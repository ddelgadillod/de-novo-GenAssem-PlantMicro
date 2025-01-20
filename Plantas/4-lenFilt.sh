#!/bin/bash

source /home/ddelgadillo/miniforge3/etc/profile.d/conda.sh
source /home/ddelgadillo/miniforge3/etc/profile.d/mamba.sh

mamba activate plantASM

while read line
do 
  echo $line
  #mkdir -p /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$line/4-lenFilt
  seqkit seq -m 1000 -g -j 1 -o /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$line/4-lenFilt/$line-Spd-filt1000.fna.gz /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$line/3-Krkn-Dec/$line-Spd-NoCont.fna.gz
done < genomesML