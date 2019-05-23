begin
	autostart=@computer.file(:xdg_config_home)+"autostart"
	rel_autostart=@computer.home.rel_path_to(autostart, inside: true)
rescue
	rel_autostart=".config/autostart"
end
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
