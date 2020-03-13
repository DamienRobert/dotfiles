vim: ft=markdownlight fdm=expr

Xkbmap
======

~/.Xkbmap
fr(oss)+compose(menu)+capslock(capslock)+altwin(meta_alt)+nbsp(level3n)+srvr_ctrl(xfree86)+terminate(ctrl_alt_bksp)

-> cf /usr/share/X11/xkb/symbols

## compose(menu):
  partial modifier_keys
  xkb_symbols "menu" {
      key <MENU>  { type[Group1]="TWO_LEVEL", [ Multi_key, Multi_key ] };
  };

nbsp(level3n) groups are given by [None,Shift,AltGr,AltGr+Shift]
  // Let Space key provide No-Break Space (NBSP), Narrow No-Break Space (NNBSP),
  // Zero-Width Non-Joiner (ZWNJ), and Zero-Width Joiner (ZWJ) for the desired
  // levels.

  // level3n provides narrow no-breaking space in addition to the normal one
  partial
  xkb_symbols "level3n" {
    key <SPCE> {
      type[Group1]="FOUR_LEVEL",
      symbols[Group1]= [ space, space, nobreakspace, 0x100202F ]
    };
  };

## altwin(meta_alt) (Meta=Shift+Alt)
  // Meta is mapped to second level of Alt keys.
  partial modifier_keys
  xkb_symbols "meta_alt" {
      key <LALT> { [ Alt_L, Meta_L ] };
      key <RALT> { type[Group1] = "TWO_LEVEL",
                   symbols[Group1] = [ Alt_R, Meta_R ] };
      modifier_map Mod1 { Alt_L, Alt_R, Meta_L, Meta_R };
  //  modifier_map Mod4 {};
  };

## level3(ralt_switch)
  // These partial variants assign ISO_Level3_Shift to various XKB keycodes
  // so that the third shift level can be reached.

  // The default behaviour:
  // the right Alt key (AltGr) chooses the third symbol engraved on a key.
  default  partial modifier_keys
  xkb_symbols "ralt_switch" {
    key <RALT> {
      type[Group1]="ONE_LEVEL",
      symbols[Group1] = [ ISO_Level3_Shift ]
    };
    include "level3(modifier_mapping)"
  };

## srvr_ctrl(xfree86)
  // Actions which control the server's behavior.
  partial keypad_keys function_keys
  xkb_symbols "xfree86" {
      include "keypad(operators)" #-> Ctrl+Alt+Fn
      include "srvr_ctrl(fkey2vt)" -> Ctrl+Alt+Keypad
  };

## capslock(capslock)
  default  partial hidden modifier_keys
  xkb_symbols "capslock" {
      replace key <CAPS> { [ Caps_Lock ] };
      modifier_map Lock { Caps_Lock };
  };

## terminate(ctrl_alt_bksp)
  default  partial modifier_keys
  xkb_symbols "ctrl_alt_bksp" {
      key <BKSP> {
          type="CTRL+ALT",
          symbols[Group1] = [ NoSymbol, NoSymbol, NoSymbol, NoSymbol, Terminate_Server ]
      };
  };

## keypad(oss):
  keypad_keys
  xkb_symbols "oss" {
      include "keypad(core)"
      include "keypad(ossmath)"
      include "keypad(ossnumber)"
      include "kpdl(dotoss)"
  };
  #keypad(ossmath):
  // ┏━━━━━┱─────┬─────┬─────┐
  // ┃Num  ┃ ∕ ₁ │ . ₂ │ − ₃ │ ₁ <XF86_Ungrab>
  // ┃Lock⇭┃ / ÷ │ * × │ - − │ ₂ <XF86_ClearGrab>
  // ┡━━━━━╃─────┼─────┼─────┤ ₃ <XF86_Prev_VMode>
  //                   │ + ₄ │ ₄ <XF86_Next_VMode>
  //                   │     │
  //                   ┤     │ 1 None
  //                   │     │ 2 Level3 ⇮
  //                   │ + + │ 3 Shift+Level3 ⇧⇮
  //                   ╆━━━━━┪ 4 Ctrl+Alt
  #keypad(ossnumber):
  // ┏━━━━━┱
  // ┃Num  ┃                   ⇱ Home
  // ┃Lock⇭┃                   ⇲ End
  // ┡━━━━━╃─────┼─────┼       ⇞ Page up
  // │ 7 ⇖ │ 8 ⇑ │ 9 ⇗ │       ⇟ Page down
  // │ ⇱ ↖ │ ⇧ ↑ │ ⇞ ↗ │       ⎀ Insert
  // ├─────┼─────┼─────┤       ␥ Delete
  // │ 4 ⇐ │ 5 ⇔ │ 6 ⇒ │       ⇦⇧⇨⇩ Directions
  // │ ⇦ ← │   ↔ │ ⇨ → │       ⍽ narrow no-break space
  // ├─────┼─────┼─────╆
  // │ 1 ⇙ │ 2 ⇓ │ 3 ⇘ ┃
  // │ ⇲ ↙ │ ⇩ ↓ │ ⇟ ↘ ┃       1 None
  // ├─────┴─────┼─────┨       2 Num Lock ⇭
  // │ 0       ⇕ │             3 Level3 ⇮
  // │ ⎀       ↕ │             4 Shift+Level3 ⇧⇮
  // └───────────┴
  #kpdl(dotoss):
  // key <KPDL> { [ KP_Delete, period, comma, 0x100202F ] }; // <delete> . , ⍽ (narrow no-break space)

fr(oss)
  // Unicode French derivative
  // Loose refactoring of the historic Linux French keyboard layout
  // ┌─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┬─────┲━━━━━━━━━┓
  // │ ³ ¸ │ 1 ̨  │ 2 É │ 3 ˘ │ 4 — │ 5 – │ 6 ‑ │ 7 È │ 8 ™ │ 9 Ç │ 0 À │ ° ≠ │ + ± ┃ ⌫ Retour┃
  // │ ² ¹ │ & ˇ │ é ~ │ " # │ ' { │ ( [ │ - | │ è ` │ _ \ │ ç ^ │ à @ │ ) ] │ = } ┃  arrière┃
  // ┢━━━━━┷━┱───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┴─┬───┺━┳━━━━━━━┫
  // ┃       ┃ A Æ │ Z Â │ E ¢ │ R Ê │ T Þ │ Y Ÿ │ U Û │ I Î │ O Œ │ P Ô │ ¨ ˚ │ £ Ø ┃Entrée ┃
  // ┃Tab ↹  ┃ a æ │ z â │ e € │ r ê │ t þ │ y ÿ │ u û │ i î │ o œ │ p ô │ ^ ~ │ $ ø ┃   ⏎   ┃
  // ┣━━━━━━━┻┱────┴┬────┴┬────┴┬────┴┬────┴┬────┴┬────┴┬────┴┬────┴┬────┴┬────┴┬────┺┓      ┃
  // ┃        ┃ Q Ä │ S „ │ D Ë │ F ‚ │ G ¥ │ H Ð │ J Ü │ K Ï │ L Ŀ │ M Ö │ % Ù │ µ ̄  ┃      ┃
  // ┃Maj ⇬   ┃ q ä │ s ß │ d ë │ f ‘ │ g ’ │ h ð │ j ü │ k ï │ l ŀ │ m ö │ ù ' │ * ` ┃      ┃
  // ┣━━━━━━━┳┹────┬┴────┬┴────┬┴────┬┴────┬┴────┬┴────┬┴────┬┴────┬┴────┬┴────┲┷━━━━━┻━━━━━━┫
  // ┃       ┃ > ≥ │ W “ │ X ” │ C ® │ V ← │ B ↑ │ N → │ ? … │ . . │ / ∕ │ § − ┃             ┃
  // ┃Shift ⇧┃ < ≤ │ w « │ x » │ c © │ v ⍽ │ b ↓ │ n ¬ │ , ¿ │ ; × │ : ÷ │ ! ¡ ┃Shift ⇧      ┃
  // ┣━━━━━━━╋━━━━━┷━┳━━━┷━━━┱─┴─────┴─────┴─────┴─────┴─────┴───┲━┷━━━━━╈━━━━━┻━┳━━━━━━━┳━━━┛
  // ┃       ┃       ┃       ┃ ␣         Espace fine insécable ⍽ ┃       ┃       ┃       ┃
  // ┃Ctrl   ┃Meta   ┃Alt    ┃ ␣ Espace       Espace insécable ⍽ ┃AltGr ⇮┃Menu   ┃Ctrl   ┃
  // ┗━━━━━━━┻━━━━━━━┻━━━━━━━┹───────────────────────────────────┺━━━━━━━┻━━━━━━━┻━━━━━━━┛
  partial alphanumeric_keys
  xkb_symbols "oss" {
      include "latin"
      include "level3(ralt_switch)"
      include "nbsp(level4n)"
      include "level5(rctrl_switch)" -> right Ctrl=Fifth Shift Level
      include "keypad(oss)"
      ...

## Divers
REM: the level5(rctrl_switch) is super annoying, this put right control to
fifth shift level, which is only used for nbsp(level4n) (ie
ctrl+shift+space->narrow space), but I use nbsp(level3n) (ie
altgr+shift+space->narrow space), so this kills my Right Control Key for
nothing!

Config
======

https://who-t.blogspot.com/2020/02/user-specific-xkb-configuration-part-1.html
> The new libxkbcommon release changes two things:
> - it prepends $XDG_CONFIG_HOME/xkb/ to the lookup path for XKB rules (and
> other files). [...]
> - Secondly, rules files now support an include statement. This means you
> can set your own rules and include system rules.

Exemple of xkb config:

xkb_keymap {
  xkb_keycodes { include \"evdev+aliases(azerty)\" };
  xkb_types { include \"complete\" };
  xkb_compat { include \"complete\" };
  xkb_geometry { include \"pc(pc105)\" };
  xkb_symbols {

    // include \"pc+fr+...\"
    include \"pc\"
    include \"fr\"
    include \"inet(evdev)\"
    include \"compose(menu)\"
    include \"altwin(meta_win)\"
    include \"level3(ralt_switch)\"
    include \"terminate(ctrl_alt_bksp)\"

    key <LatO> { [ o, O, oe, OE ] };
    key <LatJ> { [ j, J, oslash, Ooblique ] };
    key <LatN> { [ n, N, ntilde, Ntilde ] };
    key <LALT> { [ Alt_L ] };
    key <NMLK> { [ Num_Lock, Pointer_EnableKeys ] };
    key <MENU> { [ Multi_key, Menu ] };

$extra_keys
  };
};

Xcompose
========

I use [x] http://github.com/kragen/xcompose.git
Others are available here:
https://github.com/rrthomas/pointless-xcompose

gnome
=====

Desactivate gnome xkb configuration to let me use my custom ones:
gconftool-2 --type boolean --set /desktop/gnome/peripherals/keyboard/xkb/overrideSettings false
gconftool-2 --type boolean --set /apps/gnome_settings_daemon/plugins/keyboard false

Apparently gnome/gtk compose settings was hardcoded, but it seems I can use
my custom .Xcompose
