systemctl="systemctl --root=#{@dir[:target].to_s.shellescape}"
services=@processor.services
disabled_services=@processor.disabled_services

logger.debug "=> Services: #{services}"
SH.sh("#{systemctl} preset-all", sudo: true)
services.each do |service|
	# systemctl enable foo1 foo2 fails if foo1 does not exists and do not enable foo2
	SH.sh("#{systemctl} enable #{service.shellescape}", sudo: true)
end
SH.sh("#{systemctl} disable #{disabled_services.shelljoin}", sudo: true) if !disabled_services.empty?

masked=[]
masked << "atop" if has_package?("atop")
SH.sh("#{systemctl} mask #{masked.shelljoin}", log_level_execute: :info,log: true, sudo: true) if !masked.empty?

SH.sh("#{systemctl} daemon-reload", log_level_execute: :info,log: true, sudo: true)
