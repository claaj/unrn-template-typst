#let classic(
  title: "",
  subtitle: "",
  toc: false,
  cover: false,
  font: "IBM Plex Sans",
  monofont: "IBM Plex Mono",
  authors: (),
  subject: "",
  career: "",
  year: "",
  date: "",
  version: "",
  colormonoblock: rgb("#f2f2f2"),
  body,
) = {
  if title == "" {
    error("Failed to read title")
  }
  if authors == () {
    error("Failed to read author/s")
  }
  if subject == "" {
    errgr("Failed to read subject")
  }
  if career == "" {
    error("Failed to read career")
  }
  if year == "" {
    error("Failed to read year")
  }
  if date == "" {
    error("Failed to read date")
  }

  let authors_str = authors.join(", ")
  // let authors_str = authors.map(a => a.name.slice(1, -1)).join(", ")

  set document(author: authors_str, title: title)
  set text(font: (font), size: 10pt)

  let simple-line = line(length: 100%, stroke: 0.25pt)

  let right-col = grid(
    columns: (100%),
    gutter: 9%,
    rows: (auto, auto),
    [#career],
    [#subject - #year],
  )

  let unrn-logo = align(left)[#image("images/UNRN-color.png", width: 75%)]

  let header-title = align(right)[#right-col]

  let header-unrn = grid(columns: (auto, auto), rows: (auto), [#unrn-logo], [#header-title])

  let footer = align(left)[
    #box(width: auto, fill: rgb("#ffffff"), inset: 10pt, [#version])
  ]

  set page(
    paper: "a4",
    header: [
      #set text(9pt)
      #header-unrn
    ],
    margin: (top: 1in, right: 1in, left: 1in, bottom: 1in),
    footer: [
      #set text(9pt)
      #grid(
        columns: (50%, 50%),
        [#footer],
        [#set align(end)
          #box(
            width: auto,
            fill: rgb("#cccccc"),
            inset: 8pt,
            radius: 3pt,
            [#context counter(page).display((numero, total) => text[Página #numero de #total], both: true)],
          )],
      )
    ],
  )

  show heading.where(level: 1): it => grid(
    columns: (auto),
    rows: (auto, auto),
    gutter: (1.5%),
    [#align(right)[#it]],
    [#simple-line],
  )

  let empty(..) = ""
  set heading(numbering: empty)

  let big-title = [
    #set text(24pt, weight: "extrabold")
    #set align(center)
    *#title*
  ]

  let big-subtitle = [
    #set text(16pt, weight: "extrabold")
    #set align(center)
    #subtitle
  ]

  set math.equation(numbering: "(1)")

  show raw: set text(font: monofont)
  show raw.where(block: true): block.with(fill: colormonoblock, inset: 7pt, radius: 3pt, width: 100%)
  show raw.where(block: true): text.with(size: 10pt)
  show raw.where(block: false): text.with(size: 11pt)

  show parbreak: it => {
    it
    v(10pt)
  }

  show table: align.with(center)

  set par(justify: true, leading: 1.5em)

  v(15pt)
  big-title
  big-subtitle
  simple-line

  if cover {
    set align(center)
    v(50pt)
    [
      #set text(13pt)
      #authors_str
      #v(50pt)
      Universidad Nacional de Río Negro
      #v(50pt)
      #subject
      #v(50pt)
      #date
      #pagebreak()
    ]
  }

  if toc {
    outline(title: [*Índice*], indent: 1em)
    pagebreak()
  }

  body
}

#let linea = line(length: 100%, stroke: 0.25pt)
