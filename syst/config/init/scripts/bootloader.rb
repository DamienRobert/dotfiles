require 'bootloader'

if @computer[:syst][:boot]
	bootloader=DR::Config::Bootloader.new(@processor)

	bootloader.all_entries do |dir, entry|
		case @computer.name
		when "old_Feanor"
			if dir=="linux-init"
				entry[:rootflags]="subvol=/slash-init"
			end
		end
		entry
	end

	bootloader.write_entries
end
