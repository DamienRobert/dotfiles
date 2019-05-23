module ::Archlinux
	class MyGit < Git
		def do_update
			call("my", "update")
			super
		end
	end
end

def config.default_packages
	super do |default|
		default.merge(Repo.new("dams", config: self).packages)
	end
end

def config.post_install(pkgs, **opts)
	super
	unless self.db==false
		db=Pathname.home+"mnt/imb/public_html/archlinux/dams/os/x86_64/dams.db"
		unless db.exist?
			SH.sh("mysshfs -o allow_root -c imb")
		end
		db=DB.new(db)
		m=opts[:makepkg_list]
		pkgs=m.list.select {|l| l.exist?}
		_cp_pkgs=db.move_to_db(*pkgs, op: :cp)
		# db.add(*cp_pkgs)
		db.add(*pkgs) #might as well reuse the existing local packages, this will be faster since it won't go through sshfs
	end
end

=begin
# remote db
	require 'aur'
	db=SH::Pathname.home+"mnt/imb/public_html/archlinux/dams/os/x86_64/dams.db"
	SH.sh("mysshfs -o allow_root -c imb") unless db.exist?
	db=Archlinux::DB.new(db)

# copy manually to remote database:
	db_local=Archlinux.config.db
	db.show_updates(db_local.package_files)
	db.add_to_db(db_local.package_files)

# clean remote db
	db.clean(dry_run: true)

# check unneeded packages
require 'dr/packages/syst'; wanted=DR::Packages::Syst::AUR_LOCAL_REPO
pkgs = db.packages
needed = pkgs.rget(*wanted)
present = pkgs.l.keys
notneeded=present - needed
db.remove(*notneeded.map {|m| Archlinux::Query.strip(m)})
=end

{
	# db: db.to_s,
	chroot: {active: true},
	default_get_class: Archlinux::MyGit,
}
