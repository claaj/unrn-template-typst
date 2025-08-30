default: create-dir copy-files

VERSION := "1.0.0"
PACKAGE_DIR := "~/.local/share/typst/packages/local/unrn-template/" + VERSION + "/"

create-dir:
  @echo Creando directorio del template ...
  @mkdir -p {{PACKAGE_DIR}}
  
copy-files:
  @echo Copiando template v{{VERSION}} ...
  @cp -r images/ template.typ typst.toml LICENSE {{PACKAGE_DIR}}
  @echo Template listo!

build-example:
  @mkdir build
  @typst compile --root .. examples/example.typ build/example.pdf

build-example-image:
  @mkdir -p build
  @typst compile --root .. examples/example.typ build/example-{p}.png --ppi 72
