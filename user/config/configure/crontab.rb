cronfile=@computer.file(:userfiles)+"crontab"+"#{@computer.name}.crontab"
SH.sh("crontab", cronfile.to_s) if cronfile.exist?
