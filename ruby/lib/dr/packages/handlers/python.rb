require 'dr/packages/handlers'

module DR
	module Packages
		module Handler::Python
			def packages_dependencies(pkgs)
				deps={}
				name=nil
				return deps if pkgs.empty? # Prevent the pip ERROR: Please provide a package name or names.
				%x/#{@packager} show #{pkgs.shelljoin}/.each_line do |l|
					l.match(/^Name: (.*)/) {|m| name=m[1] }
					l.match(/^Requires: (.*)/) do |m|
						warn "Name not found for requirements at #{l}" unless name
						deps[name]=m[1].split(', ').map(&:downcase)
					end
					l.match(/^---$/) {|_m| name=nil }
				end
				deps
			end
			# not used
			def package_dependency(pkg)
				%x/#{@packager} show #{pkg}/.match(/^Requires: (.*)/) do |m|
					return m[1].split(', ').map(&:downcase)
				end
			end
			def manual_deps
				super do |deps|
					deps.merge!({'pip' => %w(wheel setuptools)})
				end
			end
			def parse_packages(list)
				super do |pkg|
					pkg.match(/^(.*)==.*$/) {|m| m[1].downcase}
				end
			end
			def list_packages(*args)
				super do
					parse_packages(output_list("#{@packager} list --format=freeze --user"))
				end
			end

			def bootstrap(*args)
					"curl -L https://bootstrap.pypa.io/get-pip.py | #{@python} - --user"
			end
			def install(*args)
				super do |pkgs,o|
					"#{@packager} install #{o} --user #{pkgs};"
				end
			end
			def uninstall(*args)
				super do |pkgs,o|
					"#{@packager} uninstall #{o} -y #{pkgs};"
				end
			end

			def update(*args, **kw)
				super do |o|
					pkgs=list_packages
					"#{@packager} install #{o} --user #{pkgs.shelljoin} -U;" unless pkgs.empty?
				end
			end

			def search(*args)
				super do |*args, o|
					"#{@packager} search #{o} #{args.shelljoin}"
				end
			end
		end

	end
end
