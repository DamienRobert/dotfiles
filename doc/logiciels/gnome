vim: ft=markdownlight
https://wiki.archlinux.org/index.php/Talk:GNOME

Settings: dconf and gsettings
============================
https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Desktop_Migration_and_Administration_Guide/configuration-overview-gsettings-dconf.html

gconf [-> gconfd-2 daemon] is the gnome2 settings daemon

- dconf [-> dconf-service daemon started by dbus]: dconf is a key-based configuration system which manages user settings. It is the back end for GSettings used in Red Hat Enterprise Linux 7. dconf manages a range of different settings, including GDM, application, and proxy settings. 
- dconf: The dconf command-line utility is used for reading and writing individual values or entire directories from and to a dconf database. 
- GSettings: GSettings is a high-level API for application settings, front end for dconf. 
- gsettings: The gsettings command-line tool is used to view and change user settings. 

Exemples:
gsettings set org.gnome.desktop.session session-name gnome-fvwm
  dconf write /org/gnome/desktop/session/session-name gnome-fvwm
gsettings get org.gnome.desktop.session session-name =>
  dconf read /org/gnome/desktop/session/session-name => 'gnome-fallback'
gsettings reset com.canonical.desktop.interface scrollbar-mode

dconf store ses valeurs dans ~.config/dconf/user
gsettings fait de la validation de type (ce que dconf ne fait pas). Pour
cela il regarde des schemas: 'dconf-editor reads gsettings schemas from
$XDG_DATA_DIRS/glib-2.0/schemas to obtain descriptions, default values and
allowed values for keys.' => /usr/share/glib-2.0/schemas/

The values provided are serialized GVariants: https://developer.gnome.org/glib/stable/gvariant-text.html

Tweak the appearance:
- lxappearance
- xfce4-session-settings //appearance
  xfce4-appearance-settings
- gnome-tweak-tool

gnome-settings-daemon
=====================

xsettings
---------

If gnome-settings-daemon (which is the xsetting daemon for gnome is used),
the values can be configured in
  org.gnome.settings-daemon.plugins.xsettings

gsettings schema correspondant, cf /usr/share/glib-2.0/schemas/org.gnome.settings-daemon.plugins.xsettings.gschema.xml:
antialiasing(=grayscale => rgba=none), hinting(=slight), rgba-order(=rgb), disabled-gtk-modules(=[]), enabled-gtk-modules(=[]), overrides(={})

In particular the overrides key can be used to set any settings, cf
https://github.com/GNOME/gnome-settings-daemon/blob/master/plugins/xsettings/README.xsettings

Note: d'après le code gnome-tweak-tool gère les overrides suivant:
Gtk/ShellShowsAppMenu Gtk/EnablePrimaryPaste Gdk/WindowScalingFactor

Exemples: 
- { 'Gtk/ShellShowsAppMenu': < 0 >, 'Xft/DPI': < 98304 > } 
  Note also that DPI in the above example is expressed in 1024ths of an inch.
- https://wiki.gnome.org/HowDoI/HiDpi
  "GNOME currently enables hi-dpi support when the screen resolution is at least 192 dpi and the screen height (in device pixels) is at least 1200." (hidpi => Gdk/WindowScalingFactor=2)
  Manuellement (ou via gnome-tweak-tool):
  gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "[{'Gdk/WindowScalingFactor', <2>}]"

Xresources
----------

De plus gnome-settings-daemon rajoute les Xresources suivantes:
Xft.dpi, Xft.antialias, Xft.hinting, Xft.hintstyle, Xft.rgba, Xcursor.size, Xcursor.theme

Historique sur le dpi
---------------------

### Old Gnome
https://bugzilla.novell.com/show_bug.cgi?id=217790

1. gnome-settings-daemon queries the configuration value stored in GConf for "/desktop/gnome/font_rendering/dpi".  It then propagates this value using the XSETTINGS protocol (on the "Xft/DPI" property), and also sets the "Xft.dpi" Xresource for apps which may want to use it (GNOME doesn't use that one).
2. The default value for /desktop/gnome/font_rendering/dpi in the GConf schema is 96.
3. GTK+ apps query the XSETTINGS manager for the "Xft/DPI property", and set this as the GdkScreen's resolution.  If an XSETTINGS manager is not running, GdkScreen uses the magic value of -1 for the resolution.
4. GtkWidget queries GdkScreen for the resolution, and sets that value on the Pango font rendering context.
5. Pango sees the resolution set in the context; if it is -1 (unset), it uses a fallback value of 96 DPI.  This is what gets used for rendering.
[Cf https://developer.gnome.org/pango/stable/pango-Cairo-Rendering.html
void pango_cairo_font_map_set_resolution (PangoCairoFontMap *fontmap,
                                     double dpi);
Sets the resolution for the fontmap. This is a scale factor between points
specified in a PangoFontDescription and Cairo units. The default value is
96, meaning that a 10 point font will be 13 units high. (10 * 96. / 72. =
13.3).]

### New Gnome
- http://scanline.ca/dpi/ by Billy Biggs, 2004
  => wants to hardcode the dpi to 96
  Propose le patch suivant à fontconfig:
  https://bugs.freedesktop.org/show_bug.cgi?id=2014
  fontconfig should set a default DPI of 96.0 (2004),
  heureusement rejeté par Keith Packard
- https://bugzilla.gnome.org/show_bug.cgi?id=643704 (2011): "Add helper class for tracking dpi" introduit le patch suivant par Giovanni Campagna et Bastien Nocera:
  https://bugzilla.gnome.org/attachment.cgi?id=182370&action=diff
  ~~~
        factor = g_settings_get_double (interface_settings, TEXT_SCALING_FACTOR_KEY);
        dpi = DPI_FALLBACK;
        return dpi * factor;
        settings->dpi = get_dpi_from_gsettings (manager) * 1024; /* Xft wants 1/1024ths of an inch */
where get_dpi_from_gsettings is 96*the text factor [default to 1]
  ~~~
=> Gnome xsettings daemon hardcodes the dpi to 96*text factor. More
   precisely the dpi is hidden from gsettings, and the gnome xsettings daemon
   export a dpi of 96*text factor.

   On peut utiliser le mécanisme d'override (cf plus haut; remember that
   Xft/DPI=dpi*1024):
  /org/gnome/settings-daemon/plugins/xsettings/overrides 'Xft/DPI': <153600>

- https://mail.gnome.org/archives/commits-list/2013-June/msg06726.html
  "X11: Add Gdk/UnscaledDPI to override Xft/DPI"
  => gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{ 'Gdk/WindowScalingFactor':<2>, 'Gdk/UnscaledDPI':<92160> }"
  De plus la variable d'environnement GDK_SCALE=2 override
  Gdk/WindowScalingFactor

  => gtk-xft-dpi est mis à Gdk/UnscaledDPI avec un fallback à Xft/DPI
- https://gitlab.gnome.org/GNOME/gtk/commit/bdf0820c501437a2150d8ff0d5340246e713f73f
  (2016): Simplify Xft setting fallback 
  => gtk fallback to 96 rather than autodetection

Résumé sur le réglage du dpi
----------------------------
https://wiki.archlinux.org/index.php/HiDPI

- gsettings set org.gnome.desktop.interface scaling-factor/text-scaling-factor 2
  Note that scaling-factor can only be an integer and affect everything
  => this set the gtk-settings: Gdk/WindowScalingFactor=2'
  While text-scaling-factor can be a float and affect only the font size.
  (this is just used internally by gnome-settings-daemon to compute the 'unscaled dpi': 96*text-scaling-factor)
- Gtk toolkit: To scale UI elements by a factor of two (this override 'scaling-factor'):
  export GDK_SCALE=2 ou
[ To undo scaling of text:
  export GDK_DPI_SCALE=0.5
  Cf https://groups.google.com/a/chromium.org/forum/#!topic/chromium-reviews/zGYMDk3GfZ8)
  Not working anymore, cf gtk 3.93.0 news: - We are no longer reading the GDK_DPI_SCALE environment variable]
