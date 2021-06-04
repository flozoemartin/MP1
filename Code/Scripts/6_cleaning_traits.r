#################################################################################################################################################################
#                                                                                                                                                               #
#   Script for cleaning traits dataset abstracted from ALSPAC drive                                                                                             #         
#                                                                                                                                                               #
#   Author:       Flo Martin                                                                                                                                    #
#   Start date:   18/01/2021                                                                                                                                    #
#   Finish date:  04/06/2021                                                                                                                                    #         #
#   Description:  This script describes data cleaning for traits_22jan for mini project 1                                                                       #                                                                                                                       
#                                                                                                                                                               #
################################################################################################################################################################# 

# Contents #
# line 17 - Environment management #
# line 49 - Cleaning binary traits #
# line 219 - Cleaning continuous traits #

# Load in the data abstraction from ALSPAC of traits identified from the EWAS
setwd("/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/Mini Project 1/R data/")
load("traits_25jan.Rda")

# Load in mp1.Rda to pull pre-cleaned variables
load("mp1.Rda")

# Load necessary packages
library(dplyr)

colnames(traits) [5] <- "ace_score"
colnames(traits) [6] <- "mat_edu"
colnames(traits) [9] <- "alcohol_t1"
colnames(traits) [11] <- "alcohol_t2"
colnames(traits) [15] <- "crp_tf4"
colnames(traits) [16] <- "cotinine_tf4"
colnames(traits) [19] <- "elvldl_tf4"
colnames(traits) [20] <- "serum_chol_tf4"
colnames(traits) [21] <- "kidney_disease"
colnames(traits) [22] <- "mat_bmi"
colnames(traits) [24] <- "alcohol_t3"
colnames(traits) [25] <- "cognitive_score_6yr"
colnames(traits) [26] <- "hdp"
colnames(traits) [61] <- "bmi_17yr"
colnames(traits) [66] <- "bmi_tf4"
colnames(traits) [67] <- "high_chol_tf4"
colnames(traits) [68] <- "alcohol_tf4"
colnames(traits) [69] <- "crohns_22yr"
colnames(traits) [70] <- "ra_22yr"
colnames(traits) [71] <- "ss_22yr"
colnames(traits) [72] <- "skin_cancer_25yr"

# Maternal education - binary: degree or A-levels and lower
traits$mat_degree <- mp1$mat_degree

# Alcohol in trimester 1 
table(traits$alcohol_t1)
traits$alcohol_t1[traits$alcohol_t1 == -1] <- NA
traits$alcohol_t1 <- factor(traits$alcohol_t1, 
                                    levels = c(1,2,3,4,5,6), 
                                    labels = c("Never","Less than one glass per week","1+ glasses a week","1-2 glasses per day","3-9 glasses per day",
                                               "10+ glasses per day"))
table(traits$alcohol_t1)
traits$ever_alcohol_t1 <- ifelse(traits$alcohol_t1 == "Less than one glass per week" | traits$alcohol_t1 == "1+ glasses per week" | 
                                   traits$alcohol_t1 == "1-2 glasses per day" | traits$alcohol_t1 == "3-9 glasses per day" |
                                   traits$alcohol_t1 == "10+ glasses per day",1,
                                 ifelse(traits$alcohol_t1 == "Never",0,NA))
table(traits$ever_alcohol_t1)

# Alcohol in trimester 2 
table(traits$alcohol_t2)
traits$alcohol_t2[traits$alcohol_t2 == -1 | traits$alcohol_t2 == -7] <- NA
traits$ever_alcohol_t2 <- ifelse(traits$alcohol_t2 >0,1,
                                 ifelse(traits$alcohol_t2 ==0,0,NA))
table(traits$ever_alcohol_t2)

# Alcohol in trimester 3 (same labels as trimester 1)
table(traits$alcohol_t3)
traits$alcohol_t3[traits$alcohol_t3 == -1] <- NA
traits$ever_alcohol_t3 <- ifelse(traits$alcohol_t3 > 1,1,
                                 ifelse(traits$alcohol_t3 ==1,0,NA))
table(traits$ever_alcohol_t3)

# Alcohol ever vs never in pregnancy
traits$ever_alcohol_preg <- ifelse(traits$ever_alcohol_t1 ==1 | traits$ever_alcohol_t2 ==1 | traits$ever_alcohol_t3 ==1,1,
                                   ifelse(traits$ever_alcohol_t1 ==0 & traits$ever_alcohol_t2 ==0 & traits$ever_alcohol_t3 ==0,0,NA))
table(traits$ever_alcohol_preg)

# When mum filled out the questionnaire
traits$time_qB_mother_gestation<-traits$b924
traits$time_qB_mother_gestation[traits$time_qB_mother_gestation<0] <- NA
traits$time_qC_mother_gestation<-traits$c991
traits$time_qC_mother_gestation[traits$time_qC_mother_gestation<0] <- NA

# Pregnancy: N cigarettes in the first trimester (up to end of 12 weeks)
traits$smoking_mother_firsttrim_ordinal <- NA
#b670 asks for number smoked in first trimester
traits$smoking_mother_firsttrim_ordinal[traits$b670==0]<-"None"
traits$smoking_mother_firsttrim_ordinal[traits$b670 %in% c(1,5)]<-"Light" #i.e. <5 but not 0
traits$smoking_mother_firsttrim_ordinal[traits$b670==10 | traits$b670==15]<-"Moderate" #i.e. <20, >=10
traits$smoking_mother_firsttrim_ordinal[traits$b670>=20]<-"Heavy" #i.e.>=20
#b671 asks for number smoked in last two weeks, which could be first trimester depending on when she filled out the questionnaire
traits$smoking_mother_firsttrim_ordinal[which(traits$b671==1 & traits$time_qB_mother_gestation<=12&is.na(traits$smoking_mother_firsttrim_ordinal))]<-"Light"
traits$smoking_mother_firsttrim_ordinal[which(traits$b671==5&traits$time_qB_mother_gestation<=12&is.na(traits$smoking_mother_firsttrim_ordinal))]<-"Light"
traits$smoking_mother_firsttrim_ordinal[which((traits$b671==10|traits$b671==15)&traits$time_qB_mother_gestation<=12&is.na(traits$smoking_mother_firsttrim_ordinal))]<-"Moderate"
traits$smoking_mother_firsttrim_ordinal[which(traits$b671>=20&traits$time_qB_mother_gestation<=12&is.na(traits$smoking_mother_firsttrim_ordinal))]<-"Heavy"
traits$smoking_mother_firsttrim_ordinal<-factor(traits$smoking_mother_firsttrim_ordinal,levels=c("None","Light","Moderate","Heavy"),ordered=T)
# Pregnancy: Any smoking vs no smoking in the first trimester (up to end of 12 weeks)
traits$smoking_mother_firsttrim_binary <- NA
traits$smoking_mother_firsttrim_binary[traits$smoking_mother_firsttrim_ordinal=="None"]<-0
traits$smoking_mother_firsttrim_binary[traits$smoking_mother_firsttrim_ordinal%in% c("Light","Moderate","Heavy")]<-1
# Pregnancy: N cigarettes in the second trimester (week 13 to end of 26)
# We can use 2 variables, b671 has most traitsa, so we'll start with that and then fill in missing values with c482
traits$smoking_mother_secondtrim_ordinal <- NA
#b671 asks if mother smoked in last two weeks, which could be second trimester depending on when she answered the question
traits$smoking_mother_secondtrim_ordinal[which(traits$b671==0&traits$time_qB_mother_gestation%in%13:26)]<-"None"
traits$smoking_mother_secondtrim_ordinal[which(traits$b671==1&traits$time_qB_mother_gestation%in%13:26)]<-"Light"
traits$smoking_mother_secondtrim_ordinal[which(traits$b671==5&traits$time_qB_mother_gestation%in%13:26)]<-"Light"
traits$smoking_mother_secondtrim_ordinal[which((traits$b671==10|traits$b671==15)&traits$time_qB_mother_gestation%in%13:26)]<-"Moderate"
traits$smoking_mother_secondtrim_ordinal[which(traits$b671>=20&traits$time_qB_mother_gestation%in%13:26)]<-"Heavy"
#c482 asks for number smoked "at the moment", which could be second trimester
traits$smoking_mother_secondtrim_ordinal[which(traits$c482==0&traits$time_qC_mother_gestation%in%13:26&is.na(traits$smoking_mother_secondtrim_ordinal))]<-"None"
traits$smoking_mother_secondtrim_ordinal[which(traits$c482%in%1:4&traits$time_qC_mother_gestation%in%13:26&is.na(traits$smoking_mother_secondtrim_ordinal))]<-"Light"
traits$smoking_mother_secondtrim_ordinal[which(traits$c482%in%5:9&traits$time_qC_mother_gestation%in%13:26&is.na(traits$smoking_mother_secondtrim_ordinal))]<-"Light"
traits$smoking_mother_secondtrim_ordinal[which(traits$c482%in%10:19&traits$time_qC_mother_gestation%in%13:26&is.na(traits$smoking_mother_secondtrim_ordinal))]<-"Moderate"
traits$smoking_mother_secondtrim_ordinal[which(traits$c482>=20&traits$time_qC_mother_gestation%in%13:26&is.na(traits$smoking_mother_secondtrim_ordinal))]<-"Heavy"
traits$smoking_mother_secondtrim_ordinal<-factor(traits$smoking_mother_secondtrim_ordinal,levels=c("None","Light","Moderate","Heavy"),ordered=T)
# Pregnancy: Any smoking vs no smoking in the second trimester (week 13-end 26)
traits$smoking_mother_secondtrim_binary <- NA
traits$smoking_mother_secondtrim_binary[traits$smoking_mother_secondtrim_ordinal=="None"]<-0
traits$smoking_mother_secondtrim_binary[traits$smoking_mother_secondtrim_ordinal%in% c("Light","Moderate","Heavy")]<-1
# Pregnancy: N cigarettes per day in the third trimester (week 27 onwards)
# We can use three variables, e178 is the most straightforward, so we'll start with that and then fill in the missing values using the other variables where possible
traits$smoking_mother_thirdtrim_ordinal <- NA
#e178 asks how many times per day did they smoked in the last two months of pregnancy
traits$smoking_mother_thirdtrim_ordinal[traits$e178==0]<-"None"
traits$smoking_mother_thirdtrim_ordinal[traits$e178==1]<-"Light" #i.e. <5 but not 0
traits$smoking_mother_thirdtrim_ordinal[traits$e178==5]<-"Light" #i.e. <10, >=5
traits$smoking_mother_thirdtrim_ordinal[traits$e178==10 | traits$e178==15]<-"Moderate" #i.e. <20, >=10
traits$smoking_mother_thirdtrim_ordinal[traits$e178>=20]<-"Heavy" #i.e.>=20
#c482 asks for number smoked "at the moment", which could be third trimester
traits$smoking_mother_thirdtrim_ordinal[which(traits$c482==0&traits$time_qC_mother_gestation>=27&is.na(traits$smoking_mother_thirdtrim_ordinal))]<-"None"
traits$smoking_mother_thirdtrim_ordinal[which(traits$c482%in%1:4&traits$time_qC_mother_gestation>=27&is.na(traits$smoking_mother_thirdtrim_ordinal))]<-"Light"
traits$smoking_mother_thirdtrim_ordinal[which(traits$c482%in%5:9&traits$time_qC_mother_gestation>=27&is.na(traits$smoking_mother_thirdtrim_ordinal))]<-"Light"
traits$smoking_mother_thirdtrim_ordinal[which(traits$c482%in%10:19&traits$time_qC_mother_gestation>=27&is.na(traits$smoking_mother_thirdtrim_ordinal))]<-"Moderate"
traits$smoking_mother_thirdtrim_ordinal[which(traits$c482>=20&traits$time_qC_mother_gestation>=27&is.na(traits$smoking_mother_thirdtrim_ordinal))]<-"Heavy"
#b671 asks how much the mother smoked in last two weeks, which could be third trimester depending on when she filled out the questionnaire
traits$smoking_mother_thirdtrim_ordinal[which(traits$b671==0&traits$time_qB_mother_gestation>=27&is.na(traits$smoking_mother_thirdtrim_ordinal))]<-"None"
traits$smoking_mother_thirdtrim_ordinal[which(traits$b671==1&traits$time_qB_mother_gestation>=27&is.na(traits$smoking_mother_thirdtrim_ordinal))]<-"Light"
traits$smoking_mother_thirdtrim_ordinal[which(traits$b671==5&traits$time_qB_mother_gestation>=27&is.na(traits$smoking_mother_thirdtrim_ordinal))]<-"Light"
traits$smoking_mother_thirdtrim_ordinal[which((traits$b671==10|traits$b671==15)&traits$time_qB_mother_gestation>=27&is.na(traits$smoking_mother_thirdtrim_ordinal))]<-"Moderate"
traits$smoking_mother_thirdtrim_ordinal[which(traits$b671>=20&traits$time_qB_mother_gestation>=27&is.na(traits$smoking_mother_thirdtrim_ordinal))]<-"Heavy"
traits$smoking_mother_thirdtrim_ordinal<-factor(traits$smoking_mother_thirdtrim_ordinal,levels=c("None","Light","Moderate","Heavy"),ordered=T)
# Pregnancy: Any smoking vs no smoking in the third trimester (27 weeks onward)
traits$smoking_mother_thirdtrim_binary <- NA
traits$smoking_mother_thirdtrim_binary[traits$smoking_mother_thirdtrim_ordinal=="None"]<-0
traits$smoking_mother_thirdtrim_binary[traits$smoking_mother_thirdtrim_ordinal%in% c("Light","Moderate","Heavy")]<-1
traits$smoking_mother_thirdtrim_binary <- NA
traits$smoking_mother_thirdtrim_binary[traits$smoking_mother_thirdtrim_ordinal=="None"]<-0
traits$smoking_mother_thirdtrim_binary[traits$smoking_mother_thirdtrim_ordinal%in% c("Light","Moderate","Heavy")]<-1
# Pregnancy: Any smoking vs no smoking at any time during pregnancy
traits$smoking_mother_ever_pregnancy_binary<-NA
traits$smoking_mother_ever_pregnancy_binary[traits$smoking_mother_firsttrim_binary==0 & traits$smoking_mother_secondtrim_binary==0 &traits$smoking_mother_thirdtrim_binary==0] <- 0
traits$smoking_mother_ever_pregnancy_binary[traits$smoking_mother_firsttrim_binary==1 | traits$smoking_mother_secondtrim_binary==1 | traits$smoking_mother_thirdtrim_binary==1] <- 1
table(traits$smoking_mother_ever_pregnancy_binary)

# Hypertensive disorders of pregnancy from the obstetric traits
table(traits$hdp)

# Preeclampsia specifically
table(traits$preeclampsia)

# Adolescent alcohol use at 17 years
table(traits$alcohol_tf4)
traits$alcohol_tf4[traits$alcohol_tf4 == -10 | traits$alcohol_tf4 == -4 | traits$alcohol_tf4 == -2 | traits$alcohol_tf4 == -1] <- NA
# Regular drinker those who drink more than once a week
traits$reg_drinker <- NA
traits$reg_drinker[traits$alcohol_tf4 == 4 | traits$alcohol_tf4 == 5] <- 1
traits$reg_drinker[traits$alcohol_tf4 == 1 | traits$alcohol_tf4 == 2 | traits$alcohol_tf4 == 3] <- 0
table(traits$reg_drinker)

# Adolescent contraception use any time during adolescence
traits$contraception <- mp1$contraception_ewas

# Comorbidity reported by the age of 22 years
traits$comorbidity <- mp1$comorbidity

# Crohn's diagnosis at 22 years
table(traits$crohns_22yr)
traits$crohns_22yr <- ifelse(traits$crohns_22yr == 1 | traits$crohns_22yr == 2,1,
                             ifelse(traits$crohns_22yr == 3 | traits$crohns_22yr == 4,0,NA))
table(traits$crohns_22yr)
# Not enough participants to include in the analysis

# Rheumatoid arthritis at 22 years
table(traits$ra_22yr)
traits$ra_22yr <- ifelse(traits$ra_22yr == 1 | traits$ra_22yr == 2,1,
                         ifelse(traits$ra_22yr == 3 | traits$ra_22yr == 4,0,NA))
table(traits$ra_22yr)
# Not enough participants to include in the analysis

# Primary Sjogrens Syndrome at 22 years
table(traits$ss_22yr)
traits$ss_22yr <- ifelse(traits$ss_22yr == 1,1,
                         ifelse(traits$ss_22yr == 3 | traits$ss_22yr == 4,0,NA))
table(traits$ss_22yr)
# Not enough participants to include in the analysis

# Skin cancer at 25 years
table(traits$skin_cancer_25yr)
traits$skin_cancer_25yr[traits$skin_cancer_25yr == -10| traits$skin_cancer_25yr == -9 | traits$skin_cancer_25yr == -1] <- NA
table(traits$skin_cancer_25yr)
# Not enough participants to include in the analysis

# Kidney disease from the COVID questionnaire in G1
table(traits$kidney_disease)
traits$kidney_disease[traits$kidney_disease == -10 | traits$kidney_disease == -9 | traits$kidney_disease == -1] <- NA
traits$kidney_disease <- ifelse(traits$kidney_disease ==2,0,
                                ifelse(traits$kidney_disease ==1,1,NA))
table(traits$kidney_disease)
# Not enough participants to include in the analysis

# Continous traits

# Maternal pre_pregnancy BMI (asked at 12 weeks gest)
table(traits$mat_bmi)
traits$mat_bmi[traits$mat_bmi == -3] <- NA
traits$mat_bmi_z <- scale(traits$mat_bmi)

traits$mat_bmi_cc <- ifelse(is.na(traits$mat_bmi),0,1)

# Gestational age
table(traits$bestgest)
traits$gest_z <- scale(traits$bestgest)

traits$gest_cc <- ifelse(is.na(traits$bestgest),0,1)

# Cognitive score aged 6 years (81 months)
table(traits$cognitive_score_6yr)
traits$cognitive_score_6yr[traits$cognitive_score_6yr == -1] <- NA
traits$cog_score_z <- scale(traits$cognitive_score_6yr)

traits$cog_score_cc <- ifelse(is.na(traits$cognitive_score_cc),0,1)

# Age at onset of menarche 
traits$men_age_m <- mp1$men_age_m
traits$men_age_z <- scale(traits$men_age_m)

# ACE score from useful traitsa for the trait "child abuse"
table(traits$ace_score)
traits$ace_z <- scale(traits$ace_score)

traits$ace_cc <- ifelse(is.na(traits$ace_score),0,1)

# BMI at 17 years
traits$bmi <- mp1$bmi
traits$bmi_17_z <- scale(traits$bmi)

# Cotinine at 17 years old
table(traits$cotinine_tf4)
traits$cotinine_tf4[traits$cotinine_tf4 == -2 | traits$cotinine_tf4 == -1] <- NA
traits$cotinine_z <- scale(traits$cotinine_tf4)

# C-reactive protein at TF4 to proxy for inflammation
table(traits$crp_tf4)
traits$crp_tf4[traits$crp_tf4 == -1] <- NA
traits$crp_z <- scale(traits$crp_tf4)

traits$crp_cc <- ifelse(is.na(traits$crp_tf4),0,1)

# Total serum cholesterol at TF4
table(traits$serum_chol_tf4)
traits$serum_chol_tf4[traits$serum_chol_tf4 == -1] <- NA
traits$chol_z <- scale(traits$serum_chol_tf4)

traits$chol_cc <- ifelse(is.na(traits$serum_chol_tf4),0,1)

# Pull the variables for case controls definition from mp1
traits$hmb <- mp1$hmb
traits$cramps <- mp1$cramps

# Save the dataset cleaned ready for the analysis
save(traits, file = "traits.Rda")

# And save the dataset with comorbidities removed for the supplementary material
comorbidrm <- traits[!(traits$comorbidity == 1),]
save(comorbidrm, file = "traits_comorbidrm.Rda")
