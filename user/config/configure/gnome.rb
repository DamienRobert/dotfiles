gsettings=({
	'org.gnome.desktop.interface::cursor-blink' => false,
})
if @computer.name=="imb"
	#remove ugly scrollbar overlay
  gsettings["com.canonical.desktop.interface::scrollbar-mode"]="normal"
end

gnome_settings=@computer.gnome_settings(gsettings)

if ENV['DISPLAY'] and SH.find_executable(gnome_settings[:progname])
	SH.sh_commands gnome_settings[:settings]
end
