if Pathname.new("/usr/share/pacman/keyrings/archlinux_dams.gpg").exist?
  SH.sh("pacman-key --populate archlinux_dams", sudo: true)
end
