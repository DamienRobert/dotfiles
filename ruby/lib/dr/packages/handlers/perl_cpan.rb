#!/usr/bin/env ruby
$LOADED_FEATURES << File.realpath(__FILE__) if __FILE__ == $0
require 'dr/packages/handlers'

module DR
	module Packages
		class Handler::PerlCpan < Handler::Generic
			def get_packager
				find_executable("cpanm")
			end
			def setup_packager
				@cpan_dir=@userpkgdir+"perl5/lib/perl5"
			end

			def manual_deps
				#these deps are no longer needed (Module::Build is included in perl5.10, and cpanm now use an http api)
				#{'App::cpanminus' => %w(CPAN::Meta Module::Build), 'WebService::MusicBrainz' => [ "Class::Accessor", "XML::LibXML", "XML::NamespaceSupport", "XML::SAX" ], }
				{'MusicBrainz::DiscID' => %w(Test::Pod), 'WebService::MusicBrainz' => %w(Mojolicious)}
			end

			#helper for list_packages
			# not needed anymore
			# def parse_packages
			# 	super do |pkg|
			# 		pkg.gsub(/^#{@cpan_dir}\//,'').gsub(/^.*-thread-multi\//,'').gsub(/\.pm$/,'').gsub('/','::')
			# 	end
			# end

			def list_packages(*args)
				super do
					output_list(<<EOF).reject {|i| i=="Perl"}
cat <<'EOS' | perl
use ExtUtils::Installed;
my $inst = ExtUtils::Installed->new();
my @modules = $inst->modules();
foreach $module (@modules){
  print $module . "\n";
}
EOS
EOF
					# parse_packages(Dir.glob(@cpan_dir+"**/*.pm"))
				end
			end
			# def list_top(*args)
			# 	super do
			# 		parse_packages(Dir.glob(@cpan_dir+"*/*.pm")+Dir.glob(@cpan_dir+"*-thread-multi/*/*.pm"))
			# 	end
			# end

			def bootstrap(*args)
				super do
					"curl -L http://cpanmin.us | perl - App::cpanminus"
				end
			end

			def install(*args)
				super do |pkgs,o|
					"#{@packager} #{o} #{pkgs}"
				end
			end

			def uninstall(*args)
				super do |pkgs,o|
					"#{@packager} #{o} --uninstall #{pkgs}"
				end
			end

			def update(*args, **kw)
				super do |o|
					##cpanm --self-upgrade is just a shortcup for cpanm App::cpanminus
					##so no need for a special case
					#pkgs=list_top-graph.descendants(cpanm).map(&:to_s)
					#cpanm='App::cpanminus'
					#"#{@packager} --self-upgrade;" +
					#	(pkgs.empty? ? "" : " #{@packager} #{pkgs.shelljoin};")
					pkgs=list_top
					"#{@packager} #{o} #{pkgs.shelljoin}" unless pkgs.empty?
				end
			end
		end

	end
end

if __FILE__ == $0
	DR::Packages::Handler::PerlCpan.process_args(*ARGV)
	#show_infos bootstrap install uninstall update check_update update_or_check clean
end
