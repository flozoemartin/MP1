###################################################################################################################################################################
#                                                                                                                                                                 #
#     R script from Gemma for menorrhagia EWAS (using ewaff)                                                                                                      #
#     Edited by Flo on 04/10/2021 for GO/KEGG Analysis locally                                                                                                    #
#                                                                                                                                                                 #
###################################################################################################################################################################

# This forms the second part of the scripts required to perform an EWAS analysis using the ewaff package with DMR analysis using dmrff. As discussed at the start 
# of the last script, the parts of the analysis that require packages from Bioconductor cannot be performed on BlueCrystal3, as it is now outdated for these packages.
# To get around this issue, we generate the data we need using the large data held on BC3 using script #1 in this series, then utilise the datasets generated to 
# perform the additional analyses using Bioconductor packages.

setwd("/Users/ti19522/Downloads/bluecrystal_files/results/Menorrhagia/ewaff") # Set working directory to the file where the ewaff data is pulled from BC

# Install/load the necessary packages for the analysis
library(stringr)
library(dplyr)
library(tableone)
library(devtools)

install_github("perishky/ewaff")
library(ewaff)
install_github("perishky/dmrff")
library(dmrff)

# Install the correct package to provide annotation for your methylation data. For 450k:
if (!require(IlluminaHumanMethylation450kanno.ilmn12.hg19, quietly=T)) {
  install.packages("BiocManager")
  BiocManager::install("IlluminaHumanMethylation450kanno.ilmn12.hg19")
}

data(list="IlluminaHumanMethylation450kanno.ilmn12.hg19")
data(Locations)
data(Other)
annotation <- cbind(as.data.frame(Locations), as.data.frame(Other))

# Then load in the data obtained from the ewaff analysis run on BlueCrystal:
load("menorr_ewas.Rdata")
load("menorr_DMRres.Rdata")
load("menorr_EWAScatEnrichmentres.Rdata")

# Now that all this has been loaded in, the last part of the analysis can be done, starting by assigning "cpgs" for the GO/KEGG part that BC3 can't do
lookup_cpgs <- function(dmr){                                   # Create function to find CpGs from DMRs
  chr <- dmr[1]
  start <- dmr[2]
  end <- dmr[3]
  row.names(annotation)[annotation$chr==chr & annotation$pos>=start & annotation$pos<=end]
}

dmr_hits <- dmrs[dmrs$p.adjust<0.05&dmrs$n>=2,]                 # Find all DMRs with adjusted P < 0.05 and more than or = to 2 CpGs within the DMR

cpgs <- apply(dmr_hits[,c("chr","start","end")],1,lookup_cpgs)  # List the CpGs in each DMR
cpgs <- unlist(cpgs)

# Enrichment of KEGG and GO terms
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("missMethyl")
require(missMethyl)
require(limma)

go.res <- gometh(sig.cpg=cpgs, all.cpg=res$Row.names, collection="GO")

go.res <- go.res[order(go.res$P.DE),]
kegg.res <- gometh(sig.cpg=cpgs, all.cpg=res$Row.names, collection="KEGG")

kegg.res <- kegg.res[order(kegg.res$P.DE),]
save(list=c("go.res","kegg.res"),file="menorr_GO_KEGG_res.Rdata")
