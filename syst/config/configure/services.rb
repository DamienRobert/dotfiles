systemctl="systemctl --root=#{@computer.root.to_s.shellescape}"

services=@computer[:syst][:services]||[]
disabled_services=[]

if services.is_a?(Hash)
	disabled_services=services.keys.select {|s| !services[s]}
	services=services.keys-disabled_services
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
SH.sh("sudo #{systemctl} mask #{masked.shelljoin}", log_level_execute: :info,log: true) if !masked.empty?
