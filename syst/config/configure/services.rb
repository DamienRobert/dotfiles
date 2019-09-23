systemctl="systemctl --root=#{@dir[:target].to_s.shellescape}"

services=@computer[:syst][:services]||[]
disabled_services=[]

if services.is_a?(Hash)
	disabled_services=services.keys.select {|s| !services[s]}
	services=services.keys-disabled_services
end

services.select do |service|
	case service
	when "/^tinc@/"
		has_package?("tinc")
	# when "unbound.service" #this is in the preset services anyway
		# => either modify ~etc/systemd/system-preset/10-myservices.preset
		# => or just let systemd fails when the service does not exist (the
		# same happens for lightdm anyway)
	# 	has_package?("unbound")
	else
		true
	end
end

logger.debug "=> Services: #{services}"
SH.sh("#{systemctl} preset-all", sudo: true)
services.each do |service|
	# systemctl enable foo1 foo2 fails if foo1 does not exists and do not
	# enable foo2
	SH.sh("#{systemctl} enable #{service.shellescape}", sudo: true)
end
SH.sh("#{systemctl} disable #{disabled_services.shelljoin}", sudo: true) if !disabled_services.empty?

masked=[]
masked << "atop" if has_package?("atop")
SH.sh("#{systemctl} mask #{masked.shelljoin}", log_level_execute: :info,log: true, sudo: true) if !masked.empty?

SH.sh("#{systemctl} daemon-reload", log_level_execute: :info,log: true, sudo: true)
