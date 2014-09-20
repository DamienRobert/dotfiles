#!/usr/bin/env ruby
#parse a yaml file containing github plugins and output informations about
#them
require 'yaml'
require 'open-uri'

$github="https://github.com/"
$github_reg=%r(^#{$github})
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
	if plugin =~ $github_reg
		return plugin
	else
		return $github+plugin
	end
end

def github_name(plugin)
	return plugin.sub($github_reg,'')
end

$markdown_ext=%w('' .md .mkd .markdown)
@plugins = YAML.load_file(ARGV.first)
@plugins.each do |pluginfo|
	plugin=plugin_from_yaml(pluginfo)
	warn plugin
	plugin_name=github_name(plugin)
	plugin_hub=github_link(plugin)
	puts "============ #{plugin} ================ {{{1"
	puts plugin_hub
	#.md, .mkd, .markdown
	$markdown_ext.each do |md|
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
