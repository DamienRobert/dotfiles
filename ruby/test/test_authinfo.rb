require 'helper'
require 'dr/config/authinfo'
#require 'pry-rescue/minitest'

describe DR::URIList do
	before do
		@list=DR::URIList.new({
			default: "//user:password@server:22",
			imap: "imaps://imapserver",
			smtp: "//",
			smtp_user: "smtp_user",
			foo_password: "foo",
			mailto: "mailto:foo@bar",
		})
	end
	it "Gives a hash of wrapped uris" do
		@list[:default].class.must_equal DR::URIWrapper
	end
	it "Merge with the default uri" do
		@list[:imap].to_s.must_equal("imaps://user:password@imapserver:22")
	end
	it "The mailto: is not merged with the default (since it is opaque)" do
		@list[:mailto].to_s.must_equal("mailto:foo@bar")
	end
	it "Can specify attributes via *_default" do
		@list[:smtp].user.must_equal "smtp_user"
	end
	it "As a failsafe specific attributes only work if the uri already exist" do
		@list[:foo_password].to_s.must_equal "//user:password@server:22foo"
		#this is not a bug, URI#to_s does not put a '/' between the host and
		#the path (usually all the paths are absolute)
	end
	it "Can be merged" do
		@list.merge({imap_port: 80})[:imap].to_s.must_equal "imaps://user:password@imapserver:80"
	end
end

describe DR::AuthInfo do
	before do
		@authinfo=DR::AuthInfo.new({
			server: { default: "//password:@" },
			server2: {ssh: "ssh://foo@bar",maildir: "amaildir"},
			server3: {default: "//foo@bar", mail: "mailto:{user}@{host}"},
			gmailploum: {default_user: "ploum", maildir: true},
			gmailplam: {default: "//plam@googlemail.com", smtp: false},
		})
	end
	it "Gives a hash of URIList" do
		@authinfo[:server].class.must_equal DR::URIList
	end
	it "Adds a default" do
		@authinfo[:server2].must_include(:default)
	end
	it "Expand the :mail attributes" do
		@authinfo[:server3][:mail].to_s.must_equal "mailto:foo@bar"
	end
	it "Expand gmail servers" do
		@authinfo[:gmailploum][:smtp].to_s.must_equal "smtps://ploum@smtp.gmail.com"
	end
	it "Expand gmail maildir when they are activated" do
		@authinfo[:gmailploum][:maildir].to_s.must_equal "ploum@gmail"
	end
	it "The gmail expansion can use something else than gmail.com" do
		@authinfo[:gmailplam][:imap].to_s.must_equal "imaps://plam@imap.googlemail.com"
	end
	it "Do not keep a false scheme" do
		@authinfo[:gmailplam][:smtp].must_be_nil
	end
	it "Does not merge default for maildir and webmail" do
		@authinfo[:server2][:maildir].to_s.must_equal "amaildir"
		@authinfo[:gmailploum][:webmail].to_s.must_equal "https://www.gmail.com"
	end
	it "Can quote messages" do
		DR::AuthInfo.extraquote('foo"bar"baz').must_equal('foo\"bar\"baz')
	end
end
