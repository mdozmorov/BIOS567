## ----setup, echo=FALSE, message=FALSE, warning=FALSE---------------------
# Set up the environment
library(knitr)
opts_chunk$set(cache.path='cache/', fig.path='img/', cache=F, tidy=T, fig.keep='high', echo=T, dpi=100, warnings=F, message=F, comment=NA, warning=F, results='as.is') #out.width=700, 
library(pander)
panderOptions('table.split.table', Inf)
set.seed(1)
library(dplyr)
options(stringsAsFactors = FALSE)
library(Biobase)

## ----eval=FALSE----------------------------------------------------------
## source("http://www.bioconductor.org/biocLite.R")
## biocLite()

## ----eval=FALSE----------------------------------------------------------
## library("Biobase")
## openVignette()

## ------------------------------------------------------------------------
?ExpressionSet
data("sample.ExpressionSet")
sample.ExpressionSet

## ------------------------------------------------------------------------
expression <- read.csv("data/genedata.csv")

dim(expression)
class(expression)
names(expression)[1:4]
head(expression)[1:3]
rownames(expression)[1:4]

## ------------------------------------------------------------------------
minimalSet <- ExpressionSet(assayData = as.matrix(expression))
minimalSet
exprs(minimalSet)[1:5, 1:2]
featureNames(minimalSet)[1:4]

## ------------------------------------------------------------------------
characteristics <- read.csv("data/phenodata.csv", row.names = 1)
summary(characteristics)
all.equal(rownames(characteristics), names(expression))

## ------------------------------------------------------------------------
metadata <- data.frame(labelDescription = c("Patient gender (Male or Female)", 
                                            "Tissue type (cirrhotic or cirrhotic without HCC)"), 
                       row.names = c("Gender", "Diagnosis"))
metadata
phenoChar <- new("AnnotatedDataFrame", data = characteristics, varMetadata = metadata)
phenoChar
pData(phenoChar)[1:5, ]
pData(phenoChar)$Gender[1:5]

## ------------------------------------------------------------------------
anotherSet <- ExpressionSet(assayData = as.matrix(expression), phenoData = phenoChar)
anotherSet
males <- anotherSet[, pData(anotherSet)$Gender == "Male"]
pData(males)$Gender

## ----eval=FALSE----------------------------------------------------------
## phony.pheno <- characteristics
## rownames(phony.pheno)[1] <- "wrong.sample.name"
## phenoPhony <- new("AnnotatedDataFrame", data = phony.pheno, varMetadata = metadata)
## phony.pheno[1:3, ]
## pData(phenoPhony)[1:3, ]
## errorSet <- ExpressionSet(assayData = as.matrix(expression), phenoData = phenoPhony)

## ------------------------------------------------------------------------
library(annotate)
library("GGHumanMethCancerPanelv1.db") 
withannoSet <- ExpressionSet(assayData = as.matrix(expression), phenoData = phenoChar, annotation = "GGHumanMethCancerPanelv1.db")
withannoSet

## ------------------------------------------------------------------------
featureNames(withannoSet) <- gsub("_01", "", featureNames(withannoSet))
symbol <- getSYMBOL(featureNames(withannoSet), annotation(withannoSet))
entrez <- getEG(featureNames(withannoSet), annotation(withannoSet))
entrez[1:10]
CpG <- mget(featureNames(withannoSet), env = GGHumanMethCancerPanelv1ISCPGISLAND)
CpG[1:5]

## ------------------------------------------------------------------------
experimentData <- new("MIAME", 
                      name      = "The Author", 
                      lab       = "Biostat lab", 
                      contact   = "theauthor@vcu.edu", 
                      title     = "Liver tissue study of cirrhosis vs non-HCC cirrhosis", 
                      abstract  = "Compare values between two liver tissue type", 
                      url       = "www.vcu.edu", 
                      pubMedIds = "PMC124", 
                      other     = list(notes = "Further information"))
experimentData
abstract(experimentData)
notes(experimentData)

## ------------------------------------------------------------------------
withexpSet <- ExpressionSet(assayData = as.matrix(expression), phenoData = phenoChar, annotation = "GGHumanMethCancerPanelv1.db", experimentData = experimentData)
withexpSet
experimentData(withexpSet)
abstract(experimentData(withexpSet))

## ------------------------------------------------------------------------
library(SummarizedExperiment)
?SummarizedExperiment

## ------------------------------------------------------------------------
### SummarizedExperiment
library(parathyroidSE)
#RNA sequencing reads 
data(parathyroidGenesSE)
se <- parathyroidGenesSE
se

## ------------------------------------------------------------------------
#Dimension of the SummarizedExperiment
dim(se)
#Get access to the counts of RNA sequencing reads, using assay function.
assay(se)[1:3,1:3]
#Dimensions of this assay is a matrix, which has the same dimensions as the SummarizedExperiment.
dim(assay(se))
#Get information about samples
colData(se)[1:3,1:6]
#dimension of column data
dim(colData(se))
#characteristics of the samples
names(colData(se))
#Get access to treatment column of sample characteristics
colData(se)$treatment

## ----session_info--------------------------------------------------------
diagnostics <- devtools::session_info()
platform <- data.frame(diagnostics$platform %>% unlist, stringsAsFactors = FALSE)
colnames(platform) <- c("description")
pander(platform)

packages <- as.data.frame(diagnostics$packages)
pander(packages[ packages$`*` == "*", ])

