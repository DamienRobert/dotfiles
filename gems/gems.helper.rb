#!/usr/bin/env ruby
require 'rubygems'
require 'pp'

class Node
	include Enumerable
	attr_reader :name, :missing
	attr_accessor :is_dependency_of
	@@nodes ||= []
	def initialize(name, missing: false)
		@name = name
		@nodes = []
		@is_dependency_of = []
		@missing = missing
		@@nodes << self
	end
	def <=>(other)
		return @name <=> other.name
	end
	#self.add_child(ploum) marks ploum as a child of self (ie self depends on ploum)
	def add_child(node)
		if not @nodes.include?(node)
			@nodes << node
			node.is_dependency_of << self
		end
	end
	STEP = 4
	def to_s
		return @name
	end
	def to_graph(indent_level: 0)
		sout = ""
		margin = ''
		0.upto(indent_level/STEP-1) { |p| margin += (p==0 ? ' ' : '|') + ' '*(STEP - 1) }
		margin += '|' + '-'*(STEP - 2)
		sout += margin + "#{@name}\n"
		@nodes.each do |child|
			sout += child.to_graph(indent_level: indent_level+STEP)
		end
		return sout
	end
	def to_dot
		sout=["\""+name+"\""]
		@nodes.each do |child|
			sout.push  "\"#{@name}\" -> \"#{child.name}\""
			sout += child.to_dot
		end
		return sout
	end

	class <<self
		def build(name, missing: false)
			match = @@nodes.find {|n| n.name == name}
			return match || Node.new(name, missing: missing)
		end
		def all
			@@nodes.sort
		end
		def roots
			@@nodes.select{ |n| n.is_dependency_of.length == 0}.sort
		end
		def missing
			@@nodes.select{ |n| n.missing}.sort
		end
		def dump(mode: :graph, nodes: :roots, **unused)
			n=instance_eval nodes.to_s
			sout = ""
			case mode
			when :graph; n.each do |node| sout+=node.to_graph end
			when :list; n.each do |i| sout+="- #{i}\n" end
			when :dot;
				sout+="digraph gems {\n"
				sout+=n.map {|node| node.to_dot}.inject(:+).uniq!.join("\n")
				sout+="}\n"
			end
			return sout
		end
	end
end

#From: http://stackoverflow.com/questions/5177634/list-of-installed-gems
def local_gems
	Gem::Specification.sort_by{ |g| [g.name.downcase, g.version] }.group_by{ |g| g.name }
end
def latest_spec(list)
	l=local_gems
	list.map {|i| l[i].last}
end
def latest_gems
	latest_spec(local_gems.keys)
end
def all_gems
	local_gems.map {|k,v| v}.flatten
end
#not used because I need to filter development dependencies
def get_deps(spec)
	return (spec.dependencies.map {|gem| gem.to_spec} rescue [])
end

def dependency_graph(spec, version: false)
	n = Node.build(gem_name(spec, version: version))
	spec.dependencies.each do |dependency|
		next if dependency.type == :development
		begin
			ispecs=dependency.to_specs
			ispecs.each do |ispec|
				n.add_child(dependency_graph(ispec))
			end
		rescue Gem::LoadError
		# The Gem is not available locally. This sucks.
			dependency = Node.build(dependency.name, missing: true)
			n.add_child(dependency)
		end
	end
	return n
end
def dependency_list(list, version: false)
	list.each do |spec|
		dependency_graph(spec, version: version)
	end
end

def gem_name(spec, version: false)
	if version then
		return "#{spec.name} #{spec.version}"
	else
		return spec.name
	end
end

if __FILE__ == $0
require "optparse"
$opts={}
optparse = OptionParser.new do |opt|
  opt.banner = "Show local gems installed as a graph"
	opt.on("--mode=MODE", [:graph, :list, :dot], "Print mode (graph/list/dot)") do |v| $opts[:mode]=v end
	opt.on("--nodes=NODES", [:roots,:all,:missing], " Nodes to list (roots/all/missing)") do |v| $opts[:nodes]=v end
	opt.on("--[no-]all", "Show all gems version") do |v| 
		$opts[:all]=v 
		$opts[:version]=v 
	end
	opt.on("--[no-]version", "Add version information") do |v| $opts[:version]=v end
	#Visualize the graph:
	# zathura =(./gems.helper.rb --mode=dot | dot -Tpdf)
end
optparse.parse!
$opts[:all] ? list=all_gems : list=latest_gems
dependency_list(list, version: $opts[:version])
puts Node.dump(**$opts)
end
