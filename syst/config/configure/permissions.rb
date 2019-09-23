p=Pathname.new("/etc/systemd/network/35-wg0.netdev")
if p.exist?
	SH.sh("chown -c :systemd-network #{p}", sudo: true)
end
