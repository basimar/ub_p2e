#!/bin/bash
#catmandu convert MARC --type ALEPHSEQ to MARC --type ALEPHSEQ --fix dsv01-export-p2e.fix < /opt/data/dsv01/dsv01_gl.seq > dsv01-export-p2e-check-856.seq
catmandu convert MARC --type ALEPHSEQ to MARC --type ALEPHSEQ --fix dsv01-export-p2e-portfolio1.fix < /opt/data/dsv01/dsv01_gl.seq > dsv01-export-p2e-portfolio1.seq
catmandu convert MARC --type ALEPHSEQ to MARC --type ALEPHSEQ --fix dsv01-export-p2e-portfolio2.fix < /opt/data/dsv01/dsv01_gl.seq > dsv01-export-p2e-portfolio2.seq
catmandu convert MARC --type ALEPHSEQ to MARC --type ALEPHSEQ --fix dsv01-export-p2e-portfolio3.fix < /opt/data/dsv01/dsv01_gl.seq > dsv01-export-p2e-portfolio3.seq
catmandu convert MARC --type ALEPHSEQ to MARC --type ALEPHSEQ --fix dsv01-export-p2e-portfolio4.fix < /opt/data/dsv01/dsv01_gl.seq > dsv01-export-p2e-portfolio4.seq
catmandu convert MARC --type ALEPHSEQ to MARC --type ALEPHSEQ --fix dsv01-export-p2e-database.fix < /opt/data/dsv01/dsv01_gl.seq > dsv01-export-p2e-database.seq
#catmandu convert MARC --type ALEPHSEQ to MARC --type ALEPHSEQ --fix dsv01-export-p2e-database2.fix < /opt/data/dsv01/dsv01_gl.seq > dsv01-export-p2e-database2.seq


cat dsv01-export-p2e-portfolio1.seq dsv01-export-p2e-portfolio2.seq dsv01-export-p2e-portfolio3.seq dsv01-export-p2e-portfolio4.seq > dsv01-export-p2e-portfolio.seq

cut -c1-9 dsv01-export-p2e-portfolio.seq | sort | uniq > dsv01-export-p2e-portfolio.sys
cut -c1-9 dsv01-export-p2e-database.seq | sort | uniq > dsv01-export-p2e-database.sys

sed -i 's/$/,Portfolio/' dsv01-export-p2e-portfolio.sys
sed -i 's/^/DSV01/' dsv01-export-p2e-portfolio.sys

sed -i 's/$/,DB/' dsv01-export-p2e-database.sys
sed -i 's/^/DSV01/' dsv01-export-p2e-database.sys

cat dsv01-export-p2e-portfolio.sys dsv01-export-p2e-database.sys > e_resource_input.csv

sort e_resource_input.csv | uniq -w 15  > e_resource_input_final_20201027.csv

exit 0
