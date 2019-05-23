if @computer.name=="FleurBleue"
	data=@dir[:target]+"data"
	backups_dina=@dir[:target]+"var"+"backups"+"dina"
	acls=<<EOS
# ~/script/set_acls -u dina -X #{data} #{backups_dina}
~/script/set_acls -u dina -dRX #{data+"Photos"} #{data+"Scans"} #{backups_dina}
EOS
	SH.sh_commands acls
end
