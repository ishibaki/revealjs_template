# Names of files.
files = \
		*.md\

# Directory of files
changed_files = manuscript/*

# Directory name of manuscript files
manuscript_dir = manuscript

# Directory name of output files
out_dir = out

# Filetype of default output
default_type = html

# Filename without filetype
output_file = out

# Reader arguments for pandoc
reader = -f markdown\

# general arguments
writer = --bibliography ~/.pandoc/library.bib\
		 --csl ~/.pandoc/apa-2.csl\
		 --filter pandoc-crossref\

# reveal.js specific arguments
revealjs = -t revealjs\
		   -s\
		   --slide-level=2\

# document specific arguments
document_args = -V papersize=a4\
				-N\

# docx specific arguments
docx = -t docx\
	   --reference-doc ~/.pandoc/reference.docx\
	   --filter pandoc-docx-pagebreakpy\

# PDF specific arguments
pdf = -t latex\
	  --pdf-engine=lualatex\
	  --template=eisvogel\
	  --toc\

# HTML5 specific arguments
html = -t html5\
	   -s\
	   --self-contained\
	   -c ~/.pandoc/github.css\
	   --toc\

pptx = -t pptx\
	   -s\
	   --standalone\
	   --slide-level=2\

all: $(changed_files)
	cd ./$(manuscript_dir); pandoc -o ../$(out_dir)/$(output_file).revealjs.$(default_type) $(reader) $(writer) $(revealjs) ./$(files); cd ..

%.revealjs: $(changed_files)
	cd ./$(manuscript_dir); pandoc -o ../$(out_dir)/$@.html $(reader) $(writer) $(revealjs) ./$(files); cd ..

%.docx: $(changed_files)
	cd ./$(manuscript_dir); pandoc -o ../$(out_dir)/$@ $(reader) $(writer) $(document_args) $(docx) ./$(files); cd ..

%.pdf: $(changed_files)
	cd ./$(manuscript_dir); pandoc -o ../$(out_dir)/$@ $(reader) $(writer) $(document_args) $(pdf) ./$(files); cd ..

%.html: $(changed_files)
	cd ./$(manuscript_dir); pandoc -o ../$(out_dir)/$@ $(reader) $(writer) $(document_args) $(html) ./$(files); cd ..

%.pptx: $(changed_files)
	cd ./$(manuscript_dir); pandoc -o ../$(out_dir)/$@ $(reader) $(writer) $(pptx) ./$(files); cd ..

ifeq ($(shell uname),Linux)
open:
	xdg-open ./$(out_dir)/$(output_file).revealjs.$(default_type)
else ifeq ($(shell uname),Darwin)
open:
	open ./$(out_dir)/$(output_file).revealjs.$(default_type)
else
open:
	./$(out_dir)/$(output_file).revealjs.$(default_type)
endif
