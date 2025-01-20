#!/bin/bash




mkdir -p /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/Draft/Krkn-Cont

while read line
do
  echo $line

  cd /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$line/
  
  mv 5-BUSCO 5-BUSCO-euk
  rm -rf 5-BUSCO-euk/logs
 
  mv 6-BUSCO 6-BUSCO-emb
  rm -rf 5-BUSCO-euk/logs
  
  cd 5-BUSCO-euk
  cp run_eukaryota_odb10/short_summary.txt .
  tar czvf run_eukaryota_odb10.tar.gz run_eukaryota_odb10
  
  
  
  cd ../6-BUSCO-emb
  cp run_embryophyta_odb10/short_summary.txt .
  tar czvf run_embryophyta_odb10.tar.gz run_embryophyta_odb10
  
  
  
  cd /hpcfs/home/cursos/agrosavia/Arauca/Assemblies
  
done < genomesML