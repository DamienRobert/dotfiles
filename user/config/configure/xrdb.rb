xresources=Pathname.home+".Xresources"
if ENV['DISPLAY'] && xresources.file?
	SH.sh "xrdb -merge #{xresources}"
end
