###################################################################################################################################################################
#                                                                                                                                                                 #
#     R script from Gemma for dysmenorrhea EWAS (using ewaff)                                                                                                      #
#     Edited by Flo on 04/10/2021 for EWAS analysis remotely                                                                                                      #
#                                                                                                                                                                 #
###################################################################################################################################################################

# This forms the first part of the scripts required to perform an EWAS analysis using the ewaff package with DMR analysis using dmrff. Only some of the analysis 
# does not require packages from Bioconductor and requires the large data stored on BlueCrystal3 (the ewaff part of the analysis). So, we generate the data we need 
# using the large data held on BC3 using this script, then utilise the datasets generated to perform the additional analyses using Bioconductor packages using script
# number 2 (GO/KEGG Script). Be sure to use a version of R where devtools or ewaff/dmrff are already installed (BC3 too old for devtools updated for 4.0.3).

setwd("/newhome/ti19522/EWAS/alspac_menstruation_project/dysmen_ewaff") # Set your working directory where your results will be saved
chooseCRANmirror(ind = 68)

# Install the following packages if you don't already have them:
install.packages("stringr",repos = "http://cran.us.r-project.org")
library(stringr)
install.packages("dplyr",repos = "http://cran.us.r-project.org")
library(dplyr)
install.packages("tableone",repos = "http://cran.us.r-project.org")
library(tableone)

# In addition, please install the ewaff and dmrff packages, which are still in development and not yet available on CRAN:
library(ewaff)
library(dmrff)

# Finally, install the correct package to provide annotation for your methylation data. If you have 450k:
annotation <- readRDS("annotation.rds")

# Tell R to use 4 cores instead of 1
options(mc.cores=4)

# Load in annotation file from bluecrystal
data(list="annotation")

# Load the phenotype data (please replace the file name and directory - this file should be saved in your user area (not the RDSF))
pheno <- read.csv("Pheno.csv")

# Load samplesheet (describes methylation data)
load("/panfs/panasas01/dedicated-mrcieu/studies/latest/alspac/epigenetic/methylation/450k/aries/released/2016-05-03/data/samplesheet/data.Robj")
qletB <- samplesheet$ALN[which(samplesheet$QLET=="B")]             # Find alns for multiple pregnancies
samplesheet <- samplesheet[-which(samplesheet$ALN %in% qletB),]    # Remove multiple pregnancies
samplesheet <- samplesheet[samplesheet$time_point %in% c("15up"),] # Select adolescent methylation timepoint
samplesheet <- samplesheet[is.na(samplesheet$duplicate.rm),]

# Load methylation data (meth)
load("/panfs/panasas01/dedicated-mrcieu/studies/latest/alspac/epigenetic/methylation/450k/aries/released/2016-05-03/data/betas/data.Robj")
norm.beta.random <- norm.beta.random[,samplesheet$Sample_Name]

# Load detection P-values (used to filter out probes with a high detection P-value)
load("/panfs/panasas01/dedicated-mrcieu/studies/latest/alspac/epigenetic/methylation/450k/aries/released/2016-05-03/data/detection_p_values/data.Robj")
detp <- detp[,samplesheet$Sample_Name]

# Create list of probes to filter (remove probes with high detection P-values, SNPs and those on the sex chromosomes)
pvalue.over.0.05 <- detp > 0.05
count.over.0.05 <- rowSums(sign(pvalue.over.0.05))
probes.to.exclude.p <- rownames(detp)[which(count.over.0.05 > ncol(detp)*0.05)]
XY <- as.character(row.names(annotation)[which(annotation$chr %in% c("chrX", "chrY"))])
SNPs.and.controls <- as.character(row.names(norm.beta.random))[grep("rs|ch", as.character(row.names(norm.beta.random)))]

# Load and add the cell counts
houseman.cell.counts <- read.table("/panfs/panasas01/dedicated-mrcieu/studies/latest/alspac/epigenetic/methylation/450k/aries/released/2016-05-03/data/derived/cellcounts/houseman/data.txt",header=T)
pheno <- merge(pheno,houseman.cell.counts,by="Sample_Name",all=F)

# Subset methylation dataset
meth <- norm.beta.random[,match(pheno$Sample_Name,colnames(norm.beta.random))]
meth <- meth[-which(row.names(meth) %in% c(XY,SNPs.and.controls,probes.to.exclude.p)),]

# Tidy up
rm(houseman.cell.counts,norm.beta.random,detp,count.over.0.05,pvalue.over.0.05,probes.to.exclude.p,samplesheet,samplesheet.M,samplesheet.D)

# Remove outliers using the IQR*3 method
meth <- ewaff.handle.outliers(meth, method="iqr")[[1]]

# Run the EWASs (including generation of surrogate variables to control for technical batch) and save the results (replace painD with the name of your trait 
# of interest)

res <- ewaff.sites(methylation ~ dysmen_ewas,
                   variable.of.interest="dysmen_ewas",
                   methylation=meth,
                   data=pheno,
                   generate.confounders="sva",
                   method="limma",
                   n.confounders=10)
res <- merge(res$table,annotation,by="row.names",all=F)
save(res,file="dysmen_ewas.Rdata") # Change filename as needed

# Run DMR analysis

dmrs <- dmrff(estimate=res$estimate,
              se=res$se,
              p.value=res$p.value,
              methylation=meth,
              chr=res$chr,
              pos=res$pos,
              maxgap=500,
              verbose=T)
save(dmrs,file="dysmen_DMRres.Rdata") # Change filename as needed

# Check enrichment in EWAS catalog

lookup_cpgs <- function(dmr){ # Create function to find CpGs from DMRs
  chr <- dmr[1]
  start <- dmr[2]
  end <- dmr[3]
  row.names(annotation)[annotation$chr==chr & annotation$pos>=start & annotation$pos<=end]
}

dmr_hits <- dmrs[dmrs$p.adjust<0.05&dmrs$n>=2,] # Find all DMRs with adjusted P<0.05 and more than or = to 2 CpGs within the DMR

cpgs <- apply(dmr_hits[,c("chr","start","end")],1,lookup_cpgs) # List the CpGs in each DMR
cpgs <- unlist(cpgs)

require(data.table)
ewascat <- fread("/newhome/ti19522/common_files/ewascatalog-results.txt")

terms <- unique(ewascat$Trait[ewascat$CpG %in% cpgs])

enrichment <- function(term){ # Create function to run a Fisher's test to test for enrichment of CpGs in EWAS catalog terms
  ITIH <- cpgs[cpgs %in% ewascat$CpG[ewascat$Trait==term]]
  ITNH <- ewascat$CpG[ewascat$Trait==term][-which(ewascat$CpG[ewascat$Trait==term] %in% ITIH)]
  NTIH <- cpgs[-which(cpgs %in% ITIH)]
  NTNH <- D_res$Row.names[-which(D_res$Row.names%in% c(cpgs, ewascat$CpG[ewascat$Trait==term]))]
  res <- fisher.test(matrix(c(length(ITIH),length(ITNH),length(NTIH),length(NTNH)),nrow=2))
  data.frame(term=term,
             ITIH=length(ITIH),
             ITNH=length(ITNH),
             NTIH=length(NTIH),
             NTNH=length(NTNH),
             or=res$estimate,
             lci=res$conf.int[1],
             uci=res$conf.int[2],
             p=res$p.value)
}

enrichment_res <- bind_rows(lapply(terms,enrichment))
enrichment_res$fdr <- p.adjust(enrichment_res$p,method="fdr")
enrichment_res$percentage <- 100*(enrichment_res$ITIH/(enrichment_res$ITNH+enrichment_res$ITIH))
enrichment_res <- enrichment_res[order(enrichment_res$percentage,decreasing=T),]
enrichment_res[enrichment_res$fdr<0.05,]
save(enrichment_res,file="dysmen_EWAScatEnrichmentres.Rdata")
