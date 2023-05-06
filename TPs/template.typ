#let proyecto(titulo: "", autores: (), materia: "", fecha: "", uni: "", body) = {

  // Setear autores y titulos en el documento
  set document(author: autores, title: titulo)

  // Config de pagina
  set page(
    paper: "a4",
    header: [#titulo],
    numbering: "1",
    margin: (top: 1in, right: 1in, left: 1in, bottom: 1in),
  )

  // Config de texto
  set text(
    font: ("IBM Plex Serif", "Twemoji"),
    size: 11pt,
    lang: "es",
  )

  // Setear headings
  set heading(numbering: "1.a)")

  // Agregar numeros a ecuaciones
  set math.equation(numbering: "(1)")

  // Agrega bloque gris atras de bloques de código (Más fachero)
  show raw.where(block: true): block.with(
    fill: rgb("#f2f2f2"),
    inset: 10pt,
    radius: 5pt,
    width: 100%,
  )

  // Fuente bloque de codigo
  show raw: set text(font: "IBM Plex Mono")

  // Centra los cuadros
  show table: align.with(center)

 // Formatear caratula
  let caratula = {
    set align(center)
    v(100pt)
    titulo
    v(50pt)
    for autor in autores {
      if autor == autores.last() {
       autor
      } else {
       autor + ", "
      }
    }
    v(50pt)
    uni
    v(50pt)
    materia
    v(50pt)
    fecha
    pagebreak()
    set align(left)
  }

  // Imprimir caratula
  caratula

  // Indice
  outline( title: "Indice", indent: true)
  pagebreak()

  // Justificar cuerpo.
  set par(justify: true)

  body
}
