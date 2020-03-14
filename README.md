# extract-data

![Evolution Nb Cas IDF](https://raw.githubusercontent.com/pli01/extract-data/data/data/data.png)

[source www.iledefrance.ars.sante.fr](https://www.iledefrance.ars.sante.fr/coronavirus-covid-19-points-de-situation)


# Steps
```
* 01-get_pdf.sh: download pdf report from ars.sante.fr
* 02-convertpdftotext.sh: convert pdf to text
* 03-extract-from-text.sh: extract value from text
* 04-graph-data.sh: generate png graph
* 05-commit-data.sh: commit png
```

## requirements
```
curl: download src
pdftotext : from docker kalledk/pdftotext
gnuplot: from docker remuslazar/gnuplot
git: commit
travis: execute daily
```
