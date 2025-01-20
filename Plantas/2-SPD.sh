#!/bin/bash

source /home/ddelgadillo/miniforge3/etc/profile.d/conda.sh
source /home/ddelgadillo/miniforge3/etc/profile.d/mamba.sh

mamba activate plantASM


spades.py --isolate -o /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/TAME4/2-SPD \
          -1 /hpcfs/home/cursos/agrosavia/Arauca/Clean/A22/A22_1_val_1.fq.gz \
          -2 /hpcfs/home/cursos/agrosavia/Arauca/Clean/A22/A22_2_val_2.fq.gz \
          --checkpoints all \
          --trusted-contigs /hpcfs/home/cursos/agrosavia/Arauca/Assemblies/TAME4/1-TC/contig/TAME4-K85.contig.fasta.gz \
          -t 12 \
          -k 21 25 29 33 37 41 45 49 53 57 61 65 69 73 77 81 85 89 93 97 101 105 109  