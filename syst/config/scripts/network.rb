# * systemd-resolved now maintains a new dynamic
# /run/systemd/resolve/stub-resolv.conf compatibility file. It is recommended
# to make /etc/resolv.conf a symlink to it. This file points at the
# systemd-resolved stub DNS 127.0.0.53 resolver and includes dynamically
# acquired search domains, achieving more correct  DNS resolution by software
# that bypasses local DNS APIs such as NSS.  
if @computer.current?
	#check which file exist
	dir=Pathname.new("/run/systemd/resolve")
	files=[dir+"stub-resolv.conf", dir+"resolv.conf"]
	files.each do |file|
		if file.exist?
			write_symlink("etc/resolv.conf", file)
			break
		end
	end
else
	write_symlink("etc/resolv.conf", "/run/systemd/resolve/stub-resolv.conf")
end

@wifi_networks={
  "Home WiFi 2.4GHz" => {ssid:"LapinouBlanc", psk: "5da8522df6d5e11fbbba8ac460370e5c8fbd028c9a8e505acc6ab43a0d991578", priority: 1},
  "Home WiFi 5GHz" => {ssid: "LapinouBlanc5", psk: "945fe06cbea6f2ccb8c9f17c66dc7f2ab4fae59b14136f515cb5a7ea19891f57", priority: 2},
  "Free Wifi" => {disabled: true},
  "Android Phone" => {ssid: "AndroidAP", pass: "DamienAndroid"},
  "Brignais" => {ssid: "lifeislife", pass:"lanuittousleschatssontgris"},
  "Valence" => {ssid: "SFR_E460", pass: "kejyec7shlornarnucky"},
  "Xavier" => {ssid: "SFR_EAE8", pass: "tentraperrideramm2ac"},
  "Bernin" => {ssid: "GOSAPY", pass: "3738GLC-25"},
  "Bernin Haut" => {ssid: "dlink-0D0F", pass: "3738GLC-25"}, #hidden: true
  "Eduroam Inria" => {eduroam: :inria, eduroam_opts: {eap: "PEAP", phase2: "MSCHAPV2"}},
  "Eduroam Universite Bordeaux" => {eduroam: :ub},
}

def eduroam(server, eap: "TTLS", phase2: "PAP")
	# note: PEAP-MSCHAPv2 and TTLS-MSCHAPv2 would be
	# eap=PEAP; phase2="auth=MSCHAPV2"
	# eap=TTLS; phase2="auth=MSCHAPV2"
	# In wpa_supplicant, the following settings are on by default it seems, so no need to add them
	# pairwise=CCMP TKIP
  # group=CCMP TKIP
	
	#UB: https://cat.eduroam.org/?idp=323
	uri=@computer.authinfo[server][:eduroam]||@computer.authinfo[server][:default]
	domain=uri.host; user=uri.user; password=uri.password
	user="#{user}@#{domain}" if server==:ub
	cert=get_files("etc/wpa_supplicant/eduroam-#{server}.{pem,cer}")
	cert && cert.each do |f|
		copy_file(f)
	end

	r={
		ssid: "eduroam",
		eap_method: eap,
		eap_phase2_method: phase2,
		eap_identity: "anonymous@#{domain}",
		eap_phase2_identity: user,
		eap_phase2_password: password,
	}
	r[:eap_cacert]="/#{cert.first}" if cert and !cert.empty?
	r[:wpa_supplicant]="  domain_suffix_match=\"radius.u-bordeaux.fr\"\n" if server==:ub
	r
end

def key_type(network)
	if network.key?(:eap_method)
		:'8021x'
	elsif not (network.key?(:pass) or network.key?(:psk))
		:open
	else
		:psk
	end
end

def to_wpa(network)
	r="network={\n"
	wpa_network=network.clone
	case key_type(network)
	when :'8021x'
		wpa_network[:key_mgmt]="WPA-EAP"
	when :open
		wpa_network[:key_mgmt]="NONE"
	end
	wpa_network.each do |k,v|
		next if %i(iwd wpa_supplicant).include?(k)
		k=:id_str if k==:id
		k=:anonymous_identity if k==:eap_identity
		k=:identity if k==:eap_phase2_identity
		k=:password if k==:eap_phase2_password
		k=:ca_cert if k==:eap_cacert
		k=:eap if k==:eap_method
		if k==:eap_phase2_method
			v="auth=#{v}".inspect
			k=:phase2
		end
		v=v.inspect if %i(pass ssid id_str anonymous_identity identity password ca_cert).include?(k)
		k=:scan_ssid if k==:hidden
		v=1 if v and k==:disabled || k==:scan_ssid
		k=:psk if k==:pass #put after the inspect because we need to quote
		r<< "  #{k}=#{v}\n"
	end
	r << wpa_network[:wpa_supplicant] if wpa_network.key?(:wpa_supplicant)
	r<<"}\n"
	r
end

def iwd_filename(basename)
	if basename =~ /\A[a-zA-Z _\-]*\z/
		basename
	else
		basename.unpack('U*').map {|i| i.to_s(16)}.join
		# To read an encoded ssid: r.each_char.each_slice(2).map{|i| i.join.hex}.pack('U*')
	end
end

def to_iwd(network)
	iwd_network=network.clone
	basename=iwd_network[:ssid]
	filename=iwd_filename(basename)
	ext=key_type(network).to_s
	dir=Pathname.new("var/lib/iwd")
	file=dir+"#{filename}.#{ext}"
	eap=network[:eap_method]&.downcase
	r=""
	iwd_network.each do |k,v|
		next if %i(hidden disabled iwd wpa_supplicant id ssid priority).include?(k)
		k=:Passphrase if k==:pass
		k=:PreSharedKey if k==:psk
		k=k.to_s.sub("eap_phase2_", "eap_#{eap}_phase2_") if k.to_s.start_with?("eap_phase2_")
		k=:"eap_#{eap}_cacert" if k==:eap_cacert
		if k.to_s.start_with?("eap_")
			k=k.to_s.split("_").map do |part|
				if %w(eap tls ttls peap).include?(part)
					part.upcase
				elsif part=="cacert"
					"CACert"
				else
					part.capitalize
				end
			end.join("-").to_sym
		end
		r<< "#{k}=#{v}\n"
	end
	r << iwd_network[:iwd] if iwd_network.key?(:iwd)
	content=""
	settings=""
	settings << "AutoConnect=false\n" if network[:disabled]
	settings << "Hidden=true\n" if network[:hidden]
	content="[Settings]\n#{settings}" unless settings.empty?
	content="[Security]\n#{r}" unless r.empty?
	write_file(file, content) unless get_file(file).exist?
	return file, r
end

def ssids(wifi_type)
	ssids=case wifi_type
		when "Lapinou"
			["Home WiFi 2.4GHz", "Home WiFi 5GHz"]
		else
			@wifi_networks.keys
		end
	r={}
	ssids.each do |ssid|
		network=@wifi_networks[ssid].clone
		if (eduroam=network.delete(:eduroam))
			opts=network.delete(:eduroam_opts) || {}
			network.merge!(eduroam(eduroam, **opts))
		end
		network[:id]=ssid unless network.key?(:id)
		network[:ssid]=ssid unless network.key?(:ssid)
		r[ssid]=network
	end
	r
end

def get_wpa_config(ssids)
	wpa=<<EOS
ctrl_interface=DIR=/run/wpa_supplicant GROUP=network
update_config=1

EOS
	ssids.each do |_ssid, network|
		wpa+=to_wpa(network)+"\n"
	end
	wpa+="#Other\n"
	wpa
end
def get_iwd_config(ssids)
	ssids.each do |_ssid, network|
		to_iwd(network)
	end
end

wifi_type=nil
if (wlan=@computer.dig(:syst,:net_wlan)&.first)
	if @computer.dig(:syst,:laptop)
		wifi_type="basic"
	end
	case @computer.name
	when "Feanor","FleurBleue"
		wifi_type="Lapinou"
	end
end
if wifi_type
	ssids=ssids(wifi_type)
	wpa=get_wpa_config(ssids)
	write_file("etc/wpa_supplicant/wpa_supplicant-#{wlan}.conf",wpa, perm: 0600)
	get_iwd_config(ssids)
end
