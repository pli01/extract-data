all: get-pdf convert-pdf extract-data graph-data
get-pdf:
	bash 01-get_pdf.sh
convert-pdf:
	bash 02-convertpdftotext.sh
extract-data:
	bash 03-extract-from-text.sh
graph-data:
	bash 04-graph-data.sh
commit-data:
	bash 05-commit-data.sh
