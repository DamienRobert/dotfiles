#imitate systemd-firstboot
=begin
$ systemd-firstboot --root=/tmp/firstboot --locale=en_US.UTF-8 --keymap=fr --timezone=Europe/Paris --hostname=ploum
will set
- /etc/hostname: ploum
- /etc/locale.conf: LANG=en_US.UTF-8
- /etc/localtime: ../usr/share/zoneinfo/Europe/Paris
- /etc/vconsole.conf: KEYMAP=fr
=end
if (hostname=@computer[:syst][:hostname])
	write_file("etc/hostname",hostname+"\n") 
end
if (machine_info=@computer[:syst][:machine_info])
	write_file("etc/machine-info",SH.export_variables(machine_info))
end
if (locale=@computer[:syst][:locale_info])
	write_file("etc/locale.conf",SH.export_variables(locale))
end
if (timezone=@computer[:syst][:timezone])
	write_symlink("etc/localtime","../usr/share/zoneinfo/#{timezone}")
end
