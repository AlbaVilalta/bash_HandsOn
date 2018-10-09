## Author: Alba Vilalta
## Date: 18/09/2018
## Bash Hands-On - Exercise 1

wget https://github.com/dgarrimar/teaching/raw/master/uvic/AdvBI_2018/data/exercises/bash/TAIR9_mRNA.bed #em descarrego l'arxiu TAIR9_mRNA.bed
ls #comprovo que s'ha descarregat
less TAIR9_mRNA.bed #obro el document
q #surto de la vista
gzip TAIR9_mRNA.bed #comprimeixo l'arxiu
zcat TAIR9_mRNA.bed #obro l'arxiu comprimit
gunzip TAIR9_mRNA.bed #descomprimeixo l'arxiu
grep chr1 TAIR9_mRNA.bed | grep + | sort | uniq | wc -l 
cut -f11 TAIR9_mRNA.bed | head | sed 's/,/ /g' | awk '{print$NF}' | sort -nr | uniq
grep chr1 TAIR9_mRNA.bed | cut -f11 | sed 's/,/\t/g' | fmt -1 | sort -nr | head
grep chr1 TAIR9_mRNA.bed | cut -f4,10 | sort -k2,2 -nr | head



