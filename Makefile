
LATEX=latex
BIBTEX=bibtex

aux:=thesis.aux thesis.bbl thesis.toc thesis.blg

.PHONY: all clean
all: thesis.dvi

thesis.dvi: thesis.tex thesis.bbl

thesis.ps: thesis.dvi
	dvips -o $@ $<

%.dvi: %.tex
	$(LATEX) $<

%.bbl: %.aux 
	$(BIBTEX) $*
	$(LATEX) $*.tex

%.blg: %.tex 
	$(BIBTEX) $*

%.toc: %.tex
	$(LATEX) $<

%.aux: %.tex
	$(LATEX) $<

clean:
	-rm $(aux) thesis.dvi thesis.log thesis.ps
