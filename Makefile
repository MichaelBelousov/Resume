LC=latexmk -pdf
LATEXMKFLAGS=--shell-escape
NAME=MichaelBelousov_resume
GARBAGE= *.aux *.log *.fls *.fdb* data/*.csvdat
# TODO: locally install the latextools module,
# TODO: add some vim bindings for generating tables, etc
LATEXTOOLS=../../latextools

# TODO: maybe use 'yes "" | make' or add config flags to make non-interactive
# UPDATE: turns out -interactive=batchmode is not what I want, I'll search further

all: pdf

###########################################

pdf: $(NAME).pdf

$(NAME).pdf: resume.pdf $(DATA)
	@mv resume.pdf $(NAME).pdf
	@echo "produced $(NAME).pdf"

resume.pdf: resume.tex
	$(LC) resume.tex $(LATEXMKFLAGS)

###########################################

clean:
	rm -f $(GARBAGE)

ultraclean: clean
	rm -f $(NAME).pdf

.PHONY: clean ultraclean all
