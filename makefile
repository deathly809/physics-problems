all:
	pdflatex problems.tex
	while grep 'Rerun to get ' $*.log ; do pdflatex $< ; done

%.ind: %.idx
	makeindex problems.aux

%.bbi: %.aux
	bibtex problems.aux
    
