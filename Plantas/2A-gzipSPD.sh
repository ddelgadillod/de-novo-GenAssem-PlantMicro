#!/bin/bash


while read line
do
  echo $line
  mkdir -p $line/2-SPD-results
  
  cp $line/2-SPD/scaffolds.fasta $line/2-SPD-results/$line-Spd-scaff.fna
  cp $line/2-SPD/contigs.fasta $line/2-SPD-results/$line-Spd-cntgs.fna
  
  cd $line/2-SPD-results/
  
  gzip *.fna
  cd ..
  tar -czvf 2-SPD.tar.gz 2-SPD
  rm -rf 2-SPD
  cd /hpcfs/home/cursos/agrosavia/Arauca/Assemblies
done < genomesML