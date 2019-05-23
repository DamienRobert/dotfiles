/^section:  *[0-9\.]*$/ {
  sub("^section:  *", "")
  section=$0
  sub("\\.[0-9][0-9]*$", "")
  parent=$0
}
/^content-type:  */ {
  sub("^content-type:  *", "")
  cnttype=$0
}
/^charset:  */ {
  sub("^charset:  *", "")
  charset=$0
}
/^content-disposition:  *attachment *$/ {
  attach=1
}
/^ *$/ {
  if (discard[parent] || attach) {
    discard[section]=1
  } else {
    if (cnttype == "text/plain" && gcnttype == "NONE") {
      gcnttype="TEXT"
      gsection=section
      gcharset=charset
    } else if (cnttype == "text/html" && gcnttype != "HTML") {
      gcnttype="HTML"
      gsection=section
      gcharset=charset
    }
  }
  section=""
  cnttype=""
  charset=""
  attach=""
}
BEGIN {
  gcnttype="NONE"
  gsection="NONE"
  gcharset="NONE"
}
END {
  if (gcharset == "x-unknown" || gcharset == "unknown-8bit") {
    gcharset="iso-8859-1"
  }
  if (gcnttype == "TEXT") {
    printf "reformime -e -s \"%s\" | iconv -c -s -f \"%s\" -t 'ISO8859-1'\n", gsection, gcharset
  } else if (gcnttype == "HTML") {
    printf "reformime -e -s \"%s\" | elinks -dump -stdin 1 -dump-charset 'utf-8' | iconv -c -s -f 'utf-8' -t 'ISO8859-1'\n", gsection
  } else {
    exit 1
  }
}
