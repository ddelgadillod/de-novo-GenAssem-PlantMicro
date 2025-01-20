#!/bin/bash



source /hpcfs/home/cursos/agrosavia/miniforge3/etc/profile.d/conda.sh
source /hpcfs/home/cursos/agrosavia/miniforge3/etc/profile.d/mamba.sh

mamba activate AraucaAln


while read line
do 
  echo $line
  quast -r /hpcfs/home/cursos/agrosavia/Arauca/Genome/GCA_000208745.2_Criollo_cocoa_genome_V2_genomic.fna -o $line/7-Quast --fragmented -t 12 --space-efficient --no-plots --no-html $line/4-lenFilt/$line-Spd-filt500.fna
  
  rm -rf /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$line/7-Quast/contigs_reports/minimap_output
  
  mv $line/7-Quast $line/7-Quast-Criollo
  
  quast -r /hpcfs/home/cursos/agrosavia/Arauca/Genome/Sca6/GCA_035896635.1_ASM3589663v1_genomic.fna.gz -o $line/8-Quast-Sca6 --fragmented -t 12 --space-efficient --no-plots --no-html $line/4-lenFilt/$line-Spd-filt500.fna
  rm -rf /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$line/8-Quast-Sca6/contigs_reports/minimap_output

  
done < genomesML

