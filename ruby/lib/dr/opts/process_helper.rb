#!/usr/bin/env ruby

require 'dr/config/computers'
autoload :OptionParser, 'optparse'

module DR
	module ProcessActions
		extend self
		#class helper to process actions for computers
		#klass is when I am too lazy to include ProcessActions in klass
		#Foo.process_actions("foo","bar",computers: local)
		#=> Foo.new("local").process("foo", "bar")
		def process_actions(*actions,klass: self, init_instance: :new, method: :process, default_computer: nil, pry: false, **opts)
			verbose=opts[:verbose]
			verbose=true if verbose.nil?
			#note: default_computer=nil let Computer.new choses the default
			computers=DR::Computers.computers(*opts.delete(:computers), default: default_computer)
			if pry
				require 'pry'; binding.pry
			end
			if block_given?
				yield computers, *actions, **opts
			else
				computers.each do |computer|
					puts "# #{computer} => #{actions} #{opts}" if verbose
					if init_instance
						klass.public_send(init_instance,computer,**opts).public_send(method,*actions,**opts)
					else
						klass.public_send(method,computer,*actions,**opts)
					end
				end
			end
		end

		#define an OptionParser handling computers
		def standard_option_parse(*args, default_computer: nil, convert_computers: false, **opts)
			#opts[:pretty]=opts.fetch(:pretty, true)
			optparse=OptionParser.new do |opt|
				opt.separator("Common Process Helper options")
				opt.on("-c", "--computers=computers", Array, "computers") do |v|
					opts[:computers]=v
				end
				opt.on("--[no-]pretty[=pretty]", "Pretty print mode; can also be 'color'") do |v|
					opts[:pretty]=v
				end
				opt.on("--[no-]debug", "debug") do |v|
					if v
						require 'shell_helpers'
						SH.debug
					end
				end
				opt.on("--[no-]pry", "Call pry before processing actions") do |v|
					opts[:pry]=v
				end
				opt.separator("\nSpecific options")
			end
			yield(optparse,opts) if block_given?
			optparse.parse!(args)
			opts[:computers] &&= Computers.computers(opts[:computers], default: default_computer) if convert_computers
			return args,opts
		end

		#use the above OptionParser with process_actions
		#Foo.process_args("-c local foo bar")
		def process_args(*args,**opts,&b)
			args,opts=standard_option_parse(*args,**opts,&b)
			actions=opts[:action]
			if actions
				actions.call(*args, **opts)
			else
				process_actions(*args,**opts)
			end
		end

		#in the extended class, define the default method called by process_actions
		#this method will just dispatch the actions passed
		#=> foo.process(bar,plam)=foo.bar(plam)
		def define_default_process(mod=self,name: :process, default: nil)
			mod.class_eval do
				define_method(name) do |*actions,**opts|
					actions=[default] if actions.empty? and default
					actions[0]=actions[0].to_sym
					send(*actions,**opts)
				end
			end
		end
	end

end
