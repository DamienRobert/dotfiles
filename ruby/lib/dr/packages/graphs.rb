#!/usr/bin/env ruby
require 'dr/base/graph'

module DR

	module Packages
		module PkgGraph
			## To subclass: list_package, packages_dependencies
			## Evenutally: manual_deps, list_unused, list_groups, list_top

			#helper for list_packages to clean versions
			def parse_packages(list)
				list.map do |pkg|
					yield(pkg)
				end.compact.uniq
			end
			#list installed packages
			def list_packages(**_opts)
				return @packages if @packages
				return (@packages=[]) unless @packager
				if respond_to?(:full_graph)
					@packages=full_graph.names
				else
					@packages=yield if block_given?
				end
				@packages||=[] #fallback
			end
			# sometime we want to hide packages (think about npm);
			# this command will show *all* of them
			def list_all_packages(**opts)
				return @all_packages if @all_packages
				@all_packages=list_packages(**opts)
			end

			def package_dependency(pkg)
				if respond_to?(:full_graph)
					full_graph[pkg].map(&:to_s)
				else
					return []
				end
			end
			# a hash of dependencies from the packages
			# by default assume there are no deps
			def packages_dependencies(pkgs)
				r={}
				pkgs.each {|pkg| r[pkg]=package_dependency(pkg)}
				r
			end

			def manual_deps
				deps=Hash.new([])
				yield deps if block_given?
				deps
			end

			#from a list l return a graph of packages with their dependencies in l (if restrict==true)
			#mode: :deps => only use package_dependency
			#mode: :manual => only use manual_deps
			#mode: :both => :deps+:manual
			#mode: :auto => uses @graph_type
			def graph_dependencies(l, mode: :both, restrict: true, **_opts)
				mode = @graph_type if mode == :auto
				g=Graph.new
				g|self.manual_deps if mode != :deps
				g|packages_dependencies(l) if mode != :manual
				# add trivial deps so that the nodes passed are in the graph
				deps={}; l.each {|p| deps[p]=[]}; g|deps
				g=g.subgraph(*l) if restrict
				g
			end

			def graph(**opts)
				graph_mode = opts[:graph_mode] || @graph_type || :both
				@graphs ||= {}
				@graphs[graph_mode] or @graphs[graph_mode]=graph_dependencies(list_packages, mode: graph_mode)
			end

			def list_top(**opts)
				return @top_packages if @top_packages
				return nil unless @packager
				top = block_given? ? yield(**opts) : nil
				if top.nil?
					# nil means fallback to the graph method
					mode=opts[:top_mode] || @top_type || @graph_type || :both
					@top_packages=graph(graph_mode:mode).roots.map(&:to_s) 
				else
					#remove extra 'top' dependencies
					#even for packages already handled by packager, this allow to add
					#manual dependencies
					mode=opts[:top_mode] || @top_type || @graph_type || :manual
					@top_packages=graph_dependencies(top, mode:mode).roots.map(&:to_s)
				end
			end
			def list_unused(**_opts)
				yield if block_given?
				#return nil #nil means we don't support 'unused'
			end
			#list the packages contained in 'groups'
			def list_groups(groups,**opts)
				return {} if groups.nil? or !@packager
				groups=[*groups].map do |g|
					g==:all ? group_packages(**opts) : g
				end.flatten.uniq
				block_given? ? yield(*groups) : {}
			end
			def group_packages(**opts)
				[]
			end

			def infos(groups: nil, **opts)
				#used by handler.rb
				{all: list_packages, top: list_top, unused: list_unused, groups: list_groups(groups)}
			end
		end
	end

end

if __FILE__ == $0
	#=> call #graph
	#to see #infos use handler.rb#show_infos
	require "optparse"
	require "pathname"
	$LOADED_FEATURES << (Pathname.new(__dir__)+__FILE__).to_s
	require 'dr/packages/handlers'
	opts={types: ["gem"], show_attr: false}
	optparse = OptionParser.new do |opt|
		opt.banner = "Show local packages installed as a graph"
		opt.on("--[no-]top", "Show top packages") { |v| opts[:top]=v }
		opt.on("--[no-]list", "Only list packages") { |v| opts[:top]=:list }
		opt.on("--mode=MODE", [:graph, :list, :dot], "Print mode (graph/list/dot)") { |v| opts[:mode]=v }
		opt.on("--graph=dependency", [:deps, :manual, :both], "Graph mode (deps/manual/both)") { |v| opts[:graph_mode]=v }
		opt.on("--[no-]version", "[GEM] Add version information") { |v| opts[:version]=v }
		opt.on("--[no-]dev", "[GEM] Add development gems") { |v| opts[:dev]=v }
		opt.on("--[no-]attr", "[GEM] Show gem types") { |v| opts[:show_attr]=v }
		opt.on("--[no-]all", "[GEM] Show all gems version") do |v|
			opts[:all]=v
			opts[:version]=v
		end
		opt.on("-t", "--types=package_types", Array, "packages types") do |v|
			opts[:types]=v
		end
		#Visualize the graph:
		# zathura =(./gems.helper.rb --mode=dot | dot -Tpdf)
	end
	optparse.parse!
	opts[:types].each do |type|
		if opts[:top]
			if opts[:top] == :list
				puts DR::Packages::Handler.handle(type).list_packages
			else
				puts DR::Packages::Handler.handle(type).list_top
			end
		else
			#the type is 'ruby_gem', but with 'gem' we provide more options
			if type=="gem"
				require 'dr/packages/handlers/ruby_gems'
				list=opts[:all] ? DR::Packages::GemGraph.all_gems_spec : DR::Packages::GemGraph.latest_gems_spec
				graph=DR::Packages::GemGraph.dependency_graph(list, version: opts[:version], dev: opts[:dev])
			else
				graph=DR::Packages::Handler.handle(type).graph(**opts)
			end
			# output directly when available
			out=Object.new
			def out.<<(s)
				STDOUT << s.chomp+"\n"
			end
			graph.dump(out: out, **opts)
		end
	end
end
