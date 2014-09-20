#WHEN !@computer[:xorg].empty?
"Generated @<%= `date --iso-8601=seconds`.chomp %>
" no toolbar and blinking cursor
set go-=T
let &guicursor = "a:blinkon0"

set guifont=Monospace\ <%= @computer[:xorg][:gvimfontsize] %>
