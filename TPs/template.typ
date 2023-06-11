#let proyecto(
    titulo: "",
    indice: true,
    fuente: "Liberation Serif",
    fuente_mono: "Liberation Mono",
    autores: (),
    materia: "",
    carrera: "",
    fecha: "",
    body
    ) = {

  // Setear autores y titulos en el documento
  set document(author: autores, title: titulo)

  // Creamos lineas
  let linea = line(length: 100%, stroke: 0.15pt)

  // Titulo de documento
  let doc-titulo = [#set align(left)
    #upper(titulo)]
  let numeros = [#set align(end)
    #counter(page).display("1")]
  let grilla_header = grid(
    columns:(50%, 50%),
    rows: (auto),
    doc-titulo , numeros
  )

  // Config de pagina
  set page(
    paper: "a4",
    header: [
        #set text(size: 9pt)
        #grilla_header
        #linea
      ],
    margin: (top: 1in, right: 1in, left: 1in, bottom: 1in),)

  // Config de texto
  set text(
    font: (fuente, "Twemoji", "Linux Libertine"),
    size: 11pt,
    lang: "es")

  // Agregar numeros a ecuaciones
  set math.equation(numbering: "(1)")

  // Fuente bloque de codigo
  show raw: set text(font: fuente_mono)

  // Agrega bloque gris atras de bloques de código (Más fachero)
  show raw.where(block: true): block.with(
    fill: rgb("#f2f2f2"),
    inset: 10pt,
    radius: 5pt,
    width: 100%,)

  show raw.where(block: true): text.with(size: 10pt)
  show raw.where(block: false): text.with(size: 11pt)

  // Centra los cuadros
  show table: align.with(center)

  // Justificar cuerpo.
  set par(justify: true)

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
  [Universidad Nacional de Río Negro]
  v(50pt)
  materia
  v(50pt)
  fecha
  pagebreak()
  set align(left)

  if indice {
      outline(title: [*Índice*])
      pagebreak()
  }

  body
}

// Creamos linea para poder llamarla directamente
#let linea = line(length: 100%, stroke: 0.15pt)

// Crear cuadro para contenidos importantes
// Crea un cuadro con un signo de exclamacion
#let ojo(contenido) = {
    set align(center)

    // Crear una caja con el signo de exclamacion
    let excl = box(
        fill: rgb("#ffffff"),
        inset: 5pt,
        [
          #set align(horizon)
          #set align(center)
          #set text(36pt)
          #sym.excl
        ]
    )

    // Grilla donde ira de un lado la caja con el signo y del otro lado el contenido
    let grilla = grid(
                    columns: (40pt, auto),
                    [#excl], [
                        #set align(horizon)
                        #set align(left)
                        #contenido])

    // Caja que contiene la grilla
    box(
        inset: 10pt,
        width: auto,
        stroke: 0.25pt,
        grilla)
}
