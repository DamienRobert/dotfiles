if @computer[:syst][:services]&.include?("port_forward.service")

# timer=<<EOS
# [Unit]
# Description=Port Forwarding Timer
# After=network.target
# 
# [Timer]
# OnBootSec=1min
# OnUnitActiveSec=24h
# 
# [Install]
# WantedBy=timers.target
# EOS

unit=<<EOS
[Unit]
Description=Port Forwarding
After=network.target
Wants=port_forward_test.timer

[Service]
Type=simple
User=%{user}
SyslogIdentifier=ssh_port_forward
ExecStart=/usr/bin/ssh -nN -o "ExitOnForwardFailure yes" -i %{id_file} -R %{remote_port}:%{local_host}:%{local_port} %{remote_host}
Restart=always
RestartSec=60min

[Install]
WantedBy=multi-user.target
EOS

test_unit=<<EOS
[Unit]
Description=Test Port Forwarding is active

[Service]
Type=simple
# User=%{user}
SyslogIdentifier=ssh_test_port_forward
ExecStart=%{services}/test_port_forward %{local_host_name} %{user}
EOS

test_unit_timer=<<EOS
[Unit]
Description=Port Forwarding Test timer
BindsTo=port_forward.service
After=port_forward.service

[Timer]
OnUnitActiveSec=1h
EOS

enable_service=lambda do |service, test_service, test_timer|
	#write_file("etc/systemd/system/port_forward.timer", timer)
	#write_symlink("etc/systemd/system/timers.target.wants/", "../port_forward.timer")
	write_file("etc/systemd/system/port_forward.service", service)
	write_file("etc/systemd/system/port_forward_test.service", test_service)
	write_file("etc/systemd/system/port_forward_test.timer", test_timer)
	write_symlink("etc/systemd/system/multi-user.target.wants/", "../port_forward.service")
end

data = { local_host: "localhost", local_port: 22, id_file: @computer.file(:cfgfiles)+"files/.ssh/id_ed25519_forward", user: @computer.dig(:user,:username), services: @computer.file(:scriptfiles)+"services", local_host_name: @computer.dig(:syst,:hostname), remote_host: "phare", remote_port: 44000 }

case @computer.name
when "Mithrim"
	data.merge!({remote_port: 44002, remote_host: "aimb"})
end

enable_service.(unit % data, test_unit % data, test_unit_timer % data)

end
