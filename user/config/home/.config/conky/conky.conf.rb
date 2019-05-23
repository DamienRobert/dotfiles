#!/usr/bin/env ruby
# vim: fdm=syntax

module DR
	module Conky
		extend self
		CONKY=<<EOS
<% border=0
width=@max_width-2*border
col1=border
col2=border+width/4
col3=border+2*width/4
col4=border+3*width/4
col12=col1+(col2-col1)/2
col22=col2+(col3-col2)/2
col32=col3+(col4-col3)/2
col42=col4+(width-col4)/2
graph_height=25
graph_width=width/4-10
biggraph_width=width/2-10
bar_height=6
bar_width=width/4-10
%>
conky.config= {
	own_window=true,
	own_window_transparent=true,
	own_window_type="desktop",
	own_window_colour="brown",
	double_buffer=true,
	maximum_width=<%= @max_width %>,
	minimum_height=<%= @min_height %>,
	gap_x=<%= 10 + @strut_right %>,
	gap_y=<%= 15 + @strut_top %>,
	alignment="top_right",
	draw_borders=false,
	border_inner_margin=<%= border %>,
	use_xft=true,
	xftalpha=0.8,
	font="<%= @font %>",
	default_color="black",
	draw_shades=false,
	update_interval=3,
	update_interval_on_battery=10,
	short_units=true,
	if_up_strictness="link",
	<% if @xdg_runtime_dir %>
	mpd_host="<%= (@xdg_runtime_dir+"mpd_sock").to_s %>",
	<% end %>
}

conky.text=[[
${font}${color orange}${time %a, %e %B %G %H:%M:%S} — MPD: ${mpd_status} (${mpd_vol}%)${hr 2}${alignr}$color
$nodename $sysname $kernel on $machine ${alignr}Uptime: $uptime
${mpd_track} - ${mpd_smart} [${mpd_album}]${alignr}${if_empty $mpd_length}$else($mpd_elapsed/$mpd_length)$endif

$font${color orange}SYSTEM ${hr 2}$color
${freq}MHz ($cpu%) ${goto <%=col2%>}Temp: ${acpitemp}°C ${goto <%=col3%>}Fan: ${acpifan} ${alignr}IO: $diskio
${cpugraph <%=graph_height=%>,<%=biggraph_width=%> 000000 ffffff} ${goto <%=col3%>}${diskiograph <%=graph_height=%>,<%=biggraph_width=%> 000000 ffffff}
${font <%= @smallfont %>}${top name 1} ${goto <%=col12%>}${top pid 1} ${goto <%=col2%>}${top cpu 1} ${goto <%=col22%>}${top mem 1} ${alignr}Load: ${loadavg}
${top name 2} ${goto <%=col12%>}${top pid 2} ${goto <%=col2%>}${top cpu 2} ${goto <%=col22%>}${top mem 2}${alignr}Processes: $processes
${top name 3} ${goto <%=col12%>}${top pid 3} ${goto <%=col2%>}${top cpu 3} ${goto <%=col22%>}${top mem 3}${alignr}Running: $running_processes
${top name 4} ${goto <%=col12%>}${top pid 4} ${goto <%=col2%>}${top cpu 4} ${goto <%=col22%>}${top mem 4}${alignr}Connexions: ${tcp_portmon 1 65535 count} (In: ${tcp_portmon 1 32767 count} Out: ${tcp_portmon 32768 61000 count})${font}
RAM: $memeasyfree ${goto <%= col2 %>}${membar <%=bar_height=%>,<%=bar_width%>} ${goto <%= col3 %>}Swap: $swap ${goto <%= col4 %>}${swapbar <%=bar_height=%>,<%=bar_width=%>}
/home: ${fs_free /home} ${goto <%= col2 %>}${fs_bar <%=bar_height=%>,<%=bar_width=%> /home} ${goto <%= col3 %>}/: ${fs_free /}${goto <%= col4%>}${fs_bar <%=bar_height=%>,<%=bar_width=%> /}
<% if !@battery.nil? %>
Battery: ${goto <%= col2 %>}${battery_bar <%=bar_height=%>,<%=bar_width=%> <%= @battery %>} ${goto <%= col3 %>}${battery <%= @battery %>} ${if_empty ${battery_time <%= @battery %>}}${else}${goto <%= col4 %>}(${battery_time <%= @battery %>})${endif}
<%end%>

<% if !@eth.nil? or !@wlan.nil? %>
$font${color orange}NETWORK ${hr 2}$color
${addr <%= @eth %>}${goto <%=col2 %>}Wifi: ${addr <%= @wlan %>} ${alignr}${if_empty ${wireless_essid <%= @wlan %>}}$else(${wireless_essid <%= @wlan %>}: ${wireless_bitrate <%= @wlan %>})$endif ${wireless_link_bar <%=bar_height=%>,<%=bar_width=%> <%= @wlan %>}${offset 10}x
${goto <%= 10+col1%>}Down: ${downspeed <%= @eth %>}/s ${goto <%=10+col2%>}Up: ${upspeed <%= @eth %>}/s ${goto <%=10+col3%>}Down: ${downspeed <%= @wlan %>}/s ${goto <%=10+col4%>}Up: ${upspeed <%= @wlan %>}/s
${goto <%=col1%>}${downspeedgraph <%= @eth %> <%=graph_height=%>,<%=graph_width%> 000000 ff0000} ${goto <%=col2%>}${upspeedgraph <%= @eth %> <%=graph_height=%>,<%=graph_width=%> 000000 00ff00} ${goto <%=col3%>}${downspeedgraph <%= @wlan %> <%=graph_height=%>,<%=graph_width=%> 000000 ff0000} ${goto <%=col4%>}${upspeedgraph <%= @wlan %> <%=graph_height=%>,<%=graph_width=%> 000000 00ff00}
${goto <%=10+col1%>}Total: ${totaldown <%= @eth %>} ${goto <%=10+col2%>}Total: ${totalup <%= @eth %>} ${goto <%=10+col3%>}Total: ${totaldown <%= @wlan %>} ${goto <%=10+col4%>}Total: ${totalup <%= @wlan %>}${font <%= @smallfont%>}
${execi 30 $HOME/mine/bin/netstat_infos.pl | head -n5}${font}
<%end%>

$font${color orange}LOGGING ${hr 2}$color${font <%= @smallfont %>}
${execi 30 journalctl -b -n3}
$hr
${execi 30 journalctl -n500 |grep pam_unix |tail -n3 }
]]
EOS

		def main(comp)
			@computer=comp
			@wlan=comp.dig(:syst,:net_wlan)&.first
			@eth=comp.dig(:syst,:net_eth)&.first
			@battery=comp.dig(:syst,:batteries)&.first
			@smallfont=comp.font(:conkysmall, type: :xft)
			@font=comp.font(:conky, type: :xft)
			@strut_top=comp.dig(:xorg,:strut,:top,default: 0)
			@strut_right=comp.dig(:xorg,:strut,:right,default: 0)
			@max_width, @min_height=comp.window_size(height_factor: 0.5, width_factor: 0.3, decor: false)
			@xdg_runtime_dir=comp.file(:xdg_runtime_dir)
			erb = Eruby::Engine.new(CONKY)
			#TODO: replace some goto with offset
			return erb.result(binding)
		end
	end
end

require 'dr/base/eruby'
if __FILE__ == $0
	require 'dr/config/computers'
	args=DR::Computers.computers(*ARGV)
	args.each {|c| puts DR::Conky.main(c)}
elsif self.instance_of?(::DR::Eruby::Context)
	unless @computer[:xorg].empty?
		@out=generated_from("-- ")+DR::Conky.main(@computer)
	end
end
