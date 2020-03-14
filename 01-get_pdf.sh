#!/bin/bash
set -e

# source https://www.iledefrance.ars.sante.fr/coronavirus-covid-19-points-de-situation

# pdf saved in src
year=2020
src=src
mkdir -p $src

seq -w 3 $(date +%m) | while read month ; do
  month=$(echo $month | awk  ' { printf("%.2d\n",$1) }')
  seq -w 5 $(date +%d) | while read day ; do
    # pdf report url (not normalized)
    urlA=https://www.iledefrance.ars.sante.fr/system/files/2020-03/PointSituationCovid19_202003${day}.pdf
    urlB=https://www.iledefrance.ars.sante.fr/system/files/2020-03/Point-COVID19-202003${day}_0.pdf
    urlC=https://www.iledefrance.ars.sante.fr/system/files/2020-03/PointSituationCovid10_202003${day}.pdf
    for url in $urlA $urlB $urlC ; do
      if [ ! -f "${year}-${month}-${day}.pdf" ] ;then
      ( cd $src && curl -s --write "# Downloaded %{url_effective} %{size_upload} bytes in %{time_connect} seconds (%{speed_download} bytes/s)\n"  -L -f -o ${year}-${month}-${day}.pdf $url || true)
      fi
    done
  done
done
exit 0
