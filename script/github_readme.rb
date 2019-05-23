#!/usr/bin/env ruby
#parse a yaml file containing github plugins and output informations about
#them
require 'open-uri'

@github="https://github.com/"
@github_reg=%r(^#{@github})

def plugin_from_yaml(plugin)
	case plugin
	when Hash
		return plugin.keys.first
	when Array
		return plugin.first
	else
		return plugin
	end
end

def github_link(plugin)
	if plugin =~ @github_reg
		return plugin
	else
		return @github+plugin
	end
end

def github_name(plugin)
	return plugin.sub(@github_reg,'')
end

@markdown_ext=%w('' .md .mkd .markdown)

if ARGV.first == "--yaml"
	ARGV.shift
	require 'yaml'
	plugins = ARGV.flat_map do |file|
		plugs=YAML.load_file(file)
		plugs.map do |pluginfo|
			plugin_from_yaml(pluginfo)
		end
	end
else
	plugins=ARGV
end

plugins.each do |plugin|
	warn plugin
	plugin_name=github_name(plugin)
	plugin_hub=github_link(plugin)
	puts "============ #{plugin} ================ {{{1"
	puts plugin_hub
	@markdown_ext.each do |md|
		begin
			readme="https://raw.github.com/#{plugin_name}/master/README#{md}"
			content=open(readme).read
			puts content
			break
		rescue OpenURI::HTTPError => e
			warn "#{readme}: #{e}"
		end
	end
end
