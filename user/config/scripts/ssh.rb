sshdir=@local_computer.file(:dotfiles)+".ssh"

content=""
content << "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA4iYssyCuk15dOvRyypsV2ogpdrRpD8FApPiJEkWyvf openpgp:0x99000009\n" #official gpg ed25519 public key
content << "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBNlDFlChzl+IAeyqGxk8etef9pEBOl8L6IIXwIaSDcY openpgp:0xC5A8A040\n" #personal gpg ed25519 public key
content << (sshdir+"id_ed25519.pub").read

case @computer.name
when "ainriabdx", "gforge-inria"
	content << (sshdir+"id_rsa.pub").read
when "imb"
	content << <<EOS
command="echo This key is for setting up port forwarding" ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINHbw+02dZcfjwFZPXS1EdQskdgD9P5/pITSbOTVJY+M dams@mithrim--2018-01-16
EOS
end

# case @computer[:user][:hosttype]
# when "ens"
# 	content << read_file(".ssh/id_androidkey.pub")
# end
# case @computer.name
# when "plafrim"
# 	copy_file(".ssh/id_dsa.pub")
# 	copy_file(".ssh/id_dsa")
# 	content << read_file(".ssh/id_dsa.pub")
# end

write_file(".ssh/authorized_keys",generated_from(true)+content, perm: 0o600)
