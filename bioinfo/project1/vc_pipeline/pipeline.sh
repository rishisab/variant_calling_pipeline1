#!/bin/bash

# 1. Download data (if not available)
# prefetch SRR390728

# 2. Convert to fastq
# fasterq-dump SRR390728

# 3. Trim reads
fastp -i SRR390728_1.fastq -I SRR390728_2.fastq \
     -o SRR390728_1_trimmed.fastq \
     -O SRR390728_2_trimmed.fastq

# 4. Align
bwa mem drosophila_ref.fna SRR390728_1_trimmed.fastq SRR390728_2_trimmed.fastq > SRR390728_aligned.sam

# 5. Convert & sort
samtools view -Sb SRR390728_aligned.sam > SRR390728_aligned.bam
samtools sort SRR390728_aligned.bam -o SRR390728_sorted.bam
samtools index SRR390728_sorted.bam

# 6. Variant calling
bcftools mpileup -Ou -f drosophila_ref.fna SRR390728_sorted.bam | \
    bcftools call -mv -Oz -o SRR390728_variants.vcf.gz

echo "Pipeline complete!"
