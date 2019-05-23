auth=@dir[:target]+".ssh"+"authorized_keys"
auth.exist? or logger.warn "#{auth} does not exists!"
