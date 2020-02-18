#!/usr/bin/env ruby
$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0
require 'dr/packages/handlers'

module DR
	module Packages
		class Handler::RubyGems < Handler::Generic
			def get_packager
				find_executable("gem")
			end

			def package_dependency(pkg)
				GemGraph.get_deps(GemGraph.spec_from_gemname(pkg)).map {|s| s.name}
			end

			def list_packages(*args)
				super do
					Set.new(GemGraph.local_gems(bundled: false).map(&:to_s))
				end
			end

			## Use the generic algo
			# def list_top(*args)
			# 	super do
			# 		GemGraph.top_gems
			# 	end
			# end
			# def graph(**opts)
			# 	@graph||=GemGraph.graph
			# end

			def install(*args)
				super do |pkgs,o|
					"#{@packager} install #{o} #{pkgs}"
				end
			end
			def uninstall(*args)
				super do |pkgs,o|
					#-aix=--all  --ignore-dependencies --executables
					"#{@packager} uninstall #{o} -aIx #{pkgs}"
				end
			end

			def update(*args, **kw)
				super do |o|
					"#{@packager} update #{o}"
				end
			end
			def clean(*args)
				super do |o|
					"#{@packager} clean #{o}"
				end
			end

			def clean_cache(*args)
				super do
					"rm -rf #{Gem.spec_cache_dir.shellescape}"
				end
			end

			def search(*args)
				super do |*args, o|
					"#{@packager} search #{o} #{args.shelljoin}"
				end
			end
		end

		module GemGraph
			extend self
			#gems bundled with ruby
			def bundled_gems
				dir=Pathname.new(Gem.default_path.last)+"specifications"
				return (dir.children + (dir+"default").children).map do |file|
					next if file.directory?
					m=file.basename.to_s.match(/^(.*)-(.*)\.gemspec/)
					next m[1] if m
				end.compact.uniq.sort
			end

			#Ex: spec_from_gemname("pry 0.10.4", version: true)
			def spec_from_gemname(name, version: false)
				Gem::Specification.find {|s| gem_name(s, version: version)==name}
			end

			#From: http://stackoverflow.com/questions/5177634/list-of-installed-gems
			#list of gems name
			def local_gems(bundled: false)
				#Gem::Specification.group_by {|g| g.name.downcase} is a hash of name => specifications because Gem::Specification.to_a is a list of gem specification
				gems=Gem::Specification.group_by {|g| g.name.downcase}.keys
				bundled ? gems : gems - bundled_gems
			end
			#hash of {gem names => [Gem specification for version]}
			def local_gems_spec
				Gem::Specification.sort_by{ |g| [g.name.downcase, g.version] }.group_by{ |g| g.name }
			end
			#Array of gem specifications for latest version
			def latest_gems_spec
				local_gems_spec.map {|k,v| v.last}
			end
			#Array of all gem specifications
			def all_gems_spec
				local_gems_spec.values.flatten
			end

			#Used by PkgGraph#package_dependency
			#spec.dependencies[0] is a Gem::Dependency.new on which we can call to_spec
			def get_deps(spec, dev: false)
				return (spec.dependencies.map do |gem|
					next if gem.type == :development and !dev
					begin
						gem.to_spec #return the activated gem dep
					rescue Gem::LoadError => e
						SH.logger.warn "# Missing Gem #{e.name} (#{e.requirement})"
						nil
					end
				end).compact
			end

			def dependency_node(spec, version: false, dev: false, attributes: {}, gem_graph: nil)
				gem_graph=Graph.new unless gem_graph
				n = gem_graph.new_node(gem_name(spec, version: version), **attributes)
				spec.dependencies.each do |dependency|
					next if dependency.type == :development and !dev
					begin
						if version
							ispecs=dependency.to_specs #return all possible gem deps
						else
							ispecs=[dependency.to_spec] #return the activated gem dep
						end
						ispecs.each do |ispec|
							n.add_child(dependency_node(ispec, version: version, dev: dev, gem_graph: gem_graph, attributes: {type: dependency.type}))
						end
					rescue Gem::LoadError
					# The Gem is not available locally. This sucks.
						dependency = gem_graph.add_node(dependency.name, attributes: {missing: true, type: dependency.type})
						n.add_child(dependency)
					end
				end
				return n
			end
			def dependency_graph(spec_list, version: false, dev: false)
				gem_graph=Graph.new
				spec_list.each do |spec|
					dependency_node(spec, version: version, dev: dev, gem_graph: gem_graph)
				end
				gem_graph
			end
			def graph
				dependency_graph(latest_gems_spec)
			end
			def top_gems(bundled: false)
				roots=graph.roots.map(&:to_s)
				bundled ? roots : roots - bundled_gems
			end

			def gem_name(spec, version: false)
				if version then
					return "#{spec.name} #{spec.version}"
				else
					return spec.name
				end
			end
		end

	end
end

if __FILE__ == $0
	DR::Packages::Handler::RubyGems.process_args(*ARGV)
	#show_infos bootstrap install uninstall update check_update update_or_check clean
end
