vim: ft=markdownlight fdm=expr

https://bbs.archlinux.org/viewtopic.php?id=139909
xft, cairo, freetype => Both cairo and Xft respect fontconfig settings and
use Freetype2 for glyph rendering and Xrender for compositing.

Settings
========

Application Settings
--------------------

Exemples:
- fc-match -v "Monospace:size=14"
- xterm -fa "Monospace:size=14" #-fn is for bitmap fonts
- *vt100.faceName: Monospace:size=14
- XSettings Gtk/FontName: "Sans 10" (cf [gnome] for more gsettings)
- Exemple of Xresources by Vincent Lefevre of .Xresources and firefox.cfg
  https://lists.debian.org/debian-devel/2015/08/msg00113.html

For font configuration, see also [xsettings] and https://github.com/derat/font-config-info to get the current settings
Cf also https://weirdfellow.wordpress.com/tag/xsettings/

Summary:
Gsettings => gnome-settings-daemon => xsettings (+Xresources) => GtkSettings
- pango, cairo, xft: Xresources settings are merged with fontconfig settings
- gtk: use gtksettings too
  [More precisely: Gtk uses Pango->Cairo, but uses xsettings by default to
  get the GtkSettings, if the xsettings are not set the GtkSettings are
  obtained from gtk-3.0/settings.ini; and only afterwards does it fallback
  to Cairo's default (ie Xft resources). Moreover the gnome xsettings
  daemon also overwrite the Xft resources.]

The combination of all these settings is a mess:
Cairo bug https://bugs.freedesktop.org/show_bug.cgi?id=11838 Bug 11838 - hintstyle specified in fontconfig is ignored while rgba is respected sometimes 
          = https://bugs.launchpad.net/ubuntu/+source/cairo/+bug/209256

Dpi bugs
--------

Get the dpi: xdpyinfo ou xrandr --verbose (les résultats sont différents, xrandr --verbose est correct, car xdpyinfo donne le dpi hardcodé à 96 par xorg)
1 inch=2.54cm; 1 point (pt: desktop publishing point)=1/72 inch = 0.353mm
=> On 72 dpi: 1pt=1px

Note that getting DPI in xorg is a big big mess, cf https://wiki.debian.org/MonitorDPI and the thread in https://lists.debian.org/debian-devel/2015/08/msg00107.html:
- xrandr 1.2 hardcodes 96 dpi
  https://bugs.freedesktop.org/show_bug.cgi?id=23705#c10
    Bug 23705 - xserver forces 96 DPI on randr-1.2-capable drivers, overriding correct autodetection 
  Patch: https://bugs.freedesktop.org/show_bug.cgi?id=41115
    Bug 41115 - Please add option to avoid forcing of 96dpi 
  http://pastebin.com/vtzyBK6e
    #xorg-devel log about forced 96dpi
  Work around: xrandr --fbmm `xrandr | sed -n '/ connected / {s/.* \([0-9]\+\)mm x \([0-9]\+\)mm/\1x\2/p;q}'`
  => this correct xdpyinfo to use the correct dpi
  Faulty commit by Keith Packard: https://github.com/mirror/xserver/commit/fff00df94d7ebd18a8e24537ec96073717375a3f
  Le code actuel est ici: https://cgit.freedesktop.org/xorg/xserver/tree/hw/xfree86/modes/xf86RandR12.c#n787

- About firefox (cf the comments of 23705)

  Chrome does because it's built on WebKit, where 96 as the only
  possibility is the traditional Macintosh way, which became also the
  Internet Explorer default behavior back in v7 or v8.

  > Firefox still seems to respect the system DPI by default, AFAICT.)
  Since 2010/08/18 in https://bugzilla.mozilla.org/show_bug.cgi?id=537890
  it only does so in the UI, not in web page content, where it now copies
  the IE, Chrome and Safari insanity. You can see the impact by using it to
  view both http://fm.no-ip.com/Auth/dpi-screen-windowg.html (old edition
  that worked as expected before that "fix"), and
  http://fm.no-ip.com/Auth/dpi-screen-window.html (modified version that
  can be accurate only in Geckos, Konq, and most old browsers). Its
  behavior can be impacted by two hidden preferences, layout.css.dpi
  (integer) & layout.css.devPixelsPerPx (a string parsed as a float), the
  former of which defaults to -1, and the latter to 1.0.

  => D'après le code source actuel, css.layout.dpi permet de calculer mozmm
  (qui est deprecated), la valeur par défaut étant -1 signifiant
  max(96,autodetect). Les pages web sont générées avec un dpi virtuel de
  96, et le facteur de conversion est donné par css.devpixelsperpx, qui
  s'il est -1 vaut Gdk/WindowScalingFactor*round(gtk-xft-dpi/96)
  [en fait gtk-xft-dpi/96 est arrondi à 1.5 quand il vaut entre 1.375 et 1.75]

- https://www.happyassassin.net/2015/07/09/of-dpis-desktops-and-toolkits/
  => Since X lies about a 96 dpi but round to millimeters, autodecting the
  dpi then give a 96.xxx value, which yields funny bugs...
  => gtk fallback switched from autodetect to hardcoded 96 in this commit
  https://gitlab.gnome.org/GNOME/gtk/commit/bdf0820c501437a2150d8ff0d5340246e713f73f

Default Settings
----------------

Xsettings defaults:
Recall from [../xsettings]: http://www.freedesktop.org/wiki/Specifications/XSettingsRegistry/
- Xft/Antialias -1
- Xft/Hinting -1
- Xft/HintStyle hintnone
- Xft/RGBA none
- Xft/DPI -1

GnomeSettingsDaemon default schema:
- antialiasing=grayscale
- hinting=slight (=> hinting=true, hintstyle=slight)
- rgba-order=rgb (mais mis à none à cause de antialiasing=grayscale)
- dpi=96 (parce que text-scaling-factor=1)
=> diffère du registry en mettant dpi=96 et hinting=slight

GtkSettings defaults:
- gtk-xft-antialias -1 (0=no, 1=yes, -1=default)
- gtk-xft-hinting -1
- gtk-xft-hintstyle NULL
- gtk-xft-rgba NULL
- gtk-xft-dpi -1

Xresources:
- gnome-settings-daemon set: Xft.dpi, Xft.antialias, Xft.hinting, Xft.hintstyle, Xft.rgba, Xcursor.size, Xcursor.theme
- Xft regarde: Xft.dpi, Xft.antialias, Xft.hinting, Xft.hintstyle, Xft.rgba, Xft.lcdfilter, Xft.dpi, Xft.embolden, Xft.minspace, Xft.render, Xft.maxglyphmemory
- Cairo regarde: Xft.antialias, Xft.hinting, Xft.hintstyle, Xft.rgba, Xft.lcdfilter

Fontconfig default:
- hinting=true
- hintstyle=full
- dpi=75
- autohint=false

Xft default:
- antialias: true, 
- hinting: true, 
- hintstyle: hintfull,
- rgba: autodetect via XRenderQuerySubpixelOrder, 
- dpi: compute the vertical dpi
- autohint: false
- lcdfilter: lcddefault (FC_LCD_DEFAULT)

Cairo Xresources defaults:
- antialias: true, 
- hinting: true, 
- hintstyle: hintfull,
- rgba: autodetect via XRenderQuerySubpixelOrder, 
- lcdfilter=-1 (fallback to CAIRO_LCD_FILTER_DEFAULT)
Cairo pattern option defaults:
- antialias: true, 
- hinting: true, 
- hintstyle: hintfull,
- rgba=FC_RGBA_UNKNOWN => CAIRO_SUBPIXEL_ORDER_DEFAULT (ie rgb),
- autohint: false

Pango with direct ft2 backend:
- antialias=true
- hinting=true
- hintstyle=hintfull
- autohint=false

Freetype2
=========

https://www.freetype.org/freetype2/docs/documentation.html
- http://www.freetype.org/freetype2/docs/text-rendering-general.html
  On Slight Hinting, Proper Text Rendering, Stem Darkening and LCD Filters
- https://www.freetype.org/freetype2/docs/subpixel-hinting.html
  The new v40 TrueType interpreter mode
  v35: old hinting, v38 infinality patches (=cleartype), v40 minimal infinality

- On hint slight: http://www.freetype.org/freetype2/docs/text-rendering-general.html (before hintslight would force autohint, now it uses the vertical hinting from the font if it exists)

- On autohint: http://www.freetype.org/freetype2/docs/reference/ft2-base_interface.html#FT_LOAD_NO_AUTOHINT
By default, hinting is enabled and the font's native hinter (see FT_FACE_FLAG_HINTER) is preferred over the auto-hinter. You can disable hinting by setting FT_LOAD_NO_HINTING or change the precedence by setting FT_LOAD_FORCE_AUTOHINT. You can also set FT_LOAD_NO_AUTOHINT in case you don't want the auto-hinter to be used at all.
[ie autohint=true => force autohint, autohint=false => force disable,
default: use as fallback]

- On lcdfilter:
http://www.freetype.org/freetype2/docs/reference/ft2-lcd_filtering.html
http://www.spasche.net/files/lcdfiltering/

Hinting: 
- commit ccd3188af18fc0e96a105ec68483e815209b9981 2015-11
  Allow native CFF hinter in FT_RENDER_MODE_LIGHT.
  Cf the web page above text-rendering-general.html
- commit a364e38ae7c98992a67b8d5be744445a826926ef 2017-11
  Use Adobe hinting engine for `light' hinting of both CFF and Type 1.
  As of this commit, the hinting engine table looks as follows.
                 LIGHT  NORMAL
      -------------------------
       TrueType  Auto   v40
       CFF       Adobe  Adobe
       Type 1    Adobe  Adobe

Choosing the engine: cf /etc/profile.d/freetype2.sh
export FREETYPE_PROPERTIES="truetype:interpreter-version=40"
Infinality: export FREETYPE_PROPERTIES="truetype:interpreter-version=38"

API
---
https://www.freetype.org/freetype2/docs/reference/ft2-toc.html
FT_Load_Glyph( FT_Face   face, FT_UInt   glyph_index, FT_Int32  load_flags );
FT_Render_Glyph( FT_GlyphSlot    slot, FT_Render_Mode  render_mode );
  See the note on https://www.freetype.org/freetype2/docs/reference/ft2-base_interface.html#FT_Render_Glyph about doing alpha blending of the outputed bitmap

### https://www.freetype.org/freetype2/docs/reference/ft2-base_interface.html#FT_LOAD_DEFAULT
- FT_LOAD_DEFAULT:
1. FreeType looks for a bitmap for the glyph corresponding to the face's current size. If one is found, the function returns. The bitmap data can be accessed from the glyph slot (see note below).
2. If no embedded bitmap is searched for or found, FreeType looks for a scalable outline. If one is found, it is loaded from the font file, scaled to device pixels, then ‘hinted’ to the pixel grid in order to optimize it. The outline data can be accessed from the glyph slot (see note below).
Note that by default the glyph loader doesn't render outlines into bitmaps. The following flags are used to modify this default behaviour to more specific and useful cases.
- FT_LOAD_RENDER	Call FT_Render_Glyph after the glyph is loaded. By default, the glyph is rendered in FT_RENDER_MODE_NORMAL mode. This can be overridden by FT_LOAD_TARGET_XXX or FT_LOAD_MONOCHROME. 
- FT_LOAD_NO_SCALE
- FT_LOAD_NO_HINTING
- FT_LOAD_NO_BITMAP
- FT_LOAD_VERTICAL_LAYOUT
- FT_LOAD_FORCE_AUTOHINT
- FT_LOAD_PEDANTIC
- FT_LOAD_NO_RECURSE
- FT_LOAD_IGNORE_TRANSFORM
- FT_LOAD_MONOCHROME
- FT_LOAD_LINEAR_DESIGN
- FT_LOAD_NO_AUTOHINT
- FT_LOAD_COLOR (Load embedded color bitmap images)
- FT_LOAD_COMPUTE_METRICS
- FT_LOAD_BITMAP_METRICS_ONLY
Note: By default, hinting is enabled and the font's native hinter (see FT_FACE_FLAG_HINTER) is preferred over the auto-hinter. You can disable hinting by setting FT_LOAD_NO_HINTING or change the precedence by setting FT_LOAD_FORCE_AUTOHINT. You can also set FT_LOAD_NO_AUTOHINT in case you don't want the auto-hinter to be used at all.
Besides deciding which hinter to use, you can also decide which hinting algorithm to use. See FT_LOAD_TARGET_XXX for details.

### FT_LOAD_TARGET_XXX: https://www.freetype.org/freetype2/docs/reference/ft2-base_interface.html#FT_LOAD_TARGET_XXX

Defined in FT_FREETYPE_H (freetype/freetype.h).
~~~ c
 #define FT_LOAD_TARGET_( x )   ( (FT_Int32)( (x) & 15 ) << 16 )
 #define FT_LOAD_TARGET_NORMAL  FT_LOAD_TARGET_( FT_RENDER_MODE_NORMAL )
 #define FT_LOAD_TARGET_LIGHT   FT_LOAD_TARGET_( FT_RENDER_MODE_LIGHT  )
 #define FT_LOAD_TARGET_MONO    FT_LOAD_TARGET_( FT_RENDER_MODE_MONO   )
 #define FT_LOAD_TARGET_LCD     FT_LOAD_TARGET_( FT_RENDER_MODE_LCD    )
 #define FT_LOAD_TARGET_LCD_V   FT_LOAD_TARGET_( FT_RENDER_MODE_LCD_V  )
~~~

A list of values to select a specific hinting algorithm for the hinter. You should OR one of these values to your ‘load_flags’ when calling FT_Load_Glyph.
Note that a font's native hinters may ignore the hinting algorithm you have specified (e.g., the TrueType bytecode interpreter). You can set FT_LOAD_FORCE_AUTOHINT to ensure that the auto-hinter is used.

- FT_LOAD_TARGET_NORMAL	The default hinting algorithm, optimized for standard gray-level rendering. For monochrome output, use FT_LOAD_TARGET_MONO instead.
- FT_LOAD_TARGET_LIGHT	A lighter hinting algorithm for gray-level modes. Many generated glyphs are fuzzier but better resemble their original shape. This is achieved by snapping glyphs to the pixel grid only vertically (Y-axis), as is done by FreeType's new CFF engine or Microsoft's ClearType font renderer. This preserves inter-glyph spacing in horizontal text. The snapping is done either by the native font driver, if the driver itself and the font support it, or by the auto-hinter. Advance widths are rounded to integer values; however, using the ‘lsb_delta’ and ‘rsb_delta’ fields of FT_GlyphSlotRec, it is possible to get fractional advance widths for sub-pixel positioning (which is recommended to use).
- FT_LOAD_TARGET_MONO	Strong hinting algorithm that should only be used for monochrome output. The result is probably unpleasant if the glyph is rendered in non-monochrome modes.
- FT_LOAD_TARGET_LCD	A variant of FT_LOAD_TARGET_LIGHT optimized for horizontally decimated LCD displays.
- FT_LOAD_TARGET_LCD_V	A variant of FT_LOAD_TARGET_NORMAL optimized for vertically decimated LCD displays.
note

You should use only one of the FT_LOAD_TARGET_XXX values in your
‘load_flags’. They can't be ORed.
If FT_LOAD_RENDER is also set, the glyph is rendered in the corresponding
mode (i.e., the mode that matches the used algorithm best). An exception is
FT_LOAD_TARGET_MONO since it implies FT_LOAD_MONOCHROME.
You can use a hinting algorithm that doesn't correspond to the same
rendering mode. As an example, it is possible to use the ‘light’ hinting
algorithm and have the results rendered in horizontal LCD pixel mode, with
code like
  FT_Load_Glyph( face, glyph_index, load_flags | FT_LOAD_TARGET_LIGHT );
  FT_Render_Glyph( face->glyph, FT_RENDER_MODE_LCD );
In general, you should stick with one rendering mode. For example,
switching between FT_LOAD_TARGET_NORMAL and FT_LOAD_TARGET_MONO enforces a
lot of recomputation for TrueType fonts, which is slow. Another reason is
caching: Selecting a different mode usually causes changes in both the
outlines and the rasterized bitmaps; it is thus necessary to empty the
cache after a mode switch to avoid false hits.

### FT_Render_Mode: https://www.freetype.org/freetype2/docs/reference/ft2-base_interface.html#FT_Render_Mode
- FT_RENDER_MODE_NORMAL	Default render mode; it corresponds to 8-bit anti-aliased bitmaps.
- FT_RENDER_MODE_LIGHT	This is equivalent to FT_RENDER_MODE_NORMAL. It is only defined as a separate value because render modes are also used indirectly to define hinting algorithm selectors. See FT_LOAD_TARGET_XXX for details.
- FT_RENDER_MODE_MONO	This mode corresponds to 1-bit bitmaps (with 2 levels of opacity).
- FT_RENDER_MODE_LCD	This mode corresponds to horizontal RGB and BGR sub-pixel displays like LCD screens. It produces 8-bit bitmaps that are 3 times the width of the original glyph outline in pixels, and which use the FT_PIXEL_MODE_LCD mode.
- FT_RENDER_MODE_LCD_V	This mode corresponds to vertical RGB and BGR sub-pixel displays (like PDA screens, rotated LCD displays, etc.). It produces 8-bit bitmaps that are 3 times the height of the original glyph outline in pixels and use the FT_PIXEL_MODE_LCD_V mode.

The pixels rendered are marked according to the render mode as
respectively: FT_PIXEL_MODE_GRAY, FT_PIXEL_MODE_MONO, FT_PIXEL_MODE_LCD, FT_PIXEL_MODE_LCD_V and if FT_LOAD_COLOR: FT_PIXEL_MODE_BGRA

### LCD_FILTER: https://www.freetype.org/freetype2/docs/reference/ft2-lcd_filtering.html#lcd_filtering
- FT_LCD_FILTER_NONE	Do not perform filtering. When used with subpixel
  rendering, this results in sometimes severe color fringes.
- FT_LCD_FILTER_DEFAULT	The default filter reduces color fringes
  considerably, at the cost of a slight blurriness in the output. It is a
  beveled, normalized, and color-balanced five-tap filter that is more
  forgiving to screens with non-ideal gamma curves and viewing angles. Note
  that while color-fringing is reduced, it can only be minimized by using
  linear alpha blending and gamma correction to render glyphs onto
  surfaces. The default filter weights are [0x08 0x4D 0x56 0x4D 0x08].
- FT_LCD_FILTER_LIGHT	The light filter is a variant that is sharper at
  the cost of slightly more color fringes than the default one. It is a
  boxy, normalized, and color-balanced three-tap filter that is less
  forgiving to screens with non-ideal gamma curves and viewing angles. This
  filter works best when the rendering system uses linear alpha blending
  and gamma correction to render glyphs onto surfaces. The light filter
  weights are [0x00 0x55 0x56 0x55 0x00].
- FT_LCD_FILTER_LEGACY	This filter corresponds to the original libXft
  color filter. It provides high contrast output but can exhibit really bad
  color fringes if glyphs are not extremely well hinted to the pixel grid.
  In other words, it only works well if the TrueType bytecode interpreter
  is enabled and high-quality hinted fonts are used. This filter is only
  provided for comparison purposes, and might be disabled or stay
  unsupported in the future.

Fontconfig
==========

Note: http://unix.stackexchange.com/questions/321857/why-is-xft-ignoring-font-settings/321989
      "It turns out that in Xft hintmedium is a synonym for hintslight,
      whereas in fontconfig hintmedium is a synonym for hintfull."

Default: 
  FC_WEIGHT_NORMAL, FC_SLANT_ROMAN, FC_WIDTH_CONDENSED, FC_HINT_FULL
  hinting=true, vertical_layout=false, autohint=false, global_advance=true,
  embedded_bitmap=true, decorative=false, symbol=false, variable=false
  size=12.0, scale=1.0, dpi=75, pixelsize=size*scale*dpi/72.0,
  fontversion=0x7fffffff, 
  default_lang: look at $FC_LANG, $LC_ALL, $LC_CTYPE, $LANG, fallback to 'en'
  namelang=default_lang, {familylang,stylelang,fullnamelang}+=[namelang, "en-us (weak)"]

~~~ src/fcname.c
// Macros FC_* are defined in fontconfig/fontconfig.h, cf [./fontconfig]
static const FcConstant _FcBaseConstants[] = {
    { (FcChar8 *) "thin",	    "weight",   FC_WEIGHT_THIN, },
    { (FcChar8 *) "extralight",	    "weight",   FC_WEIGHT_EXTRALIGHT, },
    { (FcChar8 *) "ultralight",	    "weight",   FC_WEIGHT_EXTRALIGHT, },
    { (FcChar8 *) "demilight",	    "weight",   FC_WEIGHT_DEMILIGHT, },
    { (FcChar8 *) "semilight",	    "weight",   FC_WEIGHT_DEMILIGHT, },
    { (FcChar8 *) "light",	    "weight",   FC_WEIGHT_LIGHT, },
    { (FcChar8 *) "book",	    "weight",	FC_WEIGHT_BOOK, },
    { (FcChar8 *) "regular",	    "weight",   FC_WEIGHT_REGULAR, },
    { (FcChar8 *) "medium",	    "weight",   FC_WEIGHT_MEDIUM, },
    { (FcChar8 *) "demibold",	    "weight",   FC_WEIGHT_DEMIBOLD, },
    { (FcChar8 *) "semibold",	    "weight",   FC_WEIGHT_DEMIBOLD, },
    { (FcChar8 *) "bold",	    "weight",   FC_WEIGHT_BOLD, },
    { (FcChar8 *) "extrabold",	    "weight",   FC_WEIGHT_EXTRABOLD, },
    { (FcChar8 *) "ultrabold",	    "weight",   FC_WEIGHT_EXTRABOLD, },
    { (FcChar8 *) "black",	    "weight",   FC_WEIGHT_BLACK, },
    { (FcChar8 *) "heavy",	    "weight",	FC_WEIGHT_HEAVY, },

    { (FcChar8 *) "roman",	    "slant",    FC_SLANT_ROMAN, },
    { (FcChar8 *) "italic",	    "slant",    FC_SLANT_ITALIC, },
    { (FcChar8 *) "oblique",	    "slant",    FC_SLANT_OBLIQUE, },

    { (FcChar8 *) "ultracondensed", "width",	FC_WIDTH_ULTRACONDENSED },
    { (FcChar8 *) "extracondensed", "width",	FC_WIDTH_EXTRACONDENSED },
    { (FcChar8 *) "condensed",	    "width",	FC_WIDTH_CONDENSED },
    { (FcChar8 *) "semicondensed",  "width",	FC_WIDTH_SEMICONDENSED },
    { (FcChar8 *) "normal",	    "width",	FC_WIDTH_NORMAL },
    { (FcChar8 *) "semiexpanded",   "width",	FC_WIDTH_SEMIEXPANDED },
    { (FcChar8 *) "expanded",	    "width",	FC_WIDTH_EXPANDED },
    { (FcChar8 *) "extraexpanded",  "width",	FC_WIDTH_EXTRAEXPANDED },
    { (FcChar8 *) "ultraexpanded",  "width",	FC_WIDTH_ULTRAEXPANDED },

    { (FcChar8 *) "proportional",   "spacing",  FC_PROPORTIONAL, },
    { (FcChar8 *) "dual",	    "spacing",  FC_DUAL, },
    { (FcChar8 *) "mono",	    "spacing",  FC_MONO, },
    { (FcChar8 *) "charcell",	    "spacing",  FC_CHARCELL, },

    { (FcChar8 *) "unknown",	    "rgba",	    FC_RGBA_UNKNOWN },
    { (FcChar8 *) "rgb",	    "rgba",	    FC_RGBA_RGB, },
    { (FcChar8 *) "bgr",	    "rgba",	    FC_RGBA_BGR, },
    { (FcChar8 *) "vrgb",	    "rgba",	    FC_RGBA_VRGB },
    { (FcChar8 *) "vbgr",	    "rgba",	    FC_RGBA_VBGR },
    { (FcChar8 *) "none",	    "rgba",	    FC_RGBA_NONE },

    { (FcChar8 *) "hintnone",	    "hintstyle",   FC_HINT_NONE },
    { (FcChar8 *) "hintslight",	    "hintstyle",   FC_HINT_SLIGHT },
    { (FcChar8 *) "hintmedium",	    "hintstyle",   FC_HINT_MEDIUM },
    { (FcChar8 *) "hintfull",	    "hintstyle",   FC_HINT_FULL },

    { (FcChar8 *) "antialias",	    "antialias",    FcTrue },
    { (FcChar8 *) "hinting",	    "hinting",	    FcTrue },
    { (FcChar8 *) "verticallayout", "verticallayout",	FcTrue },
    { (FcChar8 *) "autohint",	    "autohint",	    FcTrue },
    { (FcChar8 *) "globaladvance",  "globaladvance",	FcTrue }, /* deprecated */
    { (FcChar8 *) "outline",	    "outline",	    FcTrue },
    { (FcChar8 *) "scalable",	    "scalable",	    FcTrue },
    { (FcChar8 *) "minspace",	    "minspace",	    FcTrue },
    { (FcChar8 *) "embolden",	    "embolden",	    FcTrue },
    { (FcChar8 *) "embeddedbitmap", "embeddedbitmap",	FcTrue },
    { (FcChar8 *) "decorative",	    "decorative",   FcTrue },
    { (FcChar8 *) "lcdnone",	    "lcdfilter",    FC_LCD_NONE },
    { (FcChar8 *) "lcddefault",	    "lcdfilter",    FC_LCD_DEFAULT },
    { (FcChar8 *) "lcdlight",	    "lcdfilter",    FC_LCD_LIGHT },
    { (FcChar8 *) "lcdlegacy",	    "lcdfilter",    FC_LCD_LEGACY },
};

// fcdefault.c
static const struct {
    FcObject	field;
    FcBool	value;
} FcBoolDefaults[] = {
    { FC_HINTING_OBJECT,	   FcTrue	},  /* !FT_LOAD_NO_HINTING */
    { FC_VERTICAL_LAYOUT_OBJECT,   FcFalse	},  /* FC_LOAD_VERTICAL_LAYOUT */
    { FC_AUTOHINT_OBJECT,	   FcFalse	},  /* FC_LOAD_FORCE_AUTOHINT */
    { FC_GLOBAL_ADVANCE_OBJECT,    FcTrue	},  /* !FC_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH */
    { FC_EMBEDDED_BITMAP_OBJECT,   FcTrue 	},  /* !FC_LOAD_NO_BITMAP */
    { FC_DECORATIVE_OBJECT,	   FcFalse	},
    { FC_SYMBOL_OBJECT,		   FcFalse	},
    { FC_VARIABLE_OBJECT,	   FcFalse	},
};

FcStrSet *
FcGetDefaultLangs (void)
{
    FcStrSet *result;
retry:
    result = (FcStrSet *) fc_atomic_ptr_get (&default_langs);
    if (!result)
    {
	char *langs;

	result = FcStrSetCreate ();

	langs = getenv ("FC_LANG");
	if (!langs || !langs[0])
	    langs = getenv ("LC_ALL");
	if (!langs || !langs[0])
	    langs = getenv ("LC_CTYPE");
	if (!langs || !langs[0])
	    langs = getenv ("LANG");
	if (langs && langs[0])
	{
	    if (!FcStrSetAddLangs (result, langs))
		FcStrSetAdd (result, (const FcChar8 *) "en");
	}
	else
	    FcStrSetAdd (result, (const FcChar8 *) "en");

	FcRefSetConst (&result->ref);
	if (!fc_atomic_ptr_cmpexch (&default_langs, NULL, result)) {
	    FcRefInit (&result->ref, 1);
	    FcStrSetDestroy (result);
	    goto retry;
	}
    }

    return result;
}

void
FcDefaultSubstitute (FcPattern *pattern)
{
    FcValue v, namelang, v2;
    int	    i;
    double	dpi, size, scale, pixelsize;

    if (FcPatternObjectGet (pattern, FC_WEIGHT_OBJECT, 0, &v) == FcResultNoMatch )
	FcPatternObjectAddInteger (pattern, FC_WEIGHT_OBJECT, FC_WEIGHT_NORMAL);

    if (FcPatternObjectGet (pattern, FC_SLANT_OBJECT, 0, &v) == FcResultNoMatch)
	FcPatternObjectAddInteger (pattern, FC_SLANT_OBJECT, FC_SLANT_ROMAN);

    if (FcPatternObjectGet (pattern, FC_WIDTH_OBJECT, 0, &v) == FcResultNoMatch)
	FcPatternObjectAddInteger (pattern, FC_WIDTH_OBJECT, FC_WIDTH_NORMAL);

    for (i = 0; i < NUM_FC_BOOL_DEFAULTS; i++)
	if (FcPatternObjectGet (pattern, FcBoolDefaults[i].field, 0, &v) == FcResultNoMatch)
	    FcPatternObjectAddBool (pattern, FcBoolDefaults[i].field, FcBoolDefaults[i].value);

    if (FcPatternObjectGetDouble (pattern, FC_SIZE_OBJECT, 0, &size) != FcResultMatch)
    {
	FcRange *r;
	double b, e;
	if (FcPatternObjectGetRange (pattern, FC_SIZE_OBJECT, 0, &r) == FcResultMatch && FcRangeGetDouble (r, &b, &e))
	    size = (b + e) * .5;
	else
	    size = 12.0L;
    }
    if (FcPatternObjectGetDouble (pattern, FC_SCALE_OBJECT, 0, &scale) != FcResultMatch)
	scale = 1.0;
    if (FcPatternObjectGetDouble (pattern, FC_DPI_OBJECT, 0, &dpi) != FcResultMatch)
	dpi = 75.0;

    if (FcPatternObjectGet (pattern, FC_PIXEL_SIZE_OBJECT, 0, &v) != FcResultMatch)
    {
	(void) FcPatternObjectDel (pattern, FC_SCALE_OBJECT);
	FcPatternObjectAddDouble (pattern, FC_SCALE_OBJECT, scale);
	pixelsize = size * scale;
	(void) FcPatternObjectDel (pattern, FC_DPI_OBJECT);
	FcPatternObjectAddDouble (pattern, FC_DPI_OBJECT, dpi);
	pixelsize *= dpi / 72.0;
	FcPatternObjectAddDouble (pattern, FC_PIXEL_SIZE_OBJECT, pixelsize);
    }
    else
    {
	size = v.u.d;
	size = size / dpi * 72.0 / scale;
    }
    (void) FcPatternObjectDel (pattern, FC_SIZE_OBJECT);
    FcPatternObjectAddDouble (pattern, FC_SIZE_OBJECT, size);

    if (FcPatternObjectGet (pattern, FC_FONTVERSION_OBJECT, 0, &v) == FcResultNoMatch)
    {
	FcPatternObjectAddInteger (pattern, FC_FONTVERSION_OBJECT, 0x7fffffff);
    }

    if (FcPatternObjectGet (pattern, FC_HINT_STYLE_OBJECT, 0, &v) == FcResultNoMatch)
    {
	FcPatternObjectAddInteger (pattern, FC_HINT_STYLE_OBJECT, FC_HINT_FULL);
    }
    if (FcPatternObjectGet (pattern, FC_NAMELANG_OBJECT, 0, &v) == FcResultNoMatch)
    {
	FcPatternObjectAddString (pattern, FC_NAMELANG_OBJECT, FcGetDefaultLang ());
    }
    /* shouldn't be failed. */
    FcPatternObjectGet (pattern, FC_NAMELANG_OBJECT, 0, &namelang);
    /* Add a fallback to ensure the english name when the requested language
     * isn't available. this would helps for the fonts that have non-English
     * name at the beginning.
     */
    /* Set "en-us" instead of "en" to avoid giving higher score to "en".
     * This is a hack for the case that the orth is not like ll-cc, because,
     * if no namelang isn't explicitly set, it will has something like ll-cc
     * according to current locale. which may causes FcLangDifferentTerritory
     * at FcLangCompare(). thus, the English name is selected so that
     * exact matched "en" has higher score than ll-cc.
     */
    v2.type = FcTypeString;
    v2.u.s = (FcChar8 *) "en-us";
    if (FcPatternObjectGet (pattern, FC_FAMILYLANG_OBJECT, 0, &v) == FcResultNoMatch)
    {
	FcPatternObjectAdd (pattern, FC_FAMILYLANG_OBJECT, namelang, FcTrue);
	FcPatternObjectAddWithBinding (pattern, FC_FAMILYLANG_OBJECT, v2, FcValueBindingWeak, FcTrue);
    }
    if (FcPatternObjectGet (pattern, FC_STYLELANG_OBJECT, 0, &v) == FcResultNoMatch)
    {
	FcPatternObjectAdd (pattern, FC_STYLELANG_OBJECT, namelang, FcTrue);
	FcPatternObjectAddWithBinding (pattern, FC_STYLELANG_OBJECT, v2, FcValueBindingWeak, FcTrue);
    }
    if (FcPatternObjectGet (pattern, FC_FULLNAMELANG_OBJECT, 0, &v) == FcResultNoMatch)
    {
	FcPatternObjectAdd (pattern, FC_FULLNAMELANG_OBJECT, namelang, FcTrue);
	FcPatternObjectAddWithBinding (pattern, FC_FULLNAMELANG_OBJECT, v2, FcValueBindingWeak, FcTrue);
    }

    if (FcPatternObjectGet (pattern, FC_PRGNAME_OBJECT, 0, &v) == FcResultNoMatch)
    {
	FcChar8 *prgname = FcGetPrgname ();
	if (prgname)
	    FcPatternObjectAddString (pattern, FC_PRGNAME_OBJECT, prgname);
    }
}
~~~

Xft
===

http://keithp.com/~keithp/talks/xtc2001/paper/ [libxft 1.0]
Xft.antialias   Bool    Selects whether glyphs are anti-aliased         True
Xft.rgba        Number  Specifies sub-pixel order on LCD screens        0
Xft.minspace    Bool    Eliminates extra leading between lines          False
Xft.scale       Number  Scales point size of all fonts                  1.0
Xft.dpi         Number  Used to convert point size into pixel size      Vertical screen dpi
[note: there are more Xft.* Xresource settings now, cf below]

From the source code
- libxft 2.3 uses fontconfig, with a fallback to the X resources for the
  patterns not set by fontconifg
- the defaults Xft variables are (cf xftdpy.c)
  antialias: true, embolden: false, rgba: autodetect via
  XRenderQuerySubpixelOrder, hinting: true, hintstyle: hintfull, lcdfilter:
  lcddefault (FC_LCD_DEFAULT), autohint: false, scale=1.0 dpi: compute the
  vertical dpi
  (+Xft also add the current Xrender extension as 'render' and the
  maxglyphmemory to the font-config pattern)
  [Note: cairo has the same Xresources defaults: antialias=true,
  hinting=true, hintstyle=hintfull, rgba=XRenderQuerySubpixelOrder. It
  default to lcdfilter=-1 ie CAIRO_LCD_FILTER_DEFAULT and it does not parse
  the other values]
- these are used as follow on a FcPattern:
    FcConfigSubstitute (NULL, new, FcMatchPattern);
    XftDefaultSubstitute (dpy, screen, new); //get fallbacks from the Xft variables and then call FcDefaultSubstitute (pattern);
    match = FcFontMatch (NULL, new, result);
- Then to open a font with freetype the pattern fallbacks are (probably not
  needed because of the FcDefaultSubstitute above):
    antialias=true, rgba=FC_RGBA_UNKNOWN, lcd_filter = FC_LCD_DEFAULT,
    matrix=Id, render=info->hasRender, bitmap=false, hinting=true
    embolden=false, hint_style=full, vertical_layout=false
    autohint=false, global_advance=true, spacing=proportional
    minspace=false, char_width=0
- the FT load_flags are as follow: FT_LOAD_DEFAULT
    - if ((!bitmap && fi->antialias) || fi->transform) fi->load_flags |= FT_LOAD_NO_BITMAP;
    - if (!hinting || hint_style == FC_HINT_NONE) { fi->load_flags |= FT_LOAD_NO_HINTING; }
    - if (fi->antialias)
      {
	if (FC_HINT_NONE < hint_style && hint_style < FC_HINT_FULL) { fi->load_flags |= FT_LOAD_TARGET_LIGHT; }
	else { switch (fi->rgba) {
	    case FC_RGBA_RGB, FC_RGBA_BGR: fi->load_flags |= FT_LOAD_TARGET_LCD;
	    case FC_RGBA_VRGB, FC_RGBA_VBGR: fi->load_flags |= FT_LOAD_TARGET_LCD_V;
	}}
      }
      else fi->load_flags |= FT_LOAD_TARGET_MONO;
    - if (vertical_layout) fi->load_flags |= FT_LOAD_VERTICAL_LAYOUT;
    - if (autohint) fi->load_flags |= FT_LOAD_FORCE_AUTOHINT;
    - if (!global_advance) fi->load_flags |= FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH;
- the FT render flags are as follow: 
    if (font->info.antialias)
	switch (font->info.rgba)
	case FC_RGBA_RGB, FC_RGBA_BGR: mode = FT_RENDER_MODE_LCD;
	case FC_RGBA_VRGB, FC_RGBA_VBGR: mode = FT_RENDER_MODE_LCD_V;
	default: mode = FT_RENDER_MODE_NORMAL;

~~~ c
// xftdpy.c
static FcPattern *
_XftDefaultInit (Display *dpy)
    // reads the following Xft.* variables: scale, dpi, rgba, lcdfilter, antialias, embolden, hintstyle, hinting, minspace, render, maxglyphmemory
    // and create a FcPattern containing them (which are set)
    _XftDefaultInitDouble (dpy, pat, FC_SCALE)
    _XftDefaultInitDouble (dpy, pat, FC_DPI)
    _XftDefaultInitBool (dpy, pat, XFT_RENDER)
    _XftDefaultInitInteger (dpy, pat, FC_RGBA)
    _XftDefaultInitInteger (dpy, pat, FC_LCD_FILTER)
    _XftDefaultInitBool (dpy, pat, FC_ANTIALIAS)
    _XftDefaultInitBool (dpy, pat, FC_EMBOLDEN)
    _XftDefaultInitBool (dpy, pat, FC_AUTOHINT)
    _XftDefaultInitInteger (dpy, pat, FC_HINT_STYLE)
    _XftDefaultInitBool (dpy, pat, FC_HINTING)
    _XftDefaultInitBool (dpy, pat, FC_MINSPACE)
    _XftDefaultInitInteger (dpy, pat, XFT_MAX_GLYPH_MEMORY)

static FcResult
_XftDefaultGet (Display *dpy, const char *object, int screen, FcValue *v)
{
    XftDisplayInfo  *info = _XftDisplayInfoGet (dpy, True);
    FcResult	    r;
    if (!info) return FcResultNoMatch;
    if (!info->defaults)
    {
	info->defaults = _XftDefaultInit (dpy);
	if (!info->defaults) return FcResultNoMatch;
    }
    r = FcPatternGet (info->defaults, object, screen, v);
    if (r == FcResultNoId && screen > 0)
	r = FcPatternGet (info->defaults, object, 0, v);
    return r;
}
_X_HIDDEN XftDisplayInfo *
_XftDisplayInfoGet (Display *dpy, FcBool createIfNecessary)
{
    XftDisplayInfo	*info, **prev;
    info->display = dpy;
    info->defaults = NULL;
    info->solidFormat = NULL;
    info->hasRender = (XRenderQueryExtension (dpy, &event_base, &error_base) && (XRenderFindVisualFormat (dpy, DefaultVisual (dpy, DefaultScreen (dpy))) != NULL));
    info->use_free_glyphs = FcTrue;
    if (info->hasRender) ...
    info->fonts = NULL;
    info->next = _XftDisplayInfo;
    _XftDisplayInfo = info;
    return NULL;
    ...
}

_X_EXPORT void
XftDefaultSubstitute (Display *dpy, int screen, FcPattern *pattern)
// Fallback to xft defaults; note that the XftDefault* functions look at
// the pattern derived from _XftDefaultInit above, they are wrapper around
// _XftDefaultGet
{
    FcValue	v;
    double	dpi;

    if (FcPatternGet (pattern, XFT_RENDER, 0, &v) == FcResultNoMatch)
    {
	FcPatternAddBool (pattern, XFT_RENDER,
			   XftDefaultGetBool (dpy, XFT_RENDER, screen,
					      XftDefaultHasRender (dpy)));
    }
    if (FcPatternGet (pattern, FC_ANTIALIAS, 0, &v) == FcResultNoMatch)
    {
	FcPatternAddBool (pattern, FC_ANTIALIAS,
			   XftDefaultGetBool (dpy, FC_ANTIALIAS, screen,
					      True));
    }
/*=> if FC_ANTIALIAS is not set for the fontconfig 'pattern', then look at
the Xft ressources (on the current screen) with a fallback to true */
    if (FcPatternGet (pattern, FC_EMBOLDEN, 0, &v) == FcResultNoMatch)
    {
	FcPatternAddBool (pattern, FC_EMBOLDEN,
			   XftDefaultGetBool (dpy, FC_EMBOLDEN, screen,
					      False));
    }
    if (FcPatternGet (pattern, FC_HINTING, 0, &v) == FcResultNoMatch)
    {
	FcPatternAddBool (pattern, FC_HINTING,
			  XftDefaultGetBool (dpy, FC_HINTING, screen,
					     True));
    }
    if (FcPatternGet (pattern, FC_HINT_STYLE, 0, &v) == FcResultNoMatch)
    {
	FcPatternAddInteger (pattern, FC_HINT_STYLE,
			     XftDefaultGetInteger (dpy, FC_HINT_STYLE, screen,
						   FC_HINT_FULL));
    }
    if (FcPatternGet (pattern, FC_AUTOHINT, 0, &v) == FcResultNoMatch)
    {
	FcPatternAddBool (pattern, FC_AUTOHINT,
			  XftDefaultGetBool (dpy, FC_AUTOHINT, screen,
					     False));
    }
    if (FcPatternGet (pattern, FC_RGBA, 0, &v) == FcResultNoMatch)
    {
	int	subpixel = FC_RGBA_UNKNOWN;
 #if RENDER_MAJOR > 0 || RENDER_MINOR >= 6
	if (XftDefaultHasRender (dpy))
	{
	    int render_order = XRenderQuerySubpixelOrder (dpy, screen);
	    switch (render_order) {
	    default:
	    case SubPixelUnknown:	subpixel = FC_RGBA_UNKNOWN; break;
	    case SubPixelHorizontalRGB:	subpixel = FC_RGBA_RGB; break;
	    case SubPixelHorizontalBGR:	subpixel = FC_RGBA_BGR; break;
	    case SubPixelVerticalRGB:	subpixel = FC_RGBA_VRGB; break;
	    case SubPixelVerticalBGR:	subpixel = FC_RGBA_VBGR; break;
	    case SubPixelNone:		subpixel = FC_RGBA_NONE; break;
	    }
	}
 #endif
	FcPatternAddInteger (pattern, FC_RGBA,
			      XftDefaultGetInteger (dpy, FC_RGBA, screen,
						    subpixel));
    }
    if (FcPatternGet (pattern, FC_LCD_FILTER, 0, &v) == FcResultNoMatch)
    {
	FcPatternAddInteger (pattern, FC_LCD_FILTER,
			     XftDefaultGetInteger (dpy, FC_LCD_FILTER, screen,
						   FC_LCD_DEFAULT));
    }
    if (FcPatternGet (pattern, FC_MINSPACE, 0, &v) == FcResultNoMatch)
    {
	FcPatternAddBool (pattern, FC_MINSPACE,
			   XftDefaultGetBool (dpy, FC_MINSPACE, screen,
					      False));
    }
    if (FcPatternGet (pattern, FC_DPI, 0, &v) == FcResultNoMatch)
    {
	dpi = (((double) DisplayHeight (dpy, screen) * 25.4) /
	       (double) DisplayHeightMM (dpy, screen));
	FcPatternAddDouble (pattern, FC_DPI,
			    XftDefaultGetDouble (dpy, FC_DPI, screen,
						 dpi));
    }
    if (FcPatternGet (pattern, FC_SCALE, 0, &v) == FcResultNoMatch)
    {
	FcPatternAddDouble (pattern, FC_SCALE,
			    XftDefaultGetDouble (dpy, FC_SCALE, screen, 1.0));
    }
    if (FcPatternGet (pattern, XFT_MAX_GLYPH_MEMORY, 0, &v) == FcResultNoMatch)
    {
	FcPatternAddInteger (pattern, XFT_MAX_GLYPH_MEMORY,
			     XftDefaultGetInteger (dpy, XFT_MAX_GLYPH_MEMORY,
						   screen,
						   XFT_FONT_MAX_GLYPH_MEMORY));
    }
    FcDefaultSubstitute (pattern);
}

// xftfont.c
XftFontMatch (Display		*dpy,
	      int		screen,
	      _Xconst FcPattern *pattern,
	      FcResult		*result)
{
    new = FcPatternDuplicate (pattern);
    FcConfigSubstitute (NULL, new, FcMatchPattern);
    XftDefaultSubstitute (dpy, screen, new);
    match = FcFontMatch (NULL, new, result);
    return match;
}
~~~

- xftfreetype.c: open a freetype font from a FcPattern
~~~ c
_X_EXPORT XftFont *
XftFontOpenPattern (Display *dpy, FcPattern *pattern)
{
    XftFontInfo	    info;
    XftFont	    *font;

    if (!XftFontInfoFill (dpy, pattern, &info))
	return NULL;

    font = XftFontOpenInfo (dpy, pattern, &info);
    XftFontInfoEmpty (dpy, &info);
    return font;
}

static FcBool
XftFontInfoFill (Display *dpy, _Xconst FcPattern *pattern, XftFontInfo *fi)
{
    XftDisplayInfo  *info = _XftDisplayInfoGet (dpy, True); // only used for info->hasRender
    FcChar8	    *filename;
    int		    id;
    double	    dsize;
    double	    aspect;
    FcMatrix	    *font_matrix;
    FcBool	    hinting, vertical_layout, autohint, global_advance;
    int             hint_style;
    FcChar32	    hash, *hashp;
    FT_Face	    face;
    int		    nhash;
    FcBool	    bitmap;

    /* Find the associated file */
    switch (FcPatternGetString (pattern, FC_FILE, 0, &filename)) {
    case FcResultNoMatch:
	filename = NULL;
	break;
    case FcResultMatch:
	break;
    default:
	goto bail0;
    }

    switch (FcPatternGetInteger (pattern, FC_INDEX, 0, &id)) {
    case FcResultNoMatch:
	id = 0;
	break;
    case FcResultMatch:
	break;
    default:
	goto bail0;
    }

    if (filename)
	fi->file = _XftGetFile (filename, id);
    else if (FcPatternGetFTFace (pattern, FC_FT_FACE, 0, &face) == FcResultMatch
	     && face)
	fi->file = _XftGetFaceFile (face);
    if (!fi->file)
        goto bail0;

    /*
     * Compute pixel size
     */
    if (FcPatternGetDouble (pattern, FC_PIXEL_SIZE, 0, &dsize) != FcResultMatch)
	goto bail1;

    if (FcPatternGetDouble (pattern, FC_ASPECT, 0, &aspect) != FcResultMatch)
	aspect = 1.0;

    fi->ysize = (FT_F26Dot6) (dsize * 64.0);
    fi->xsize = (FT_F26Dot6) (dsize * aspect * 64.0);

    if (XftDebug() & XFT_DBG_OPEN)
	printf ("XftFontInfoFill: %s: %d (%g pixels)\n",
		(filename ? filename : (FcChar8 *) "<none>"), id, dsize);
    /* Get antialias value */
    switch (FcPatternGetBool (pattern, FC_ANTIALIAS, 0, &fi->antialias)) {
    case FcResultNoMatch:
	fi->antialias = True;
	break;
    case FcResultMatch:
	break;
    default:
	goto bail1;
    }

    /* Get rgba value */
    switch (FcPatternGetInteger (pattern, FC_RGBA, 0, &fi->rgba)) {
    case FcResultNoMatch:
	fi->rgba = FC_RGBA_UNKNOWN;
	break;
    case FcResultMatch:
	break;
    default:
	goto bail1;
    }

    /* Get lcd_filter value */
    switch (FcPatternGetInteger (pattern, FC_LCD_FILTER, 0, &fi->lcd_filter)) {
    case FcResultNoMatch:
	fi->lcd_filter = FC_LCD_DEFAULT;
	break;
    case FcResultMatch:
	break;
    default:
	goto bail1;
    }

    /* Get matrix and transform values */
    switch (FcPatternGetMatrix (pattern, FC_MATRIX, 0, &font_matrix)) {
    case FcResultNoMatch:
	fi->matrix.xx = fi->matrix.yy = 0x10000;
	fi->matrix.xy = fi->matrix.yx = 0;
	break;
    case FcResultMatch:
	fi->matrix.xx = 0x10000L * font_matrix->xx;
	fi->matrix.yy = 0x10000L * font_matrix->yy;
	fi->matrix.xy = 0x10000L * font_matrix->xy;
	fi->matrix.yx = 0x10000L * font_matrix->yx;
	break;
    default:
	goto bail1;
    }

    fi->transform = (fi->matrix.xx != 0x10000 || fi->matrix.xy != 0 ||
		     fi->matrix.yx != 0 || fi->matrix.yy != 0x10000);

    /* Get render value, set to false if no Render extension present */
    if (info->hasRender)
    {
	switch (FcPatternGetBool (pattern, XFT_RENDER, 0, &fi->render)) {
	case FcResultNoMatch:
	    fi->render = info->hasRender;
	    break;
	case FcResultMatch:
	    break;
	default:
	    goto bail1;
	}
    }
    else
	fi->render = FcFalse;

    /* Compute glyph load flags */
    fi->load_flags = FT_LOAD_DEFAULT;

 #ifndef XFT_EMBEDDED_BITMAP
 #define XFT_EMBEDDED_BITMAP "embeddedbitmap"
 #endif

    switch (FcPatternGetBool (pattern, XFT_EMBEDDED_BITMAP, 0, &bitmap)) {
    case FcResultNoMatch:
	bitmap = FcFalse;
	break;
    case FcResultMatch:
	break;
    default:
	goto bail1;
    }

    /* disable bitmaps when anti-aliasing or transforming glyphs */
    if ((!bitmap && fi->antialias) || fi->transform)
	fi->load_flags |= FT_LOAD_NO_BITMAP;

    /* disable hinting if requested */
    switch (FcPatternGetBool (pattern, FC_HINTING, 0, &hinting)) {
    case FcResultNoMatch:
	hinting = FcTrue;
	break;
    case FcResultMatch:
	break;
    default:
	goto bail1;
    }

    switch (FcPatternGetBool (pattern, FC_EMBOLDEN, 0, &fi->embolden)) {
    case FcResultNoMatch:
	fi->embolden = FcFalse;
	break;
    case FcResultMatch:
	break;
    default:
	goto bail1;
    }

    switch (FcPatternGetInteger (pattern, FC_HINT_STYLE, 0, &hint_style)) {
    case FcResultNoMatch:
	hint_style = FC_HINT_FULL;
	break;
    case FcResultMatch:
	break;
    default:
	goto bail1;
    }

    if (!hinting
	|| hint_style == FC_HINT_NONE
	)
    {
	fi->load_flags |= FT_LOAD_NO_HINTING;
    }

    /* Figure out the load target, which modifies the hinting
     * behavior of FreeType based on the intended use of the glyphs.
     */
    if (fi->antialias)
    {
	if (FC_HINT_NONE < hint_style && hint_style < FC_HINT_FULL)
	{
	    fi->load_flags |= FT_LOAD_TARGET_LIGHT;
	}
	else
	{
	    /* autohinter will snap stems to integer widths, when
	     * the LCD targets are used.
	     */
	    switch (fi->rgba) {
	    case FC_RGBA_RGB:
	    case FC_RGBA_BGR:
		fi->load_flags |= FT_LOAD_TARGET_LCD;
		break;
	    case FC_RGBA_VRGB:
	    case FC_RGBA_VBGR:
		fi->load_flags |= FT_LOAD_TARGET_LCD_V;
		break;
	    }
	}
    }
    else
	fi->load_flags |= FT_LOAD_TARGET_MONO;

    /* set vertical layout if requested */
    switch (FcPatternGetBool (pattern, FC_VERTICAL_LAYOUT, 0, &vertical_layout)) {
    case FcResultNoMatch:
	vertical_layout = FcFalse;
	break;
    case FcResultMatch:
	break;
    default:
	goto bail1;
    }

    if (vertical_layout)
	fi->load_flags |= FT_LOAD_VERTICAL_LAYOUT;

    /* force autohinting if requested */
    switch (FcPatternGetBool (pattern, FC_AUTOHINT, 0, &autohint)) {
    case FcResultNoMatch:
	autohint = FcFalse;
	break;
    case FcResultMatch:
	break;
    default:
	goto bail1;
    }

    if (autohint)
	fi->load_flags |= FT_LOAD_FORCE_AUTOHINT;

    /* disable global advance width (for broken DynaLab TT CJK fonts) */
    switch (FcPatternGetBool (pattern, FC_GLOBAL_ADVANCE, 0, &global_advance)) {
    case FcResultNoMatch:
	global_advance = FcTrue;
	break;
    case FcResultMatch:
	break;
    default:
	goto bail1;
    }

    if (!global_advance)
	fi->load_flags |= FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH;

    /* Get requested spacing value */
    switch (FcPatternGetInteger (pattern, FC_SPACING, 0, &fi->spacing)) {
    case FcResultNoMatch:
	fi->spacing = FC_PROPORTIONAL;
	break;
    case FcResultMatch:
	break;
    default:
	goto bail1;
    }

    /* Check for minspace */
    switch (FcPatternGetBool (pattern, FC_MINSPACE, 0, &fi->minspace)) {
    case FcResultNoMatch:
	fi->minspace = FcFalse;
	break;
    case FcResultMatch:
	break;
    default:
	goto bail1;
    }
    /* Check for fixed pixel spacing */
    switch (FcPatternGetInteger (pattern, FC_CHAR_WIDTH, 0, &fi->char_width)) {
    case FcResultNoMatch:
	fi->char_width = 0;
	break;
    case FcResultMatch:
	if (fi->char_width)
	    fi->spacing = FC_MONO;
	break;
    default:
	goto bail1;
    }
    ...

    /* All done */ return FcTrue;
}

_X_EXPORT XftFont *
XftFontOpenInfo (Display	*dpy,
		 FcPattern	*pattern,
		 XftFontInfo	*fi)
{
    XftDisplayInfo	*info = _XftDisplayInfoGet (dpy, True);
    FT_Face		face;
    XftFontInt		*font;
    XRenderPictFormat	*format;
    FcCharSet		*charset;
    FcBool		antialias;
    int			max_glyph_memory;

    /* Find a matching previously opened font */
    ...
    /* No existing font, create another. */ 
    if (XftDebug () & XFT_DBG_CACHE)
	printf ("New font %s/%d size %dx%d\n",
		fi->file->file, fi->file->id,
		(int) fi->xsize >> 6, (int) fi->ysize >> 6);

    if (FcPatternGetInteger (pattern, XFT_MAX_GLYPH_MEMORY, 0,
			     &max_glyph_memory) != FcResultMatch)
	max_glyph_memory = XFT_FONT_MAX_GLYPH_MEMORY;

    /*
     * Get the set of Unicode codepoints covered by the font.
     * If the incoming pattern doesn't provide this data, go
     * off and compute it.  Yes, this is expensive, but it's
     * required to map Unicode to glyph indices.
     */
    if (FcPatternGetCharSet (pattern, FC_CHARSET, 0, &charset) == FcResultMatch)
	charset = FcCharSetCopy (charset);
    else
	charset = FcFreeTypeCharSet (face, FcConfigGetBlanks (NULL));

    antialias = fi->antialias;
    if (!(face->face_flags & FT_FACE_FLAG_SCALABLE))
	antialias = FcFalse;

    /*
     * Find the appropriate picture format
     */
    if (fi->render)
    {
	if (antialias)
	{
	    switch (fi->rgba) {
	    case FC_RGBA_RGB:
	    case FC_RGBA_BGR:
	    case FC_RGBA_VRGB:
	    case FC_RGBA_VBGR:
		format = XRenderFindStandardFormat (dpy, PictStandardARGB32);
		break;
	    default:
		format = XRenderFindStandardFormat (dpy, PictStandardA8);
		break;
	    }
	}
	else
	{
	    format = XRenderFindStandardFormat (dpy, PictStandardA1);
	}

	if (!format)
	    goto bail2;
    }
    else
	format = NULL;
    ...

    /* Copy the info over */
    font->info = *fi;
    /*
     * reset the antialias field.  It can't
     * be set correctly until the font is opened,
     * which doesn't happen in XftFontInfoFill
     */
    font->info.antialias = antialias;
    ...
    return &font->public;
}
~~~

- These infos are then used by XftFontLoadGlyphs in xftglyphs.c

~~~ c
XftFontLoadGlyphs (Display	    *dpy,
		   XftFont	    *pub,
		   FcBool	    need_bitmaps,
		   _Xconst FT_UInt  *glyphs,
		   int		    nglyph)
{
    XftDisplayInfo  *info = _XftDisplayInfoGet (dpy, True);
    XftFontInt	    *font = (XftFontInt *) pub;

    if (font->info.antialias)
    {
	switch (font->info.rgba) {
	case FC_RGBA_RGB:
	case FC_RGBA_BGR:
	    mode = FT_RENDER_MODE_LCD;
	    break;
	case FC_RGBA_VRGB:
	case FC_RGBA_VBGR:
	    mode = FT_RENDER_MODE_LCD_V;
	    break;
	default:
	    mode = FT_RENDER_MODE_NORMAL;
	}
    }

    while (nglyph--)
    {
	glyphindex = *glyphs++;
	xftg = font->glyphs[glyphindex];
	FT_Library_SetLcdFilter( _XftFTlibrary, font->info.lcd_filter);
	error = FT_Load_Glyph (face, glyphindex, font->info.load_flags);
	if (error)
	{
	    /*
	     * If anti-aliasing or transforming glyphs and
	     * no outline version exists, fallback to the
	     * bitmap and let things look bad instead of
	     * missing the glyph
	     */
	    if (font->info.load_flags & FT_LOAD_NO_BITMAP)
		error = FT_Load_Glyph (face, glyphindex,
				       font->info.load_flags & ~FT_LOAD_NO_BITMAP);
	}
 #define FLOOR(x)    ((x) & -64)
 #define CEIL(x)	    (((x)+63) & -64)
 #define TRUNC(x)    ((x) >> 6)
 #define ROUND(x)    (((x)+32) & -64)
	glyphslot = face->glyph;

	/* Embolden if required */
	if (font->info.embolden) FT_GlyphSlot_Embolden(glyphslot);

	/* Compute glyph metrics from FreeType information */
	if(font->info.transform && glyphslot->format != FT_GLYPH_FORMAT_BITMAP)
	...
	} else {
	    left  = FLOOR( glyphslot->metrics.horiBearingX );
	    right = CEIL( glyphslot->metrics.horiBearingX + glyphslot->metrics.width );
	    top    = CEIL( glyphslot->metrics.horiBearingY );
	    bottom = FLOOR( glyphslot->metrics.horiBearingY - glyphslot->metrics.height );
	}
	width = TRUNC(right - left);
	height = TRUNC( top - bottom );

	/* Clip charcell glyphs to the bounding box XXX transformed? */
	if (font->info.spacing >= FC_CHARCELL && !font->info.transform)
	...
	if ( glyphslot->format != FT_GLYPH_FORMAT_BITMAP )
	{
	    error = FT_Render_Glyph( face->glyph, mode );
	}
	FT_Library_SetLcdFilter( _XftFTlibrary, FT_LCD_FILTER_NONE );
	if (font->info.spacing >= FC_MONO)
	{
	    if (font->info.transform)
	    ...
	    else
		if (font->info.load_flags & FT_LOAD_VERTICAL_LAYOUT)
		...
		else
		{
		    xftg->metrics.xOff = font->public.max_advance_width;
		    xftg->metrics.yOff = 0;
		}
	    }
	}
	else
	{
	    xftg->metrics.xOff = TRUNC(ROUND(glyphslot->advance.x));
	    xftg->metrics.yOff = -TRUNC(ROUND(glyphslot->advance.y));
	}

	// compute the size of the final bitmap
	...
	xftg->metrics.width  = local.width;
	xftg->metrics.height = local.rows;
	xftg->metrics.x      = - glyphslot->bitmap_left;
	xftg->metrics.y      =   glyphslot->bitmap_top;
	...
	_fill_xrender_bitmap( &local, glyphslot, mode,
			      (font->info.rgba == FC_RGBA_BGR ||
			       font->info.rgba == FC_RGBA_VBGR ) );
	xftg->glyph_memory = size + sizeof (XftGlyph);
	if (font->format)
	{
	    if (!font->glyphset)
		font->glyphset = XRenderCreateGlyphSet (dpy, font->format);
	    if ( mode == FT_RENDER_MODE_MONO )
	    ...
	    else if ( mode != FT_RENDER_MODE_NORMAL )
	    {
		/* invert ARGB <=> BGRA */
	}}
	else
		    memcpy (xftg->bitmap, bufBitmap, size);
}
~~~

Cairo
=====

- From the source code, Cairo parses the Xft Xresources too, with the following defaults
  Xft.antialias=true, Xft.lcdfilter=-1 (fallback to CAIRO_LCD_FILTER_DEFAULT), Xft.hinting=true,
  Xft.hintstyle=hintfull, Xft.rgba=FC_RGBA_UNKNOWN (=> autodetect via XRenderQuerySubpixelOrder)
  cf _cairo_xlib_init_screen_font_options

Note: cairo does not care about dpi, it's pango's role

Global api: https://cairographics.org/manual/
- cairo_set_font_face [set the unscaled font face as default in the context]
- cairo_scaled_font_create [create a scaled font face from an unscaled one]

Freetype+Fontconfig backend (cf cairo-ft-font.c), https://cairographics.org/manual/cairo-FreeType-Fonts.html:
cairo_ft_font_face_create_for_pattern, cairo_ft_font_face_create_for_ft_face create unscaled fonts.
=> font = cairo_ft_font_face_create_for_pattern(pattern)
   cairo_set_font_face(cairo_t, font) //set the current font face
   peut aussi être utilisé pour créer une autre fonte 'scalée' via `cairo_scaled_font_create`

Résumé pour le ft backend:
- _get_pattern_ft_options (pattern, &ft_options) 
    Convertit les options du pattern en ft_options
- _cairo_ft_font_options_substitute (font_options, pattern);
    Rajoute les options de font_options à pattern (sauf si elles sont déjà spécifiées dans pattern)
- cairo_ft_font_face_create_for_pattern (FcPattern *pattern)
    Si pattern est non résolu: 
      Appelle _cairo_font_face_init(&font_face->base) en laissant les autres champs de font_face à NULL 
      (ils seront résolus plus tard)
    Sinon: 
      unscaled est la fonte unscaled référencée par resolved (via _cairo_ft_unscaled_font_create_for_pattern)
      font_face->ft_options=_get_pattern_ft_options(pattern);
      Appelle _cairo_ft_font_face_create (unscaled, &ft_options) qui fait un _cairo_font_face_init(unscaled->base)
- _cairo_ft_font_face_get_implementation (void *abstract_face, *font_matrix, *ctm, const cairo_font_options_t *options)
    Si le pattern est non résolu: Appelle _cairo_ft_resolve_pattern
    Sinon: return abstract_face;
- _cairo_ft_resolve_pattern (FcPattern *pattern, *font_matrix, *ctm, const cairo_font_options_t *font_options)
    FcConfigSubstitute (NULL, pattern, FcMatchPattern));
    _cairo_ft_font_options_substitute (font_options, pattern);
    FcDefaultSubstitute (pattern);
    Si pattern n'est pas résolu: resolved = FcFontMatch (NULL, pattern, &result)
    Sinon: resolved = pattern;
    unscaled est la fonte unscaled référencée par resolved (via _cairo_ft_unscaled_font_create_for_pattern)
    font_face->ft_options=_get_pattern_ft_options(resolved));
    Appelle _cairo_ft_font_face_create(unscaled, &ft_options) qui fait un _cairo_font_face_init(unscaled)
- _cairo_ft_font_face_scaled_font_create (void *abstract_font_face, *font_matrix, *ctm, const cairo_font_options_t *options, cairo_scaled_font_t **font_out)
    // Merge les options avec la abstract_font_face:
    _cairo_font_options_init_copy (&scaled_font->ft_options.base, options);
    _cairo_ft_options_merge (&scaled_font->ft_options, &font_face->ft_options);

More details on the ft backend:
- _get_pattern_ft_options (pattern, &ft_options) 
    Convertit les options du pattern en ft_options
    Avec le fallback par défaut si l'option n'est pas spécifiée dans le pattern:
      bitmap=false, antialias=true, hinting=true, rgba=FC_RGBA_UNKNOWN =>
      CAIRO_SUBPIXEL_ORDER_DEFAULT, hintstyle=hintfull, autohint=false,
      vertical_layout=false, embolden=false
      (ie the same defaults as for the Xft Xresources but with also defaults
      for autohint, bitmap, vertical_layout, embolden; and the fallback rgba to
      CAIRO_SUBPIXEL_ORDER_DEFAULT)
- _cairo_ft_font_options_substitute (font_options, pattern);
    Fait essentiellement l'inverse de _get_pattern_ft_options: rajoute les
    options de font_options à pattern (sauf si elles sont déjà spécifiées dans pattern)
    (à part que font_options est un cairo_font_options_t alors que ft_options est un cairo_ft_options_t)
- cairo_ft_font_face_create_for_pattern (FcPattern *pattern)
    Si pattern est non résolu: [test via: _cairo_ft_unscaled_font_create_for_pattern (pattern, &unscaled);]
      return _cairo_ft_font_face_create_for_pattern (pattern);
    Sinon (la fonte résolue est mise dans la variable 'unscaled'):
      _get_pattern_ft_options (pattern, &ft_options);
      font_face = _cairo_ft_font_face_create (unscaled, &ft_options);
- cairo_ft_font_face_create_for_ft_face (FT_Face face, int load_flags)
    cairo_ft_options_t ft_options;
    ft_options.load_flags = load_flags; ft_options.synth_flags = 0;
    _cairo_font_options_init_default (&ft_options.base); // Met tout à CAIRO_*_DEFAULT
    font_face = _cairo_ft_font_face_create (unscaled, &ft_options); //unscaled est la cairo unscaled font correspondant à face
-  _cairo_ft_font_face_create_for_pattern (FcPattern *pattern)
      Appelle _cairo_font_face_init qui doit faire un _cairo_ft_font_face_get_implementation
-  _cairo_ft_font_face_create (cairo_ft_unscaled_font_t *unscaled, cairo_ft_options_t *ft_options)
      _cairo_ft_options_init_copy (&font_face->ft_options, ft_options);
      Appelle _cairo_font_face_init qui doit faire un _cairo_ft_font_face_get_implementation
- _cairo_ft_font_face_get_implementation (void *abstract_face, *font_matrix, *ctm, const cairo_font_options_t *options)
    cairo_ft_font_face_t      *font_face = abstract_face;
    Si le pattern est non résolu
      retourne la fonte de _cairo_ft_resolve_pattern (font_face->pattern, font_matrix, ctm, options);
    Sinon return abstract_face;
- _cairo_ft_resolve_pattern (FcPattern *pattern, *font_matrix, *ctm, const cairo_font_options_t *font_options)
    FcConfigSubstitute (NULL, pattern, FcMatchPattern));
    _cairo_ft_font_options_substitute (font_options, pattern);
    FcDefaultSubstitute (pattern);
    Si pattern n'est pas résolu [test via: status = _cairo_ft_unscaled_font_create_for_pattern (pattern, &unscaled);]
      resolved = FcFontMatch (NULL, pattern, &result); [+ créer la fonte correspondant à resolved dans unscaled via: status = _cairo_ft_unscaled_font_create_for_pattern (resolved, &unscaled);]
    Sinon (la fonte résolue est dans unscaled):
      resolved = pattern;
    _get_pattern_ft_options (resolved, &ft_options);
    font_face = _cairo_ft_font_face_create (unscaled, &ft_options);
- _cairo_ft_font_face_scaled_font_create (void *abstract_font_face, *font_matrix, *ctm, const cairo_font_options_t *options, cairo_scaled_font_t **font_out)
    // Called by cairo_scaled_font_create, cf cairo-scaled-font.c: 
    // status = font_face->backend->scaled_font_create (font_face, font_matrix, ctm, options, &scaled_font);
    _cairo_font_options_init_copy (&scaled_font->ft_options.base, options);
    _cairo_ft_options_merge (&scaled_font->ft_options, &font_face->ft_options);
=> font = cairo_ft_font_face_create_for_pattern(pattern)
   cairo_set_font_face(cairo_t, font) //set the current font face
   peut aussi être utilisé pour créer une autre fonte 'scalée' via `cairo_scaled_font_create`

- cairo options (since cairo has different backends they may not be the
  same as fontconfig font options): cairo.h
~~~ c
typedef enum _cairo_antialias {
    CAIRO_ANTIALIAS_DEFAULT,

    /* method */
    CAIRO_ANTIALIAS_NONE,
    CAIRO_ANTIALIAS_GRAY,
    CAIRO_ANTIALIAS_SUBPIXEL,

    /* hints */
    CAIRO_ANTIALIAS_FAST, // => GRAY
    CAIRO_ANTIALIAS_GOOD, // => GRAY
    CAIRO_ANTIALIAS_BEST  // => SUBPIXEL
} cairo_antialias_t;

typedef enum _cairo_hint_style {
    CAIRO_HINT_STYLE_DEFAULT,
    CAIRO_HINT_STYLE_NONE,
    CAIRO_HINT_STYLE_SLIGHT,
    CAIRO_HINT_STYLE_MEDIUM,
    CAIRO_HINT_STYLE_FULL
} cairo_hint_style_t;

typedef enum _cairo_hint_metrics {
    CAIRO_HINT_METRICS_DEFAULT,
    CAIRO_HINT_METRICS_OFF,
    CAIRO_HINT_METRICS_ON
} cairo_hint_metrics_t;

typedef enum _cairo_subpixel_order {
    CAIRO_SUBPIXEL_ORDER_DEFAULT,
    CAIRO_SUBPIXEL_ORDER_RGB,
    CAIRO_SUBPIXEL_ORDER_BGR,
    CAIRO_SUBPIXEL_ORDER_VRGB,
    CAIRO_SUBPIXEL_ORDER_VBGR
} cairo_subpixel_order_t;
~~~
- cairo-types-private.h
~~~ c
typedef enum _cairo_lcd_filter {
    CAIRO_LCD_FILTER_DEFAULT,
    CAIRO_LCD_FILTER_NONE,
    CAIRO_LCD_FILTER_INTRA_PIXEL, //legacy
    CAIRO_LCD_FILTER_FIR3, //light
    CAIRO_LCD_FILTER_FIR5  //default
} cairo_lcd_filter_t;
~~~

- cairo-font-options.c:
~~~ c
// Default without the resources [works for other output like printing]
_cairo_font_options_init_default (cairo_font_options_t *options)
{
    options->antialias = CAIRO_ANTIALIAS_DEFAULT;
    options->subpixel_order = CAIRO_SUBPIXEL_ORDER_DEFAULT;
    options->lcd_filter = CAIRO_LCD_FILTER_DEFAULT;
    options->hint_style = CAIRO_HINT_STYLE_DEFAULT;
    options->hint_metrics = CAIRO_HINT_METRICS_DEFAULT;
    options->round_glyph_positions = CAIRO_ROUND_GLYPH_POS_DEFAULT;
    options->variations = NULL;
}
/* These are enums defined in cairo.h */

void
_cairo_font_options_init_copy (cairo_font_options_t		*options,
			       const cairo_font_options_t	*other)
{
    options->antialias = other->antialias;
    options->subpixel_order = other->subpixel_order;
    options->lcd_filter = other->lcd_filter;
    options->hint_style = other->hint_style;
    options->hint_metrics = other->hint_metrics;
    options->round_glyph_positions = other->round_glyph_positions;
    options->variations = other->variations ? strdup (other->variations) : NULL;
}
~~~

- cairo-xcb-resources.c:
~~~ c
// If we have resources, we parse them, with the following fallback
get_resources {
    resources->xft_antialias = TRUE;
    resources->xft_lcdfilter = -1; //the case when no lcdfilter property is available => fallback to CAIRO_LCD_FILTER_DEFAULT
    resources->xft_hinting = TRUE;
    resources->xft_hintstyle = FC_HINT_FULL;
    resources->xft_rgba = FC_RGBA_UNKNOWN; //=> fallback to autodetection in _cairo_xcb_resources_get()
    ... Parse the Xresources

void
_cairo_xcb_resources_get (cairo_xcb_screen_t *screen, cairo_xcb_resources_t *resources)
{
    get_resources (screen->connection->xcb_connection, screen->xcb_screen, resources);
    if (resources->xft_rgba == FC_RGBA_UNKNOWN) {
	switch (screen->subpixel_order) {
	case XCB_RENDER_SUB_PIXEL_UNKNOWN:
	    resources->xft_rgba = FC_RGBA_UNKNOWN;
	    break;
	case XCB_RENDER_SUB_PIXEL_HORIZONTAL_RGB:
	    resources->xft_rgba = FC_RGBA_RGB;
	    break;
	case XCB_RENDER_SUB_PIXEL_HORIZONTAL_BGR:
	    resources->xft_rgba = FC_RGBA_BGR;
	    break;
	case XCB_RENDER_SUB_PIXEL_VERTICAL_RGB:
	    resources->xft_rgba = FC_RGBA_VRGB;
	    break;
	case XCB_RENDER_SUB_PIXEL_VERTICAL_BGR:
	    resources->xft_rgba = FC_RGBA_VBGR;
	    break;
	case XCB_RENDER_SUB_PIXEL_NONE:
	    resources->xft_rgba = FC_RGBA_NONE;
	    break;
	}
    }
}
~~~
- caire-xcb-screen.c
~~~ c
  _cairo_xcb_init_screen_font_options (cairo_xcb_screen_t *screen)
    calls _cairo_xcb_resources_get (screen, &res);
    and transform the settings to cairo style (de la même manière que
    _cairo_xlib_init_screen_font_options plus bas)
    Utilisé par _cairo_xcb_screen_get_font_options
~~~

- cairo-xlib-screen.c:
~~~ c
// parse Xft xresources via xlib, with the fallbacks:
_cairo_xlib_init_screen_font_options {
    if (!get_boolean_default (dpy, "antialias", &xft_antialias))
	xft_antialias = TRUE;
	...
      xft_antialias = TRUE;
      xft_lcdfilter = -1;
      xft_hinting = TRUE;
      xft_hintstyle = FC_HINT_FULL;
      xft_rgba = XRenderQuerySubpixelOrder with a fallback to FC_RGBA_UNKNOWN;

    // Convert these settings to CAIRO style settings
    if (xft_hinting) {
	switch (xft_hintstyle) {
	case FC_HINT_NONE:
	    hint_style = CAIRO_HINT_STYLE_NONE;
	    break;
	case FC_HINT_SLIGHT:
	    hint_style = CAIRO_HINT_STYLE_SLIGHT;
	    break;
	case FC_HINT_MEDIUM:
	    hint_style = CAIRO_HINT_STYLE_MEDIUM;
	    break;
	case FC_HINT_FULL:
	    hint_style = CAIRO_HINT_STYLE_FULL;
	    break;
	default:
	    hint_style = CAIRO_HINT_STYLE_DEFAULT;
	}
    } else {
	hint_style = CAIRO_HINT_STYLE_NONE;
    }

    switch (xft_rgba) {
    case FC_RGBA_RGB:
	subpixel_order = CAIRO_SUBPIXEL_ORDER_RGB;
	break;
    case FC_RGBA_BGR:
	subpixel_order = CAIRO_SUBPIXEL_ORDER_BGR;
	break;
    case FC_RGBA_VRGB:
	subpixel_order = CAIRO_SUBPIXEL_ORDER_VRGB;
	break;
    case FC_RGBA_VBGR:
	subpixel_order = CAIRO_SUBPIXEL_ORDER_VBGR;
	break;
    case FC_RGBA_UNKNOWN:
    case FC_RGBA_NONE:
    default:
	subpixel_order = CAIRO_SUBPIXEL_ORDER_DEFAULT;
    }

    switch (xft_lcdfilter) {
    case FC_LCD_NONE:
	lcd_filter = CAIRO_LCD_FILTER_NONE;
	break;
    case FC_LCD_DEFAULT:
	lcd_filter = CAIRO_LCD_FILTER_FIR5;
	break;
    case FC_LCD_LIGHT:
	lcd_filter = CAIRO_LCD_FILTER_FIR3;
	break;
    case FC_LCD_LEGACY:
	lcd_filter = CAIRO_LCD_FILTER_INTRA_PIXEL;
	break;
    default:
	lcd_filter = CAIRO_LCD_FILTER_DEFAULT;
	break;
    }

    if (xft_antialias) {
	if (subpixel_order == CAIRO_SUBPIXEL_ORDER_DEFAULT)
	    antialias = CAIRO_ANTIALIAS_GRAY;
	else
	    antialias = CAIRO_ANTIALIAS_SUBPIXEL;
    } else {
	antialias = CAIRO_ANTIALIAS_NONE;
    }

    cairo_font_options_set_hint_style (&info->font_options, hint_style);
    cairo_font_options_set_antialias (&info->font_options, antialias);
    cairo_font_options_set_subpixel_order (&info->font_options, subpixel_order);
    _cairo_font_options_set_lcd_filter (&info->font_options, lcd_filter);
    cairo_font_options_set_hint_metrics (&info->font_options, CAIRO_HINT_METRICS_ON);
}

// set up the default font options from the resources: start with cairo's
// all default and add the Xresources above
_cairo_xlib_screen_get_font_options (cairo_xlib_screen_t *info)
{
  if (! info->has_font_options) {
    _cairo_font_options_init_default (&info->font_options);
    if (info->screen != NULL) {
      cairo_xlib_display_t *display;
      //parse Xresources
      _cairo_xlib_init_screen_font_options (display->display, info);
    }
    info->has_font_options = TRUE;
  }
  return &info->font_options;
}
~~~

- cairo-ft-font.c:
~~~ c
//get the options from pattern into a cairo_ft_options structure
_get_pattern_ft_options (FcPattern *pattern, cairo_ft_options_t *ret)

    // => if not specified, bitmap=false, antialias=true, hinting=true,
    // rgba=FC_RGBA_UNKNOWN => CAIRO_SUBPIXEL_ORDER_DEFAULT,
    // hintstyle=hintfull, autohint=false, vertical_layout=false,
    // embolden=false
    
    FcBool antialias, vertical_layout, hinting, autohint, bitmap, embolden;
    cairo_ft_options_t ft_options;
    int rgba;
 #ifdef FC_HINT_STYLE
    int hintstyle;
 #endif
    char *variations;

    _cairo_font_options_init_default (&ft_options.base);
    ft_options.load_flags = FT_LOAD_DEFAULT;
    ft_options.synth_flags = 0;

 #ifndef FC_EMBEDDED_BITMAP
 #define FC_EMBEDDED_BITMAP "embeddedbitmap"
 #endif

    /* Check whether to force use of embedded bitmaps */
    if (FcPatternGetBool (pattern,
			  FC_EMBEDDED_BITMAP, 0, &bitmap) != FcResultMatch)
	bitmap = FcFalse;

    /* disable antialiasing if requested */
    if (FcPatternGetBool (pattern,
			  FC_ANTIALIAS, 0, &antialias) != FcResultMatch)
	antialias = FcTrue;
    
    if (antialias) {
	cairo_subpixel_order_t subpixel_order;
	int lcd_filter;

	/* disable hinting if requested */
	if (FcPatternGetBool (pattern,
			      FC_HINTING, 0, &hinting) != FcResultMatch)
	    hinting = FcTrue;

	if (FcPatternGetInteger (pattern,
				 FC_RGBA, 0, &rgba) != FcResultMatch)
	    rgba = FC_RGBA_UNKNOWN;

	switch (rgba) {
	case FC_RGBA_RGB:
	    subpixel_order = CAIRO_SUBPIXEL_ORDER_RGB;
	    break;
	case FC_RGBA_BGR:
	    subpixel_order = CAIRO_SUBPIXEL_ORDER_BGR;
	    break;
	case FC_RGBA_VRGB:
	    subpixel_order = CAIRO_SUBPIXEL_ORDER_VRGB;
	    break;
	case FC_RGBA_VBGR:
	    subpixel_order = CAIRO_SUBPIXEL_ORDER_VBGR;
	    break;
	case FC_RGBA_UNKNOWN:
	case FC_RGBA_NONE:
	default:
	    subpixel_order = CAIRO_SUBPIXEL_ORDER_DEFAULT;
	    break;
	}

	if (subpixel_order != CAIRO_SUBPIXEL_ORDER_DEFAULT) {
	    ft_options.base.subpixel_order = subpixel_order;
	    ft_options.base.antialias = CAIRO_ANTIALIAS_SUBPIXEL;
	}

	if (FcPatternGetInteger (pattern,
				 FC_LCD_FILTER, 0, &lcd_filter) == FcResultMatch)
	{
	    switch (lcd_filter) {
	    case FC_LCD_NONE:
		ft_options.base.lcd_filter = CAIRO_LCD_FILTER_NONE;
		break;
	    case FC_LCD_DEFAULT:
		ft_options.base.lcd_filter = CAIRO_LCD_FILTER_FIR5;
		break;
	    case FC_LCD_LIGHT:
		ft_options.base.lcd_filter = CAIRO_LCD_FILTER_FIR3;
		break;
	    case FC_LCD_LEGACY:
		ft_options.base.lcd_filter = CAIRO_LCD_FILTER_INTRA_PIXEL;
		break;
	    }
	}

 #ifdef FC_HINT_STYLE
	if (FcPatternGetInteger (pattern,
				 FC_HINT_STYLE, 0, &hintstyle) != FcResultMatch)
	    hintstyle = FC_HINT_FULL;

	if (!hinting)
	    hintstyle = FC_HINT_NONE;

	switch (hintstyle) {
	case FC_HINT_NONE:
	    ft_options.base.hint_style = CAIRO_HINT_STYLE_NONE;
	    break;
	case FC_HINT_SLIGHT:
	    ft_options.base.hint_style = CAIRO_HINT_STYLE_SLIGHT;
	    break;
	case FC_HINT_MEDIUM:
	default:
	    ft_options.base.hint_style = CAIRO_HINT_STYLE_MEDIUM;
	    break;
	case FC_HINT_FULL:
	    ft_options.base.hint_style = CAIRO_HINT_STYLE_FULL;
	    break;
	}
 #else /* !FC_HINT_STYLE */
	if (!hinting) {
	    ft_options.base.hint_style = CAIRO_HINT_STYLE_NONE;
	}
 #endif /* FC_HINT_STYLE */

	/* Force embedded bitmaps off if no hinting requested */
	if (ft_options.base.hint_style == CAIRO_HINT_STYLE_NONE)
	  bitmap = FcFalse;

	if (!bitmap)
	    ft_options.load_flags |= FT_LOAD_NO_BITMAP;

    } else {
	ft_options.base.antialias = CAIRO_ANTIALIAS_NONE;
    }

    /* force autohinting if requested */
    if (FcPatternGetBool (pattern,
			  FC_AUTOHINT, 0, &autohint) != FcResultMatch)
	autohint = FcFalse;

    if (autohint)
	ft_options.load_flags |= FT_LOAD_FORCE_AUTOHINT;

    if (FcPatternGetBool (pattern,
			  FC_VERTICAL_LAYOUT, 0, &vertical_layout) != FcResultMatch)
	vertical_layout = FcFalse;

    if (vertical_layout)
	ft_options.load_flags |= FT_LOAD_VERTICAL_LAYOUT;

 #ifndef FC_EMBOLDEN
 #define FC_EMBOLDEN "embolden"
 #endif
    if (FcPatternGetBool (pattern,
			  FC_EMBOLDEN, 0, &embolden) != FcResultMatch)
	embolden = FcFalse;

    if (embolden)
	ft_options.synth_flags |= CAIRO_FT_SYNTHESIZE_BOLD;

 #ifndef FC_FONT_VARIATIONS
 #define FC_FONT_VARIATIONS "fontvariations"
 #endif
    if (FcPatternGetString (pattern, FC_FONT_VARIATIONS, 0, (FcChar8 **) &variations) == FcResultMatch) {
      ft_options.base.variations = strdup (variations);
    }

    *ret = ft_options;
}

/*
_cairo_ft_options_merge (cairo_ft_options_t *options,
			 cairo_ft_options_t *other)
 The merge is complicated, see https://bugs.freedesktop.org/show_bug.cgi?id=11838
 This is called by _cairo_ft_font_face_scaled_font_create(font_face, ..., ft_options) with
 'options=ft_options' (ie the new cairo options) and 'other=font_face->ft_options'
 ie from the old cairo options from the unscaled font 'font_face'.
*/
static void
_cairo_ft_options_merge (cairo_ft_options_t *options,
			 cairo_ft_options_t *other)
{
    int load_flags = other->load_flags;
    int load_target = FT_LOAD_TARGET_NORMAL;

    /* clear load target mode */
    load_flags &= ~(FT_LOAD_TARGET_(FT_LOAD_TARGET_MODE(other->load_flags)));

    if (load_flags & FT_LOAD_NO_HINTING)
	other->base.hint_style = CAIRO_HINT_STYLE_NONE;

    if (other->base.antialias == CAIRO_ANTIALIAS_NONE ||
	options->base.antialias == CAIRO_ANTIALIAS_NONE) {
	options->base.antialias = CAIRO_ANTIALIAS_NONE;
	options->base.subpixel_order = CAIRO_SUBPIXEL_ORDER_DEFAULT;
    }

    if (other->base.antialias == CAIRO_ANTIALIAS_SUBPIXEL &&
	(options->base.antialias == CAIRO_ANTIALIAS_DEFAULT ||
	 options->base.antialias == CAIRO_ANTIALIAS_GRAY)) {
	options->base.antialias = CAIRO_ANTIALIAS_SUBPIXEL;
	options->base.subpixel_order = other->base.subpixel_order;
    }

    if (options->base.hint_style == CAIRO_HINT_STYLE_DEFAULT)
	options->base.hint_style = other->base.hint_style;

    if (other->base.hint_style == CAIRO_HINT_STYLE_NONE)
	options->base.hint_style = CAIRO_HINT_STYLE_NONE;

    if (options->base.lcd_filter == CAIRO_LCD_FILTER_DEFAULT)
	options->base.lcd_filter = other->base.lcd_filter;

    if (other->base.lcd_filter == CAIRO_LCD_FILTER_NONE)
	options->base.lcd_filter = CAIRO_LCD_FILTER_NONE;

    if (options->base.antialias == CAIRO_ANTIALIAS_NONE) {
	if (options->base.hint_style == CAIRO_HINT_STYLE_NONE)
	    load_flags |= FT_LOAD_NO_HINTING;
	else
	    load_target = FT_LOAD_TARGET_MONO;
	load_flags |= FT_LOAD_MONOCHROME;
    } else {
	switch (options->base.hint_style) {
	case CAIRO_HINT_STYLE_NONE:
	    load_flags |= FT_LOAD_NO_HINTING;
	    break;
	case CAIRO_HINT_STYLE_SLIGHT:
	    load_target = FT_LOAD_TARGET_LIGHT;
	    break;
	case CAIRO_HINT_STYLE_MEDIUM:
	    break;
	case CAIRO_HINT_STYLE_FULL:
	case CAIRO_HINT_STYLE_DEFAULT:
	    if (options->base.antialias == CAIRO_ANTIALIAS_SUBPIXEL) {
		switch (options->base.subpixel_order) {
		case CAIRO_SUBPIXEL_ORDER_DEFAULT:
		case CAIRO_SUBPIXEL_ORDER_RGB:
		case CAIRO_SUBPIXEL_ORDER_BGR:
		    load_target = FT_LOAD_TARGET_LCD;
		    break;
		case CAIRO_SUBPIXEL_ORDER_VRGB:
		case CAIRO_SUBPIXEL_ORDER_VBGR:
		    load_target = FT_LOAD_TARGET_LCD_V;
		break;
		}
	    }
	    break;
	}
    }

    if (other->base.variations) {
      if (options->base.variations) {
        char *p;

        /* 'merge' variations by concatenating - later entries win */
        p = malloc (strlen (other->base.variations) + strlen (options->base.variations) + 2);
        p[0] = 0;
        strcat (p, other->base.variations);
        strcat (p, ",");
        strcat (p, options->base.variations);
        free (options->base.variations);
        options->base.variations = p;
      }
      else {
        options->base.variations = strdup (other->base.variations);
      }
    }

    options->load_flags = load_flags | load_target;
    options->synth_flags = other->synth_flags;
}

/* create a scaled font from an abstract font face 'font_face' and some cairo options:
   set the ft_options.base from the cairo options "options" (base=antialias,
   subpixel_order, lcd_filter, hint_style, hint_metrics,
   round_glyph_positions, variations)
   and then merge ft_options with abstract_font_face->ft_options

_cairo_ft_font_face_scaled_font_create {
    //options->base comes from the cairo options
    _cairo_font_options_init_copy (&scaled_font->ft_options.base, options);
   
    _cairo_ft_options_merge (&scaled_font->ft_options, &font_face->ft_options);
*/

static cairo_status_t
_cairo_ft_font_face_scaled_font_create (void		    *abstract_font_face,
					const cairo_matrix_t	 *font_matrix,
					const cairo_matrix_t	 *ctm,
					const cairo_font_options_t *options,
					cairo_scaled_font_t       **font_out)
{
    cairo_ft_font_face_t *font_face = abstract_font_face;
    cairo_ft_scaled_font_t *scaled_font;
    FT_Face face;
    cairo_status_t status;
    cairo_ft_unscaled_font_t *unscaled;

    face = _cairo_ft_unscaled_font_lock_face (font_face->unscaled);
    scaled_font = malloc (sizeof (cairo_ft_scaled_font_t));
    scaled_font->unscaled = unscaled = font_face->unscaled;
    _cairo_font_options_init_copy (&scaled_font->ft_options.base, options);
    _cairo_ft_options_merge (&scaled_font->ft_options, &font_face->ft_options);
    status = _cairo_scaled_font_init (&scaled_font->base,
			              &font_face->base,
				      font_matrix, ctm, options,
				      &_cairo_ft_scaled_font_backend);
    ...
}

const cairo_font_face_backend_t _cairo_ft_font_face_backend = {
    CAIRO_FONT_TYPE_FT,
    _cairo_ft_font_face_create_for_toy, // creates a pattern from the toy font struct values and call cairo_ft_font_face_create_for_pattern
    _cairo_ft_font_face_destroy,
    _cairo_ft_font_face_scaled_font_create, // the above function
    _cairo_ft_font_face_get_implementation // see below
};

static cairo_font_face_t *
_cairo_ft_font_face_get_implementation (void                     *abstract_face,
					const cairo_matrix_t       *font_matrix,
					const cairo_matrix_t       *ctm,
					const cairo_font_options_t *options)
{
    cairo_ft_font_face_t      *font_face = abstract_face;

    /* The handling of font options is different depending on how the
     * font face was created. When the user creates a font face with
     * cairo_ft_font_face_create_for_ft_face(), then the load flags
     * passed in augment the load flags for the options.  But for
     * cairo_ft_font_face_create_for_pattern(), the load flags are
     * derived from a pattern where the user has called
     * cairo_ft_font_options_substitute(), so *just* use those load
     * flags and ignore the options.
     */
    /* If we have an unresolved pattern, resolve it and create
     * unscaled font.  Otherwise, use the ones stored in font_face. */
    if (font_face->pattern) {
	cairo_font_face_t *resolved;

	/* Cache the resolved font whilst the FcConfig remains consistent. */
	resolved = font_face->resolved_font_face;
	if (resolved != NULL) { ... }
	resolved = _cairo_ft_resolve_pattern (font_face->pattern,
					      font_matrix,
					      ctm,
					      options);
	font_face->resolved_font_face = cairo_font_face_reference (resolved);
	font_face->resolved_config = FcConfigGetCurrent ();
	return resolved;
    }
    return abstract_face;
}

static cairo_font_face_t *
_cairo_ft_font_face_create_for_pattern (FcPattern *pattern)
{
    cairo_ft_font_face_t *font_face;
    ...
    font_face->resolved_font_face = NULL;
    font_face->resolved_config = NULL;
    _cairo_font_face_init (&font_face->base, &_cairo_ft_font_face_backend);
    return &font_face->base;
}

static cairo_font_face_t *
_cairo_ft_font_face_create (cairo_ft_unscaled_font_t *unscaled,
			    cairo_ft_options_t	     *ft_options)
{
    cairo_ft_font_face_t *font_face;
    ...
    font_face->unscaled = unscaled;
    _cairo_ft_options_init_copy (&font_face->ft_options, ft_options);
    font_face->pattern = NULL;
    _cairo_font_face_init (&font_face->base, &_cairo_ft_font_face_backend);
    return &font_face->base;
}


/**
 * cairo_ft_font_options_substitute:
 * @options: a #cairo_font_options_t object
 * @pattern: an existing #FcPattern
 *
 * Add options to a #FcPattern based on a #cairo_font_options_t font
 * options object. Options that are already in the pattern, are not overridden,
 * so you should call this function after calling FcConfigSubstitute() (the
 * user's settings should override options based on the surface type), but
 * before calling FcDefaultSubstitute().
 *
 * Since: 1.0
 **/
void
cairo_ft_font_options_substitute (const cairo_font_options_t *options,
				  FcPattern                  *pattern)
{
    _cairo_ft_font_options_substitute (options, pattern);
}
static cairo_status_t

_cairo_ft_font_options_substitute (const cairo_font_options_t *options,
				   FcPattern                  *pattern)
{
    FcValue v;

    if (options->antialias != CAIRO_ANTIALIAS_DEFAULT)
    {
	if (FcPatternGet (pattern, FC_ANTIALIAS, 0, &v) == FcResultNoMatch)
	{
	    if (! FcPatternAddBool (pattern,
			            FC_ANTIALIAS,
				    options->antialias != CAIRO_ANTIALIAS_NONE))
		return _cairo_error (CAIRO_STATUS_NO_MEMORY);

	    if (options->antialias != CAIRO_ANTIALIAS_SUBPIXEL) {
		FcPatternDel (pattern, FC_RGBA);
		if (! FcPatternAddInteger (pattern, FC_RGBA, FC_RGBA_NONE))
		    return _cairo_error (CAIRO_STATUS_NO_MEMORY);
	    }
	}
    }

    if (options->antialias != CAIRO_ANTIALIAS_DEFAULT)
    {
	if (FcPatternGet (pattern, FC_RGBA, 0, &v) == FcResultNoMatch)
	{
	    int rgba;

	    if (options->antialias == CAIRO_ANTIALIAS_SUBPIXEL) {
		switch (options->subpixel_order) {
		case CAIRO_SUBPIXEL_ORDER_DEFAULT:
		case CAIRO_SUBPIXEL_ORDER_RGB:
		default:
		    rgba = FC_RGBA_RGB;
		    break;
		case CAIRO_SUBPIXEL_ORDER_BGR:
		    rgba = FC_RGBA_BGR;
		    break;
		case CAIRO_SUBPIXEL_ORDER_VRGB:
		    rgba = FC_RGBA_VRGB;
		    break;
		case CAIRO_SUBPIXEL_ORDER_VBGR:
		    rgba = FC_RGBA_VBGR;
		    break;
		}
	    } else {
		rgba = FC_RGBA_NONE;
	    }

	    if (! FcPatternAddInteger (pattern, FC_RGBA, rgba))
		return _cairo_error (CAIRO_STATUS_NO_MEMORY);
	}
    }

    if (options->lcd_filter != CAIRO_LCD_FILTER_DEFAULT)
    {
	if (FcPatternGet (pattern, FC_LCD_FILTER, 0, &v) == FcResultNoMatch)
	{
	    int lcd_filter;

	    switch (options->lcd_filter) {
	    case CAIRO_LCD_FILTER_NONE:
		lcd_filter = FT_LCD_FILTER_NONE;
		break;
	    case CAIRO_LCD_FILTER_DEFAULT:
	    case CAIRO_LCD_FILTER_INTRA_PIXEL:
		lcd_filter = FT_LCD_FILTER_LEGACY;
		break;
	    case CAIRO_LCD_FILTER_FIR3:
		lcd_filter = FT_LCD_FILTER_LIGHT;
		break;
	    default:
	    case CAIRO_LCD_FILTER_FIR5:
		lcd_filter = FT_LCD_FILTER_DEFAULT;
		break;
	    }

	    if (! FcPatternAddInteger (pattern, FC_LCD_FILTER, lcd_filter))
		return _cairo_error (CAIRO_STATUS_NO_MEMORY);
	}
    }

    if (options->hint_style != CAIRO_HINT_STYLE_DEFAULT)
    {
	if (FcPatternGet (pattern, FC_HINTING, 0, &v) == FcResultNoMatch)
	{
	    if (! FcPatternAddBool (pattern,
			            FC_HINTING,
				    options->hint_style != CAIRO_HINT_STYLE_NONE))
		return _cairo_error (CAIRO_STATUS_NO_MEMORY);
	}

 #ifdef FC_HINT_STYLE
	if (FcPatternGet (pattern, FC_HINT_STYLE, 0, &v) == FcResultNoMatch)
	{
	    int hint_style;

	    switch (options->hint_style) {
	    case CAIRO_HINT_STYLE_NONE:
		hint_style = FC_HINT_NONE;
		break;
	    case CAIRO_HINT_STYLE_SLIGHT:
		hint_style = FC_HINT_SLIGHT;
		break;
	    case CAIRO_HINT_STYLE_MEDIUM:
		hint_style = FC_HINT_MEDIUM;
		break;
	    case CAIRO_HINT_STYLE_FULL:
	    case CAIRO_HINT_STYLE_DEFAULT:
	    default:
		hint_style = FC_HINT_FULL;
		break;
	    }

	    if (! FcPatternAddInteger (pattern, FC_HINT_STYLE, hint_style))
		return _cairo_error (CAIRO_STATUS_NO_MEMORY);
	}
 #endif
    }

    return CAIRO_STATUS_SUCCESS;
}

static cairo_status_t
_cairo_ft_unscaled_font_create_for_pattern (FcPattern *pattern,
					    cairo_ft_unscaled_font_t **out)
{
    FT_Face font_face = NULL;
    char *filename = NULL;
    int id = 0;
    FcResult ret;

    ret = FcPatternGetFTFace (pattern, FC_FT_FACE, 0, &font_face);
    if (ret == FcResultMatch)
	goto DONE;
    ret = FcPatternGetString (pattern, FC_FILE, 0, (FcChar8 **) &filename);
    if (ret == FcResultMatch) {
	if (access (filename, R_OK) == 0) {
	    /* If FC_INDEX is not set, we just use 0 */
	    ret = FcPatternGetInteger (pattern, FC_INDEX, 0, &id);
	    goto DONE;
	} else
	    return _cairo_error (CAIRO_STATUS_FILE_NOT_FOUND);
    }

    /* The pattern contains neither a face nor a filename, resolve it later. */
    *out = NULL;
    return CAIRO_STATUS_SUCCESS;

DONE:
    return _cairo_ft_unscaled_font_create_internal (font_face != NULL,
						    filename, id, font_face,
						    out);
}

/*
_cairo_ft_resolve_pattern {
  FcConfigSubstitute (NULL, pattern, FcMatchPattern)
  _cairo_ft_font_options_substitute (font_options, pattern);
  FcDefaultSubstitute (pattern);
*/
static cairo_font_face_t *
_cairo_ft_resolve_pattern (FcPattern		      *pattern,
			   const cairo_matrix_t       *font_matrix,
			   const cairo_matrix_t       *ctm,
			   const cairo_font_options_t *font_options)
{
    cairo_status_t status;
    FcPattern *resolved; FcResult result;
    cairo_ft_unscaled_font_t *unscaled;
    cairo_ft_options_t ft_options;
    cairo_font_face_t *font_face;

    FcConfigSubstitute (NULL, pattern, FcMatchPattern));
    _cairo_ft_font_options_substitute (font_options, pattern);
    FcDefaultSubstitute (pattern);
    _cairo_ft_unscaled_font_create_for_pattern (pattern, &unscaled);
    if (unscaled == NULL) { // Le pattern n'a pas été résolu
	resolved = FcFontMatch (NULL, pattern, &result);
	if (!resolved) {
	    /* We failed to find any font. Substitute twin so that the user can
	     * see something (and hopefully recognise that the font is missing)
	     * and not just receive a NO_MEMORY error during rendering.
	     */
	    font_face = _cairo_font_face_twin_create_fallback ();
	    goto FREE_PATTERN;
	}

	status = _cairo_ft_unscaled_font_create_for_pattern (resolved, &unscaled);
    } else
	resolved = pattern;

    _get_pattern_ft_options (resolved, &ft_options);
    font_face = _cairo_ft_font_face_create (unscaled, &ft_options);
    return font_face;
}


/**
 * cairo_ft_font_face_create_for_pattern:
 * @pattern: A fontconfig pattern.  Cairo makes a copy of the pattern
 * if it needs to.  You are free to modify or free @pattern after this call.
 *
 * Creates a new font face for the FreeType font backend based on a
 * fontconfig pattern. This font can then be used with
 * cairo_set_font_face() or cairo_scaled_font_create(). The
 * #cairo_scaled_font_t returned from cairo_scaled_font_create() is
 * also for the FreeType backend and can be used with functions such
 * as cairo_ft_scaled_font_lock_face().
 *
 * Font rendering options are represented both here and when you
 * call cairo_scaled_font_create(). Font options that have a representation
 * in a #FcPattern must be passed in here; to modify #FcPattern
 * appropriately to reflect the options in a #cairo_font_options_t, call
 * cairo_ft_font_options_substitute().
 *
 * The pattern's FC_FT_FACE element is inspected first and if that is set,
 * that will be the FreeType font face associated with the returned cairo
 * font face.  Otherwise the FC_FILE element is checked.  If it's set,
 * that and the value of the FC_INDEX element (defaults to zero) of @pattern
 * are used to load a font face from file.
 *
 * If both steps from the previous paragraph fails, @pattern will be passed
 * to FcConfigSubstitute, FcDefaultSubstitute, and finally FcFontMatch,
 * and the resulting font pattern is used.
 *
 * If the FC_FT_FACE element of @pattern is set, the user is responsible
 * for making sure that the referenced FT_Face remains valid for the life
 * time of the returned #cairo_font_face_t.  See
 * cairo_ft_font_face_create_for_ft_face() for an example of how to couple
 * the life time of the FT_Face to that of the cairo font-face.
 *
 * Return value: a newly created #cairo_font_face_t. Free with
 *  cairo_font_face_destroy() when you are done using it.
 *
 * Since: 1.0
 **/
cairo_font_face_t *
cairo_ft_font_face_create_for_pattern (FcPattern *pattern)
{
    cairo_ft_unscaled_font_t *unscaled;
    cairo_font_face_t *font_face;
    cairo_ft_options_t ft_options;
    cairo_status_t status;

    status = _cairo_ft_unscaled_font_create_for_pattern (pattern, &unscaled);
    // Create the font associated to the pattern if it has been resolved already
    if (unlikely (unscaled == NULL)) {
	/* Store the pattern.  We will resolve it and create unscaled
	 * font when creating scaled fonts */
	return _cairo_ft_font_face_create_for_pattern (pattern);
    }
    _get_pattern_ft_options (pattern, &ft_options);
    font_face = _cairo_ft_font_face_create (unscaled, &ft_options);
    _cairo_ft_options_fini (&ft_options);
    _cairo_unscaled_font_destroy (&unscaled->base);

    return font_face;
}
 #endif

/**
 * cairo_ft_font_face_create_for_ft_face:
 * @face: A FreeType face object, already opened. This must
 *   be kept around until the face's ref_count drops to
 *   zero and it is freed. Since the face may be referenced
 *   internally to Cairo, the best way to determine when it
 *   is safe to free the face is to pass a
 *   #cairo_destroy_func_t to cairo_font_face_set_user_data()
 * @load_flags: flags to pass to FT_Load_Glyph when loading
 *   glyphs from the font. These flags are OR'ed together with
 *   the flags derived from the #cairo_font_options_t passed
 *   to cairo_scaled_font_create(), so only a few values such
 *   as %FT_LOAD_VERTICAL_LAYOUT, and %FT_LOAD_FORCE_AUTOHINT
 *   are useful. You should not pass any of the flags affecting
 *   the load target, such as %FT_LOAD_TARGET_LIGHT.
 *
 * Creates a new font face for the FreeType font backend from a
 * pre-opened FreeType face. This font can then be used with
 * cairo_set_font_face() or cairo_scaled_font_create(). The
 * #cairo_scaled_font_t returned from cairo_scaled_font_create() is
 * also for the FreeType backend and can be used with functions such
 * as cairo_ft_scaled_font_lock_face(). Note that Cairo may keep a reference
 * to the FT_Face alive in a font-cache and the exact lifetime of the reference
 * depends highly upon the exact usage pattern and is subject to external
 * factors. You must not call FT_Done_Face() before the last reference to the
 * #cairo_font_face_t has been dropped.
 *
 * As an example, below is how one might correctly couple the lifetime of
 * the FreeType face object to the #cairo_font_face_t.
 *
 * <informalexample><programlisting>
 * static const cairo_user_data_key_t key;
 *
 * font_face = cairo_ft_font_face_create_for_ft_face (ft_face, 0);
 * status = cairo_font_face_set_user_data (font_face, &key,
 *                                ft_face, (cairo_destroy_func_t) FT_Done_Face);
 * if (status) {
 *    cairo_font_face_destroy (font_face);
 *    FT_Done_Face (ft_face);
 *    return ERROR;
 * }
 * </programlisting></informalexample>
 *
 * Return value: a newly created #cairo_font_face_t. Free with
 *  cairo_font_face_destroy() when you are done using it.
 *
 * Since: 1.0
 **/
cairo_font_face_t *
cairo_ft_font_face_create_for_ft_face (FT_Face         face,
				       int             load_flags)
{
    cairo_ft_unscaled_font_t *unscaled;
    cairo_font_face_t *font_face;
    cairo_ft_options_t ft_options;
    cairo_status_t status;

    status = _cairo_ft_unscaled_font_create_from_face (face, &unscaled);
    ft_options.load_flags = load_flags;
    ft_options.synth_flags = 0;
    _cairo_font_options_init_default (&ft_options.base);
    font_face = _cairo_ft_font_face_create (unscaled, &ft_options);
    _cairo_unscaled_font_destroy (&unscaled->base);

    return font_face;
}
~~~

- cairo-ft-font.c: rendering methods
~~~ c
/* Fills in val->image with an image surface created from @bitmap
 */
static cairo_status_t
_get_bitmap_surface (FT_Bitmap		     *bitmap,
		     FT_Library		      library,
		     cairo_bool_t	      own_buffer,
		     cairo_font_options_t    *font_options,
		     cairo_image_surface_t  **surface)
  //get the cairo bitmap corresponding to the ft bitmap
  //font_options is used here:
    switch (bitmap->pixel_mode) {
    case FT_PIXEL_MODE_LCD:
    case FT_PIXEL_MODE_LCD_V:
    case FT_PIXEL_MODE_GRAY:
	if (font_options->antialias != CAIRO_ANTIALIAS_SUBPIXEL ||
	    bitmap->pixel_mode == FT_PIXEL_MODE_GRAY)

/* Converts a bitmap (or other) FT_GlyphSlot into an image */
static cairo_status_t
_render_glyph_bitmap (FT_Face		      face,
		      cairo_font_options_t   *font_options,
		      cairo_image_surface_t **surface)
{
    FT_GlyphSlot glyphslot = face->glyph;
    cairo_status_t status; FT_Error error;

    /* According to the FreeType docs, glyphslot->format could be
     * something other than FT_GLYPH_FORMAT_OUTLINE or
     * FT_GLYPH_FORMAT_BITMAP. Calling FT_Render_Glyph gives FreeType
     * the opportunity to convert such to
     * bitmap. FT_GLYPH_FORMAT_COMPOSITE will not be encountered since
     * we avoid the FT_LOAD_NO_RECURSE flag.
     */
    error = FT_Render_Glyph (glyphslot, FT_RENDER_MODE_NORMAL);
    status = _get_bitmap_surface (&glyphslot->bitmap,
				  glyphslot->library,
				  FALSE, font_options,
				  surface);
    /*
     * Note: the font's coordinate system is upside down from ours, so the
     * Y coordinate of the control box needs to be negated.  Moreover, device
     * offsets are position of glyph origin relative to top left while
     * bitmap_left and bitmap_top are offsets of top left relative to origin.
     * Another negation.
     */
    cairo_surface_set_device_offset (&(*surface)->base,
				     -glyphslot->bitmap_left,
				     +glyphslot->bitmap_top);

    return CAIRO_STATUS_SUCCESS;
}

/* Converts an outline FT_GlyphSlot into an image
 *
 * This could go through _render_glyph_bitmap as well, letting
 * FreeType convert the outline to a bitmap, but doing it ourselves
 * has two minor advantages: first, we save a copy of the bitmap
 * buffer: we can directly use the buffer that FreeType renders
 * into.
 *
 * Second, it may help when we add support for subpixel
 * rendering: the Xft code does it this way. (Keith thinks that
 * it may also be possible to get the subpixel rendering with
 * FT_Render_Glyph: something worth looking into in more detail
 * when we add subpixel support. If so, we may want to eliminate
 * this version of the code path entirely.
 */
static cairo_status_t
_render_glyph_outline (FT_Face                    face,
		       cairo_font_options_t	 *font_options,
		       cairo_image_surface_t	**surface)
{
    int rgba = FC_RGBA_UNKNOWN;
    int lcd_filter = FT_LCD_FILTER_LEGACY;
    FT_GlyphSlot glyphslot = face->glyph;
    FT_Outline *outline = &glyphslot->outline;
    FT_Bitmap bitmap;
    FT_BBox cbox;
    unsigned int width, height;
    cairo_status_t status;
    FT_Error error;
    FT_Library library = glyphslot->library;
    FT_Render_Mode render_mode = FT_RENDER_MODE_NORMAL;

    switch (font_options->antialias) {
    case CAIRO_ANTIALIAS_NONE:
	render_mode = FT_RENDER_MODE_MONO;
	break;

    case CAIRO_ANTIALIAS_SUBPIXEL:
    case CAIRO_ANTIALIAS_BEST:
	switch (font_options->subpixel_order) {
	    case CAIRO_SUBPIXEL_ORDER_DEFAULT:
	    case CAIRO_SUBPIXEL_ORDER_RGB:
	    case CAIRO_SUBPIXEL_ORDER_BGR:
		render_mode = FT_RENDER_MODE_LCD;
		break;

	    case CAIRO_SUBPIXEL_ORDER_VRGB:
	    case CAIRO_SUBPIXEL_ORDER_VBGR:
		render_mode = FT_RENDER_MODE_LCD_V;
		break;
	}

	switch (font_options->lcd_filter) {
	case CAIRO_LCD_FILTER_NONE:
	    lcd_filter = FT_LCD_FILTER_NONE;
	    break;
	case CAIRO_LCD_FILTER_DEFAULT:
	case CAIRO_LCD_FILTER_INTRA_PIXEL:
	    lcd_filter = FT_LCD_FILTER_LEGACY;
	    break;
	case CAIRO_LCD_FILTER_FIR3:
	    lcd_filter = FT_LCD_FILTER_LIGHT;
	    break;
	case CAIRO_LCD_FILTER_FIR5:
	    lcd_filter = FT_LCD_FILTER_DEFAULT;
	    break;
	}

	break;

    case CAIRO_ANTIALIAS_DEFAULT:
    case CAIRO_ANTIALIAS_GRAY:
    case CAIRO_ANTIALIAS_GOOD:
    case CAIRO_ANTIALIAS_FAST:
	render_mode = FT_RENDER_MODE_NORMAL;
    }

    FT_Outline_Get_CBox (outline, &cbox);

    cbox.xMin &= -64;
    cbox.yMin &= -64;
    cbox.xMax = (cbox.xMax + 63) & -64;
    cbox.yMax = (cbox.yMax + 63) & -64;

    width = (unsigned int) ((cbox.xMax - cbox.xMin) >> 6);
    height = (unsigned int) ((cbox.yMax - cbox.yMin) >> 6);

    if (width * height == 0) {
	cairo_format_t format;
	/* Looks like fb handles zero-sized images just fine */
	switch (render_mode) {
	case FT_RENDER_MODE_MONO:
	    format = CAIRO_FORMAT_A1;
	    break;
	case FT_RENDER_MODE_LCD:
	case FT_RENDER_MODE_LCD_V:
	    format= CAIRO_FORMAT_ARGB32;
	    break;
	case FT_RENDER_MODE_LIGHT:
	case FT_RENDER_MODE_NORMAL:
	case FT_RENDER_MODE_MAX:
	default:
	    format = CAIRO_FORMAT_A8;
	    break;
	}

	(*surface) = (cairo_image_surface_t *)
	    cairo_image_surface_create_for_data (NULL, format, 0, 0, 0);
	pixman_image_set_component_alpha ((*surface)->pixman_image, TRUE);
	if ((*surface)->base.status)
	    return (*surface)->base.status;
    } else {

	int bitmap_size;

	switch (render_mode) {
	case FT_RENDER_MODE_LCD:
	    if (font_options->subpixel_order == CAIRO_SUBPIXEL_ORDER_BGR)
		rgba = FC_RGBA_BGR;
	    else
		rgba = FC_RGBA_RGB;
	    break;

	case FT_RENDER_MODE_LCD_V:
	    if (font_options->subpixel_order == CAIRO_SUBPIXEL_ORDER_VBGR)
		rgba = FC_RGBA_VBGR;
	    else
		rgba = FC_RGBA_VRGB;
	    break;

	case FT_RENDER_MODE_MONO:
	case FT_RENDER_MODE_LIGHT:
	case FT_RENDER_MODE_NORMAL:
	case FT_RENDER_MODE_MAX:
	default:
	    break;
	}

 #if HAVE_FT_LIBRARY_SETLCDFILTER
	FT_Library_SetLcdFilter (library, lcd_filter);
 #endif

	error = FT_Render_Glyph (face->glyph, render_mode);

 #if HAVE_FT_LIBRARY_SETLCDFILTER
	FT_Library_SetLcdFilter (library, FT_LCD_FILTER_NONE);
 #endif

	if (error)
	    return _cairo_error (_ft_to_cairo_error (error));

	bitmap_size = _compute_xrender_bitmap_size (&bitmap,
						    face->glyph,
						    render_mode);
	if (bitmap_size < 0)
	    return _cairo_error (CAIRO_STATUS_INVALID_FORMAT);

	bitmap.buffer = calloc (1, bitmap_size);
	if (bitmap.buffer == NULL)
		return _cairo_error (CAIRO_STATUS_NO_MEMORY);

	_fill_xrender_bitmap (&bitmap, face->glyph, render_mode,
			      (rgba == FC_RGBA_BGR || rgba == FC_RGBA_VBGR));

	/* Note:
	 * _get_bitmap_surface will free bitmap.buffer if there is an error
	 */
	status = _get_bitmap_surface (&bitmap, NULL, TRUE, font_options, surface);
	if (unlikely (status))
	    return status;

	/* Note: the font's coordinate system is upside down from ours, so the
	 * Y coordinate of the control box needs to be negated.  Moreover, device
	 * offsets are position of glyph origin relative to top left while xMin
	 * and yMax are offsets of top left relative to origin.  Another negation.
	 */
	cairo_surface_set_device_offset (&(*surface)->base,
					 (double)-glyphslot->bitmap_left,
					 (double)+glyphslot->bitmap_top);
    }

    return CAIRO_STATUS_SUCCESS;
}
~~~

Notes: backends, cf cairo.h, cairoint.h
~~~ c
struct _cairo_font_face {
    ...
    const cairo_font_face_backend_t *backend;
};

struct _cairo_font_face_backend {
    cairo_font_type_t	type;

    cairo_warn cairo_status_t
    (*create_for_toy)  (cairo_toy_font_face_t	*toy_face,
			cairo_font_face_t      **font_face);

    /* The destroy() function is allowed to resurrect the font face
     * by re-referencing. This is needed for the FreeType backend.
     */
    cairo_bool_t
    (*destroy)     (void			*font_face);

    cairo_warn cairo_status_t
    (*scaled_font_create) (void				*font_face,
			   const cairo_matrix_t		*font_matrix,
			   const cairo_matrix_t		*ctm,
			   const cairo_font_options_t	*options,
			   cairo_scaled_font_t	       **scaled_font);

    cairo_font_face_t *
    (*get_implementation) (void				*font_face,
			   const cairo_matrix_t		*font_matrix,
			   const cairo_matrix_t		*ctm,
			   const cairo_font_options_t	*options);
};

const cairo_font_face_backend_t _cairo_ft_font_face_backend
    CAIRO_FONT_TYPE_FT,
    _cairo_ft_font_face_create_for_toy,
    _cairo_ft_font_face_destroy,
    _cairo_ft_font_face_scaled_font_create,
    _cairo_ft_font_face_get_implementation
};

struct _cairo_unscaled_font_backend {
    cairo_bool_t (*destroy) (void	*unscaled_font);
};

struct _cairo_scaled_font_backend {
    cairo_font_type_t type;
    ... lots of things // cf cairoint.h
}

static const cairo_scaled_font_backend_t _cairo_ft_scaled_font_backend = {
    CAIRO_FONT_TYPE_FT,
    _cairo_ft_scaled_font_fini,
    _cairo_ft_scaled_glyph_init,
    NULL,			/* text_to_glyphs */
    _cairo_ft_ucs4_to_index,
    _cairo_ft_load_truetype_table,
    _cairo_ft_index_to_ucs4,
    _cairo_ft_is_synthetic,
    _cairo_index_to_glyph_name,
    _cairo_ft_load_type1_data,
    _cairo_ft_has_color_glyphs
};

struct _cairo_surface_backend {
    cairo_surface_type_t type;
    ...
    void (*get_font_options) (void *surface, cairo_font_options_t  *options);
};


static const cairo_surface_backend_t _cairo_xlib_xcb_surface_backend = {
    CAIRO_SURFACE_TYPE_XLIB,
    ...
    _cairo_xlib_xcb_surface_get_font_options,
};

static const cairo_surface_backend_t cairo_xlib_surface_backend = {
    CAIRO_SURFACE_TYPE_XLIB,
    ...
    _cairo_xlib_surface_get_font_options,
};

~~~

Pango
=====

Exemples of pango usage: 
http://roxlu.com/2014/046/rendering-text-with-pango--cairo-and-freetype
https://sites.google.com/site/randomcodecollections/home/python-gtk-3-pango-cairo-example

Allows to layout fonts (ie combine harfbuzz with freetype).
As several backend: direct fontconfig+freetype, xft, cairo

Note: cairo is a drawing engine, has only very simple text to glyph
support: https://cairographics.org/manual/cairo-text.html
    The functions with text in their name form cairo's toy text API. The
    toy API takes UTF-8 encoded text and is limited in its functionality to
    rendering simple left-to-right text with no advanced features. That
    means for example that most complex scripts like Hebrew, Arabic, and
    Indic scripts are out of question. No kerning or correct positioning of
    diacritical marks either. The font selection is pretty limited too and
    doesn't handle the case that the selected font does not cover the
    characters in the text. This set of functions are really that, a toy
    text API, for testing and demonstration purposes. Any serious
    application should avoid them.
    The functions with glyphs in their name form cairo's low-level text
    API. The low-level API relies on the user to convert text to a set of
    glyph indexes and positions. This is a very hard problem and is best
    handled by external libraries, like the pangocairo that is part of the
    Pango text layout and rendering library. Pango is available from
    http://www.pango.org/.

PANGO_SCALE: (cf pango-types.h,
 * The %PANGO_SCALE macro represents the scale between dimensions used
 * for Pango distances and device units. (The definition of device
 * units is dependent on the output device; it will typically be pixels
 * for a screen, and points for a printer.) %PANGO_SCALE is currently
 * 1024, but this may be changed in the future.
 => this explain the 1024 factor in xsettings:Xft/dpi
)

https://developer.gnome.org/pango/stable/
    ├── PangoFont => Represent a font (abstract class)
    │   ╰── PangoFcFont => Subclass for fontconfig based backends
    ├── PangoFontMap => Font map: map font description to real font (abstract class)
    │   ╰── PangoFcFontMap => Subclass for fontconfig based backends

Subclasses of PangoFont: PangoCairoFont
Subclasses of PangoFontMap: PangoCairoFontMap
Subclasses of PangoFcFont: PangoFT2Font, PangoXftFont
Subclasses of PangoFcFontMap: PangoFT2FontMap, PangoXftFontMap
For PangoCairo, the fc backend gives the subclasses PangoCairoFcFont and PangoCairoFcFontMap

Default dpi:
- pangocairo-fcfont.c: dpi = 72 if it is not set by the fcpattern;
- pangocairo-context.c: info->dpi=-1
  /* @dpi: the resolution in "dots per inch". (Physical inches aren't actually
     involved; the terminology is conventional.) A 0 or negative value
     means to use the resolution from the font map. */
- pangocairo-fcfontmap.c: cffontmap->dpi   = 96.0;

- pangofc-fontmap.c: dpi=-1, meaning the dpi is retrieved from pango_fc_font_map_get_resolution
  which calls pango_fc_default_substitute on the pattern 'Sans 10'
  and fallback to 72 if fontconfig did not provide a dpi.
- pangoft2-fontmap.c: fontmap->dpi_x   = 72.0; fontmap->dpi_y   = 72.0;
  Used as a fallback if fontconfig does not provide a dpi:
  ~~~ c
  if (FcPatternGet (pattern, FC_DPI, 0, &v) == FcResultNoMatch)
    FcPatternAddDouble (pattern, FC_DPI, ft2fontmap->dpi_y);
  FcDefaultSubstitute (pattern);
  ~~~

When using the ft2 backend directly (rather than xft or cairo), pango has
the following defaults: antialias=true, hinting=true, hintstyle=hintfull,
autohint=false:
- pangoft2.c: convert a pango font to a ft font face
~~~ c
/**
 * pango_ft2_font_get_face:
 * @font: a #PangoFont
 *
 * Returns the native FreeType2 <type>FT_Face</type> structure used for this #PangoFont.
 * This may be useful if you want to use FreeType2 functions directly.
 *
 * Use pango_fc_font_lock_face() instead; when you are done with a
 * face from pango_fc_font_lock_face() you must call
 * pango_fc_font_unlock_face().
 *
 * Return value: (nullable): a pointer to a <type>FT_Face</type>
 *               structure, with the size set correctly, or %NULL if
 *               @font is %NULL.
 **/
FT_Face
pango_ft2_font_get_face (PangoFont *font)
{
  PangoFT2Font *ft2font = (PangoFT2Font *)font;
  PangoFcFont *fcfont = (PangoFcFont *)font;
  FT_Error error;
  FcPattern *pattern;
  FcChar8 *filename;
  FcBool antialias, hinting, autohint;
  int hintstyle;
  int id;

  if (G_UNLIKELY (!font))
    return NULL;

  pattern = fcfont->font_pattern;

  if (!ft2font->face)
    {
      ft2font->load_flags = 0;

      /* disable antialiasing if requested */
      if (FcPatternGetBool (pattern,
			    FC_ANTIALIAS, 0, &antialias) != FcResultMatch)
	antialias = FcTrue;

      if (antialias)
	ft2font->load_flags |= FT_LOAD_NO_BITMAP;
      else
	ft2font->load_flags |= FT_LOAD_TARGET_MONO;

      /* disable hinting if requested */
      if (FcPatternGetBool (pattern,
			    FC_HINTING, 0, &hinting) != FcResultMatch)
	hinting = FcTrue;

 #ifdef FC_HINT_STYLE
      if (FcPatternGetInteger (pattern, FC_HINT_STYLE, 0, &hintstyle) != FcResultMatch)
	hintstyle = FC_HINT_FULL;

      if (!hinting || hintstyle == FC_HINT_NONE)
          ft2font->load_flags |= FT_LOAD_NO_HINTING;
      
      switch (hintstyle) {
      case FC_HINT_SLIGHT:
      case FC_HINT_MEDIUM:
	ft2font->load_flags |= FT_LOAD_TARGET_LIGHT;
	break;
      default:
	ft2font->load_flags |= FT_LOAD_TARGET_NORMAL;
	break;
      }
 #else
      if (!hinting)
          ft2font->load_flags |= FT_LOAD_NO_HINTING;
 #endif

      /* force autohinting if requested */
      if (FcPatternGetBool (pattern,
			    FC_AUTOHINT, 0, &autohint) != FcResultMatch)
	autohint = FcFalse;

      if (autohint)
	ft2font->load_flags |= FT_LOAD_FORCE_AUTOHINT;

      if (FcPatternGetString (pattern, FC_FILE, 0, &filename) != FcResultMatch)
	      goto bail0;

      if (FcPatternGetInteger (pattern, FC_INDEX, 0, &id) != FcResultMatch)
	      goto bail0;

      error = FT_New_Face (_pango_ft2_font_map_get_library (fcfont->fontmap),
			   (char *) filename, id, &ft2font->face);
      if (error != FT_Err_Ok)
	{
	bail0:
	  load_fallback_face (ft2font, (char *) filename);
	}

      g_assert (ft2font->face);

      set_transform (ft2font);

      error = FT_Set_Char_Size (ft2font->face,
				PANGO_PIXELS_26_6 (ft2font->size),
				PANGO_PIXELS_26_6 (ft2font->size),
				0, 0);
      if (error)
	g_warning ("Error in FT_Set_Char_Size: %d", error);
    }

  return ft2font->face;
}
G_DEFINE_TYPE (PangoFT2Font, pango_ft2_font, PANGO_TYPE_FC_FONT)

static void
pango_ft2_font_init (PangoFT2Font *ft2font)
{
  ft2font->face = NULL;
  ft2font->size = 0;
  ft2font->glyph_info = g_hash_table_new (NULL, NULL);
}
~~~

Gnome Settings Daemon
=====================

From the source code: gsd-xsettings-manager.c we get:
- gsd-xsettings-manager 'manager' is the gnome-settings-daemon plugin that handle xsettings
- manager->priv->manager est le xsettings-daemon (de xsettings-manager.c)
- dans 'gnome_xsettings_manager_start' le code spécifie les valeurs de
  manager->priv->manager suivant les gsettings via TranslationEntry
  translations (+ des settings fixes via FixedEntry fixed_entries)
- les settings xft sont gérés par
        /* Xft settings */
        update_xft_settings (manager);
  qui fait
        xft_settings_get (manager, &settings);
        xft_settings_set_xsettings (manager, &settings);
        xft_settings_set_xresources (&settings);
  et xft_settings_set_xsettings règle les clés suivantes:
        xsettings_manager_set_int (manager->priv->manager, "Xft/Antialias", settings->antialias);
        xsettings_manager_set_int (manager->priv->manager, "Xft/Hinting", settings->hinting);
        xsettings_manager_set_string (manager->priv->manager, "Xft/HintStyle", settings->hintstyle);
        xsettings_manager_set_int (manager->priv->manager, "Gdk/WindowScalingFactor", settings->window_scale);
        xsettings_manager_set_int (manager->priv->manager, "Gdk/UnscaledDPI", settings->dpi);
        xsettings_manager_set_int (manager->priv->manager, "Xft/DPI", settings->scaled_dpi);
        xsettings_manager_set_string (manager->priv->manager, "Xft/RGBA", settings->rgba);
        xsettings_manager_set_int (manager->priv->manager, "Gtk/CursorThemeSize", settings->cursor_size);
        xsettings_manager_set_string (manager->priv->manager, "Gtk/CursorThemeName", settings->cursor_theme);

  [Note que  scaled_dpi et cursor_size sont scalés par window_scale:
   ~~~
        dpi = get_dpi_from_gsettings (manager);
        settings->scaled_dpi = dpi * settings->window_scale * 1024;
        cursor_size = g_settings_get_int (interface_settings, CURSOR_SIZE_KEY);
        settings->cursor_size = cursor_size * settings->window_scale;
   et get_dpi_from_gsettings => DPI_FALLBACK * factor, où
        factor = g_settings_get_double (interface_settings, TEXT_SCALING_FACTOR_KEY);
        et #define DPI_FALLBACK 96
   et settings->window_scale est mis par get_window_scale qui récupère le
   window scaling actif de la session (ie Gdk/WindowScalingFactor)
    ~~~
  => donc Xft.dpi est 1024 * 96 * org.gnome.desktop.interface/text-scaling-factor * Gdk/WindowScalingFactor,
     Gdk/UnscaledDPI est 1024 * 96 * org.gnome.desktop.interface/text-scaling-factor et
     cursor_size est org.gnome.desktop.interface/cursor-size * Gdk/WindowScalingFactor]

- puis les overrides sont activés:
        overrides = g_settings_get_value (manager->priv->plugin_settings, XSETTINGS_OVERRIDE_KEY);
        xsettings_manager_set_overrides (manager->priv->manager, overrides);
- et des callbacks sont réglés en cas de mise à jour des settings:
  - Pour manager->priv->settings: xsettings-callback  qui appelle xft_callback si key=TEXT_SCALING_FACTOR_KEY || CURSOR_SIZE_KEY || CURSOR_THEME_KEY
  xft_callback qui fait juste un update_xft_settings;
  et sinon utilise les TranslationEntry translations.
  - Pour manager->priv->plugin_settings: plugin_callback qui fait
        if (g_str_equal (key, GTK_MODULES_DISABLED_KEY) || g_str_equal (key, GTK_MODULES_ENABLED_KEY)) {
                /* Do nothing, as GsdXsettingsGtk will handle it */
        } else if (g_str_equal (key, XSETTINGS_OVERRIDE_KEY)) {
                override_callback (settings, key, manager);
                => xsettings_manager_set_overrides (manager->priv->manager, value);
        } else {
                xft_callback (settings, key, manager);
        }
  - Pour manager->priv->gtk: gtk_modules_callback qui gère Gtk/Modules
    => xsettings_manager_set_string (manager->priv->manager, "Gtk/Modules", modules);


- gdk: parse les xsettings (mis dans `x11_screen->xsettings`)
  et les transforme en gtk-* settings
  Gdk/WindowScalingFactor et Gdk/UnscaledDPI ne sont pas exportés en gtk-*
  settings, par contre ils sont lus depuis le xsetting par gdk. Or
  gnome-settings-daemon met le UnscaledDPI à 1024*96*text-scaling-factor et
  lit le WindowScalingFactor via le scaling associé à x11 (qui est géré par
  gdk), donc en fait il y a une boucle de rétroaction :)

- gnome-settings-daemon/plugins/xsettings/gsd-xsettings-manager.c:
~~~ c
 #define MOUSE_SETTINGS_SCHEMA     "org.gnome.settings-daemon.peripherals.mouse"
 #define BACKGROUND_SETTINGS_SCHEMA "org.gnome.desktop.background"
 #define INTERFACE_SETTINGS_SCHEMA "org.gnome.desktop.interface"
 #define SOUND_SETTINGS_SCHEMA     "org.gnome.desktop.sound"
 #define PRIVACY_SETTINGS_SCHEMA     "org.gnome.desktop.privacy"
 #define WM_SETTINGS_SCHEMA        "org.gnome.desktop.wm.preferences"
 #define A11Y_SCHEMA               "org.gnome.desktop.a11y"
 #define CLASSIC_WM_SETTINGS_SCHEMA "org.gnome.shell.extensions.classic-overrides"

 #define XSETTINGS_PLUGIN_SCHEMA "org.gnome.settings-daemon.plugins.xsettings"
 #define XSETTINGS_OVERRIDE_KEY  "overrides"

 #define GTK_MODULES_DISABLED_KEY "disabled-gtk-modules"
 #define GTK_MODULES_ENABLED_KEY  "enabled-gtk-modules"

 #define TEXT_SCALING_FACTOR_KEY "text-scaling-factor"
 #define CURSOR_SIZE_KEY "cursor-size"
 #define CURSOR_THEME_KEY "cursor-theme"

 #define FONT_ANTIALIASING_KEY "antialiasing"
 #define FONT_HINTING_KEY      "hinting"
 #define FONT_RGBA_ORDER_KEY   "rgba-order"

 #define DPI_FALLBACK 96
 /* The minimum resolution at which we turn on a window-scale of 2 */
 #define HIDPI_LIMIT (DPI_FALLBACK * 2)
 /* The minimum screen height at which we turn on a window-scale of 2;
  * below this there just isn't enough vertical real estate for GNOME
  * apps to work, and it's better to just be tiny */
 #define HIDPI_MIN_HEIGHT 1200
/* => these looks like the window-scaling factor = 2 is automatic
   but this is used nowhere else in the code (nor in gtk)
   although the page https://wiki.gnome.org/HowDoI/HiDpi states:
   GNOME currently enables hi-dpi support when the screen resolution is at
   least 192 dpi and the screen height (in device pixels) is at least 1200.
   Maybe in the mutter code? */

gnome_xsettings_manager_start (GnomeXSettingsManager *manager, ...)
  manager->priv->manager = xsettings_manager_new ...
        g_hash_table_insert (manager->priv->settings, MOUSE_SETTINGS_SCHEMA, g_settings_new (MOUSE_SETTINGS_SCHEMA));
        g_hash_table_insert (manager->priv->settings, BACKGROUND_SETTINGS_SCHEMA, g_settings_new (BACKGROUND_SETTINGS_SCHEMA));
        g_hash_table_insert (manager->priv->settings, INTERFACE_SETTINGS_SCHEMA, g_settings_new (INTERFACE_SETTINGS_SCHEMA));
        g_hash_table_insert (manager->priv->settings, SOUND_SETTINGS_SCHEMA, g_settings_new (SOUND_SETTINGS_SCHEMA));
        g_hash_table_insert (manager->priv->settings, PRIVACY_SETTINGS_SCHEMA, g_settings_new (PRIVACY_SETTINGS_SCHEMA));
        g_hash_table_insert (manager->priv->settings, WM_SETTINGS_SCHEMA, g_settings_new (WM_SETTINGS_SCHEMA));
        g_hash_table_insert (manager->priv->settings, A11Y_SCHEMA, g_settings_new (A11Y_SCHEMA));
  manager->priv->plugin_settings = g_settings_new (XSETTINGS_PLUGIN_SCHEMA);
  // + mais à jour les xsettings suivant les translation entries:
         settings = g_hash_table_lookup (manager->priv->settings,
                                         translations[i].gsettings_schema);
         val = g_settings_get_value (settings, translations[i].gsettings_key);


/* ce sont les gtksettings deprecated ù/
static FixedEntry fixed_entries [] = {
        { "Gtk/MenuImages",          fixed_false_int },
        { "Gtk/ButtonImages",        fixed_false_int },
        { "Gtk/ShowInputMethodMenu", fixed_false_int },
        { "Gtk/ShowUnicodeMenu",     fixed_false_int },
        { "Gtk/AutoMnemonics",       fixed_true_int },
        { "Gtk/DialogsUseHeader",    fixed_true_int },
        { "Gtk/SessionBusId",        fixed_bus_id },
        { "Gtk/ColorPalette",        fixed_string,      { .str = DEFAULT_COLOR_PALETTE } },
        { "Net/FallbackIconTheme",   fixed_string,      { .str = "gnome" } },
        { "Gtk/ToolbarStyle",        fixed_string,      { .str =  "both-horiz" } },
        { "Gtk/ToolbarIconSize",     fixed_string,      { .str = "large" } },
        { "Gtk/CanChangeAccels",     fixed_false_int },
        { "Gtk/TimeoutInitial",      fixed_int,         { .num = 200 } },
        { "Gtk/TimeoutRepeat",       fixed_int,         { .num = 20 } },
        { "Gtk/ColorScheme",         fixed_string,      { .str = "" } },
        { "Gtk/IMPreeditStyle",      fixed_string,      { .str = "callback" } },
        { "Gtk/IMStatusStyle",       fixed_string,      { .str = "callback" } },
        { "Gtk/MenuBarAccel",        fixed_string,      { .str = "F10" } }
};

static TranslationEntry translations [] = {
        { "org.gnome.settings-daemon.peripherals.mouse", "double-click",   "Net/DoubleClickTime",  translate_int_int },
        { "org.gnome.settings-daemon.peripherals.mouse", "drag-threshold", "Net/DndDragThreshold", translate_int_int },

        { "org.gnome.desktop.background", "show-desktop-icons",    "Gtk/ShellShowsDesktop",   translate_bool_int },

        { "org.gnome.desktop.interface", "font-name",              "Gtk/FontName",            translate_string_string },
        { "org.gnome.desktop.interface", "gtk-key-theme",          "Gtk/KeyThemeName",        translate_string_string },
        { "org.gnome.desktop.interface", "cursor-blink",           "Net/CursorBlink",         translate_bool_int },
        { "org.gnome.desktop.interface", "cursor-blink-time",      "Net/CursorBlinkTime",     translate_int_int },
        { "org.gnome.desktop.interface", "cursor-blink-timeout",   "Gtk/CursorBlinkTimeout",  translate_int_int },
        { "org.gnome.desktop.interface", "gtk-theme",              "Net/ThemeName",           translate_string_string },
        { "org.gnome.desktop.interface", "gtk-im-module",          "Gtk/IMModule",            translate_string_string },
        { "org.gnome.desktop.interface", "icon-theme",             "Net/IconThemeName",       translate_string_string },
        { "org.gnome.desktop.interface", "cursor-theme",           "Gtk/CursorThemeName",     translate_string_string },
        { "org.gnome.desktop.interface", "gtk-enable-primary-paste", "Gtk/EnablePrimaryPaste", translate_bool_int },
        /* cursor-size is handled via the Xft side as it needs the scaling factor */

        { "org.gnome.desktop.sound", "theme-name",                 "Net/SoundThemeName",            translate_string_string },
        { "org.gnome.desktop.sound", "event-sounds",               "Net/EnableEventSounds" ,        translate_bool_int },
        { "org.gnome.desktop.sound", "input-feedback-sounds",      "Net/EnableInputFeedbackSounds", translate_bool_int },

        { "org.gnome.desktop.privacy", "recent-files-max-age",      "Gtk/RecentFilesMaxAge", translate_int_int },
        { "org.gnome.desktop.privacy", "remember-recent-files",    "Gtk/RecentFilesEnabled", translate_bool_int },
        { "org.gnome.desktop.wm.preferences", "button-layout",     "Gtk/DecorationLayout", translate_button_layout },
        { "org.gnome.desktop.wm.preferences", "action-double-click-titlebar",  "Gtk/TitlebarDoubleClick",     translate_string_string },
        { "org.gnome.desktop.wm.preferences", "action-middle-click-titlebar",  "Gtk/TitlebarMiddleClick",     translate_string_string },
        { "org.gnome.desktop.wm.preferences", "action-right-click-titlebar",  "Gtk/TitlebarRightClick",     translate_string_string },
        { "org.gnome.desktop.a11y", "always-show-text-caret",       "Gtk/KeynavUseCaret",         translate_bool_int }
};

// Note: Gtk/Modules is handled in gtk_modules_callback,
// Fontconfig/Timestamp in fontconfig_callback
/* Et enfin les réglages xft sont réglés par xft_settings_set_xsettings:
 * Xft/Antialias => org.gnome.settings-daemon.plugins.xsettings.antialiasing
 * Xft/Hinting+Xft/HintStyle => org.gnome.settings-daemon.plugins.xsettings.hinting
 * Xft/RGBA => org.gnome.settings-daemon.plugins.xsettings.rgba-order
 * Gdk/UnscaledDPI, Xft/DPI => org.gnome.desktop.interface.text-scaling-factor
 * Gdk/WindowScalingFactor => autodetect,
 * Gtk/CursorThemeSize, org.gnome.desktop.interface.cursor-size
 * Gtk/CursorThemeName, org.gnome.desktop.interface.cursor-theme */

static double
get_dpi_from_gsettings (GnomeXSettingsManager *manager)
{
	GSettings  *interface_settings;
        double      dpi; double      factor;
	interface_settings = g_hash_table_lookup (manager->priv->settings, INTERFACE_SETTINGS_SCHEMA);
        factor = g_settings_get_double (interface_settings, TEXT_SCALING_FACTOR_KEY);
	dpi = DPI_FALLBACK;
        return dpi * factor;
}

static int
get_window_scale (GnomeXSettingsManager *manager)
  ... en résumé se connecte via dbus à Mutter.DisplayConfig, itère les
  logical_monitors jusqu'à trouver le primary, et renvoie le
  logical_monitor_scale, avec fallback sur 1

/* Read GSettings and determine the appropriate Xft settings based on them. */
static void
xft_settings_get (GnomeXSettingsManager *manager,
                  GnomeXftSettings      *settings)
{
	GSettings  *interface_settings;
        GsdFontAntialiasingMode antialiasing; //an enum with GSD_FONT_ANTIALIASING_MODE_NONE...
        GsdFontHinting hinting;
        GsdFontRgbaOrder order;
        gboolean use_rgba = FALSE;
        double dpi;
        int cursor_size;

	interface_settings = g_hash_table_lookup (manager->priv->settings, INTERFACE_SETTINGS_SCHEMA);

        /* Rappels: https://developer.gnome.org/gio/stable/GSettings.html#g-settings-get-enum
         * g_settings_get_enum (GSettings *settings,
                     const gchar *key);
         Gets the value that is stored in settings for key and converts it
         to the enum value that it represents. In order to use this
         function the type of the value must be a string and it must be
         marked in the schema file as an enumerated type. It is a
         programmer error to give a key that isn't contained in the schema
         for settings or is not marked as an enumerated type. If the value
         stored in the configuration database is not a valid value for the
         enumerated type then this function will return the default value.
        */

        antialiasing = g_settings_get_enum (manager->priv->plugin_settings, FONT_ANTIALIASING_KEY);
        hinting = g_settings_get_enum (manager->priv->plugin_settings, FONT_HINTING_KEY);
        order = g_settings_get_enum (manager->priv->plugin_settings, FONT_RGBA_ORDER_KEY);

        settings->antialias = (antialiasing != GSD_FONT_ANTIALIASING_MODE_NONE);
        settings->hinting = (hinting != GSD_FONT_HINTING_NONE);
        settings->window_scale = get_window_scale (manager);
        dpi = get_dpi_from_gsettings (manager);
        settings->dpi = dpi * 1024; /* Xft wants 1/1024ths of an inch */
        settings->scaled_dpi = dpi * settings->window_scale * 1024;
        cursor_size = g_settings_get_int (interface_settings, CURSOR_SIZE_KEY);
        settings->cursor_size = cursor_size * settings->window_scale;
        settings->cursor_theme = g_settings_get_string (interface_settings, CURSOR_THEME_KEY);
        settings->rgba = "rgb";
        settings->hintstyle = "hintfull"; //Note: in the gsettings schema the default is "hintslight"

        switch (hinting) {
        case GSD_FONT_HINTING_NONE:
                settings->hintstyle = "hintnone";
                break;
        case GSD_FONT_HINTING_SLIGHT:
                settings->hintstyle = "hintslight";
                break;
        case GSD_FONT_HINTING_MEDIUM:
                settings->hintstyle = "hintmedium";
                break;
        case GSD_FONT_HINTING_FULL:
                settings->hintstyle = "hintfull";
                break;
        }

        switch (order) {
        case GSD_FONT_RGBA_ORDER_RGBA:
                settings->rgba = "rgba";
                break;
        case GSD_FONT_RGBA_ORDER_RGB:
                settings->rgba = "rgb";
                break;
        case GSD_FONT_RGBA_ORDER_BGR:
                settings->rgba = "bgr";
                break;
        case GSD_FONT_RGBA_ORDER_VRGB:
                settings->rgba = "vrgb";
                break;
        case GSD_FONT_RGBA_ORDER_VBGR:
                settings->rgba = "vbgr";
                break;
        }

        switch (antialiasing) {
        case GSD_FONT_ANTIALIASING_MODE_NONE:
                settings->antialias = 0;
                break;
        case GSD_FONT_ANTIALIASING_MODE_GRAYSCALE:
                settings->antialias = 1;
                break;
        case GSD_FONT_ANTIALIASING_MODE_RGBA:
                settings->antialias = 1;
                use_rgba = TRUE;
        }

        if (!use_rgba) {
                settings->rgba = "none";
        }
}

static void
xft_settings_set_xsettings (GnomeXSettingsManager *manager,
                            GnomeXftSettings      *settings)
{
        gnome_settings_profile_start (NULL);

        xsettings_manager_set_int (manager->priv->manager, "Xft/Antialias", settings->antialias);
        xsettings_manager_set_int (manager->priv->manager, "Xft/Hinting", settings->hinting);
        xsettings_manager_set_string (manager->priv->manager, "Xft/HintStyle", settings->hintstyle);
        xsettings_manager_set_int (manager->priv->manager, "Gdk/WindowScalingFactor", settings->window_scale);
        xsettings_manager_set_int (manager->priv->manager, "Gdk/UnscaledDPI", settings->dpi);
        xsettings_manager_set_int (manager->priv->manager, "Xft/DPI", settings->scaled_dpi);
        xsettings_manager_set_string (manager->priv->manager, "Xft/RGBA", settings->rgba);
        xsettings_manager_set_int (manager->priv->manager, "Gtk/CursorThemeSize", settings->cursor_size);
        xsettings_manager_set_string (manager->priv->manager, "Gtk/CursorThemeName", settings->cursor_theme);

        gnome_settings_profile_end (NULL);
}

static void
xft_settings_set_xresources (GnomeXftSettings *settings)
  ...
        update_property (add_string, "Xft.dpi",
                                g_ascii_dtostr (dpibuf, sizeof (dpibuf), (double) settings->scaled_dpi / 1024.0));
        update_property (add_string, "Xft.antialias",
                                settings->antialias ? "1" : "0");
        update_property (add_string, "Xft.hinting",
                                settings->hinting ? "1" : "0");
        update_property (add_string, "Xft.hintstyle",
                                settings->hintstyle);
        update_property (add_string, "Xft.rgba",
                                settings->rgba);
        update_property (add_string, "Xcursor.size",
                                g_ascii_dtostr (dpibuf, sizeof (dpibuf), (double) settings->cursor_size));
        update_property (add_string, "Xcursor.theme",
                                settings->cursor_theme);
~~~

# Gdk/Gtk

- cf gdk_settings_map pour la conversion Xsettings => gtksettings
- gtk-xft-dpi vaut gdk-unscaled-dpi=Gdk/UnscaledDPI si il existe, et sinon Xft/DPI (attention, il y a un facteur 1024, ie par défaut c'est 96*1024):
  ~~~ gdk/x11/xsettings-client.c
    if (!x11_screen->fixed_window_scale &&
        gdk_display_get_setting (display, "gdk-window-scaling-factor", &value))
      _gdk_x11_screen_set_window_scale (x11_screen, g_value_get_int (&value));
  ~~~
- Gdk/WindowScalingFactor est overridé par la variable d'environnement
  GDK_SCALE, si elle existe. (Et dans ce cas x11_screen->fixed_window_scale
  vaut TRUE)

~~~ gtk/gdk/x11/gdksettings.c
// Used by gdk_from_xsettings_name (const char *xname)
static const struct {
  const char *xname, *gdkname;
} gdk_settings_map[] = {
  {"Net/DoubleClickTime",     "gtk-double-click-time"},
  {"Net/DoubleClickDistance", "gtk-double-click-distance"},
  {"Net/DndDragThreshold",    "gtk-dnd-drag-threshold"},
  {"Net/CursorBlink",         "gtk-cursor-blink"},
  {"Net/CursorBlinkTime",     "gtk-cursor-blink-time"},
  {"Net/ThemeName",           "gtk-theme-name"},
  {"Net/IconThemeName",       "gtk-icon-theme-name"},
  {"Gtk/ColorPalette",        "gtk-color-palette"},
  {"Gtk/FontName",            "gtk-font-name"},
  {"Gtk/KeyThemeName",        "gtk-key-theme-name"},
  {"Gtk/Modules",             "gtk-modules"},
  {"Gtk/ButtonImages",        "gtk-button-images"},
  {"Gtk/MenuImages",          "gtk-menu-images"},
  {"Gtk/CursorThemeName",     "gtk-cursor-theme-name"},
  {"Gtk/CursorThemeSize",     "gtk-cursor-theme-size"},
  {"Gtk/ColorScheme",         "gtk-color-scheme"},
  {"Gtk/EnableAnimations",    "gtk-enable-animations"},
  {"Xft/Antialias",           "gtk-xft-antialias"},
  {"Xft/Hinting",             "gtk-xft-hinting"},
  {"Xft/HintStyle",           "gtk-xft-hintstyle"},
  {"Xft/RGBA",                "gtk-xft-rgba"},
  {"Xft/DPI",                 "gtk-xft-dpi"},
  {"Gtk/EnableAccels",        "gtk-enable-accels"},
  {"Gtk/ScrolledWindowPlacement", "gtk-scrolled-window-placement"},
  {"Gtk/IMModule",            "gtk-im-module"},
  {"Fontconfig/Timestamp",    "gtk-fontconfig-timestamp"},
  {"Net/SoundThemeName",      "gtk-sound-theme-name"},
  {"Net/EnableInputFeedbackSounds", "gtk-enable-input-feedback-sounds"},
  {"Net/EnableEventSounds",   "gtk-enable-event-sounds"},
  {"Gtk/CursorBlinkTimeout",  "gtk-cursor-blink-timeout"},
  {"Gtk/ShellShowsAppMenu",   "gtk-shell-shows-app-menu"},
  {"Gtk/ShellShowsMenubar",   "gtk-shell-shows-menubar"},
  {"Gtk/ShellShowsDesktop",   "gtk-shell-shows-desktop"},
  {"Gtk/SessionBusId",        "gtk-session-bus-id"},
  {"Gtk/DecorationLayout",    "gtk-decoration-layout"},
  {"Gtk/TitlebarDoubleClick", "gtk-titlebar-double-click"},
  {"Gtk/TitlebarMiddleClick", "gtk-titlebar-middle-click"},
  {"Gtk/TitlebarRightClick", "gtk-titlebar-right-click"},
  {"Gtk/DialogsUseHeader",    "gtk-dialogs-use-header"},
  {"Gtk/EnablePrimaryPaste",  "gtk-enable-primary-paste"},
  {"Gtk/PrimaryButtonWarpsSlider", "gtk-primary-button-warps-slider"},
  {"Gtk/RecentFilesMaxAge",   "gtk-recent-files-max-age"},
  {"Gtk/RecentFilesEnabled",  "gtk-recent-files-enabled"},
  {"Gtk/KeynavUseCaret",      "gtk-keynav-use-caret"},

  /* These are here in order to be recognized, but are not sent to
     gtk as they are handled internally by gdk: */
  {"Gdk/WindowScalingFactor", "gdk-window-scaling-factor"},
  {"Gdk/UnscaledDPI",         "gdk-unscaled-dpi"}
};
~~~

~~~ gtk/gdk/x11/xsettings-client.c
static void
read_settings (GdkX11Screen *x11_screen,
               gboolean      do_notify)
  ...
  if (x11_screen->xsettings_manager_window != 0)
    {
	    x11_screen->xsettings = parse_settings (data, n_items);
	    où parse_settings utilise gdk_from_xsettings_name pour
	    convertir les infos xsettings en infos gtk
    }


  /* Since we support scaling we look at the specific Gdk/UnscaledDPI
     setting if it exists and use that instead of Xft/DPI if it is set */
  if (x11_screen->xsettings && !x11_screen->fixed_window_scale)
    {
      setting = g_hash_table_lookup (x11_screen->xsettings, "gdk-unscaled-dpi");
      if (setting)
	{
	  copy = g_new0 (GValue, 1);
	  g_value_init (copy, G_VALUE_TYPE (setting));
	  g_value_copy (setting, copy);
	  g_hash_table_insert (x11_screen->xsettings, 
			       (gpointer) "gtk-xft-dpi", copy);
	}
    }
  ...
  if (!x11_screen->fixed_window_scale &&
      gdk_display_get_setting (display, "gdk-window-scaling-factor", &value))
    _gdk_x11_screen_set_window_scale (x11_screen, g_value_get_int (&value));
  // => met le scaling factor à gdk-window-scaling-factor sauf si il est
  // déjà spécifié (via GDK_SCALE)
~~~

~~~ gdkscreen-x11.c
GdkX11Screen *
_gdk_x11_screen_new (GdkDisplay *display,
		     gint	 screen_number,
                     gboolean    setup_display)
  ...
  scale_str = g_getenv ("GDK_SCALE");
  if (scale_str)
    {
      x11_screen->fixed_window_scale = TRUE;
      x11_screen->window_scale = atol (scale_str);
      if (x11_screen->window_scale == 0)
        x11_screen->window_scale = 1;
    }
  else
    x11_screen->window_scale = 1;
}

void
_gdk_x11_screen_set_window_scale (GdkX11Screen *x11_screen,
				  gint          scale)
{
  GdkX11Display *x11_display = GDK_X11_DISPLAY (x11_screen->display);
  if (x11_screen->window_scale == scale)
    return;
  x11_screen->window_scale = scale;
  toplevels = gdk_x11_display_get_toplevel_windows (x11_screen->display);
  for (l = toplevels; l != NULL; l = l->next)
    {
      GdkWindow *window = l->data;

      _gdk_x11_window_set_window_scale (window, scale);
    }
  for (i = 0; i < x11_display->monitors->len; i++)
    {
      GdkMonitor *monitor = GDK_MONITOR (x11_display->monitors->pdata[i]);

      gdk_monitor_set_scale_factor (monitor, scale);
    }
}
~~~

~~~ gtksettings.c
/**
 * SECTION:gtksettings
 * @Short_description: Sharing settings between applications
 * @Title: Settings
 *
 * GtkSettings provide a mechanism to share global settings between
 * applications.
 *
 * On the X window system, this sharing is realized by an
 * [XSettings](http://www.freedesktop.org/wiki/Specifications/xsettings-spec)
 * manager that is usually part of the desktop environment, along with
 * utilities that let the user change these settings. In the absence of
 * an Xsettings manager, GTK+ reads default values for settings from
 * `settings.ini` files in
 * `/etc/gtk-4.0`, `$XDG_CONFIG_DIRS/gtk-4.0`
 * and `$XDG_CONFIG_HOME/gtk-4.0`.
 * These files must be valid key files (see #GKeyFile), and have
 * a section called Settings. Themes can also provide default values
 * for settings by installing a `settings.ini` file
 * next to their `gtk.css` file.
 *
 * Applications can override system-wide settings by setting the property
 * of the GtkSettings object with g_object_set(). This should be restricted
 * to special cases though; GtkSettings are not meant as an application
 * configuration facility. When doing so, you need to be aware that settings
 * that are specific to individual widgets may not be available before the
 * widget type has been realized at least once. The following example
 * demonstrates a way to do this:
 * |[<!-- language="C" -->
 *   gtk_init ();
 *
 *   // make sure the type is realized
 *   g_type_class_unref (g_type_class_ref (GTK_TYPE_BUTTON));
 *
 *   g_object_set (gtk_settings_get_default (), "gtk-enable-animations", FALSE, NULL);
 * ]|
 *
 * There is one GtkSettings instance per display. It can be obtained with
 * gtk_settings_get_for_display(), but in many cases, it is more convenient
 * to use gtk_widget_get_settings(). gtk_settings_get_default() returns the
 * GtkSettings instance for the default display.
 */
~~~

Chromium
========

Cf https://bugs.chromium.org/p/chromium/issues/detail?id=26354
   https://bugs.chromium.org/p/chromium/issues/detail?id=484400
   https://bugs.chromium.org/p/chromium/issues/detail?id=485183

https://cs.chromium.org/chromium/src/chrome/browser/ui/libgtkui/gtk_ui.cc?l=1127

~~~ c++
float GtkUi::GetRawDeviceScaleFactor() {
  if (display::Display::HasForceDeviceScaleFactor())
    return display::Display::GetForcedDeviceScaleFactor();

 #if GTK_MAJOR_VERSION == 2
  GtkSettings* gtk_settings = gtk_settings_get_default();
  gint gtk_dpi = -1;
  g_object_get(gtk_settings, "gtk-xft-dpi", &gtk_dpi, nullptr);
  const float scale_factor = gtk_dpi / (1024 * kDefaultDPI);
 #else
  GdkScreen* screen = gdk_screen_get_default();
  gint scale = gtk_widget_get_scale_factor(fake_window_);
  //NdDams: Gdk/WindowScale
  DCHECK_GT(scale, 0);
  gdouble resolution = gdk_screen_get_resolution(screen);
  //Doc gnome: the resolution for font handling on the screen. This is a scale
  //  factor between points specified in a PangoFontDescription and cairo
  //  units. The default value is 96, meaning that a 10 point font will be
  //  13 units high. (NdDams: ie gtk-xft-dpi/1024)
  const float scale_factor =
      resolution <= 0 ? scale : resolution * scale / kDefaultDPI;
 #endif

  // Blacklist scaling factors <120% (crbug.com/484400) and round
  // to 1 decimal to prevent rendering problems (crbug.com/485183).
  return scale_factor < 1.2f ? 1.0f : roundf(scale_factor * 10) / 10;
}
~~~

https://cs.chromium.org/chromium/src/ui/views/widget/desktop_aura/desktop_screen_x11.cc
~~~ c++
double GetDeviceScaleFactor() {
  float device_scale_factor = 1.0f;
  if (views::LinuxUI::instance()) {
    device_scale_factor =
      views::LinuxUI::instance()->GetDeviceScaleFactor();
  } else if (display::Display::HasForceDeviceScaleFactor()) {
    device_scale_factor = display::Display::GetForcedDeviceScaleFactor();
  }
  return device_scale_factor;
}

gfx::Point PixelToDIPPoint(const gfx::Point& pixel_point) {
  return gfx::ScaleToFlooredPoint(pixel_point, 1.0f / GetDeviceScaleFactor());
}

gfx::Point DIPToPixelPoint(const gfx::Point& dip_point) {
  return gfx::ScaleToFlooredPoint(dip_point, GetDeviceScaleFactor());
}
~~~

Firefox
=======

https://bugzilla.mozilla.org/show_bug.cgi?id=537890 "Implement new DPI system"
http://robert.ocallahan.org/2010/01/css-absolute-length-units_12.html
http://robert.ocallahan.org/2010/08/css-units-changes-landed_20.html
Thread: http://lists.w3.org/Archives/Public/www-style/2010Jan/0058.html
https://developer.mozilla.org/en-US/docs/Web/CSS/length (mozmm removed in
firefox 59)

https://github.com/mozilla/gecko-dev/blob/f5e840425b2e980bf2d8d196841f7d40aa3c6c45/modules/libpref/init/all.js
~~~ js
// Override DPI. A value of -1 means use the maximum of 96 and the system DPI.
// A value of 0 means use the system DPI. A positive value is used as the DPI.
// This sets the physical size of a device pixel and thus controls the
// interpretation of physical units such as "pt".
pref("layout.css.dpi", -1);

// Set the number of device pixels per CSS pixel. A value <= 0 means choose
// automatically based on user settings for the platform (e.g., "UI scale factor"
// on Mac). A positive value is used as-is. This effectively controls the size
// of a CSS "px". This is only used for windows on the screen, not for printing.
pref("layout.css.devPixelsPerPx", "-1.0");
~~~

~~~ widget/gtk/nsWindow.cpp
double
nsWindow::GetDefaultScaleInternal()
{
    return GdkScaleFactor() * gfxPlatformGtk::GetFontScaleFactor();
}
// NDDams: Gdk/WindowScale *

gint
nsWindow::GdkScaleFactor()
{
 #if (MOZ_WIDGET_GTK >= 3)
    // Available as of GTK 3.10+
    static auto sGdkWindowGetScaleFactorPtr = (gint (*)(GdkWindow*))
        dlsym(RTLD_DEFAULT, "gdk_window_get_scale_factor");
    if (sGdkWindowGetScaleFactorPtr && mGdkWindow)
        return (*sGdkWindowGetScaleFactorPtr)(mGdkWindow);
 #endif
    return ScreenHelperGTK::GetGTKMonitorScaleFactor();
}
~~~

~~~ gfx/thebes/gfxPlatformGtk.cpp
int32_t
gfxPlatformGtk::GetFontScaleDPI()
{
    if (!sDPI) {
        // Make sure init is run so we have a resolution
        GdkScreen *screen = gdk_screen_get_default();
        gtk_settings_get_for_screen(screen);
        sDPI = int32_t(round(gdk_screen_get_resolution(screen)));
        if (sDPI <= 0) {
            // Fall back to something sane
            sDPI = 96;
        }
    }
    return sDPI;
}

double
gfxPlatformGtk::GetFontScaleFactor()
{
    // Integer scale factors work well with GTK window scaling, image scaling,
    // and pixel alignment, but there is a range where 1 is too small and 2 is
    // too big.  An additional step of 1.5 is added because this is common
    // scale on WINNT and at this ratio the advantages of larger rendering
    // outweigh the disadvantages from scaling and pixel mis-alignment.
    int32_t dpi = GetFontScaleDPI();
    if (dpi < 132) {
        return 1.0;
    }
    if (dpi < 168) {
        return 1.5;
    }
    return round(dpi/96.0);

}
~~~

# Windows

https://blogs.msdn.microsoft.com/fontblog/2005/11/08/where-does-96-dpi-come-from-in-windows/

Dpi autodetection ans scaling factors in windows 7 and 8:
(according to Lionel F., dpi autodetection started in windows xp)
https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-8.1-and-8/ff716252(v=win.10)

Dynamic dpi in windows 10:
https://blogs.technet.microsoft.com/askcore/2015/12/08/display-scaling-in-windows-10/
https://blogs.technet.microsoft.com/askcore/2016/08/16/display-scaling-changes-for-the-windows-10-anniversary-update/

# QT
https://blog.qt.io/blog/2016/01/26/high-dpi-support-in-qt-5-6/

Source code
===========

git://git.sv.nongnu.org/freetype/freetype2.git
git://git.sv.nongnu.org/freetype/freetype2-demos.git
https://anongit.freedesktop.org/git/fontconfig
https://anongit.freedesktop.org/git/xorg/lib/libXft.git
https://anongit.freedesktop.org/git/cairo
git://git.xfce.org/xfce/xfce4-settings
https://github.com/GNOME/gnome-settings-daemon
https://github.com/GNOME/gnome-desktop
https://github.com/GNOME/pango
https://github.com/GNOME/gtk
