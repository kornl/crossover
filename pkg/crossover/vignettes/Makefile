
all: pdf

pdf: crossover.pdf

pdfclean:
	rm -f crossover.pdf

clean:
	rm -f *.tex *.bbl *.blg *.aux *.out *.log *.idx *.toc *.ind *.ilg *.loa *.lof *.lot

crossover.pdf: knitr/crossover.Rnw
	./createKnitrVignette.sh crossover.Rnw

