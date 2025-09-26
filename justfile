default: create-dir copy-files

VERSION := "1.0.0"
PLUGIN_DIR := "~/.local/share/typst/packages/local/unrn-template/"
PACKAGE_DIR := PLUGIN_DIR + "/" + VERSION + "/"
PANDOC_DIR := "~/.local/share/pandoc/templates/"

create-dir:
  @echo Creando directorio del template ...
  @mkdir -p {{PACKAGE_DIR}}
  @mkdir -p {{PANDOC_DIR}}
  
copy-files:
  @echo Copiando template v{{VERSION}} ...
  @cp -r images/ template.typ typst.toml LICENSE {{PACKAGE_DIR}}
  @echo Paquete de typst listo!
  @cp unrn.typ {{PANDOC_DIR}}
  @echo Template pandoc listo! 

build-example:
  @mkdir -p build
  @typst compile --root .. examples/example.typ build/example.pdf

uninstall:
  @rm -r {{PLUGIN_DIR}} 
  @rm {{PANDOC_DIR}}/unrn.typ

build-md-example:
  @mkdir -p build
  @pandoc examples/example.md --wrap=none --pdf-engine=typst --resource-path=images --template=unrn.typ -o build/example.pdf

build-example-image:
  @mkdir -p build
  @typst compile --root .. examples/example.typ build/example-{p}.png --ppi 72
