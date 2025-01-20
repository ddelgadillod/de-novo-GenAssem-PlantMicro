#!/bin/bash


source /hpcfs/home/cursos/agrosavia/miniforge3/etc/profile.d/conda.sh
source /hpcfs/home/cursos/agrosavia/miniforge3/etc/profile.d/mamba.sh
mamba activate AraucaAln



while read genotype
do
	#mkdir -p /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$genotype/1-TC/assem-stats
	quast -o /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$genotype/1-TC/contig-assem-stats -r /hpcfs/home/cursos/agrosavia/Arauca/Genome/GCA_000208745.2_Criollo_cocoa_genome_V2_genomic.fna -m 100 -t 8 -e --no-plots --no-html /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$genotype/1-TC/contig/*.fasta.gz
 
	quast -o /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$genotype/1-TC/scaff-assem-stats -r /hpcfs/home/cursos/agrosavia/Arauca/Genome/GCA_000208745.2_Criollo_cocoa_genome_V2_genomic.fna -m 100 -t 8 -e --no-plots --no-html /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$genotype/1-TC/scaff/*.fasta.gz
 
  seqkit stats -j 8 -T -a -o /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$genotype/1-TC/contig/Contig-Stats.csv /home/cursos/agrosavia/Arauca/Assemblies/$genotype/1-TC/contig/*.fasta.gz
  seqkit stats -j 8 -T -a -o /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$genotype/1-TC/scaff/Scaff-Stats.csv /home/cursos/agrosavia/Arauca/Assemblies/$genotype/1-TC/scaff/*.fasta.gz
  
  multiqc -o /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$genotype/1-TC/ /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/$genotype/1-TC/
done < geno2
