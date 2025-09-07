#import "../template.typ": classic
// Una vez instalado utilizar: #import "@local/unrn-template:1.0.0": classic 

// Valores por defecto
#show: classic.with(
  title: "Template UNRN",
  subtitle: "Esto es un ejemplo",
  toc: true,
  font: "IBM Plex Sans",
  monofont: "IBM Plex Mono",
  cover: true,
  authors: ("Autor 1", "Autor 2",),
  subject: "Materia de ejemplo",
  career: "Ingenería en Templates",
  year: "2077",
  date: "1 de enero de 2077",
  version: "v1.0"
)

= Prueba

#lorem(20)

== Prueba 2

#lorem(20)
