#!/usr/bin/env ruby

# => 50-preferences.conf
my_preferences = {
	"serif" => ["DejaVu Serif", "Noto Serif"],
	"sans-serif" => ["DejaVu Sans", "Noto Sans"],
	"monospace" => ["Consolas", "Source Code Pro", "Inconsolata", "Hack",
								  "DejaVu Sans Mono", "FreeMono"],
	"cursive" => ["ITC Zapf Chancery Std", "Zapfino"],
	"symbols" => ["Font Awesome", "Symbols Nerd Font"],
	"emoji" => ["Noto Color Emoji"],
	"math" => ["Asana Math"],
}

# Note: 'Sans', 'Sans Mono', 'Serif', 'Emoji', 'Math' fonts are automatically detected in 49-family-auto-generic.conf
# but for reverse mappings we still need them
#=> 45-family-to-generic.conf, 60-generic-to-family.conf
generic_aliases = {
	"serif" => ["DejaVu Serif", "FreeSerif",
						  "Cambria", "Constantia", "Elephant", "Garamond", "Georgia",
							"Palatino", "Times New Roman"],
	"sans-serif" => ["DejaVu Sans", "DejaVu Sans Condensed", "FreeSans",
									 "Arial", "Arial Unicode MS", "Britannic", "Calibri",
									 "Candara", "Corbel", "Helvetica", "Haettenschweiler",
									 "Tahoma", "Trebuchet MS", "Twentieth Century", "Verdana" ],
	"monospace" => ["Consolas", "Source Code Pro", "Inconsolata", "Hack",
								  "DejaVu Sans Mono", "FreeMono",
									"Courier New", "Courier", "Fixedsys", "Inconsolata", "Terminal"],
	"fantasy" => ["Bauhaus Std", "Cooper Std", "Copperplate Gothic Std", "Impact"],
	"cursive" => ["Comic Sans MS", "ITC Zapf Chancery Std", "Zapfino"],
	"symbols" => ["Pomodoro", "Font Awesome", "Octicons", "Icomoon"], # Icomoon=devicons-regular.ttf
	"emoji" => ["Noto Color Emoji", "Apple Color Emoji", "Segoe UI Emoji", 
							"Twitter Color Emoji", "EmojiOne Mozilla", "Emoji Two", "Emoji One",
							"Noto Emoji", "Android Emoji"],
	"math" => ["XITS Math", "STIX Two Math", "Cambria Math", "Latin Modern Math",
						 "Minion Math", "Lucida Math", "Asana Math"],
}

=begin
  Helvetica               Nimbus Sans         TeX Gyre Heros
  Helvetica Narrow        Nimbus Sans Narrow  TeX Gyre Heros Cn
  Times                   Nimbus Roman        TeX Gyre Termes
  Courier                 Nimbus Mono PS      TeX Gyre Cursor
  ITC Avant Garde Gothic  URW Gothic          TeX Gyre Adventor
  ITC Bookman             URW Bookman         TeX Gyre Bonum     Bookman Old Style
  ITC Zapf Chancery       Chancery URW, Z003  TeX Gyre Chorus
  Palatino                Palladio URW, P052  TeX Gyre Pagella   Palatino Linotype
  New Century Schoolbook  Century Schoolbook  TeX Gyre Schola    Century Schoolbook
                          URW, C059

  Microsoft fonts:  Liberation fonts:       Google CrOS core fonts:  StarOffice fonts:  AMT fonts:
  ================  ======================  =======================  =================  ==============
  Arial             Liberation Sans         Arimo                    Albany             Albany AMT
  Arial Narrow      Liberation Sans Narrow
  Times New Roman   Liberation Serif        Tinos                    Thorndale          Thorndale AMT
  Courier New       Liberation Mono         Cousine                  Cumberland         Cumberland AMT
  Cambria                                   Caladea
  Calibri                                   Carlito
  Symbol                                    SymbolNeu

  Microsoft fonts:  Other fonts:
  ================  ============
  Georgia           Gelasio

	Old URW fonts:
  PostScript fonts:       latest URW fonts:     previous URW fonts:
  ======================  ====================  =============================================
  Courier                 Nimbus Mono PS        Nimbus Mono L | Nimbus Mono
  ITC Avant Garde Gothic  URW Gothic            URW Gothic L
  ITC Bookman             URW Bookman           URW Bookman L | Bookman URW
  ITC Zapf Chancery       Z003                  URW Chancery L | Chancery URW
  ITC Zapf Dingbats       D050000L              Dingbats
  Helvetica               Nimbus Sans           Nimbus Sans L
  Helvetica Narrow        Nimbus Sans Narrow    Nimbus Sans Narrow (same as current name)
  New Century Schoolbook  C059                  Century Schoolbook L | Century SchoolBook URW
  Palatino                P052                  URW Palladio L | Palladio URW
  Symbol                  Standard Symbols PS   Standard Symbols L
  Times                   Nimbus Roman          Nimbus Roman No9 L
=end

# => 30-metric-aliases-family.conf and 39-metric-aliases-generic.conf
compatible_metric={
	"Helvetica" =>  ["Nimbus Sans", "TeX Gyre Heros", "Nimbus Sans L"],
	"Helvetica Narrow" =>  ["Nimbus Sans Narrow", "TeX Gyre Heros Cn"],
	"Times" =>  ["Nimbus Roman", "TeX Gyre Termes", "Nimbus Roman No9 L"],
	"Courier" =>  ["Nimbus Mono PS", "TeX Gyre Cursor", "Nimbus Mono L", "Nimbus Mono"],
	"ITC Avant Garde Gothic" =>  ["URW Gothic", "TeX Gyre Adventor", "URW Gothic L"],
	"ITC Bookman" =>  ["URW Bookman", "TeX Gyre Bonum", "Bookman Old Style", "URW Bookman L", "Bookman URW"],
	"ITC Zapf Chancery" =>  ["Z003", "TeX Gyre Chorus", "URW Chancery L", "Chancery URW"],
	"Palatino" =>  ["P052", "TeX Gyre Pagella", "Palladio URW", "Palatino Linotye", "Book Antiqua", "URW Palladio L", "Palladio URW"],
	"New Century Schoolbook" =>  ["C059", "TeX Gyre Schola", "Century Schoolbook", "Century Schoolbook URW", "Century Schoolbook L"],
	"Arial" => ["Liberation Sans", "Arimo", "Albany", "Albany AMT"],
	"Arial Narrow" => ["Liberation Sans Narrow"],
	"Times New Roman" => ["Liberation Serif", "Tinos", "Thorndale", "Thorndale AMT"],
	"Courier New" => ["Liberation Mono", "Cousine", "Cumberland", "Cumberland AMT"],
	"Cambria" => ["Caladea"],
	"Calibri" => ["Carlito"],
	"Symbol" => ["Standard Symbols PS", "SymbolNeu", "Symbola", "Standard Symbols L"],
	"Georgia" => ["Gelasio"],
	"Optima" => ["URW Classico"],
	"Univers" => ["U001"],
	"Clarendon Bold Condensed" => ["Clarendon URW Bold Condensed"],
	"Coronet"  => ["Coronet"],
	"Marigold" => ["Mauritius"],
	"Albertus" => ["A028"],
	"Garamond" => ["Garamond No. 8"],
	"DejaVu Serif" => ["Bitstream Vera Serif"],
	"DejaVu Sans" => ["Bitstream Vera Sans"],
	"DejaVu Sans Mono" => ["Bitstream Vera Sans Mono"],
}

# bidirectional weak alias
bidir_aliases = {
	"Helvetica" => "Arial",
	"Helvetica Narrow" => "Arial Narrow",
	"Times" => "Times New Roman",
	"Courier" => "Courier New",
}

# => 35-weak-aliases.conf
# From: "https://gist.github.com/cryzed/e002e7057435f02cc7894b9e748c5671"
weak_aliases = bidir_aliases.merge(bidir_aliases.invert).merge({
	"Comic Sans MS" => ["Signika"],
	"Consolas" => ["Droid Sans Mono Slashed"],
	"Constantia" => ["Merriweather"],
	"Corbel" => ["Merriweather Sans"],
	"Courier New" => ["Courier Prime"],
	"Geneva" => ["Noto Sans"],
	"Helvetica Neue" => ["Open Sans"],
	"Impact" => ["Oswald"],
	"Lucida Calligraphy" => ["Quintessential"],
	"Lucida Handwriting" => ["Quintessential"],
	"Lucida Casual" => ["CantoraOne"],
	"Lucida Console" => ["Droid Sans Mono"],
	"Lucida Sans Typewriter" => ["Liberation Sans Mono"],
	"Lucida Fax" => ["Luxi Mono"],
	"Lucida Sans" => ["Droid Sans"],
	"Lucida Grande" => ["Droid Sans"],
	"Symbol" => ["Symbola"],
	"Tahoma" => ["DejaVu Sans Condensed"],
	"Trebuchet MS" => ["Ubuntu"],
	"Verdana" => ["DejaVu Sans"],
	"Wingdings" => ["Symbola"],
})

require 'dr/config/computers'
confdir=DR::Pathname.home+DR::Computers::MYFILES[:dot]+".config/fontconfig/conf.d"

squel=<<EOS
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
%s
</fontconfig>
EOS

def list_family(*families)
	families.map {|family| "      <family>#{family}</family>"}.join("\n")
end

def make_alias(family, accept: [], prefer: [], default: [], binding: nil)
	r= <<EOS
  <alias#{binding ? " binding=\"#{binding}\"" : ""}>
    <family>#{family}</family>
EOS
	unless prefer.empty?
	r+= <<EOS
    <prefer>
#{list_family(*prefer)}
    </prefer>
EOS
	end
	unless accept.empty?
	r+= <<EOS
    <accept>
#{list_family(*accept)}
    </accept>
EOS
	end
	unless default.empty?
	r+= <<EOS
    <default>
#{list_family(*default)}
    </default>
EOS
	end
	r+"  </alias>\n\n"
end

r=""
compatible_metric.each do |generic, v|
	v.each do |family|
		r+= make_alias(family, accept: generic, binding: "same")
	end
end
(confdir + "30-metric-aliases-family.conf").filewrite(squel % r)

r=""
weak_aliases.each do |family, aliases|
	r += make_alias(family, accept: aliases)
end
(confdir + "35-weak-aliases.conf").filewrite(squel % r)

# We need to alias generic to family after the weak aliases
r=""
compatible_metric.each do |generic, v|
	r+= make_alias(generic, accept: v, binding: "same")
end
(confdir + "39-metric-aliases-generic.conf").filewrite(squel % r)

r=""
generic_aliases.each do |generic,v|
	v.each do |family|
		r+= make_alias(family, default: generic)
	end
end
(confdir + "45-family-to-generic.conf").filewrite(squel % r)

def auto_match(name, generic, more_test: nil, binding: nil)
	return <<EOS
  <match>
    <test name="family" compare="contains">
      <string>#{name}</string>
    </test>
    <test qual="all" name="family" compare="not_eq">
      <string>#{generic}</string>
    </test>
#{more_test}
    <edit name="family" mode="append" #{binding ? "binding=\"#{binding}\"" : "" }>
      <string>#{generic}</string>
    </edit>
  </match>

EOS
end
# The order is important: "Sans Mono" is monospace
# "Sans Serif" is sans
(confdir + "49-family-auto-generic.conf").filewrite(squel % <<EOS)
#{auto_match('Mono', 'monospace')}
#{auto_match('Sans', 'sans-serif', more_test: <<EIOS)
    <test qual="all" name="family" compare="not_contains">
      <string>monospace</string>
    </test>
EIOS
}
#{auto_match('Serif', 'serif', more_test: <<EIOS)
    <test qual="all" name="family" compare="not_contains">
      <string>sans-serif</string>
    </test>
EIOS
}
#{auto_match('Emoji', 'emoji', binding: "same")}
#{auto_match('Math', 'math', binding: "same")}
EOS

r=""
my_preferences.each do |generic,v|
	r+= make_alias(generic, prefer: v)
end
(confdir + "50-preferences.conf").filewrite(squel % r)

r=""
generic_aliases.each do |generic,v|
	r+= make_alias(generic, prefer: v)
end
(confdir + "60-generic-to-family.conf").filewrite(squel % r)
