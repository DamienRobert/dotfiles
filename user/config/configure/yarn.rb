#SH.find_executable("yarn") and SH.sh "yarn config set prefix #{(@dir[:target]+"opt/pkgmgr/yarn").to_s.shellescape}", capture:true, log_level_stdout_success: :debug
## I need to ouptut .config/yarn (which is a symlink to ~pkgmgr/yarn,
#otherwise yarn messes up its bin symlinks
SH.find_executable("yarn") and SH.sh "yarn config set prefix #{(@dir[:target]+".config/yarn").to_s.shellescape}", capture:true, log_level_stdout_success: :debug
