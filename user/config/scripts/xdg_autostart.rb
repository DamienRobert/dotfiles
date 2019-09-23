rel_autostart=@computer.file(:rel_xdg_config_home)+"autostart"
xdg=@computer.dig(:user, :xdg_autostart, default: {})
xdg.each do |k,v|
	entry=<<EOS
[Desktop Entry]
Hidden=#{!v}
EOS
	entry << <<EOS if k=="xfce4-clipman-plugin-autostart"
TryExec=xfce4-clipman
Exec=xfce4-clipman
EOS
	write_file(rel_autostart+"#{k}.desktop",entry)
end
