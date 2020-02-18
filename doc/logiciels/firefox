vim: ft=markdownlight fdm=expr

Privacy
=======

Réglages dans about:config
https://wiki.archlinux.org/index.php/Firefox/Privacy
https://restoreprivacy.com/firefox-privacy/

Urls:
- https://www.privacytools.io/
- duckduckgo

* Firefox default protection:
-> disable third party cookie
-> disable trackers?
Pro: activates *after* ublock, so do not interfere with it + may block some
missed trackers + when disabling ublock for a site still provide a level of
protection.
Cf https://www.reddit.com/r/firefox/comments/9zrc0a/should_i_enable_both_content_blocking_ublock/
   Note that this older comment is not valid https://www.reddit.com/r/firefox/comments/6tnpdi/tracking_protection_and_ublock_origin/ since the protection is *after* ublock
Con: may need to desactivate both ublock and firefox tracking if this
really breaks a site
Solution: only use the basic (level1) list rather than the strict (level2) list, so there probably won't be any breakage on firefox sides. Note: the block list can be configured in 'custom mode', I don't know which one is used in 'strict mode', if it is the level1 or level2 mode.

* Privacy badger and privacy possum:
https://www.ghacks.net/2018/05/07/privacy-possum-is-privacy-badger-on-steroids/
https://www.reddit.com/r/theprivacymachine/comments/a4zjma/privacy_possum_vs_privacy_badger/

* Ad block lists:
Stop asking cookies: https://www.i-dont-care-about-cookies.eu/

Default ublock lists: ublock filters, EasyList, Peter Lowe’s Ad server list, EasyPrivacy, Malware Domain List, Malware domains

* ublock blocking modes
https://github.com/gorhill/uBlock/wiki/Blocking-mode

Filtering process: https://github.com/gorhill/uBlock/wiki/Overview-of-uBlock's-network-filtering-engine
- Static filters: https://github.com/gorhill/uBlock/wiki/Static-filter-syntax
  https://github.com/gorhill/uBlock/wiki/Introduction-to-basic-filtering-syntax

  - Strict blocking:
    For a path filter without options, only network types are blocked (ie ~document is implied), while for hostname filter both network types and document is blocked (ie the $document option is implied in hostname filters)
    Eg: ||example.com^ blocks visiting the website [=strict blocking] since document is implied
    -> Disable strict blocking: @@noscript.net^$document

    Exemples:
    foo.com: block ressources and page (since $document is implied)
    foo.com$document: only block document
    foo/bar: block ressources, but not visiting this page
    foo/bar$document: block visiting this page (but not other ressources)
    foo/bar$all: block visiting this page and all ressources
    Note that there is currently no way to only block ressources and not document on a hostname, cf https://github.com/gorhill/uBlock/issues/2385
  
  - Ad block filter rules: https://help.eyeo.com/en/adblockplus/how-to-write-filters

  Marker (|): Adblock Plus typically treats each filter as if it has a wildcard at its beginning and end (i.e. there’s no difference between the filters ad and *ad*) ->  add a pipe symbol (|) to the filter to show that there should be a definite end at this point. || at the beginning allows subdomains
  eg: swf| blocks http://example.com/annoyingflash.swf
      ||example.com/banner.gif blocks http://www.example.com/banner.gif but not badexample.com/banner.git

  Separator caracter: '^' = anything except letter,digit, _, -, ., %
  eg: http://example.com^ matches http://example.com/ and http://example.com:8000/ but not http://example.com.ar/.
  Cheatsheet: https://adblockplus.org/filter-cheatsheet

  - Filter options: filter$option1,option2 cf https://help.eyeo.com/en/adblockplus/how-to-write-filters#options
    Filter by network type: script, image, stylesheet, font, media, ~script (negation)
    Special types: popup, document (=the page itself), inline-font, inline-script, all (= all network-based types + special types)
    By party: third-party, 3p, first-party, 1p (=~third-party)
    For exception rules: elemhide (turns off element hiding rules), generichide (turns off generic element hiding rules on the page), genericblock (turns off generic blocking rules)

  Ex: important means to ignore all exception filters (those prefixed with @@)
  ||google-analytics.com^$important,third-party
  ||bet365.com^$all: 'all' option is equivalent to specifying all network-based types + popup, document, inline-font, inline-script

  Note on negation: for a network type, eg ~image means all other network
  type except image. For a special type, ~popup means nothing, except when
  used as $all,~popup which mean all types except popup.

- Element hiding: [hostname(s)]##[expression] ou [hostname(s)]#@#[expression]

  example.com##css_selector: hide all matched css selectors
  example.com##^.badstuff: as above but acts on the response date *before browser parsing*

  Can be refined by procedural filters: https://github.com/gorhill/uBlock/wiki/Procedural-cosmetic-filters
  example.com##body > div:last-of-type span:has-text(/^Promoted by/i)
  strikeout.me##body > div:has(img[alt="AdBlock Alert"])

  By default, cosmetic filters add the 'display: none !important;' css
  property. This can be customised as follow:
  example.com##h1:style(background-color: blue !important)

- Dynamic filters: https://github.com/gorhill/uBlock/wiki/Dynamic-filtering:-rule-syntax
  source destination request-type action

Source hostname always corresponds to the hostname extracted from the URL of the web page in the browser.
The destination hostname corresponds to the hostname extracted from the URL of a remote resource which the web page is fetching (or trying to).
Request:
  - *: any type of request
  - image: images
  - 3p: any request which 3rd-party to the web page
  - inline-script: inline script tags, i.e. scripts embedded in the main document
  - 1p-script: 1st-party scripts, i.e. scripts which are pulled from the same domain name of the current web page
  - 3p-script: 3rd-party scripts, i.e. scripts which are pulled from a different domain name than that of the current web page
  - 3p-frame: 3rd-party frames, i.e. frames elements which are pulled from a different domain name than that of current web page
Exemple: * * 3p-frame block

https://github.com/gorhill/uBlock/wiki/Dynamic-URL-filtering
example.org https://foo.com/widget.js script allow

behind-the-scene: https://github.com/gorhill/uBlock/wiki/Behind-the-scene-network-requests = request not associated to a particular tab
By default: everything is noop for behind the scene, except no-large-media
and no-scripting which is false.

This also allows to change global options on a specific site (on the ui
these are the icons at the bottom):
no-cosmetic-filtering: www.lemonde.fr true [=element hiding]
no-large-media: www.lemonde.fr true
no-popups: www.lemonde.fr true
no-remote-fonts: www.lemonde.fr true
no-scripting: www.lemonde.fr true

no-large-media: behind-the-scene false
no-scripting: behind-the-scene false

The ui: on the left is the global setting, on the right is the site only
setting. green=allow, red=deny, grey=nop
Ex: globally disable facebook: * facebook.fr * deny
Ex: locally enable facebook: www.lemonde.fr facebook.fr * allow
Ex: locally disable third party = www.lemonde.fr * 3p block

On the ui: changing a setting adds a temporary rule, clicking on the lock icon
makes the rule permanent.

Precedence:
  - Local setting for example.com override global setting for example.com.
  - The party-specific cells override the type-specific cells. eg '3rd-party' or 'example.com' override images
  - The more specific the party, the higher the precedence. eg www.example.com overrides example.com which overrides '3rd-party scripts'
  - Party-specific and type-specific cells override non specific party cells: 3rd-party frames overrides 3rd-party

Pdf
===

Modifier le programme qui ouvre les pdf: Preferences -> Applications -> pdf
Si les pdf sont dl automatiquement, régler ça en enlevant mimetypes.rdf du
profil

See: http://kb.mozillazine.org/MimeTypes.rdf
https://www.math.ubc.ca/MathNet/FAQ/?FirefoxHelper.html
For example for pdf I have
  #MIME type to the list of helpers Firefox should handle
  <RDF:li RDF:resource="urn:mimetype:application/pdf"/>
  #declare the mime/type
  <RDF:Description RDF:about="urn:mimetype:application/pdf"
                   NC:value="application/pdf"
                   NC:editable="true">
    <NC:handlerProp RDF:resource="urn:mimetype:handler:application/pdf"/>
  </RDF:Description>
  #how to handle the mimetype
  <RDF:Description RDF:about="urn:mimetype:handler:application/pdf"
                   NC:alwaysAsk="true"
                   NC:saveToDisk="false"
                   NC:useSystemDefault="false"
                   NC:handleInternal="false">
    <NC:externalApplication RDF:resource="urn:mimetype:externalApplication:application/pdf"/>
    <NC:possibleApplication RDF:resource="urn:handler:local:/usr/bin/evince"/>
  </RDF:Description>
  #wich external application to use
  <RDF:Description RDF:about="urn:mimetype:externalApplication:application/pdf"
                   NC:path="/usr/bin/evince"
                   NC:prettyName="evince" />

So the default application is to use
urn:mimetype:externalApplication:application/pdf which here is evince.
Firefox also looks at the xdg mime info and the mailcap file, and I don't
quite understand the precedence of these things.

Plugins
=======

https://support.mozilla.org/en-US/kb/set-adobe-flash-click-play-firefox

Pocket integration: export: http://getpocket.com/export

Tabs
====

about:plugins
about:config
about:preferences#applications #which app to use

Cookies
=======

Page info (le (i) dans l'adresse) => Security / View Cookies

DNS
===

DNS-over-HTTPS (DOH):
https://wiki.mozilla.org/Trusted_Recursive_Resolver
