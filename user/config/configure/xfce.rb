xfsettings={
	"keyboards::/Default/Numlock" => true,
	"keyboard-layout::/Default/XkbDisable" => true,
	"xfce4-keyboard-shortcuts::/commands/custom/<Control><Alt>l" => "dm-tool lock",
	"xfce4-notifyd::/theme"  => "Smoke",
	"xfce4-session::/startup/ssh-agent/enabled" => false,
	"xfce4-session::/startup/gpg-agent/enabled" => false,
	"xfce4-session::/general/SaveOnExit" => false,
	"xfce4-session::/sessions/Failsafe/Client0_Command" => ["fvwm"],
}

xfce_settings=@computer.xfce_settings(xfsettings)

if ENV['DISPLAY'] and SH.find_executable(xfce_settings[:progname])
	SH.sh_commands xfce_settings[:settings]
end


