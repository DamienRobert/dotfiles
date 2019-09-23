vim: ft=markdownlight fdm=expr

Privacy
=======

Réglages dans about:config
https://wiki.archlinux.org/index.php/Firefox/Privacy
https://restoreprivacy.com/firefox-privacy/

Urls:
- https://www.privacytools.io/
- duckduckgo

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
