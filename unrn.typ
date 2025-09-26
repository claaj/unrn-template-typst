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
  font: none,
  monofont: none,
  toc: none,
  npar: none,
  doc,
) = {
  classic.with(
    title:    if title == none { [] } else { title },
    subtitle: if subtitle == none { [] } else { subtitle },
    authors:  authors_to_array(authors),
    date:     if date == none { "" } else { date },
    subject:  if subject == none { "" } else { subject },
    career:  if career == none { "" } else { career },
    font:     if font == none { "New Computer Modern Sans" } else { font },
    monofont: if monofont == none { "New Computer Modern Mono" } else { monofont },
    toc:      if toc == none { false } else { true },
    npar:    if npar == none { false } else { true },
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
$if(font)$
  font: "$font$",
$endif$
$if(monofont)$
  monofont: "$monofont$",
$endif$
$if(toc)$
  toc: $toc$,
$endif$
$if(npar)$
  npar: $npar$,
$endif$
  doc,
)

$body$
