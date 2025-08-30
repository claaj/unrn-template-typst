#import "../template.typ": proyecto
// Una vez instalado utilizar: #import "@local/unrn-template:1.0.0": proyecto 

// Valores por defecto
#show: proyecto.with(
  titulo: "Template UNRN",
  subtitulo: "Esto es un ejemplo",
  indice: true,
  fuente: "IBM Plex Sans",
  fuente_mono: "IBM Plex Mono",
  caratula: true,
  autores: ("Autor 1", "Autor 2",),
  materia: "Materia de ejemplo",
  carrera: "Ingenería en Templates",
  año: "2077",
  fecha: "1 de enero de 2077",
  version: "v1.0"
)

= Prueba

#lorem(20)

== Prueba 2

#lorem(20)
