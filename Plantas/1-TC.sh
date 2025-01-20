#!/bin/bash

source /home/ddelgadillo/miniforge3/etc/profile.d/conda.sh
source /home/ddelgadillo/miniforge3/etc/profile.d/mamba.sh

mamba activate plantASM



idx=TAME4



for k in `seq 21 2 63`
do
  mkdir $idx'-K'$k
  SOAPdenovo-63mer all -s $idx.config -K $k -o ./$idx'-K'$k/$idx'-K'$k -p 12
done

for k in `seq 65 2 111`
do
  mkdir $idx'-K'$k
  SOAPdenovo-127mer all -s $idx.config -K $k -o ./$idx'-K'$k/$idx'-K'$k -p 12
done
