---
layout: page
title: Differential expression
---

Differential expression slides, [HTML](/BIOS567/assets/presentation_diffexpression/diffexpression.html), [PDF](/BIOS567/assets/presentation_diffexpression/diffexpression.pdf), [Rmd](/BIOS567/assets/presentation_diffexpression/diffexpression.Rmd)

Gene ID conversion slides, [HTML](/BIOS567/assets/presentation_diffexpression/annotation.html), [PDF](/BIOS567/assets/presentation_diffexpression/annotation.pdf), [Rmd](/BIOS567/assets/presentation_diffexpression/annotation.Rmd)

Multiple testing correction slides, [HTML](/BIOS567/assets/presentation_diffexpression/multipletesting.html), [PDF](/BIOS567/assets/presentation_diffexpression/multipletesting.pdf), [Rmd](/BIOS567/assets/presentation_diffexpression/multipletesting.Rmd)

### Exercises

Differential expression using `limma`, [Rmd](/BIOS567/assets/presentation_diffexpression/DiffExpr_Limma.Rmd) , [HTML](/BIOS567/assets/presentation_diffexpression/DiffExpr_Limma.html)

Differential expression using `sam`, [Rmd](/BIOS567/assets/presentation_diffexpression/DiffExpr_SAM.Rmd) , [HTML](/BIOS567/assets/presentation_diffexpression/DiffExpr_SAM.html)

Gene ID conversion using `biomaRt`, [biomaRt.R](/BIOS567/assets/presentation_diffexpression/biomaRt.R)

Extracting gene coordinates using `annotables`, [grch37_gene_classes_to_BED.R](/BIOS567/assets/presentation_diffexpression/grch37_gene_classes_to_BED.R)

Multiple testing correction demo, [multitest.R](/BIOS567/assets/presentation_diffexpression/multitest.R)

### References

- Original `limma` paper

Smyth, Gordon K. “**Linear Models and Empirical Bayes Methods for Assessing Differential Expression in Microarray Experiments.**” Statistical Applications in Genetics and Molecular Biology 3 (2004) [http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.412.1072&rep=rep1&type=pdf](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.412.1072&rep=rep1&type=pdf)

- `limma` package [https://bioconductor.org/packages/release/bioc/html/limma.html](https://bioconductor.org/packages/release/bioc/html/limma.html) and highly useful manual (chapters 8, 9) [https://bioconductor.org/packages/release/bioc/vignettes/limma/inst/doc/usersguide.pdf](https://bioconductor.org/packages/release/bioc/vignettes/limma/inst/doc/usersguide.pdf)

- Most current overview of `limma` philosophy and capabilities

Ritchie, Matthew E., Belinda Phipson, Di Wu, Yifang Hu, Charity W. Law, Wei Shi, and Gordon K. Smyth. “**Limma Powers Differential Expression Analyses for RNA-Sequencing and Microarray Studies.**” Nucleic Acids Research 2015 [http://nar.oxfordjournals.org/content/43/7/e47.long](http://nar.oxfordjournals.org/content/43/7/e47.long)

- Original `sam` paper

Tusher, V. G., R. Tibshirani, and G. Chu. “**Significance Analysis of Microarrays Applied to the Ionizing Radiation Response.**” PNAS 2001 [http://www.pnas.org/content/98/9/5116.long]
(http://www.pnas.org/content/98/9/5116.long)

- `samr` package [https://cran.r-project.org/web/packages/samr/index.html](https://cran.r-project.org/web/packages/samr/index.html)

- Original q-value paper

Storey, John D., and Robert Tibshirani. “**Statistical Significance for Genomewide Studies.**” PNAS 2003 [http://www.pnas.org/content/100/16/9440.long](http://www.pnas.org/content/100/16/9440.long)

- A two-page overview of multiple testing correction

Krzywinski, Martin, and Naomi Altman. “**Points of Significance: Comparing Samples—part II.**” Nature Methods 2014 [http://www.nature.com/nmeth/journal/v11/n4/full/nmeth.2900.html](http://www.nature.com/nmeth/journal/v11/n4/full/nmeth.2900.html)

- An overview of the batch effect problem

Leek, Jeffrey T., et. al., and Rafael A. Irizarry. “**Tackling the Widespread and Critical Impact of Batch Effects in High-Throughput Data.**” Nature Reviews. 2010 [http://www.nature.com/nrg/journal/v11/n10/abs/nrg2825.html](http://www.nature.com/nrg/journal/v11/n10/abs/nrg2825.html)

- Original ComBat paper

Johnson, W. Evan, Cheng Li, and Ariel Rabinovic. “**Adjusting Batch Effects in Microarray Expression Data Using Empirical Bayes Methods.**” Biostatistics 2007 [http://biostatistics.oxfordjournals.org/content/8/1/118.long](http://biostatistics.oxfordjournals.org/content/8/1/118.long)

- SVA paper

Leek, Jeffrey T., and John D. Storey. “**Capturing Heterogeneity in Gene Expression Studies by Surrogate Variable Analysis.**” PLoS Genetics 2007 [http://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.0030161](http://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.0030161)



