if (fstab=@computer.dig(:sysinit, :fstab))
	# allow a callback like
	#  process.computer[:sysinit][:fstab]=Proc.new do %x(genfstab -p -U #{@dir[:target].shellescape}) end
	fstab=instance_eval(&fstab) if fstab.respond_to?(:call)
	write_file("etc/fstab", fstab)
end
