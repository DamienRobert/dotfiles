vim: ft=markdownlight fdm=expr

Macro
=====

https://tug.org/TUGboat/tb22-4/tb72perlS.pdf
 A complement to \smash, \llap, and \rlap => \clap, \math?lap
 \def\llap#1{\hbox to 0pt{\hss#1}}
 \def\rlap#1{\hbox to 0pt{#1\hss}}

TeX
===

http://tex.stackexchange.com/questions/50069/how-to-change-white-background-of-an-included-pdf-to-transparent

http://tex.stackexchange.com/questions/87520/how-to-install-tex-on-android-phones

Using recode to convert \'{e} into é:
recode -d Tex..u8 foobar

LuaTeX
------

http://tex.stackexchange.com/questions/33096/which-lua-environment-should-i-use-with-luatex-lualatex/33102#33102
  #different environments to embed lua inside a luatex tex file

luatextra: not really needed:
\RequirePackage{fontspec}
\RequirePackage{luatexbase} -> obsolete
\RequireLuaModule{lualibs}
\RequirePackage{metalogo} -> just \TeX, \LuaTex logos
\RequirePackage{luacode} -> wrapper around \directlua
\RequirePackage{fixltx2e} -> not needed anymore

TexLive
=======

mktexlsr=texhash : create ls-R database
mktexfmt=fmtutil, fmtutil-sys: TeX format files

updmap, updmap-sys: manage TeX font maps

mktextfm: create tfm file for a font
mktexmf: create metafont
mktexpk: create pk file for a font

* Après une update:
sudo fmtutil-sys --all #ou fmtutil-sys --missing
sudo updmap-sys
luaotfload-tool -u

* Userspace
fmtutil --all
updmap
luaotfload-tool -u #should be done automatically but can be usefull if it bugs

* kpathsea
Usage: kpsexpand [options] string
Usage: kpsetool -w [options] pathtype filename
Usage: kpsepath  [options] pathtype

Valid options are the following:
  -n progname  : pretend to be progname to kpathsea
  -m mode      : set Metafont mode
  -w           : locate files (similar to kpsewhich)
  -p           : act like kpsepath
  -v           : act like kpsexpand

Ex: kpsewhich updmap.cfg
    kpsepath tex

## Configuration: see conf: texconfig conf

From /etc/texmf/web2c/texmf.cnf, we have:
  TEXMFCONFIG = ~/.texlive/texmf-config
In /home/dams/latex/texmf/texmf-config/web2c/texmf.cnf:
  TEXMFCONFIG = $HOME/texmf/texmf-config
  OSFONTDIR = ~/.fonts//:/usr/share/fonts//
  %TEXMFCONFIG = $HOME/.texmf-config;$HOME/texmf/texmf-config
  %TEXMFLOCAL = $HOME/texmf/texmf-config
  %TEXINPUTS =  ./packages//; 
  % modifier ~/opt/packages/texlive/texmf.cnf!
But the texmf.cnf is not read yet because it won't search in this
directory! Solution: export TEXMFCNF=/home/dams/latex/texmf/texmf-config/web2c:

But simpler method: just do a symlink

OSFONTDIR: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=683943
luatex uses fontconfig to find fonts if no OSFONTDIR is configured
=> I want to unset it

Exemple: kpsexpand '$TEXINPUTS'
- // -> regarder tous les sous répertoires
- !! -> If the path is prepended by two exclamation marks, the file system will not be searched. The file ls-R in the given directory will be taken as a file name database containing a recursive listing of that directory.
eg TEXINPUTS=".//:$TEXINPUTS" latexmk ...

Bibtex
======

curl -LH "Accept: application/x-bibtex" http://dx.doi.org/10.15454/FDUJ25

Maths
=====

- https://tex.stackexchange.com/questions/84302/what-is-the-difference-of-mathop-operatorname-and-declaremathoperator

mathtools
---------

\smash, \llap, \rlap ->
\mathllap, ..., \clap
\mathmbox, \mathmakebox

\cramped: pour passer en mode cramp (les indices sont moins relevés).
\cramped[\scriptstyle] pour du mode cramp en \scriptstyle
+ \crampedclap pour combiner \cramped et \clap

\smashoperator: pour faire du \mathclap sur les indices en haut et en bas

\adjustlimits pour ajuster les limites de différents opérateurs

* tags
\newtagform{name}[\command]{left_del}{right_delimiter}
\renewtagform...
\usetagform{name}

\showonlyrefs=true|false (pour ne pas afficher un numéro d'équation s'il
n'est pas référencé)

(+ \refeq pour les références d'équations faites par \tag*)

* Extensible symbols:
\xleftrightarrow[under][over]
...

\underbracket[rule thickness][bracket height]{arg}
\overbracket... (comme \underbrace et \overbrace mais avec des brackets)

\begin{matrix*}[alignement]

* nouvel environnement pour indiquer l'alignement des colonnes

Environnement multlined
\begin{multlined}[pos][width] (pos=t|b|c: alignement vertical)
  ...
  \shoveleft[dim]{args}
  \shoveright...

Environnement dcases: comme cases mais les maths sont en displaystyle
              dcases*: la seconde colonne est en texte par défaut

\shortintertext: moins d'espacement vertical que \intertext

\DeclarePairedDelimiter\abs{\vert}{\rvert}
  -> \abs* donne des délimiteurs avec \left et \right
  -> \abs[big|Big|bigg|Bigg]

\coloneqq, \Colonapprox, ...(C pour ::)

\spreadlines[dim] -> espacement vertical dans gather
lgathered, rgathered: comme gathered mais alignement l ou r

\mathtoolset{mathic=true}: corrections italiques en mode math (utiliser \(
\) plutôt que $$ pour l'avoir).

\prescript: indices à gauche

\splitfrac: fractions sur plusieurs lignes

* empheq
\begin{empheq}{align*}

empheq permet de mettre des trucs autour des équations: des trucs à gauche
ou droite, des boxes.

utiliser {empheq}{multine} ou {empheq}{gather} donne de meilleurs résultats
que amsmaths quand on a des grands tags (pour multline) ou des tags de
différentes longueurs pour gather (car gather centre par ligne).

On peut utiliser overload pour remplacer ces environnements
automatiquement, et overload2 pour remplacer \[\] aussi. Et puis ça marche
mieux avec le marqueur de fin de ntheorem aussi.

Unicode
=======

- newunicodechar
  To enter commands like
  \newunicodechar{ò}{\u{o}}
  instead of \DeclareUnicodeCharacter{014F}{\u{o}}
  calling \newunicodechar{ù}{\={u}} is equivalent to say
  \makeatletter
  \@namedef{u8:\detokenize{ù}}{\={u}}
  \makeatother

- input methods in vim:
  unilatex.vim https://www.vim.org/scripts/script.php?script_id=284
  https://github.com/joom/latex-unicoder.vim (https://www.reddit.com/r/vim/comments/2rzpp7/a_plugin_to_type_unicode_chars_in_vim_using_their/)

Font Packages
=============

- fontspec: use otf fonts in lualatex [also replace the fonts used for mathrm, mathsf and so on]
- unicode-math: use otf fonts for math in lualatex

- mathspec: use the same font in math and text (for xetex, not compatible
with luatex); see http://tex.stackexchange.com/questions/118244/what-is-the-difference-between-unicode-math-and-mathspec
- mathastext: use the same font in math and text (for legacy latex), partial support for luatex

Ex of text and math fonts rendering: http://www.princeton.edu/~gkv/aofd/fonts/

Ex:
\fontsize{25pt}{30pt}
\fontspec{Zapfino Extra LT Pro}
fontsize works in standard tex too, it selects the size and the baseline
size. It needs to be followed by a \selectfont but \fontspec calls
\selectfont already.

Fonts
=====

\defaultfontfeatures+{Ligatures=Tex}%append the font features (Ligatures=Tex is now on by default)
\fontspec{Font}[Numbers=OldStyle] % change the features for this font
\addfontfeatures % change the features for the current font
Sizes: http://tex.stackexchange.com/questions/46087/how-do-i-change-the-font-size-in-lualatex

* Small Caps with lmodern by using the CM-Super substitute:
- http://tex.stackexchange.com/questions/22240/choosing-font-for-bold-small-caps-or-any-other-particular-familyseriesshape-c
- http://tex.stackexchange.com/questions/79086/how-to-use-all-variants-of-latin-modern-roman-with-fontspec
  # with fontspec

* Cursive fonts:
http://tex.stackexchange.com/questions/48002/hand-written-fonts-in-latex-xetex-luatex
-> http://www.tug.dk/FontCatalogue/calligraphicalfonts.html
-> http://www.fontsquirrel.com/fonts/list/style/Handdrawn
-> http://www.fontsquirrel.com/fonts/list/style/Calligraphic

* Zapfino: http://tex.stackexchange.com/questions/29123/can-i-get-lualatex-to-do-font-variations-on-the-zapfino-font-just-as-xelatex-doe
-> Zapfino Extra LT Pro is newer font, it combines the older four Linotype Zapfino fonts with extensive OpenType features (http://www.twardoch.com/download/typotechnica2005_zapfino.pdf)

* Embed the full fonts
- In pdftex: https://tex.stackexchange.com/questions/24002/turning-off-font-subsetting-in-pdftex
- In luatex: https://tex.stackexchange.com/questions/485774/how-can-i-verify-that-the-fonts-are-all-embedded-in-my-lualatex-document

* Add symbols and enter utf8 caracters:
- https://tex.stackexchange.com/questions/62725/the-notation-in-various-engines
  ^^^^0056
- https://tex.stackexchange.com/questions/159669/how-to-print-a-warning-sign-triangle-with-exclamation-point
  - {\fontencoding{U}\fontfamily{futs}\selectfont\char 66\relax}
    \newcommand*{\TakeFourierOrnament}[1]{{\fontencoding{U}\fontfamily{futs}\selectfont\char#1}}
    \newcommand*{\danger}{\TakeFourierOrnament{66}}
  - \usepackage{newunicodechar}\newunicodechar{⚠}{\Warning}
  - fontspec: \newcommand\warningsign{⚠}

* Symbols list
- http://tug.ctan.org/info/symbols/comprehensive/symbols-a4.pdf
- €: http://www.theiling.de/eurosym.html
- http://mirrors.ibiblio.org/CTAN/macros/latex/contrib/unicode-math/unimath-symbols.pdf

Math fonts
==========

* Référence:
- https://tex.stackexchange.com/questions/290555/lualatex-and-mathspec
- http://mirrors.ircam.fr/pub/CTAN/macros/latex/contrib/mathalpha/doc/mathalpha-doc.pdf
- https://tex.stackexchange.com/questions/58098/what-are-all-the-font-styles-i-can-use-in-math-mode

* Math fonts:
- http://en.wikipedia.org/wiki/Asana-Math
Asana-Math is a Palatino-like OpenType mathematical font
- http://en.wikipedia.org/wiki/Cambria_%28typeface%29
- http://en.wikipedia.org/wiki/Computer_Modern
  Computer Modern -> LatinModern
- http://en.wikipedia.org/wiki/Lucida
- http://en.wikipedia.org/wiki/Minion_%28typeface%29
- http://en.wikipedia.org/wiki/AMS_Euler
  AME_Euler -> NeoEuler
- http://en.wikipedia.org/wiki/STIX_Fonts_project
  + Math -> http://en.wikipedia.org/wiki/XITS_font_project

-> http://www.gust.org.pl/projects/e-foundry/math/gust_e-foundry-math_fonts-presentation.pdf examples of the following math fonts:
Latin Modern Math,
TG Bonum Math, TG Schola Math, TG Pagella Math, TG Termes Math
DejaVu Math, Cambria Math, Asana Math, Lucida Math, XITS Math
-> https://developer.mozilla.org/en-US/docs/Mozilla/MathML_Project/Fonts
On ArchLinux: texlive-core (Latin Modern Math, TeX Gyre Math), texlive-fontsextra (XITS Math, STIX Math, Asana Math).

$ stack exchange (math fonts):
http://tex.stackexchange.com/questions/145522/what-is-the-best-math-font-for-use-with-minion-pro-font
http://tex.stackexchange.com/questions/37561/getting-started-with-minion-pro-xelatex-and-mathspec -> Minion Math: http://www.typoma.com/en/fonts.html
http://tex.stackexchange.com/questions/219392/state-of-unicode-math-typesetting-fonts
- https://tex.stackexchange.com/questions/439477/how-do-i-use-a-math-symbol-from-the-private-use-area-with-unicode-math
- https://tex.stackexchange.com/questions/514204/replicating-charter-bt-of-mathdesign-using-unicodemath
  If using mathdesign, load it before fontspec

* lualatex packages
- lualatex-math patches for the LATEX2ε kernel and the ams math, mathtools and icomma packages are provided
- mathfont: https://ctan.org/pkg/mathfont?lang=en
  Like mathspec, but compatible with luatex. Use a font as a math alphabet
  (for plain pdflatex: mathastext)
  Cf also https://tex.stackexchange.com/questions/487310/are-mathfont-and-mathspec-intended-for-same-purpose/487319#487319
  as to why it is better to use unicode-math if possible

Typography
==========

- Classic Thesis
- Ars Classica
- Tufte Latex
  https://www.ctan.org/pkg/tufte-latex?lang=en

Latex Packages
==============

- https://tex.stackexchange.com/questions/553/what-packages-do-people-load-by-default-in-latex

- embed: embed a file in a pdf (like the source code)

- navigator: Navigator offers access to PDF features such as outlines (book-
marks), links, actions and embedded files ; it differs from other
existing packages on two main points : first, it doesn't depend on
any format and can be used with plain TEX, LaTEX, ConTeXt (with
some limitations, see here and here), and anywhere else ; second,
it defines commands to create PDF objects, and can be used as a
base to produce raw PDF code across pdfTEX, LuaTEX and XeTEX.

http://tex.stackexchange.com/questions/5599/theorem-packages-which-to-use-which-conflict

- cvs: https://ctan.org/pkg/komacv + https://ctan.org/pkg/komacv-rg

Beamer
======

* How to have verbatim in beamer:
- use the 'semiverbatim' beamer environment
  http://tex.stackexchange.com/questions/147363/how-can-i-insert-verbatim-text-to-beamer-notes
- use a fragile frame
  http://tex.stackexchange.com/questions/140719/verbatim-in-beamer-showing-error-file-ended-while-scanning-use-of-xverbatim

    \documentclass{beamer}
    %\theme{AnnArbor}
    \begin{document}
    \begin{frame}[fragile]
    \begin{verbatim}
       \begin{frame}[<alignment>]
       \frametitle{Frame Title Goes Here}
       Frame body text and/or LATEX code
       \end{frame}
    \end{verbatim}
    \end{frame}
    \end{document}

* Automatic toc
- https://tex.stackexchange.com/questions/26712/how-to-make-outline-frame-in-beamer
\AtBeginSection[]
{
  \begin{frame}<beamer>
    \frametitle{Outline for section \thesection}
    \tableofcontents[currentsection]
    % other options: currentsection,hideothersubsections,currentsubsection,hideallsubsections,...
  \end{frame}
}

- https://tex.stackexchange.com/questions/193975/highlight-only-current-subsection-hide-subsections-of-other-sections
\tableofcontents
    [
        currentsection,
        currentsubsection,
        subsectionstyle=show/shaded/hide
    ]


Bugs
====

- Bug with \hrulefill with mathdesign: http://tex.stackexchange.com/questions/135352/conflict-between-mathdesign-and-memoir-chapterstyle-ell

Tools
=====

Compilation:
- https://github.com/aclements/latexrun
latexrun: modern latexmk, but not developed anymore...
- https://github.com/cereda/arara
  arara is a TeX automation tool based on rules and directives. It gives you a way to enhance your TeX experience.
  Another 'modern' latexmk, still seems developed
- https://github.com/stefanhepp/pplatex
  Pretty-Print LaTeX: A tool to reformat the output of latex and friends into readable messages
- Dicy: another one. See the comparison in
  https://yitzchak.github.io/dicy/comparison-of-builders.html

* Convert images to LaTeX:
- https://mathpix.com/
- other ocr: https://tex.stackexchange.com/questions/1443/what-is-the-status-of-generating-latex-from-handwriting-i-e-ocr
  => http://www.inftyproject.org/en/software.html#LaTeXInstall

Latex online:
- https://www.overleaf.com/
  (there was sharelatex too, but it has been merged to overleaf)
