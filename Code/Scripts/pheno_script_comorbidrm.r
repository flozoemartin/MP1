##############################################################################################################################################################
#                                                                                                                                                            #
#       Generating covariates for EWAS based on age at methylation measure with participants with comorbidities removed                                      #
#       Author:         Flo Martin                                                                                                                           #
#       Date started:   30/11/2020                                                                                                                           #
#       Date finished:  30/11/2020                                                                                                                           #
#                                                                                                                                                            #
##############################################################################################################################################################

getwd()
setwd("/Users/ti19522/Downloads/bluecrystal_files/EWAS")
load("Pheno_comorbidrm.Rda")

# So, for each person, I need to derive the right covariate information at each timepoint: if time_code == TF3 use 15yr covariates and if time_code == F17 use
# 17yr covariates for BMI
Pheno_comorbidrm$bmi_meth <- ifelse(Pheno_comorbidrm$time_code == "TF3",Pheno_comorbidrm$bmi_15yr,Pheno_comorbidrm$bmi_17yr_tf4)
table(Pheno_comorbidrm$bmi_meth, Pheno_comorbidrm$time_code)

# Copy the age column to a new variable called age_meth as per analysis plan
Pheno_comorbidrm$age_meth <- Pheno_comorbidrm$age

# For some reason oral contraceptives in the past 12 months at 15 &17 years was coded as 1 and 2 for no and yes so I have changed it to 0 and 1 for continuity with 
# the other binary covariates
table(as.numeric(Pheno_comorbidrm$oral_contraceptives_pastyr_17yr))
table(Pheno_comorbidrm$oral_contraceptives_pastyr_17yr)
as.numeric(Pheno_comorbidrm$oral_contraceptives_pastyr_17yr)
Pheno_comorbidrm$oral_contraceptives_pastyr_17yr <- ifelse(Pheno_comorbidrm$oral_contraceptives_pastyr_17yr == "No",0,
                                              ifelse(Pheno_comorbidrm$oral_contraceptives_pastyr_17yr == "Yes",1, NA))
table(Pheno_comorbidrm$oral_contraceptives_pastyr_17yr)

table(as.numeric(Pheno_comorbidrm$oral_contraceptives_pastyr_15yr))
table(Pheno_comorbidrm$oral_contraceptives_pastyr_15yr)

Pheno_comorbidrm$oral_contraceptives_pastyr_15yr <- ifelse(Pheno_comorbidrm$oral_contraceptives_pastyr_15yr == "No",0,
                                                ifelse(Pheno_comorbidrm$oral_contraceptives_pastyr_15yr == "Yes",1, NA))
table(Pheno_comorbidrm$oral_contraceptives_pastyr_15yr)

# Then I generated a variable asking if they were taking oral contraception at the time of methylation measure
Pheno_comorbidrm$contraception_meth <- ifelse(Pheno_comorbidrm$time_code == "TF3", Pheno_comorbidrm$oral_contraceptives_pastyr_15yr, 
                                              Pheno_comorbidrm$oral_contraceptives_pastyr_17yr)

contraception <- data.frame(Pheno_comorbidrm$time_code, Pheno_comorbidrm$oral_contraceptives_pastyr_15yr, Pheno_comorbidrm$oral_contraceptives_pastyr_17yr, 
                            Pheno_comorbidrm$contraception_meth)
table(Pheno_comorbidrm$contraception_meth)

# For smoking and drinking, I will use the variables generated from the TF3 and F17 clinics (also funny 1 and 2 for no and yes)
Pheno_comorbidrm$reg_smoker <- ifelse(Pheno_comorbidrm$time_code == "TF3",Pheno_comorbidrm$cotinine_15yr,Pheno_comorbidrm$cotinine_17yr)
table(Pheno_comorbidrm$reg_smoker, Pheno_comorbidrm$time_code)

table(Pheno_comorbidrm$reg_drinker_15yr)
table(as.numeric(Pheno_comorbidrm$reg_drinker_15yr))
Pheno_comorbidrm$reg_drinker_15yr <- ifelse(Pheno_comorbidrm$reg_drinker_15yr == "No",0,
                                ifelse(Pheno_comorbidrm$reg_drinker_15yr == "Yes",1, NA))
table(Pheno_comorbidrm$reg_drinker_15yr)
table(as.numeric(Pheno_comorbidrm$reg_drinker_17yr))
Pheno_comorbidrm$reg_drinker_17yr <- ifelse(Pheno_comorbidrm$reg_drinker_17yr == "No",0,
                                ifelse(Pheno_comorbidrm$reg_drinker_17yr == "Yes",1, NA))
table(Pheno_comorbidrm$reg_drinker_17yr)

Pheno_comorbidrm$reg_drinker <- ifelse(Pheno_comorbidrm$time_code == "TF3", Pheno_comorbidrm$reg_drinker_15yr, Pheno_comorbidrm$reg_drinker_17yr)
table(Pheno_comorbidrm$reg_drinker)

# Create a dataframe only containing women
Pheno_comorbidrmFem <- Pheno_comorbidrm[!(Pheno_comorbidrm$Sex == "M"),]
table(Pheno_comorbidrmFem$menorr_ewas)

# Save the Pheno_comorbidrm data frame as .csv files
getwd()
setwd("/Users/ti19522/Downloads/bluecrystal_files/EWAS")
write.csv(Pheno_comorbidrm, "Pheno_comorbidrm.csv")
