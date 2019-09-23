module ::Archlinux
	class MyGit < Git
		def do_update
			call("my", "update")
			super
		end
	end
end

def config.parser(parser)
	super
	parser.global_options do |opt|
		opt.on("--[no-]imb", "Use 'imb' as database") do |v|
			self.db=self.imb_db if v
		end
	end
end

def config.imb_db
	db=Pathname.home+"mnt/imb/public_html/archlinux/dams/os/x86_64/dams.db"
	unless db.exist?
		SH.sh("mysshfs -o allow_root -c imb")
	end
	DB.new(db)
end

def config.default_packages(use_db: false, **opts)
	super do |default|
		default.merge(Repo.new("dams", config: self).packages)
	end
end

def config.post_install(pkgs, **opts)
	super
	unless self.db==false
		imb=imb_db
		m=opts[:makepkg_list]
		pkgs=m.list.select {|l| l.exist?}
		_cp_pkgs=imb.move_to_db(*pkgs, op: :cp)
		# db.add(*cp_pkgs)
		imb.add(*pkgs) #might as well reuse the existing local packages, this will be faster since it won't go through sshfs
	end
end

=begin
# remote db
	require 'aur'
	imb=Archlinux.config.imb_db

# copy manually to remote database:
	db=Archlinux.config.db
	imb.show_updates(db.package_files)
	imb.add_to_db(db.package_files)

# update remote db: aur.rb --imb db update -c
	imb.show_updates
	imb.update
# clean remote db: aur.rb --imb db clean
	imb.clean(dry_run: true)

# check unneeded packages
	require 'dr/packages/syst'; wanted=DR::Packages::Syst::AUR_LOCAL_REPO
	pkgs = imb.packages
	needed = pkgs.rget(*wanted)
	present = pkgs.l.keys
	notneeded=present - needed
	missing = wanted - present.map {|pkg| Archlinux::Query.strip(pkg)}
	imb.remove(*notneeded.map {|m| Archlinux::Query.strip(m)})
=end

=begin
Solve invalid signatures
cd ~/.cache/arch_aur/.db
pkgs=(foo.xz)
aur.rb --v sign -f $pkgs
aur.rb --imb db add -f $pkgs
=end

{
	# db: db.to_s,
	chroot: {active: true},
	default_get_class: Archlinux::MyGit,
}
