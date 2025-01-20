#!/bin/bash


source /home/ddelgadillo/miniforge3/etc/profile.d/conda.sh
source /home/ddelgadillo/miniforge3/etc/profile.d/mamba.sh

mamba activate plantASM

while read line
do 
  echo $line
  mkdir -p /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$line/3-Krkn-Dec/
  
  cd /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$line/3-Krkn-Dec/
  
  
  kraken2 --db /hpcfs/home/cursos/agrosavia/Arauca/Kraken/k2_pluspf/ --threads 12 --use-names --confidence 0.1 --report $line-cont-report --unclassified-out $line-Spd-NoCont.fna --classified-out $line-Cont.fna --output $line-k2.out --gzip-compressed ../2-SPD-results/$line-Spd-scaff.fna.gz

  cd /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/
done < genomesML