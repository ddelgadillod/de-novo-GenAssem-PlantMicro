#/bin/bash


source /home/ddelgadillo/miniforge3/etc/profile.d/conda.sh
source /home/ddelgadillo/miniforge3/etc/profile.d/mamba.sh

mamba activate bactASM


for i in $(seq 1 8; seq 33 35; seq 67 68; seq 107 114)
do

  mkdir Library$i
  
  cp /home/ddelgadillo/Datos-Bact/Ensamblajes/All/assembly_output/assemblies/Library$i/Library$i.fasta ./Library$i/
  
  ln -s /home/ddelgadillo/Datos-Bact/30-1087133126/00_fastq/Library$i'_R1_001.fastq.gz' Library$i/1-Library$i-R1.fastq.gz
  ln -s /home/ddelgadillo/Datos-Bact/30-1087133126/00_fastq/Library$i'_R2_001.fastq.gz' Library$i/1-Library$i-R2.fastq.gz

  trim_galore -q 20 -j 8 --length 50 --gzip -o Library$i/ --illumina --paired --basename trim-Library$i Library$i/1-Library$i-R1.fastq.gz Library$i/1-Library$i-R2.fastq.gz
  mkdir -p Library$i/QC
  
  lighter -t 8 -od Library$i/ -r Library$i/trim-Library$i'_val_1.fq.gz' -r Library$i/trim-Library$i'_val_2.fq.gz' -k 32 -maxcor 2  

  fastqc -o Library$i/QC/ --nogroup -t 12 Library$i/*.gz
  multiqc --outdir Library$i/QC/ Library$i/QC/
  mkdir Library$i/SpadesASM

  spades.py --isolate -o Library$i/SpadesASM \
    -1 Library$i/trim-Library$i'_val_1.fq.gz' \
    -2 Library$i/trim-Library$i'_val_1.fq.gz' \
	--careful \ 
    --checkpoints all \
	--tmp-dir .
    -t 12 \
    -k 21 25 29 33 37 41 45 49 53 57 61 65 69 73 77 81 85 89 93 97 101 105 109  

  cp Library$i/SpadesASM/scaffolds.fasta Library$i/Library$i.fasta
  
  seqkit seq -m 1000 -g -j 12 -o Library$i/Library$i-min1000.fna Library$i/Library$i.fasta
  
  bwa-mem2 index Library$i/Library$i-min1000.fna
  bwa-mem2 mem -t 12 -o Library$i/Library$i-R1R2.sam Library$i/Library$i-min1000.fna Library$i/trim-Library$i'_val_1.cor.fq.gz' Library$i/trim-Library$i'_val_2.cor.fq.gz'
  samtools sort -@ 12 -O BAM -o Library$i/Library$i-R1R2.bam Library$i/Library$i-R1R2.sam
  rm -rf Library$i/Library$i-R1R2.sam
  samtools coverage -o Library$i/Library$i-cov Library$i/Library$i-R1R2.bam
  
  mv Library$i/*report* Library$i/QC/
  rm -rf Library$i/*.fna.*
  
  echo Library$i 
  busco -i ./Library$i/Library$i-min1000.fna -o ./Library$i/BUSCO-Library$i-m1000-baci -m geno -l bacillales_odb10 -c 12
  prokka --cpus 12 --outdir Library$i/Annotation --prefix Library$i --locustag LT-Library$i --kingdom Bacteria --gcode 11 Library$i/Library$i-min1000.fna


done



mamba activate /home/ddelgadillo/miniconda3/envs/dbcan

for i in $(seq 1 8; seq 33 35; seq 67 68; seq 107 114)
do
  echo Library$i 
  run_dbcan ./Library$i/Library$i-min1000.fna prok --verbose --dia_cpu 12 --hmm_cpu 12 --db_dir /home/ddelgadillo/Celulasas/DB/db --out_dir ./Library$i/dbCAN --tools 'all'
done
