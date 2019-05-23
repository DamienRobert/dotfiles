require 'set'
require 'dr/ruby_ext/core_ext' #for Hash#inverse
require 'dr/packages/handlers'
require 'pp'
begin
	require 'ap'
rescue LoadError
	def ap(item,*args)
		pp item
	end
end

module DR
	module Packages
		class Resolver
			extend ProcessActions

			module Utilities
				#helper to print packages
				def print_packages(pkgs)
					ap pkgs, multiline: false
				end
				#flatten packages
				def get_list(*pkgs_list)
					list={}
					pkgs_list=[@pkgs] if pkgs_list.empty?
					pkgs_list.each do |pkgs|
						pkgs.each_key do |ptype|
							list[ptype]||=Set.new
							#the dup is needed otherwise the first set is merged with the other ones in place
							list[ptype].merge(pkgs[ptype].values.inject(Set.new, :union))
						end
					end
					return list
				end
				#add packages pkgs to @pkgs[ptype][pgroup]
				def add_packages(ptype,pgroup,pkgs, to: @pkgs)
					to[ptype]||={}
					to[ptype][pgroup]||=Set.new
					pkgs=[pkgs] unless Enumerable === pkgs
					to[ptype][pgroup].merge(pkgs)
				end
				#replace packages
				def set_packages(ptype,pgroup,pkgs, to: @pkgs)
					to[ptype]||={}
					pkgs=[pkgs] unless Enumerable === pkgs
					to[ptype][pgroup]=pkgs
				end
				def set_all_packages(ptype,pkgs, to: @pkgs)
					pkgs={all: pkgs} unless Hash === pkgs
					to[ptype]={}
					pkgs.each do |pgroup,pkgs|
						add_packages(ptype,pgroup,pkgs, to: to)
					end
				end
				#remove packages
				def remove_packages(ptype,pgroup,pkgs, to: @pkgs)
					pkgs=[pkgs] unless Enumerable === pkgs
					to[ptype][pgroup].subtract(pkgs) if @pkgs[ptype] and @pkgs[ptype][pgroup]
				end
				def check_package(ptype,pkg, to: @pkgs)
					list=get_list(to)
					return (list[ptype]||[]).include?(pkg)
				end
			end
			include Utilities

			#:packages: static list of packages settings
			#:packages_mode: static list of packages mode
			#:pkgs_mode: our (=@computer) packages mode eg {[:ruby,:python]=> [:text], ruby: [:git]}
			#:pkgs: our packages list (the packages we want; infered from packages and pkgs_mode)  eg @pkgs= {:arch_abs=> {:archive=> <Set: {"atool", "cpio", ...
			#:pkgs_list: flattened package list
			#:ourpkgs: the packages currently installed
			#:pkgsdep: missing and extra packages
			# @pkgsdep[ptype]={missing_pkgs: pmissing, missing_groups: gmissing, missing: pmissing+gmissing, extra: extrapkgs, unused: unused, allextra: extra+unused, expected: expectedpackages, extra_ok_missing: extraok-allpackages, missing_ok_missing: missingok-allpackages, extra_ok_present: extraok & allpackages, missing_ok_present: missingok & allpackages}
			attr_reader :packages, :packages_mode, :pkgs_mode, :pkgs, :ourpkgs, :pkgsdep, :pkgs_list
			attr_accessor :default_package_handler

			def initialize(computer,**opts)
				@opts=opts
				@computer=computer.is_a?(Computer) ? computer : Computer.new(computer)
				@default_package_handler||=lambda do |comp, ptype: type|
					Packages::Handler.handle(ptype, computer: comp, **opts)
				end
				packages_setup
				populate_pkgs
				solve_conflict
				filter_packages #get packages according to @packages_filter
				filter_types #filter types according to the passed options
				#note that if types=nil will give all types
				filter_pkgs #do nothing by default, can be subclassed
				@pkgs_list=get_list(@pkgs)
			end

			def filter_pkgs
			end

			def filter_types(types=@opts[:types])
				if types
					types.map! {|p| p.to_sym}
					delta=(types||[])-@pkgs.keys
					warn "No packages requested for default installation for types #{delta.join(', ')}" unless delta.empty?
					delta.each do |empty_type|
						@packages[empty_type]||={}
						@packages[empty_type][:pkgs]||={all: Set.new}
						@pkgs[empty_type]={all: Set.new}
					end
					@pkgs.each_key do |ptype|
						@pkgs.delete(ptype) unless types.include?(ptype)
					end
				end
			end

			def pkgs_list_extra(type)
				@pkgs_list[type] | (@packages[type][:extra_ok] || Set.new)
			end

			def packages_setup ##To subclass
				#a hash of packages we may want to install
				#@packages={ ruby: { pkgs: { text: %w(pry irb), media: %w(mail)},
				#	groups: [list] #for packages that are 'groups'. The setting :all ask for graphs.rb to query all existing groups
				#	extra_ok: [list] for packages that we may have (we don't remove them if they are here)
				#	missing_ok: [list] for packages we don't care if they are missing (so we don't add them if they are not there)
				#	Note: the difference between extra_ok and missing_ok is that, the list of extra packages is computed as 'top_packages - target - extra_ok (-unused)' while the list of missing packages as 'target - all_packages - missing_ok', so this is essentially a question of presentation
				#	'get-all' will still install the missing_ok packages but not the extra_ok packages
				#	conflicts: {hash} #how to solve conflicts
				#	handler: object #the object to handle these packages
				#as a shorcut we allow { pip: {pkgs: ["ploum"]}} or even {pip: ["ploum"]}
				@packages||={}
				#a hash of groups of packages we want, according to our config
				#@packages_mode={minimal: {[:ruby,:python]=> [:text], ruby: [:git]}, standard: {npm: [:text,:media]}}
				#the :all keyword apply to all types
				@packages_mode||={}
				#sometime we want to only filter packages according to type at the
				#end (think pacman vs pacaur). We use packages_filter for that
				#packages_filter={oldtype: {newtype1: [list], newtype2: [list],
				#default: type}
				@packages_filter||={}
				@packages_types=@packages.keys
				@packages.each do |pkgtype,pkghash|
					@packages[pkgtype]={pkgs: pkghash} unless pkghash.kind_of?(Hash) && pkghash.key?(:pkgs)
					pkgs=@packages[pkgtype][:pkgs]
					unless pkgs.kind_of?(Hash)
						#consider there is only an ':all' category
						@packages[pkgtype][:pkgs]={all: pkgs}
					end
					if (missing_ok=@packages[pkgtype][:missing_ok]).is_a?(Hash)
						classify=(@packages[pkgtype][:classify]||{})
						@packages[pkgtype][:classify]=classify.reverse_deep_merge(missing_ok)
						@packages[pkgtype][:missing_ok]=missing_ok.values.flatten.compact.uniq
					end
					if (extra_ok=@packages[pkgtype][:extra_ok]).is_a?(Hash)
						classify=(@packages[pkgtype][:classify]||{})
						@packages[pkgtype][:classify]=classify.reverse_deep_merge(extra_ok)
						@packages[pkgtype][:extra_ok]=extra_ok.values.flatten.compact.uniq
					end
				end
				@packages_mode[:all]={@packages_types=>[:all]}
			end

			def populate_pkgs #Maybe Subclass
				# a subclass will typically call `...; super`
				@pkgs_mode||= @opts[:packages]
				@pkgs_mode ||= get_mode #fallback to @computer.name
				populate_pkgs_from_mode #fill in @pkgs from @pkgs_mode
			end

			def is_mode?(mode)
				@packages_mode.key?(mode.to_sym) rescue false
			end

			def get_mode(mode=@computer.name) #Maybe Subclass
				#if the computer name matches a packages_mode type, return it as our pkgs_mode.
				mode if is_mode?(mode)
			end

			#should define @pkgs, the packages we want, as an hash of types
			#expand the @pkgs we already have with the modes in @pkgs_mode
			def populate_pkgs_from_mode #Maybe subclass
				@pkgs||=Hash.new()
				@pkgs_mode||=Hash.new()
				# if we have a Proc, we expect it to return a pkggroups for each pkgtype
				case @pkgs_mode
				when Proc
					list={}
					@packages_types.each do |ptype|
						list[ptype]=@pkgs_mode.call(ptype)
					end
				when Symbol,String
					list=@packages_mode[@pkgs_mode]
					warn "Package mode type #{@pkgs_mode} unknown" unless is_mode?(@pkgs_mode) 
				else
					list=@pkgs_mode
				end
				list.each do |pkgtype,pkggroups|
					#pkggroups is either a [:group1, :group2] or directly a list of packages (which will be added to the 'custom' group) or a hash of packages {:type1=[...], ...}
					pkgtype=[pkgtype] unless Enumerable === pkgtype
					pkggroups=[pkggroups] unless Enumerable === pkggroups
					pkgtype.each do |ptype|
						warn "Type #{ptype} not configured" && next unless @packages.key?(ptype)
						add_packages(ptype,:none,[]) if pkggroups==[] #we do not want any package so construct a dummy @pkgs[ptype]
						if pkggroups.is_a?(Hash)
							classify=(@packages[ptype][:classify]||{})
							@packages[ptype][:classify]=classify.reverse_deep_merge(pkggroups)
							pkggroups.each do |pgroup,pvalues|
								add_packages(ptype,pgroup,pvalues)
							end
						else
							pkggroups.each do |pgroup|
								# allow a pgroup to be a lambda for dynamic package selection
								pgroup=pgroup.call(ptype) if pgroup.is_a?(Proc)
								if pgroup.is_a?(Symbol)
									if @packages[ptype][:pkgs].key?(pgroup)
										add_packages(ptype,pgroup,@packages[ptype][:pkgs][pgroup])
									elsif pgroup==:all #we want all packages
										@packages[ptype][:pkgs].each do |pgroup,pvalues|
											add_packages(ptype,pgroup,pvalues)
										end
									else
										warn "Group #{pgroup} not found in @packages for #{ptype}"
									end
								# assume we directly have a list of packages
								else
									add_packages(ptype,"custom",pgroup)
								end
							end
						end
					end
				end
			end

			def solve_conflict
				pkgs_list=get_list(@pkgs)
				@pkgs.each_key do |ptype|
					conflict=(@packages[ptype]||{})[:conflict]||[]
					conflict.each do |tpkg,rpkgs|
						if pkgs_list[ptype].include?(tpkg)
							@pkgs[ptype].each_key do |grp|
								@pkgs[ptype][grp].delete_if {|ipkg| rpkgs.include?(ipkg) }
							end
						end
					end
				end
			end
			def filter_packages
				@packages_filter.each_key do |oldtype|
					default=@packages_filter[oldtype].delete(:default)
					inv=@packages_filter[oldtype].inverse
					#update @pkgs so that pkgs_mode can use oldtype
					oldpkgs=@pkgs.delete(oldtype)||{}
					oldpkgs.each do |pgroup,v|
						v.each do |pkg|
							newtypes=inv[pkg] || [default]
							newtypes.each do |ntype|
								add_packages(ntype,pgroup,pkg)
							end
						end
					end
					#but also update @packages so that pkgs_mode can also use newtype
					#(so we copy :pkgs, and :classify)
					[:pkgs, :classify].each do |pkgkey|
						(@packages[oldtype][pkgkey]||{}).each do |pgroup,v|
							v.each do |pkg|
								newtypes=inv[pkg] || [default]
								newtypes.each do |ntype|
									@packages[ntype]||={}
									add_packages(pkgkey,pgroup,pkg, to: @packages[ntype])
								end
							end
						end
					end
					#we also need to copy conflict, groups, missing_ok, extra_ok
					#note that conflict will work only when the conflicted package
					#replacement are in the same ntype
					(@packages[oldtype][:conflict]||{}).each_key do |pkg|
						newtypes=inv[pkg] || [default]
						newtypes.each do |ntype|
							@packages[ntype]||={}
							@packages[ntype][:conflict]||={}
							@packages[ntype][:conflict][pkg]=@packages[oldtype][:conflict][pkg]
						end
					end
					%i(groups missing_ok extra_ok).each do |k|
						@packages[oldtype].key?(k) and @packages[oldtype][k].each do |pkg|
							newtypes=inv[pkg] || [default]
							newtypes.each do |ntype|
								add_packages(ntype,k,pkg, to: @packages)
							end
						end
					end
				end
			end

			def get_handler(ptype)
				@packages[ptype][:handler]||=@default_package_handler.call(@computer,ptype:ptype)
			end
			#should return installed packages
			#this should be a hash of !{type: [list]}
			def get_pkgs!
				#@ourpkgs={ruby: {all: [], top: [], unused: [], groups: {}}}
				#where top are the top packages and groups list all packages
				#belonging to a 'group package'
				@ourpkgs={}
				@pkgs.each_key do |ptype|
					#infos is from graphs.rb
					@ourpkgs[ptype]=get_handler(ptype).infos(groups:@packages[ptype][:groups])
					#Note: rather than looking at all 'group packages' we could just look at those belonging to @pkgs
				end
				@ourpkgs
			end
			def get_pkgs
				@ourpkgs || get_pkgs!
			end
			#just a wrapper around @ourpkgs[ptype][:all] which is faster than
			#get_pkgs since we don't need to do full dependency resolution
			#to get top packages and so on
			def all_installed_pkgs
				r={}
				if @ourpkgs #if get_pkgs! was called reuse it
					@ourpkgs.each_key do |ptype|
						r[ptype]=@ourpkgs[ptype][:all]
					end
				else #don't call get_pkgs! which does more work
					@pkgs.each_key do |ptype|
						r[ptype]=get_handler(ptype).list_packages
						#this is the all: field of get_pkgs
					end
				end
				r
			end

			# like solve_conflict, but for currently installed packages
			# this allow to solve_conflict involving extra_ok packages
			def solve_conflict_pkgs
				@pkgs.each_key do |ptype|
					conflict=(@packages[ptype]||{})[:conflict]||[]
					ourpkgs=@ourpkgs[ptype][:all].to_a||[]
					conflict.each do |tpkg,rpkgs|
						if ourpkgs.include?(tpkg)
							@pkgs[ptype].each_key do |grp|
								@pkgs[ptype][grp].delete_if {|ipkg| rpkgs.include?(ipkg) }
							end
						end
					end
				end
			end

			#should return missing packages and extra packages
			def get_deps
				get_pkgs
				solve_conflict_pkgs
				@pkgsdep={}
				#the packages we want
				@pkgs_list.each do |ptype,targetpackages|
					groups=@ourpkgs[ptype][:groups] || {}
					#the packages that are not considered extra packages
					extraok=@packages[ptype][:extra_ok].to_a||[]
					expectedpackages=targetpackages+extraok
					expectedpackages+=groups.values_at(*groups.keys.select {|g| expectedpackages.include?(g)}).flatten.compact.uniq
					#the packages we "have"
					allpackages=(@ourpkgs[ptype][:all].to_a||[])
					missingok=@packages[ptype][:missing_ok].to_a||[]
					ourpackages=allpackages+missingok

					gmissing={}
					groups.each_key do |g|
						if targetpackages.include?(g) then
							groups[g].each do |i|
								(gmissing[g]||=Set.new) << i unless ourpackages.include?(i)
							end
						end
					end
					pmissing={}
					@pkgs[ptype].each do |g,pkgs|
						pkgs.each do |i|
							(pmissing[g]||=Set.new) << i unless ourpackages.include?(i) or groups.include?(i)
						end
					end
					allmissing=(gmissing.values+pmissing.values).reduce(Set.new, :union)||Set.new
					unused=@ourpkgs[ptype][:unused]
					allextra=(@ourpkgs[ptype][:top]||[])-expectedpackages.to_a
					extrapkgs=allextra.dup
					extrapkgs-=unused if unused
					#note: a package can be in unused without being in allextra, if
					#we did not install it by hand. It will be 'wrongly' removed by
					#rm-unused, but not by rm
					@pkgsdep[ptype]={missing_pkgs: pmissing, missing_groups: gmissing, missing: allmissing, extra: extrapkgs, unused: unused, allextra: allextra, expected: expectedpackages, extra_ok_missing: extraok-allpackages, missing_ok_missing: missingok-allpackages, extra_ok_present: extraok & allpackages, missing_ok_present: missingok & allpackages}
				end
				@pkgsdep
			end

			def show_packages(header,packages)
				unless packages.empty?
					puts header
					print_packages packages
				end
			end

			#show missing and extra packages
			def show(**opts)
				get_deps
				@pkgsdep.each do |ptype,deps|
					puts "## #{ptype} ##"
					if @packages[ptype][:groups]
						show_packages("== Non complete groups ==", deps[:missing_groups])
					end
					show_packages("== Packages missings ==", deps[:missing_pkgs])
					show_packages("== Extra packages ==", deps[:extra])
					if deps[:unused]
						unused=deps[:unused]
						expected=deps[:expected]
						show_packages("== Unused packages", deps[:unused])
						false_unused=expected & unused
						unless false_unused.empty?
							show_packages("== False unused packages", false_unused)
						end
					end
					if opts[:verbose]
						show_packages("== May be removed (extra_ok_present)", deps[:extra_ok_present])
						show_packages("== Might be added (extra_ok_missing)", deps[:extra_ok_missing])
						show_packages("== Might be removed (missing_ok_present)", deps[:missing_ok_present])
						show_packages("== May be missing (missing_ok_missing)", deps[:missing_ok_missing])
					end
				end
			end

			#given a list of packages, classify them according to @packages
			def classify(ptype, pkgs, **opts)
				classify=(@packages[ptype][:classify]||{})
				#merge classify with :pkgs
				@packages[ptype][:pkgs].each do |type,values|
					classify[type]||=[]
					classify[type]|=values.to_a
				end
				r={}
				#TODO this is O(n^2)...
				pkgs and pkgs.each do |pkg|
					rtype=nil
					classify.each do |type,values|
						if values.include?(pkg)
							rtype=type
							break
						end
					end
					rtype||=:_extra
					r[rtype]||=[]
					r[rtype]<< pkg
				end
				r
			end

			# list the union of all packages
			def list_packages(type=nil)
				if type.nil?
					pkgs_list&.values&.inject(&:|)||[]
				else
					pkgs_list&.fetch(type) || []
				end
			end

			def pkg_search(*targets, install: false, **opts)
				r={}
				#require 'pry'; binding.pry
				@packages.each do |ptype, values|
					#pkgs=values[:pkgs]&.values&.flatten)
					#flatten does not work when we have a mix of arrays and sets
					#-> use union instead
					pkgs=values[:pkgs]&.values&.inject(Set.new, :union)
					pkgs.each do |pkg|
						targets.each do |target|
							if pkg === target
								r[ptype]||=[]
								r[ptype] << pkg
							end
						end
					end
				end
				if install
					r.each do |ptype, pkgs|
						get_handler(ptype).install(*pkgs)
					end
				end
				r
			end

			Actions=%w(show list list-all pristine get-all get rm rm-extra rm-unused fix_unused top_pkgs all_pkgs pkg_search pry)

			def process(*actions,**opts)
				recursive=opts[:recursive]
				recursive=:auto if recursive.nil?
				actions<<'show' if actions.empty?
				# pkg_search looks in @packages. If found, the package is proposed
				# for installation whenever shell is eval/exec/puts
				# calling ~/maint/packages.rb --shell=nil pkg_search pry
				# will only show the result
				if actions.first == 'pkg_search'
					#this one needs argument
					_ac, *targets=actions
					r=pkg_search(*targets, install: ! opts[:shell].empty?)
					p r unless r.empty?
					return r
				end
				actions.each do |action|
					case action
					when 'pry'
						require 'pry'; binding.pry
					when 'show'
						show(**opts)
					when 'list'
						ap @pkgs
					when 'list-all'
						get_deps
						puts "## @packages"
						pp @packages
						puts "## @pkgs_mode"
						pp @pkgs_mode
						puts "## @pkgs"
						pp @pkgs
						puts "## @ourpkgs"
						pp @ourpkgs
						puts "## @pkgsdep"
						pp @pkgsdep
					when 'pristine'
						process('get',**opts)
						process('rm',**opts)
					when 'export-all'
						@pkgs_list.each do |ptype,all|
							puts "#{ptype}=(#{all.to_a.shelljoin})"
						end
					when 'export'
						get_deps
						@pkgsdep.each do |ptype,deps|
							missing=deps[:missing]
							puts "#{ptype}=(#{missing.to_a.shelljoin})"
						end
					when 'get-all' #all packages that should be installed
						@pkgs_list.each do |ptype,all|
							get_handler(ptype).install(*all,**opts)
						end
					when 'get'#packages that we want installed but missing
						get_deps
						@pkgsdep.each do |ptype,deps|
							missing=deps[:missing]
							get_handler(ptype).install(*missing,**opts)
						end
					when 'rm', 'rm-extra', 'rm-unused'
						get_deps
						@pkgsdep.each do |ptype,deps|
							case action
							when 'rm'; extra=deps[:allextra] || []
							when 'rm-extra'; extra=deps[:extra] || []
							#Note: it can happen that a package was marked as unused
							#during installation but that we now requires it.
							#This package will still get removed by 'rm-unused' because
							#I don't know of a good way to handle this situation (the
							#packages should be marked as manual, but this depend on
							#the package manager and should be handled by handler.rb).
							#Currently we will just uninstall and then install back
							#manually again afterwards which will solve the situation.
							#In practice this only happens with pacman, so I just need
							#to do pacman -D --asexplicit foo
							#=> cf fix_unused
							when 'rm-unused'; extra=deps[:unused] || []
							end
							unless extra.empty?
								get_handler(ptype).uninstall(*extra,needed: pkgs_list_extra(ptype).to_a,recursive: recursive, **opts)
							end
						end
					when 'fix_unused'
						get_deps
						@pkgsdep.each do |ptype,deps|
							if (unused=deps[:unused])
								expected=deps[:expected]
								false_unused=expected & unused
								unless false_unused.empty?
									get_handler(ptype).change_mode(*false_unused, mode: :manual, **opts)
								end
							end
						end
					when 'top_pkgs'
						#show our top pkgs (and try to classify them)
						get_pkgs
						@ourpkgs.each do |ptype,ourpkgs|
							puts "## #{ptype} ##"
							pp classify(ptype,ourpkgs[:top],**opts)
						end
					when 'all_pkgs'
						#show all our pkgs (and try to classify them)
						get_pkgs
						@ourpkgs.each do |ptype,ourpkgs|
							puts "## #{ptype} ##"
							pp classify(ptype,ourpkgs[:all],**opts)
						end
					else warn "action '#{action}' should be "+ Actions.join("/")
					end
				end
			end
		end
	end
end
