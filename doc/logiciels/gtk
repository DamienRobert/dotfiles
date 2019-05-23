vim: ft=markdownlight

https://wiki.archlinux.org/index.php/GTK%2B

gdk/gtk
=======

GTK+ is implemented on top of an abstraction layer called GDK, freeing GTK+ from low-level concerns like input gathering, Drag and drop and pixel format conversion. GDK is an intermediate layer which isolates GTK+ from the details of the windowing system. GDK is an important part of GTK+'s portability.

GtkSettings
===========

https://developer.gnome.org/gtk3/stable/GtkSettings.html

  GtkSettings provide a mechanism to share global settings between applications.
  On the X window system, this sharing is realized by an XSettings manager that is usually part of the desktop environment, along with utilities that let the user change these settings. In the absence of an Xsettings manager, GTK+ reads default values for settings from settings.ini files in /etc/gtk-3.0, $XDG_CONFIG_DIRS/gtk-3.0 and $XDG_CONFIG_HOME/gtk-3.0. These files must be valid key files (see GKeyFile), and have a section called Settings. Themes can also provide default values for settings by installing a settings.ini file next to their gtk.css file.

~/.gtkrc-2.0
~/.config/gtk-3.0/settings.ini
~/.config/gtk-4.0/settings.ini

Note: certains de ces settings ne sont pas dans le xsettings registry, mais
je pense qu'on peut quand même les régler via le démon xsettings, cf
[xsettings] et ce que me sort dump_xsettings et les override plus bas.

Exemple de réglage via les gsettings dans gnome:
https://ask.fedoraproject.org/en/question/42224/how-do-i-change-font-size-in-gnome/ or gnome-tweak-tool
  gsettings set org.gnome.desktop.interface text-scaling-factor 2.0
  gsettings get org.gnome.desktop.interface text-scaling-factor
  gsettings set org.gnome.desktop.interface monospace-font-name "Monospace 10"
  gsettings set org.gnome.desktop.interface document-font-name 'Sans 10'
  gsettings set org.gnome.desktop.interface font-name 'Cantarell 10'
  gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Cantarell Bold 10'

Gtk Inspector
=============

https://wiki.gnome.org/Projects/GTK+/Inspector

The debugger is disabled by default. To enable it run in a terminal:
gsettings set org.gtk.Settings.Debug enable-inspector-keybinding true
And launch it pressing on the keyboard Control-Shift-I or Control-Shift-D.

If you don't want to use the shortcuts, you can also run it temporarily directly when running your app with:
GTK_DEBUG=interactive your-app

Default gtk settings
====================

gtk-alternative-button-order FALSE
gtk-application-prefer-dark-theme FALSE
gtk-cursor-blink TRUE
gtk-cursor-blink-time 1200
gtk-cursor-blink-timeout 10
gtk-cursor-theme-name NULL
gtk-cursor-theme-size 0
gtk-decoration-layout "menu:minimize,maximize,close"
gtk-dialogs-use-header FALSE
gtk-dnd-drag-threshold 8
gtk-double-click-distance 5
gtk-double-click-time 400
gtk-enable-accels TRUE
gtk-enable-animations TRUE
gtk-enable-event-sounds TRUE
gtk-enable-input-feedback-sounds TRUE
gtk-enable-primary-paste TRUE
gtk-entry-password-hint-timeout 0
gtk-entry-select-on-focus TRUE
gtk-error-bell TRUE
gtk-font-name "Sans 10"
gtk-fontconfig-timestamp 0
gtk-icon-theme-name "Adwaita"
gtk-im-module NULL
gtk-key-theme-name NULL
gtk-keynav-use-caret FALSE
gtk-label-select-on-focus TRUE
gtk-long-press-time 500
gtk-modules NULL
gtk-primary-button-warps-slider TRUE
gtk-print-backends "file,cups,cloudprint"
gtk-print-preview-command "evince --unlink-tempfile --preview --print-settings %s %f"
gtk-recent-files-enabled TRUE
gtk-recent-files-max-age 30
gtk-shell-shows-app-menu FALSE
gtk-shell-shows-desktop FALSE
gtk-shell-shows-menubar FALSE
gtk-sound-theme-name "freedesktop"
gtk-split-cursor TRUE
gtk-theme-name "Adwaita"
gtk-titlebar-double-click "toggle-maximize"
gtk-titlebar-middle-click "none"
gtk-titlebar-right-click "menu"
gtk-xft-antialias -1 (0=no, 1=yes, -1=default)
gtk-xft-dpi -1
gtk-xft-hinting -1
gtk-xft-hintstyle NULL
gtk-xft-rgba NULL

deprecated: (je ne mets pas tout, cf la doc)
- gtk-color-palette: Palette to use in the deprecated color selector.
  GtkSettings:gtk-color-palette has been deprecated since version 3.10 and should not be used in newly-written code. Only used by the deprecated color selector widget.
  Default value: "black:white:gray50:red:purple:blue:light blue:green:yellow:orange:lavender:brown:goldenrod4:dodger blue:pink:light green:gray10:gray30:gray75:gray90"
