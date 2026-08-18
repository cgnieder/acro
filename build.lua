-- Build script for "acro" files

-- Identify the bundle and module
bundle = ""
module = "acro"

-- Non-standard structure
docfiledir    = "./doc"
sourcefiledir = "./code"

installfiles = {"*.sty", "*.tex"}
sourcefiles  = installfiles
unpackfiles  = { }

-- Typeset only the main documentation file,
-- but make all sources available
docfiles     = {"acro-manual.cls", "**/*.tex"}
typesetfiles = {"acro-manual.tex"}