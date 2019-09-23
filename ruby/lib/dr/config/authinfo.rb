#!/usr/bin/env ruby

require "yaml"
require "dr/config/computers"
require "dr/base/uri"

module DR
	class URIList < Hash
		def initialize(h, no_default: [])
			@no_default = no_default
			merge!(h)
		end

		def populate(h, reverse: false) # accept a Hash or a URIList
			h.each do |k, v|
				# handle {ploum: "http://service", ploum_user:"user"}
				if (m = k.to_s.match(/^(.*)_(.*)$/))
					k1 = m[1].to_sym; prop = m[2]
					if self[k1].respond_to?(:"#{prop}=")
						self[k1].public_send(:"#{prop}=", v.to_s)
						next
					end
				end
				begin
					v = URIWrapper.new(v) unless v.is_a?(URIWrapper)
					self[k] = self[k] ? (reverse ? self[k].reverse_merge(v) : self[k].soft_merge(v)) : v
				rescue StandardError => e
					warn "[#{self.class}#populate] Error in handling '#{v}': #{e} #{e.backtrace.first}"
				end
			end
			self
		end

		def handle_default
			if self[:default]
				each do |k, v|
					next if k == :default
					self[k] = v.reverse_merge(self[:default]) unless @no_default.include?(k)
				end
			end
			self
		end

		def merge!(h, reverse: false)
			populate(h, reverse: reverse) # I don't need to convert h to an url list the way soft_merge work (even with handle_default!)
			handle_default
			self
		end

		def merge(h, reverse: false)
			dup.merge!(h, reverse: reverse)
		end
	end

	class AuthInfo < Hash
		def initialize(h)
			merge!(h)
		end

		def merge!(h, reverse: false)
			h.each do |k, v|
				# expand allow to add well known server names like 'gmail.com'
				v = self.class.expand(k, v, current: self[k]) if self.class.respond_to?(:expand) && !v.is_a?(URIList)
				(self[k] ||= URIList.new({}, no_default: %i[webmail maildir])).merge!(v, reverse: reverse)
				 # TODO: transform mail://... into mailto:...
			end
		end

		def merge(h, reverse: false)
			dup.merge!(h, reverse: reverse)
		end

		def add(file, reverse: false)
			begin
				content = DR::Computer.load_file(file, yaml: true)
				merge!(content, reverse: reverse) if content
			rescue StandardError => e
				warn "Error in parsing authinfo #{file}: #{e} #{e.backtrace.first}"
			end
		end

		module Helper
			extend self
			def expand(k, v, current: nil)
				v = { default: "//" }.merge(v) # always define a default so that default_... works; we do it this way so that :default is the first key; note that 'default ""' gives the same URI but I find '//' clearer
				current = { default: URI.parse("//") } if current.nil?
				dhost = v[:default_host] || URI.parse(v[:default]).host || current[:default].host
				duser = v[:default_user] || URI.parse(v[:default]).user || current[:default].user
				if v[:mail]
					v[:mail].gsub!("{user}", duser) if duser
					v[:mail].gsub!("{host}", dhost) if dhost
				end

				if k.to_s.match(/^gmail/) && (current[:default].to_s == "") # this is a gmail account that was not already expanded
					dhost || v[:default_host] = dhost = "gmail.com"
					%i[imap smtp mail webmail].each do |scheme|
						if v[scheme] == false
							v.delete(scheme)
						else
							v[scheme] ||= case scheme
								when :mail
									"mailto:#{duser}@#{dhost}" if duser
								when :webmail
									"https://www.#{dhost}"
								else
									"#{scheme}s://#{scheme}.#{dhost}"
								end
						end
					end
					v[:maildir] = "#{duser}@gmail" if duser && (v[:maildir] == true)
				end
				v
			end

			def extraquote(*s, singlequote: false, join: nil)
				# s.join.gsub("\\","\\\\\\\\").gsub('"','\"').gsub('\'',"\\\\'")
				s = s.compact.join(join).dump[1..-2] # this escapes '\' and '"'
				s.gsub!("'", "\\\\'") if singlequote
				s
			end
		end
		extend Helper

		def self.get_authinfo(default: {}, authfile: Pathname.home + DR::Computers::MYFILES[:cfg] + ".authinfo", gpg: true)
			auth = new(default)
			auth.add(authfile)
			auth.add(authfile.to_s + ".gpg") if gpg
			auth
		end

		GMAIL_TOKENS = %i[gmailpp gmaildor].freeze
		def self.get_offlineimap_authokens
			require "json"
			authdir = Pathname.home + DR::Computers::MYFILES[:crypt] + ".auth/google_tokens"
			tokens = JSON.load(authdir + "offlineimap_dor.json")
			oauth = {}
			GMAIL_TOKENS.each do |account|
				oauth[account] = { oauth: {} }
				oauth[account][:oauth][:id] = tokens["installed"]["client_id"]
				oauth[account][:oauth][:secret] = tokens["installed"]["client_secret"]
				refreshname = "offlineimap_#{account.to_s.sub(/^gmail/, '')}_refresh"
				refreshfile = (authdir + refreshname)
				oauth[account][:oauth][:refresh] = refreshfile.read.chomp if refreshfile.readable?
			end
			# pp oauth
			oauth
		end
	end
end

if $PROGRAM_NAME == __FILE__
	require "optparse"
	opts = { format: "json", pretty: false }
	optparse = OptionParser.new do |opt|
		opt.banner = "#{File.basename($PROGRAM_NAME)} [--offlineimap] [authfile]"
		opt.on("--[no-]offlineimap", "Offlineimap", "Offlineimap flag") do |v|
			opts[:offlineimap] = v
		end
		opt.on("--[no-]gpg", "gpg") do |v|
			opts[:gpg] = v
		end
		opt.on("--[no-]pretty", "=[color]", "Pretty Print") do |v|
			opts[:pretty] = v
			opts[:format]='string' if v
		end
		opt.on("--format=json", "Output format (string,json,yaml)") do |v|
			opts[:format] = v
		end
	end
	optparse.parse!
	keys = {}
	keys[:gpg] = opts[:gpg] if opts.key?(:gpg)
	keys[:authfile] = ARGV[1] if ARGV[1]
	auth = DR::AuthInfo.get_authinfo(**keys)
	# with --offlineimap only keep authinfo relating to maildirs
	if opts[:offlineimap]
		auth.keep_if { |_k, v| v.key?(:maildir) }
		# also add oauth tokens
		oauth = DR::AuthInfo.get_offlineimap_authokens
		auth.deep_merge!(oauth)
	end
	DR::Utils.pretty_print(auth, pretty: opts[:pretty], format: opts[:format])
end
