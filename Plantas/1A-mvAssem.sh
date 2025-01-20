#!/bin/bash

mkdir contig

mkdir scaff

idx=$1

for i in $(seq 21 2 63)
do
	mv $idx-K$i/$idx-K$i.contig contig/$idx-K$i.contig.fasta
	mv $idx-K$i/$idx-K$i.scafSeq scaff/$idx-K$i.scaff.fasta

done
