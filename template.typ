#let proyecto(
  titulo: "",
  subtitulo: "",
  indice: false,
  caratula: false,
  fuente: "IBM Plex Sans",
  fuente_mono: "IBM Plex Mono",
  autores: (),
  materia: "",
  carrera: "",
  año: "",
  fecha: "",
  version: "",
  color_fondo_codigo: rgb("#f2f2f2"),
  body,
) = {
  if titulo == "" {
    error("El título es obligatorio")
  }
  if autores == () {
    error("Debe proporcionar al menos un autor")
  }
  if materia == "" {
    errgr("La materia es obligatoria")
  }
  if carrera == "" {
    error("La carrera es obligatoria")
  }
  if año == "" {
    error("El año es obligatorio")
  }
  if fecha == "" {
    error("La fecha es obligatoria")
  }

  set document(author: autores, title: titulo)
  set text(font: (fuente), size: 10pt)

  let linea = line(length: 100%, stroke: 0.25pt)

  let columna-der = grid(
    columns: (100%),
    gutter: 9%,
    rows: (auto, auto),
    [#carrera],
    [#materia - #año],
  )

  let unrn-logo = align(left)[#image("images/UNRN-color.png", width: 75%)]

  let doc-titulo = align(right)[#columna-der]

  let header-unrn = grid(columns: (auto, auto), rows: (auto), [#unrn-logo], [#doc-titulo])

  let pie_pag = align(left)[
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
        [#pie_pag],
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
    [#linea],
  )

  let vacio(..) = ""
  set heading(numbering: vacio)

  let titulo_grande = [
    #set text(24pt, weight: "extrabold")
    #set align(center)
    *#titulo*
  ]

  let subtitulo = [
    #set text(16pt, weight: "extrabold")
    #set align(center)
    #subtitulo
  ]

  set math.equation(numbering: "(1)")

  show raw: set text(font: fuente_mono)
  show raw.where(block: true): block.with(fill: color_fondo_codigo, inset: 7pt, radius: 3pt, width: 100%)
  show raw.where(block: true): text.with(size: 10pt)
  show raw.where(block: false): text.with(size: 11pt)

  show parbreak: it => {
    it
    v(10pt)
  }

  show table: align.with(center)

  set par(justify: true, leading: 1.5em)

  v(15pt)
  titulo_grande
  subtitulo
  linea

  if caratula {
    set align(center)
    v(50pt)
    [
      #set text(13pt)
      #for autor in autores {
        if autor == autores.last() {
          autor
        } else {
          autor + ", "
        }
      }
      #v(50pt)
      Universidad Nacional de Río Negro
      #v(50pt)
      #materia
      #v(50pt)
      #fecha
      #pagebreak()
    ]
  }

  if indice {
    outline(title: [*Índice*], indent: 1em)
    pagebreak()
  }

  body
}

#let linea = line(length: 100%, stroke: 0.25pt)
