#################################################################################################################################################################
#                                                                                                                                                               #
#   Script for building MP1 dataset from ALSPAC files using the GitHub repository by Gibran Hermani                                                             #
#                                                                                                                                                               #
#   Author:       Flo Martin                                                                                                                                    #
#   Start Date:   28/10/2020                                                                                                                                    #
#   Finish Date:  27/11/2020                                                                                                                                    #
#   Description:  This script describes the paths necessary to build the dataset for my mini project 1: a hypothesis-generating epigenetic approach to          #
#                 characterize premenstrual and menstrual symptoms using ALSPAC, using the instructions available on GitHub                                     #
#                                                                                                                                                               #
#################################################################################################################################################################

# First install version 0.6.1
install.packages("devtools")
install.packages("digest")
library(devtools)
install_github("explodecomputer/alspac")

# Then load the package
library(alspac)

# There are two data objects that come with the package - current & useful - 
# that contain all the variables available in the R:/Current/ and R:/Useful_data
# directories, respectively. You can search through them manually by loading 
# them directly:
data(current)
data(useful)

# obj is the filename, name is the variable name, lab is the description of the
# variable, counts is the number of non-missing values, type is the data type,
# cat1 - cat4 are the folder names in which the object is found (used here 
# loosely as categories for the data) and path is the path to the obj file

# Documentation for the function findVars:
?findVars

# To search for all the variables with the word "bleeding" in the description
# from the current data:
vars <- findVars("bleeding")
vars

# Find any variables with bleeding or cramps in the description:
vars <- findVars("bleeding", "cramps", logic="any", whold.world=TRUE, ignore.case=TRUE)
vars

# Find any variable with bleeding and doctor:
vars <- findVars("bleeding", "doctor", logic="and", whole.world=TRUE, ignore.case=TRUE)
vars

# findVars may identify multiple variables with the same name so the filterVars
# function can be used to select among these duplicates e.g. c645a 
# (maternal edu)
varnames <- c("c645a")
vars <- findVars(varnames)
vars
vars <- subset(vars, subset=tolower(name) %in% varnames)
vars
vars <- filterVars(vars, c645a=c(cat2="Quest"))
vars

# Now I'm going to try and compose the list of variables in the required format
# i.e. the output from findVars to extract:

varnames <- c("men_age","men_agey","ccxf2000","ccxf2001","ccxf2002","ccxf2003","ccxf2004","ccxf3004","ccxf3005","pub127","pub227","pub327","pub427","pub527","pub627","pub727","pub827","pub927",
              "pub128","pub228","pub328","pub428","pub528","pub628","pub728","pub828","pub928","ypb1216","ypb1216_imputeno","ypb1217","ypb1217_imputeno","ypa3310","pub105","pub205","pub305","pub405",
              "pub505","pub605","pub805","pub905","pub109","pub209","pub309","pub409","pub509","pub609","pub709","pub809","pub909","c645a","c755","fh3019","fh8511","fjal1000","fh8450","fh8455","fjsm350",
              "fjsm450","pub110","pub210","pub310","pub410","pub510","pub610","pub710","pub810","pub910","pub315","pub415","pub515","pub615","pub715","pub815","pub915","pub120","pub220","pub320",
              "pub420","pub520","pub620","pub720","pub820","pub920","pub121","pub221","pub321","pub421","pub521","pub621","pub721","pub821","pub921","pub122","pub222","pub322","pub422","pub522",
              "pub622","pub722","pub723","pub822","pub922","pub123","pub223","pub323","pub423","pub523","pub623","pub724","pub823","pub923","pub124","pub224","pub324","pub424","pub524","pub624",
              "pub725","pub824","pub924","pub125","pub225","pub325","pub425","pub525","pub625","pub726","pub825","pub925","kz021","fjmr022a","cotinine_tf3","cotinine_tf4_avg")
vars <- findVars(varnames)
vars <- subset(vars, subset=tolower(name) %in% varnames)
options(max.print=999999)   # So that the list doesn't cut off at a certain number of variables
vars <- filterVars(vars, kz021=c(obj="^cp", lab="Participant"), c645a=c(cat2="Quest"))
vars

# Now that the list of variables is in the required format I can extract them. 
# I need the R:/Data drive mapped to the computer whilst connected to the VPN.
# Extract the variables from the R drive:
setwd("/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/Mini Project 1/R Data")
setDataDir("/Volumes/Data")
flo_27nov <- extractVars(vars)
flo_27nov
save(flo_27nov, file="flo_27nov.Rda")
