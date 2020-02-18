#!/usr/bin/env ruby
# extract slogans

=begin
The makefile goes SOURCES -> FOOS -> BARS -> PDFS
.tex->.foo is $(FOO_LATEX):=$(LATEX)
.foo->.bar is for bibtex
.bar->.pdf is $(PDFLATEX)
Note: a .pdf requires all FOOS, meaning the other sources will get compiled to get the correct references.

tmp/ holds book.tex from the make_book.py script, and index.tex from the make_index.py. Cf 'make tmp/book.tex'

web: make web creates a web_book, for use with plastex
	python2 ./scripts/web_book.py "$(CURDIR)" > $(WEBDIR)/book.tex

tags:
- python2 scripts/add_tags.py assign new tags to labels (in tags/tags)
- tag_up.py introduit des \reversemarginpar\marginnote{039G}\hypertarget{039G}{}
au niveau de chaque label.
- make tags copie tous les fichiers sous tags/tmp (en convertissant via tag_up.py les .tex), puis compile.

=> targets:
- the default only recompile the updated tex files
- make pdfs compile all pdfs 
- make book compile the book
- make distclean => make clean, make tags_clean
- mkdir web && make WEBDIR=web web

Lists of chapters occur in the following files
	Makefile #LIJST=introduction conventions sets categories ...
	tags/Makefile
	preamble.tex #\externaldocument[introduction-]{introduction}...
	chapters.tex # a toc make by hand: \item \hyperref[introduction-section-phantom]{Introduction}...
=end

require 'latex/decode'
puts "vim: ft=markdownlight fdm=expr\n"
ARGV.each do |file|
	title=file
	found=section=section_printed=slogan=nil
	File.read(file).each_line do |line|
		if line =~ %r!\\begin\{slogan\}!
			slogan=[]
			unless found
				puts "# #{title}"
				found=true
			end
		elsif line =~ %r!\\end\{slogan\}!
			puts "$ #{section}" unless section_printed
			puts "- #{slogan.join(' ')}" if slogan
			slogan=false
			section_printed=true
		elsif line =~ %r!\\section\{slogan\}!
		else
			line.match(%r!\\section\{(.*)\}!) do |m|
				section=LaTeX.decode(m[1])
				section_printed=false
			end
			line.match(%r!\\title\{(.*)\}!) do |m|
				title="#{LaTeX.decode(m[1])} (#{file})"
			end
			slogan << LaTeX.decode(line.chomp) if slogan
		end
	end
	puts if found
end

=begin
LIJST=(introduction conventions sets categories \
	topology sheaves sites stacks \
	fields algebra brauer \
	homology derived simplicial \
	more-algebra smoothing \
	modules sites-modules \
	injectives cohomology sites-cohomology dga dpa sdga hypercovering \
	schemes constructions properties morphisms coherent divisors limits \
	varieties topologies descent perfect more-morphisms flat groupoids \
	more-groupoids etale \
	chow intersection pic weil \
	adequate dualizing duality discriminant derham local-cohomology \
	algebraization curves resolve models pione etale-cohomology \
	crystalline proetale more-etale trace \
	spaces spaces-properties spaces-morphisms decent-spaces \
	spaces-cohomology spaces-limits spaces-divisors spaces-over-fields \
	spaces-topologies \
	spaces-descent spaces-perfect spaces-more-morphisms \
	spaces-flat spaces-groupoids spaces-more-groupoids bootstrap \
	spaces-pushouts spaces-chow \
	groupoids-quotients spaces-more-cohomology spaces-simplicial \
	spaces-duality formal-spaces restricted spaces-resolve \
	formal-defos defos cotangent examples-defos \
	algebraic examples-stacks stacks-sheaves criteria artin quot \
	stacks-properties stacks-morphisms stacks-limits \
	stacks-cohomology stacks-perfect \
	stacks-introduction stacks-more-morphisms stacks-geometry \
	moduli moduli-curves \
	examples exercises guide \
	desirables coding obsolete)

~/script/misc/stack_project.rb ${^LIJST}.tex > slogans.md


=end
