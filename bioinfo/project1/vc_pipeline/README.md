Variant Calling Pipeline
📖 Overview

This repository contains a simple end-to-end variant calling pipeline built using:

fastp for quality control

BWA for sequence alignment

Samtools for format conversion, sorting, and indexing

BCFtools for variant calling

It’s a lightweight demonstration of a standard bioinformatics workflow for read alignment and SNP/indel detection.


📁 Directory Structure
variant_calling_pipeline/
├── data/                # Raw FASTQ files
├── reference/           # Reference genome (.fna)
├── results/             # Trimmed reads, BAM, BCF, and VCF outputs
├── pipeline.sh          # Main automation script
└── README.md            # Project documentation


⚙️ Dependencies

Make sure these tools are installed before running the pipeline:
| Tool     | Version Tested | Install Command             |
| -------- | -------------- | --------------------------- |
| fastp    | ≥ 0.23.2       | `sudo apt install fastp`    |
| BWA      | ≥ 0.7.17       | `sudo apt install bwa`      |
| Samtools | ≥ 1.13         | `sudo apt install samtools` |
| BCFtools | ≥ 1.13         | `sudo apt install bcftools` |

🧩 Pipeline Steps

The pipeline performs these steps in order:

Quality Control: Trim low-quality bases and adapters using fastp.

Reference Indexing: Prepare the reference genome with bwa index and samtools faidx.

Alignment: Map reads to the reference using bwa mem.

File Conversion: Convert .sam to .bam using samtools view.

Sorting: Sort the BAM file for downstream analysis.

Indexing: Create a BAM index with samtools index.

Variant Calling: Generate BCF with bcftools mpileup and bcftools call.

VCF Conversion: Convert .bcf to .vcf format using bcftools view.


▶️ Usage

Clone the repository:
git clone https://github.com/<your-username>/variant_calling_pipeline.git
cd variant_calling_pipeline

Make the pipeline executable:
chmod +x pipeline.sh

Run the pipeline:
./pipeline.sh

📊 Output Files

After running, you’ll find:
| File               | Description        |
| ------------------ | ------------------ |
| `*_trimmed.fastq`  | Cleaned reads      |
| `*_aligned.sam`    | Alignment file     |
| `*_aligned.bam`    | Binary alignment   |
| `*_sorted.bam`     | Sorted BAM file    |
| `*_sorted.bam.bai` | BAM index          |
| `*_variants.bcf`   | Raw variant calls  |
| `*_variants.vcf`   | Final variant list |

Notes

You can replace the reference genome and FASTQ files with your own samples.

If you use gzip-compressed references, make sure to decompress or use bgzip before indexing.

This is for educational purposes — not for clinical or publication-grade analysis.

👨‍💻 Author

Rishikesh indraguru
Learning bioinformatics & building simple reproducible pipelines 🚀

🧾 License

This project is released under the MIT License.

Acknowledgments

Drosophila melanogaster genome: Obtained from Ensembl.

GitHub: For hosting the repository.

The bioinformatics tools used in this pipeline: fastp, bwa, samtools, bcftools.

ChatGPT: For assistance in developing and refining the pipeline scripts and documentation.
