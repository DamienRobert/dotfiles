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

def eduroam(server, eap: "TTLS", phase2: "PAP")
	#UB: https://cat.eduroam.org/?idp=323
	uri=@computer.authinfo[server][:eduroam]||@computer.authinfo[server][:default]
	domain=uri.host; user=uri.user; password=uri.password
	user="#{user}@#{domain}" if server==:ub
	cert=get_files("etc/wpa_supplicant/eduroam-#{server}.{pem,cer}")
	cert && cert.each do |f|
		copy_file(f)
	end

	# note: PEAP-MSCHAPv2 would be
	# eap=PEAP; phase2="auth=MSCHAPV2"
	# note: TTLS-MSCHAPv2 would be
	# eap=TTLS; phase2="auth=MSCHAPV2"
	config= <<EOS
  ssid="eduroam"
  key_mgmt=WPA-EAP
  # pairwise=CCMP TKIP
  # group=CCMP TKIP
  eap=#{eap}
  anonymous_identity="anonymous@#{domain}"
  identity="#{user}"
  password="#{password}"
  phase2="auth=#{phase2}"
EOS
	config << "  ca_cert=\"/#{cert.first}\"\n" if cert and !cert.empty?
	config << "  domain_suffix_match=\"radius.u-bordeaux.fr\"\n" if server==:ub
	config
end

def get_wpa_config(wpa_type)
	wpa_header=<<EOS
ctrl_interface=DIR=/run/wpa_supplicant GROUP=network
update_config=1
EOS
	wpa_network_Lapinou=<<EOS
network={
  id_str="Home Wifi 2.4GHz"
  ssid="LapinouBlanc"
  psk=5da8522df6d5e11fbbba8ac460370e5c8fbd028c9a8e505acc6ab43a0d991578
  priority=1
}
network={
  id_str="Home Wifi 5GHz"
  ssid="LapinouBlanc5"
  psk=945fe06cbea6f2ccb8c9f17c66dc7f2ab4fae59b14136f515cb5a7ea19891f57
  priority=2
}
EOS

	wpa=wpa_header
	wpa+=case wpa_type
		when "Lapinou"
			wpa_network_Lapinou
		when "basic"
			<<EOS
#Networks needing web authentification (disabled by default)
network={
  key_mgmt=NONE
  ssid="FreeWifi"
  disabled=1
}

#My networks
#{wpa_network_Lapinou}

network={
  id_str="Android Phone"
  ssid="AndroidAP"
  psk="DamienAndroid"
}

network={
  id_str="Eduroam Inria"
#{eduroam(:inria, eap: "PEAP", phase2: "MSCHAPV2").chomp}
}

network={
  id_str="Eduroam Universite Bordeaux"
#{eduroam(:ub).chomp}
}

network={
  id_str="Brignais"
  ssid="lifeislife"
  psk="lanuittousleschatssontgris"
}

network={
  id_str="Valence"
  ssid="SFR_E460"
  psk="kejyec7shlornarnucky"
}

network={
  id_str="Xavier"
  ssid="SFR_EAE8"
  psk="tentraperrideramm2ac"
}

network={
  id_str="Bernin"
  ssid="GOSAPY"
  psk="3738GLC-25"
  # scan_ssid=1
}

network={
  id_str="Bernin Haut"
  ssid="dlink-0D0F"
  psk="3738GLC-25"
}

#Other
EOS
		end
end

wpa_type=nil
if (wlan=@computer.dig(:syst,:net_wlan)&.first)
	if @computer.dig(:syst,:laptop)
		wpa_type="basic"
	end
	case @computer.name
	when "Feanor","FleurBleue"
		wpa_type="Lapinou"
	end
end
if wpa_type
	wpa=get_wpa_config(wpa_type)
	write_file("etc/wpa_supplicant/wpa_supplicant-#{wlan}.conf",wpa, perm: 0600)
end
