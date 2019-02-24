PY=python
PANDOC=pandoc

BASEDIR=$(CURDIR)
OUTPUTDIR=$(BASEDIR)/output

help:
	@echo ' 																	  															'
	@echo 'Makefile for the Markdown CV                                       '
	@echo '                                                                   '
	@echo 'Usage:                                                             '
	@echo '   make pdf                         generate a PDF file						'

pdf:
	pandoc -s -f markdown-auto_identifiers \
	"$(BASEDIR)"/cv.md \
	-o "$(BASEDIR)/cv.tex" \
	--template="$(BASEDIR)/template.tex"
	xelatex cv
	bibtex cv
	xelatex cv
	xelatex cv

.PHONY: help pdf
