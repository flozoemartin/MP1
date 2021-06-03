##############################################################################################################################################################
#                                                                                                                                                            #
#       Generating covariates for EWAS based on age at methylation measure                                                                                   #
#       Author:         Flo Martin                                                                                                                           #
#       Date started:   19/11/2020                                                                                                                           #
#       Date finished:  27/11/2020                                                                                                                           #
#       Description:    This script takes the Pheno.Rda file generated from merging my ALSPAC dataset with the ARIES samplesheet and generating covariates   #
#                       based on time of methylation measure (15 or 17 years old) for use in the adjusted EWAS (not performed just for ref)                  #
#                                                                                                                                                            #
##############################################################################################################################################################

# Load in the phenofile generated from merging ALSPAC dataset with samplesheet
getwd()
setwd("/Users/ti19522/Downloads/bluecrystal_files/EWAS")
load("Pheno.Rda")

# So, for each person, I need to derive the right covariate information at each timepoint: if time_code == TF3 use 15yr covariates and if time_code == F17 use
# 17yr covariates for BMI
Pheno$bmi_meth <- ifelse(Pheno$time_code == "TF3",Pheno$bmi_15yr,Pheno$bmi_17yr_tf4)
table(Pheno$bmi_meth, Pheno$time_code)

# Just copy the age column to a new variable called age_meth as per my analysis plan and shell files
Pheno$age_meth <- Pheno$age

# For some reason oral contraceptives in the past 12 months at 15 & 17 years was coded as 1 and 2 for no and yes so I have changed it to 0 and 1 for continuity with 
# the other binary covariates

table(as.numeric(Pheno$oral_contraceptives_pastyr_17yr))
table(Pheno$oral_contraceptives_pastyr_17yr)
as.numeric(Pheno$oral_contraceptives_pastyr_17yr)
Pheno$oral_contraceptives_pastyr_17yr <- ifelse(Pheno$oral_contraceptives_pastyr_17yr == "No",0,
                                              ifelse(Pheno$oral_contraceptives_pastyr_17yr == "Yes",1, NA))
table(Pheno$oral_contraceptives_pastyr_17yr)

table(as.numeric(Pheno$oral_contraceptives_pastyr_15yr))
table(Pheno$oral_contraceptives_pastyr_15yr)

Pheno$oral_contraceptives_pastyr_15yr <- ifelse(Pheno$oral_contraceptives_pastyr_15yr == "No",0,
                                                ifelse(Pheno$oral_contraceptives_pastyr_15yr == "Yes",1, NA))
table(Pheno$oral_contraceptives_pastyr_15yr)

# Then I generated a variable asking if they were taking oral contraception at the time of methylation measure

Pheno$contracep_pre_15 <- ifelse(Pheno$oral_contraceptives_pastyr_8yr == "Yes" | Pheno$oral_contraceptives_pastyr_9yr == "Yes" | 
                                      Pheno$oral_contraceptives_pastyr_10yr == "Yes" | Pheno$oral_contraceptives_pastyr_11yr == "Yes" |
                                      Pheno$oral_contraceptives_pastyr_13yr == "Yes" | Pheno$oral_contraceptives_pastyr_14yr == "Yes" |
                                      Pheno$oral_contraceptives_pastyr_15yr == 1,1,0)
table(Pheno$contracep_pre_15)
Pheno$contracep_pre_15_never <- ifelse(Pheno$oral_contraceptives_pastyr_8yr == "No" | Pheno$oral_contraceptives_pastyr_9yr == "No" | Pheno$oral_contraceptives_pastyr_10yr == "No" |
                                    Pheno$oral_contraceptives_pastyr_11yr == "No" | Pheno$oral_contraceptives_pastyr_13yr == "No" | Pheno$oral_contraceptives_pastyr_14yr == "No" |
                                    Pheno$oral_contraceptives_pastyr_15yr == 0,1,0)
table(Pheno$contracep_pre_15_never)

# From these two variables I can generate a "ever" and "never" variable

Pheno$contracep_pre_15_meth <- NA
Pheno$contracep_pre_15_meth[Pheno$contracep_pre_15_never ==1] <- 0
Pheno$contracep_pre_15_meth[Pheno$contracep_pre_15 ==1] <- 1
table(Pheno$contracep_pre_15_meth)

Pheno$contracep_pre_17 <- ifelse(Pheno$oral_contraceptives_pastyr_8yr == "Yes" | Pheno$oral_contraceptives_pastyr_9yr == "Yes" | 
                                      Pheno$oral_contraceptives_pastyr_10yr == "Yes" | Pheno$oral_contraceptives_pastyr_11yr == "Yes" |
                                      Pheno$oral_contraceptives_pastyr_13yr == "Yes" | Pheno$oral_contraceptives_pastyr_14yr == "Yes" |
                                      Pheno$oral_contraceptives_pastyr_15yr == 1 | Pheno$oral_contraceptives_pastyr_16yr == "Yes" |
                                      Pheno$oral_contraceptives_pastyr_17yr == 1,1,0)
table(Pheno$contracep_pre_17)
Pheno$contracep_pre_17_never <- ifelse(Pheno$oral_contraceptives_pastyr_8yr == "No" | Pheno$oral_contraceptives_pastyr_9yr == "No" | Pheno$oral_contraceptives_pastyr_10yr == "No" |
                                            Pheno$oral_contraceptives_pastyr_11yr == "No" | Pheno$oral_contraceptives_pastyr_13yr == "No" | Pheno$oral_contraceptives_pastyr_14yr == "No" |
                                            PhenoFem$oral_contraceptives_pastyr_15yr == 0 | PhenoFem$oral_contraceptives_pastyr_16yr == "No" |
                                            PhenoFem$oral_contraceptives_pastyr_17yr == 0,1,0)
table(Pheno$contracep_pre_17_never)

# From these two variables I can generate a "ever" and "never" variable

Pheno$contracep_pre_17_meth <- NA
Pheno$contracep_pre_17_meth[Pheno$contracep_pre_17_never ==1] <- 0
Pheno$contracep_pre_17_meth[Pheno$contracep_pre_17 ==1] <- 1
table(Pheno$contracep_pre_17_meth)

Pheno$contraception_meth <- ifelse(Pheno$time_code == "TF3", Pheno$contracep_pre_15_meth, Pheno$contracep_pre_17_meth)

contraception <- data.frame(Pheno$time_code, Pheno$oral_contraceptives_pastyr_15yr, Pheno$oral_contraceptives_pastyr_17yr, 
                            Pheno$contracep_pre_15_meth,Pheno$contracep_pre_17_meth, Pheno$contraception_meth)
table(Pheno$contraception_meth)

# For smoking, I will use the variables generated from the TF3 and T4 clinics (also funny 1 and 2 for no and yes)
Pheno$reg_smoker <- ifelse(Pheno$time_code == "TF3",Pheno$cotinine_15yr,Pheno$cotinine_17yr)
table(Pheno$reg_smoker, Pheno$time_code)

# Double check how many comorbids I have before I remove them
table(Pheno$comorbidity)
table(Pheno$comorbidity, Pheno$cramps)
Pheno_comorbidrm <- Pheno[!(Pheno$comorbidity == 1),]

# Create a dataframe only containing women so that the EWAS takes less time to run on Bluecrystal
PhenoFem <- Pheno[!(Pheno$Sex == "M"),]

# Save dataframes for EWAS
setwd("/Users/ti19522/Downloads/bluecrystal_files/EWAS")
save(PhenoFem, file="Pheno.Rda")
write.csv(PhenoFem, "Pheno.csv")
write.csv(Pheno_comorbidrm, "Pheno_comorbidrm.csv")
