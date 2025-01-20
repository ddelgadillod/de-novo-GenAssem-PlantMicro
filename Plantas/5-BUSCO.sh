#!/bin/bash


source /home/ddelgadillo/miniforge3/etc/profile.d/conda.sh
source /home/ddelgadillo/miniforge3/etc/profile.d/mamba.sh

mamba activate plantASM

while read line
do
  echo $line
  
  busco -i $line/4-lenFilt/$line-Spd-filt500.fna -o $line/5-BUSCO -m geno -l eukaryota_odb10 -c 12 -f
  
  busco -i $line/4-lenFilt/$line-Spd-filt500.fna -o ./$line/6-BUSCO -m geno -l embryophyta_odb10 -c 12 -f
  
 
done < genomesML

