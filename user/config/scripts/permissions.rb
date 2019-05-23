mine=@dir[:out]+@computer.file(:rel_myfiles)
mine.chmod(0700) if mine.directory?

gpg=@dir[:out]+@computer.file(:rel_dotfiles)+".gnupg"
gpg.chmod(0700) if gpg.directory?
