#!/bin/bash



mkdir -p /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/Draft/Krkn-Cont

while read line
do
  echo $line

  cd /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$line/3-Krkn-Dec/
  
  gzip *.fna
 
  ln -s  $line-Spd-NoCont.fna.gz /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/Draft/Krkn-Cont/$line-Spd-NoCont.fna.gz
  
  cd /hpcfs/home/cursos/agrosavia/Arauca/Assemblies
  
  
  #seqkit seq -m 1000 -g -j 12 -o Library$i/Library$i-min1000.fna Library$i/Library$i.fasta
  #busco -i ./Library$i/Library$i-min1000.fna -o ./Library$i/BUSCO-Library$i-m1000-baci -m geno -l bacillales_odb10 -c 12
  
  
  
done < genomesML