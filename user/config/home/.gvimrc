#WHEN !@computer[:xorg].empty?
"<%= generated_from %>
set go-=T "no toolbar
let &guicursor = "a:blinkon0" "no blinking cursor

if has("nvim")
  set guifont=<%= font=@computer.font(:gvim, :vte, :vt); family=font[:family]; size=font[:size].round; "#{family.shellescape}:h#{size}" %>
else
  set guifont=<%= @computer.font(:gvim, :vte, :vt, type: :gtk).shellescape %>
endif
