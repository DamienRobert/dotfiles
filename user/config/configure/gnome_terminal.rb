gnome_settings=@computer.gnome_settings({})
if ENV['DISPLAY'] and SH.find_executable(gnome_settings[:progname]) and SH.find_executable("gnome-terminal")
	terminal_settings={
		'org.gnome.Terminal.Legacy.Settings::menu-accelerator-enabled' => false,
		'org.gnome.Terminal.Legacy.Settings::default-show-menubar' => false,
		'org.gnome.Terminal.Legacy.Settings::tab-policy' => 'always',
		'org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/::help' => '<Control>F1',
		'org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/::full-screen' => '<Control>F11',
	}
	profile_settings={
		"audible-bell" => false,
		"use-theme-colors" => false,
		"use-system-font" => false,
		"cursor-blink-mode" => "off",
		"default-show-menubar" => false,
		"scroll-on-output" => false,
		"highlight-colors-set" => false,
		"bold-color-same-as-fg" => true,
		"cursor-colors-set" => true,
		"default-size-columns" => @computer.terminal(:vte)[:horiz],
		"default-size-rows" => @computer.terminal(:vte)[:vert],
		"foreground-color" => @computer[:xorg][:colors][:foreground],
		"background-color" => @computer[:xorg][:colors][:background],
		"palette" => @computer[:xorg][:colors][:scheme],
		"cursor-foreground-color" => @computer[:xorg][:colors][:cursor],
		"cursor-background-color" => @computer[:xorg][:colors][:background],
		"font" => @computer.terminal_font(:vte, type: :gtk)
	}
	profile=`gsettings get org.gnome.Terminal.ProfilesList default`.chomp
	profile=profile[1...-1]
	#terminal default profile
	gsettings=(terminal_settings.map {|k,v| gnome_settings[:conf].call(k, v) }+
		profile_settings.map do |k,v|
			gnome_settings[:conf].call("org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:#{profile}/::#{k}", v)
		end).join
	SH.sh_commands gsettings
end
