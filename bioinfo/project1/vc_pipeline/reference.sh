#!/bin/bash

# Download drosophila genome (smallest part used)
wget https://ftp.ensembl.org/pub/release-109/fasta/drosophila_melanogaster/dna/Drosophila_melanogaster.BDGP6.54.dna.primary_assembly.2L.fa.gz

# Unzip
gunzip Drosophila_melanogaster.BDGP6.54.dna.primary_assembly.2L.fa.gz

# Rename
mv Drosophila_melanogaster.BDGP6.54.dna.primary_assembly.2L.fa drosophila_ref.fna

# Index
bwa index drosophila_ref.fna
samtools faidx drosophila_ref.fna

echo "Reference downloaded and indexed!"
