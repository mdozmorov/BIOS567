---
layout: page
title: Quality control
---

Experimental design slides, [HTML](/BIOS567/assets/presentation_ExpDesign/presentation_ExpDesign.html), [Rmd](/BIOS567/assets/presentation_ExpDesign/presentation_ExpDesign.Rmd)

QC spotted (two-channel) arrays slides, [HTML](/BIOS567/assets/presentation_Quality/Quality_spotted.html), [PDF](/BIOS567/assets/presentation_Quality/Quality_spotted.pdf), [Rmd](/BIOS567/assets/presentation_Quality/Quality_spotted.Rmd)

QC Affymetrix (single-channel) arrays slides, [HTML](/BIOS567/assets/presentation_Quality/Quality_affy.html), [PDF](/BIOS567/assets/presentation_Quality/Quality_affy.pdf), [Rmd](/BIOS567/assets/presentation_Quality/Quality_affy.Rmd)

### Exercises

- `MAplots_QC_spotted.R` - Reading in two spotted arrays, playing with regular and Bland-Altman plots. [code](/BIOS567/assets/presentation_Quality/MAplots_QC_spotted.R), [data](/BIOS567/assets/presentation_Quality/spotted.zip)

- `MAplots_affy.R` - constructing ExpressionSet, visualizing it as scatterplot, MAplot, smoothscatter. Volcano plot. [code](/BIOS567/assets/presentation_Quality/MAplots_affy.R), [data](/BIOS567/assets/presentation_Quality/eset.zip)

- `Affy_QC.R` - reading CEL files, plotting probes, boxplots, affyPLM visualization, average background, percent present, 3'/5' ratio. [code](/BIOS567/assets/presentation_Quality/Affy_QC.R), [data](/BIOS567/assets/presentation_Quality/affy.zip)

- `LOF_code.R` - lack of fit test using Affymetrix spike-in [data](/BIOS567/assets/presentation_Quality/12_13_02_U133A_Mer_Latin_Square_Expt4_R1.CEL.gz), [code](/BIOS567/assets/presentation_Quality/LOF_code.R)

# References

- Quality Assessment of Exon and Gene 1.0 ST Arrays (pdf, 180 KB) [http://www.affymetrix.com/support/technical/whitepapers/exon_gene_arrays_qa_whitepaper.pdf](http://www.affymetrix.com/support/technical/whitepapers/exon_gene_arrays_qa_whitepaper.pdf)

- Manufacturing Quality Control and Validation Studies of GeneChip® Arrays (pdf, 3.28 MB) [http://www.affymetrix.com/support/technical/technotes/manufacturing_quality_technote.pdf](http://www.affymetrix.com/support/technical/technotes/manufacturing_quality_technote.pdf)

