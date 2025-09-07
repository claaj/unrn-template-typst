#import "@local/unrn-template:1.0.0": classic

#let authors_to_array = a => {
  if a == none { () }
  else if type(a) == array {
    a.map(x => if type(x) == dictionary and "name" in x {
      if type(x.name) == content { repr(x.name).slice(1, -1) } else { str(x.name) }
    } else { str(x) })
  } else if type(a) == dictionary and "name" in a {
    ( if type(a.name) == content { repr(a.name).slice(1, -1) } else { str(a.name) }, )
  } else {
    ( str(a), )
  }
}

#let horizontalrule = none

#let conf(
  title: none,
  subtitle: none,
  authors: (),
  date: none,
  subject: none,
  career: none,
  year: none,
  version: none,
  font: none,
  monofont: none,
  colormonoblock: none,
  cover: none,
  toc: none,
  doc,
) = {
  classic.with(
    title:    if title == none { [] } else { title },
    subtitle: if subtitle == none { [] } else { subtitle },
    authors:  authors_to_array(authors),
    date:     if date == none { "" } else { date },
    subject:  if subject == none { "" } else { subject },
    career:   if career == none { "" } else { career },
    year:     if year == none { "" } else { year },
    version:  if version == none { "" } else { version },
    font:     if font == none { "IBM Plex Sans" } else { font },
    monofont: if monofont == none { "IBM Plex Mono" } else { monofont },
    colormonoblock: if colormonoblock == none {
      rgb("#f2f2f2")
    } else {
      if type(colormonoblock) == string { rgb(colormonoblock) } else { colormonoblock }
    },
    cover:    if cover == none { false } else { cover },
    toc:      if toc == none { false } else { toc },
  )(doc)
}

#show: doc => conf(
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(author)$
  authors: (
$for(author)$
$if(author.name)$
    ( name: [$author.name$],
      affiliation: [$author.affil$],
      email: [$author.email$] ),
$else$
    ( name: [$author$],
      affiliation: [],
      email: [] ),
$endif$
$endfor$
  ),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(subject)$
  subject: "$subject$",
$endif$
$if(career)$
  career: "$career$",
$endif$
$if(year)$
  year: "$year$",
$endif$
$if(version)$
  version: "$version$",
$endif$
$if(font)$
  font: "$font$",
$endif$
$if(monofont)$
  monofont: "$monofont$",
$endif$
$if(colormonoblock)$
  colormonoblock: rgb("$colormonoblock$"),
$endif$
$if(cover)$
  cover: $cover$,
$endif$
$if(toc)$
  toc: $toc$,
$endif$
  doc,
)

$body$
