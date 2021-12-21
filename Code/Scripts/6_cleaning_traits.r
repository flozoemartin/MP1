##############################################################################################################################################################
#                                                                                                                                                            #
#   Script for cleaning traits dataset abstracted from ALSPAC drive                                                                                          #         
#                                                                                                                                                            #
#   Author:       Flo Martin                                                                                                                                 #
#   Start date:   18/01/2021                                                                                                                                 #
#   Finish date:  21/12/2021                                                                                                                                 #         #
#   Description:  This script describes data cleaning for traits_28jul for mini project 1                                                                    #                                                                                                                       
#                                                                                                                                                            #
############################################################################################################################################################## 

# Contents #
# line 17 - Environment management #
# line 49 - Cleaning binary traits #
# line 219 - Cleaning continuous traits #

# Load in the data abstraction from ALSPAC of traits identified from the EWAS
setwd("/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/Mini Project 1/R data/")
load("traits_28jul.Rda")
load("mp1.Rda")

traits <- data.frame(traits_28jul)            # ...and the create a copy of traits_18jan (blank - no labels) which will allow any changes made to 

colnames(traits)                  # This allows me to check all the column names and category labels are as they were when pulled from R:/traitsa

colnames(traits) [5] <- "ace_score"
colnames(traits) [6] <- "mat_edu"
colnames(traits) [10] <- "alcohol_t1"
colnames(traits) [13] <- "alcohol_t2"
colnames(traits) [18] <- "chol_7yr"
colnames(traits) [19] <- "cotinine_7yr"
colnames(traits) [20] <- "crp_9yr"
colnames(traits) [21] <- "crp_tf3"
colnames(traits) [22] <- "crp_tf4"
colnames(traits) [23] <- "cotinine_tf4"
colnames(traits) [25] <- "elvldl_tf3"
colnames(traits) [26] <- "serum_chol_tf3"
colnames(traits) [27] <- "elvldl_tf4"
colnames(traits) [28] <- "serum_chol_tf4"
colnames(traits) [30] <- "kidney_disease"
colnames(traits) [32] <- "mat_bmi"
colnames(traits) [35] <- "alcohol_t3"
colnames(traits) [37] <- "bmi_7yr"
colnames(traits) [39] <- "nonword_rep_score_8yr"
colnames(traits) [41] <- "cognitive_score_6yr"
colnames(traits) [43] <- "hdp"
colnames(traits) [46] <- "hmb_8yr"
colnames(traits) [47] <- "dr_hmb_8yr"
colnames(traits) [48] <- "cramps_8yr"
colnames(traits) [49] <- "dr_cramps_8yr"
colnames(traits) [51] <- "hmb_9yr"
colnames(traits) [52] <- "dr_hmb_9yr"
colnames(traits) [53] <- "cramps_9yr"
colnames(traits) [54] <- "dr_cramps_9yr"
colnames(traits) [56] <- "hmb_10yr"
colnames(traits) [57] <- "dr_hmb_10yr"
colnames(traits) [58] <- "cramps_10yr"
colnames(traits) [59] <- "dr_cramps_10yr"
colnames(traits) [61] <- "hmb_11yr"
colnames(traits) [62] <- "dr_hmb_11yr"
colnames(traits) [63] <- "cramps_11yr"
colnames(traits) [64] <- "dr_cramps_11yr"
colnames(traits) [66] <- "hmb_13yr"
colnames(traits) [67] <- "dr_hmb_13yr"
colnames(traits) [68] <- "cramps_13yr"
colnames(traits) [69] <- "dr_cramps_13yr"
colnames(traits) [71] <- "hmb_14yr"
colnames(traits) [72] <- "dr_hmb_14yr"
colnames(traits) [73] <- "cramps_14yr"
colnames(traits) [74] <- "dr_cramps_14yr"
colnames(traits) [76] <- "hmb_15yr"
colnames(traits) [77] <- "dr_hmb_15yr"
colnames(traits) [78] <- "cramps_15yr"
colnames(traits) [79] <- "sev_cramps_15yr"
colnames(traits) [80] <- "dr_cramps_15yr"
colnames(traits) [82] <- "hmb_16yr"
colnames(traits) [83] <- "dr_hmb_16yr"
colnames(traits) [84] <- "cramps_16yr"
colnames(traits) [85] <- "dr_cramps_16yr"
colnames(traits) [87] <- "bmi_17yr"
colnames(traits) [88] <- "hmb_17yr"
colnames(traits) [89] <- "dr_hmb_17yr"
colnames(traits) [90] <- "cramps_17yr"
colnames(traits) [91] <- "dr_cramps_17yr"
colnames(traits) [93] <- "smoked_tf1"
colnames(traits) [94] <- "alcohol_tf1"
colnames(traits) [96] <- "bmi_tf4"
colnames(traits) [97] <- "high_chol_tf4"
colnames(traits) [98] <- "alcohol_tf4"
colnames(traits) [100] <- "crohns_22yr"
colnames(traits) [101] <- "ra_22yr"
colnames(traits) [102] <- "ss_22yr"
colnames(traits) [104] <- "skin_cancer_25yr"


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

# Maternal pre_pregnancy BMI (asked at 12 weeks gest)
table(traits$mat_bmi)
traits$mat_bmi[traits$mat_bmi == -3] <- NA

traits$mat_bmi_z <- scale(traits$mat_bmi)

# Gestational age
table(traits$bestgest)
traits$preterm[traits$bestgest <38] <- 1
traits$preterm[traits$bestgest >37] <- 0
table(traits$preterm)

traits$bestgest_z <- scale(traits$bestgest)

# Maternal educational attainment
table(traits$mat_edu)
traits$mat_degree <- ifelse(traits$mat_edu == "Degree",1,0)
table(traits$mat_degree)

# BMI at 7 years
table(traits$bmi_7yr)
traits$bmi_7yr[traits$bmi_7yr < 0] <- NA

traits$bmi_7yr_z <- scale(traits$bmi_7yr)

# Cholesterol at 7 years
table(traits$chol_7yr)
traits$chol_7yr[traits$chol_7yr == -1] <- NA

traits$chol_7yr_z <- scale(traits$chol_7yr)

# Cotinine at 7 years
table(traits$cotinine_7yr)
traits$cotinine_7yr[traits$cotinine_7yr == -1] <- NA

traits$cotinine_7yr_z <- scale(traits$cotinine_7yr)

# CRP at 9 years
table(traits$crp_9yr)
traits$crp_9yr[traits$crp_9yr == -1] <- NA

traits$crp_9yr_z <- scale(traits$crp_9yr)

# Cognitive score aged 6 years (81 months)
table(traits$cognitive_score_6yr)
traits$cognitive_score_6yr[traits$cognitive_score_6yr == -1] <- NA

# Non-word repetition score at 8 years
table(traits$nonword_rep_score_8yr)
traits$nonword_rep_score_8yr[traits$nonword_rep_score_8yr < 0] <- NA

traits$nonword_8yr_z <- scale(traits$nonword_rep_score_8yr)

# Smoking at TF1
table(traits$smoked_tf1)
traits$smoked_tf1[traits$smoked_tf1 < 0] <- NA
traits$smoked_tf1 <- ifelse(traits$smoked_tf1 ==2,0,1)

# Drinking at TF1
table(traits$alcohol_tf1)
traits$alcohol_tf1[traits$alcohol_tf1 < 0] <- NA
traits$alcohol_tf1 <- ifelse(traits$alcohol_tf1 ==2,0,1)

# ACE score from useful traits for the trait "child abuse"
table(traits$ace_score)

traits$ace_score_z <- scale(traits$ace_score)

# Alcohol use at 17 years
table(traits$alcohol_tf4)
traits$alcohol_tf4[traits$alcohol_tf4 == -10 | traits$alcohol_tf4 == -4 | traits$alcohol_tf4 == -2 | traits$alcohol_tf4 == -1] <- NA
# Regular drinker those who drink more than once a week
traits$reg_drinker <- NA
traits$reg_drinker[traits$alcohol_tf4 == 4 | traits$alcohol_tf4 == 5] <- 1
traits$reg_drinker[traits$alcohol_tf4 == 1 | traits$alcohol_tf4 == 2 | traits$alcohol_tf4 == 3] <- 0
table(traits$reg_drinker)

# BMI at 17 years
traits$bmi_17yr[traits$bmi_17yr == -1 | traits$bmi_17yr == -10] <- NA
traits$bmi_tf4[traits$bmi_tf4 == -1 | traits$bmi_tf4 == -4 | traits$bmi_tf4 == -10] <- NA
traits$bmi_17yr[is.na(traits$bmi_17yr)] <- 0
traits$bmi_tf4[is.na(traits$bmi_tf4)] <- 0
traits$bmi <- ifelse(traits$bmi_tf4 >0,traits$bmi_tf4,
                     ifelse(traits$bmi_tf4 ==0 & traits$bmi_17yr >0, traits$bmi_17yr,NA))
table(traits$bmi)
traits$bmi_17yr[traits$bmi_17yr ==0] <- NA
traits$bmi_tf4[traits$bmi_tf4 ==0] <- NA

# C-reactive protein at TF3 & TF4 to proxy for inflammation
table(traits$crp_tf4)
traits$crp_tf4[traits$crp_tf4 == -1] <- NA

# Cotinine at 17 years old
table(traits$cotinine_tf4)
traits$cotinine_tf4[traits$cotinine_tf4 == -2 | traits$cotinine_tf4 == -1] <- NA

# Total serum cholesterol at TF3 & TF4
table(traits$serum_chol_tf4)
traits$serum_chol_tf4[traits$serum_chol_tf4 == -1] <- NA

# Young person has high cholesterol at 17
table(traits$high_chol_tf4)
traits$high_chol_tf4[traits$high_chol_tf4 == -10 | traits$high_chol_tf4 == -4 | traits$high_chol_tf4 == -1] <- NA
traits$high_chol_tf4[traits$high_chol_tf4 == 2] <- 0
table(traits$high_chol_tf4)

# Crohn's diagnosis at 22 years
table(traits$crohns_22yr)
traits$crohns_22yr <- ifelse(traits$crohns_22yr == 1 | traits$crohns_22yr == 2,1,
                             ifelse(traits$crohns_22yr == 3 | traits$crohns_22yr == 4,0,NA))
table(traits$crohns_22yr)

# Rheumatoid arthritis at 22 years
table(traits$ra_22yr)
traits$ra_22yr <- ifelse(traits$ra_22yr == 1 | traits$ra_22yr == 2,1,
                         ifelse(traits$ra_22yr == 3 | traits$ra_22yr == 4,0,NA))
table(traits$ra_22yr)

# Primary Sjogrens Syndrome at 22 years
table(traits$ss_22yr)
traits$ss_22yr <- ifelse(traits$ss_22yr == 1,1,
                         ifelse(traits$ss_22yr == 3 | traits$ss_22yr == 4,0,NA))
table(traits$ss_22yr)

# Skin cancer at 25 years
table(traits$skin_cancer_25yr)
traits$skin_cancer_25yr[traits$skin_cancer_25yr == -10| traits$skin_cancer_25yr == -9 | traits$skin_cancer_25yr == -1] <- NA
table(traits$skin_cancer_25yr)

# Kidney disease from the COVID questionnaire in G1
table(traits$kidney_disease)
traits$kidney_disease[traits$kidney_disease == -10 | traits$kidney_disease == -9 | traits$kidney_disease == -1] <- NA
traits$kidney_disease <- ifelse(traits$kidney_disease ==2,0,
                                ifelse(traits$kidney_disease ==1,1,NA))
table(traits$kidney_disease)

# Defining cases & controls
# Heavy/prolonged bleeding
table(traits$hmb_8yr)
traits$hmb_8yr <- ifelse(traits$hmb_8yr == 2,0, NA)
traits$hmb_8yr <- factor(traits$hmb_8yr, 
                         levels = c(0), 
                         labels = c("No"))
table(traits$hmb_8yr)

table(traits$hmb_9yr)
traits$hmb_9yr <- ifelse(traits$hmb_9yr == 2,0,
                         ifelse(traits$hmb_9yr == 1,1,NA))
traits$hmb_9yr <- factor(traits$hmb_9yr, 
                         levels = c(0,1), 
                         labels = c("No","Yes"))
table(traits$hmb_9yr)

table(traits$hmb_10yr)
traits$hmb_10yr <- ifelse(traits$hmb_10yr == 2,0,
                          ifelse(traits$hmb_10yr == 1,1,NA))
traits$hmb_10yr <- factor(traits$hmb_10yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(traits$hmb_10yr)

table(traits$hmb_11yr)
traits$hmb_11yr <- ifelse(traits$hmb_11yr == 2,0,
                          ifelse(traits$hmb_11yr == 1,1,NA))
traits$hmb_11yr <- factor(traits$hmb_11yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(traits$hmb_11yr)

table(traits$hmb_13yr)
traits$hmb_13yr <- ifelse(traits$hmb_13yr == 2,0,
                          ifelse(traits$hmb_13yr == 1,1,NA))
traits$hmb_13yr <- factor(traits$hmb_13yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(traits$hmb_13yr)

table(traits$hmb_14yr)
traits$hmb_14yr <- ifelse(traits$hmb_14yr == 2,0,
                          ifelse(traits$hmb_14yr == 1,1,NA))
traits$hmb_14yr <- factor(traits$hmb_14yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(traits$hmb_14yr)

table(traits$hmb_15yr)
traits$hmb_15yr <- ifelse(traits$hmb_15yr == 2,0,
                          ifelse(traits$hmb_15yr == 1,1,NA))
traits$hmb_15yr <- factor(traits$hmb_15yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(traits$hmb_15yr)

table(traits$hmb_16yr)
traits$hmb_16yr <- ifelse(traits$hmb_16yr == 2,0,
                          ifelse(traits$hmb_16yr == 1,1,NA))
traits$hmb_16yr <- factor(traits$hmb_16yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(traits$hmb_16yr)

table(traits$hmb_17yr)
traits$hmb_17yr <- ifelse(traits$hmb_17yr == 2,0,
                          ifelse(traits$hmb_17yr == 1,1,NA))
traits$hmb_17yr <- factor(traits$hmb_17yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(traits$hmb_17yr)

# Cramps
table(traits$cramps_8yr)
traits$cramps_8yr <- ifelse(traits$cramps_8yr == 2,0, NA)
traits$cramps_8yr <- factor(traits$cramps_8yr, 
                            levels = c(0), 
                            labels = c("No"))
table(traits$cramps_8yr)

table(traits$cramps_9yr)
traits$cramps_9yr <- ifelse(traits$cramps_9yr == 2,0,
                            ifelse(traits$cramps_9yr == 1,1,NA))
traits$cramps_9yr <- factor(traits$cramps_9yr, 
                            levels = c(0,1), 
                            labels = c("No","Yes"))
table(traits$cramps_9yr)

table(traits$cramps_10yr)
traits$cramps_10yr <- ifelse(traits$cramps_10yr == 2,0,
                             ifelse(traits$cramps_10yr == 1,1,NA))
traits$cramps_10yr <- factor(traits$cramps_10yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(traits$cramps_10yr)

table(traits$cramps_11yr)
traits$cramps_11yr <- ifelse(traits$cramps_11yr == 2,0,
                             ifelse(traits$cramps_11yr == 1,1,NA))
traits$cramps_11yr <- factor(traits$cramps_11yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(traits$cramps_11yr)

table(traits$cramps_13yr)
traits$cramps_13yr <- ifelse(traits$cramps_13yr == 2,0,
                             ifelse(traits$cramps_13yr == 1,1,NA))
traits$cramps_13yr <- factor(traits$cramps_13yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(traits$cramps_13yr)

table(traits$cramps_14yr)
traits$cramps_14yr <- ifelse(traits$cramps_14yr == 2,0,
                             ifelse(traits$cramps_14yr == 1,1,NA))
traits$cramps_14yr <- factor(traits$cramps_14yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(traits$cramps_14yr)

table(traits$cramps_15yr)
traits$cramps_15yr <- ifelse(traits$cramps_15yr == 2,0,
                             ifelse(traits$cramps_15yr == 1,1,NA))
traits$cramps_15yr <- factor(traits$cramps_15yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(traits$cramps_15yr)
table(traits$sev_cramps_15yr)
traits$sev_cramps_15yr <- ifelse(traits$sev_cramps_15yr == 3,3,
                                 ifelse(traits$sev_cramps_15yr == 2,2,
                                        ifelse(traits$sev_cramps_15yr == 1,1,NA)))
traits$sev_cramps_15yr <- factor(traits$sev_cramps_15yr, 
                                 levels = c(1,2,3), 
                                 labels = c("Mild","Moderate","Severe"))
table(traits$sev_cramps_15yr)

table(traits$cramps_16yr)
traits$cramps_16yr <- ifelse(traits$cramps_16yr == 2,0,
                             ifelse(traits$cramps_16yr == 1,1,NA))
traits$cramps_16yr <- factor(traits$cramps_16yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(traits$cramps_16yr)

table(traits$cramps_17yr)
traits$cramps_17yr <- ifelse(traits$cramps_17yr == 2,0,
                             ifelse(traits$cramps_17yr == 1,1,NA))
traits$cramps_17yr <- factor(traits$cramps_17yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(traits$cramps_17yr)

# Doctor for heavy/prolonged bleeding
table(traits$dr_hmb_8yr)
traits$dr_hmb_8yr[traits$dr_hmb_8yr == -10 | traits$dr_hmb_8yr == -3 | traits$dr_hmb_8yr == -2 | traits$dr_hmb_8yr == -1] <- NA

table(traits$dr_hmb_9yr)
traits$dr_hmb_9yr <- ifelse(traits$dr_hmb_9yr == 2,0, NA)
traits$dr_hmb_9yr <- factor(traits$dr_hmb_9yr, 
                            levels = c(0), 
                            labels = c("No"))
table(traits$dr_hmb_9yr)

table(traits$dr_hmb_10yr)
traits$dr_hmb_10yr <- ifelse(traits$dr_hmb_10yr == 2,0,
                             ifelse(traits$dr_hmb_10yr == 1,1,NA))
traits$dr_hmb_10yr <- factor(traits$dr_hmb_10yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(traits$dr_hmb_10yr)

table(traits$dr_hmb_11yr)
traits$dr_hmb_11yr <- ifelse(traits$dr_hmb_11yr == 2,0,
                             ifelse(traits$dr_hmb_11yr == 1,1,NA))
traits$dr_hmb_11yr <- factor(traits$dr_hmb_11yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(traits$dr_hmb_11yr)

table(traits$dr_hmb_13yr)
traits$dr_hmb_13yr <- ifelse(traits$dr_hmb_13yr == 2,0,
                             ifelse(traits$dr_hmb_13yr == 1,1,NA))
traits$dr_hmb_13yr <- factor(traits$dr_hmb_13yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(traits$dr_hmb_13yr)

table(traits$dr_hmb_14yr)
traits$dr_hmb_14yr <- ifelse(traits$dr_hmb_14yr == 2,0,
                             ifelse(traits$dr_hmb_14yr == 1,1,NA))
traits$dr_hmb_14yr <- factor(traits$dr_hmb_14yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(traits$dr_hmb_14yr)

table(traits$dr_hmb_15yr)
traits$dr_hmb_15yr <- ifelse(traits$dr_hmb_15yr == 2,0,
                             ifelse(traits$dr_hmb_15yr == 1,1,NA))
traits$dr_hmb_15yr <- factor(traits$dr_hmb_15yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(traits$dr_hmb_15yr)

table(traits$dr_hmb_16yr)
traits$dr_hmb_16yr <- ifelse(traits$dr_hmb_16yr == 2,0,
                             ifelse(traits$dr_hmb_16yr == 1,1,NA))
traits$dr_hmb_16yr <- factor(traits$dr_hmb_16yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(traits$dr_hmb_16yr)

table(traits$dr_hmb_17yr)
traits$dr_hmb_17yr <- ifelse(traits$dr_hmb_17yr == 2,0,
                             ifelse(traits$dr_hmb_17yr == 1,1,NA))
traits$dr_hmb_17yr <- factor(traits$dr_hmb_17yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(traits$dr_hmb_17yr)

# Doctor for cramps
table(traits$dr_cramps_8yr)
traits$dr_cramps_8yr[traits$dr_cramps_8yr == -10 | traits$dr_cramps_8yr == -3 | traits$dr_cramps_8yr == -2 | traits$dr_cramps_8yr == -1] <- NA
table(traits$dr_cramps_8yr)

table(traits$dr_cramps_9yr)
traits$dr_cramps_9yr <- ifelse(traits$dr_cramps_9yr == 2,0, 
                               ifelse(traits$dr_cramps_9yr == 1,1,NA))
traits$dr_cramps_9yr <- factor(traits$dr_cramps_9yr, 
                               levels = c(0,1), 
                               labels = c("No","Yes"))
table(traits$dr_cramps_9yr)

table(traits$dr_cramps_10yr)
traits$dr_cramps_10yr <- ifelse(traits$dr_cramps_10yr == 2,0, 
                                ifelse(traits$dr_cramps_10yr == 1,1,NA))
traits$dr_cramps_10yr <- factor(traits$dr_cramps_10yr, 
                                levels = c(0,1), 
                                labels = c("No","Yes"))
table(traits$dr_cramps_10yr)

table(traits$dr_cramps_11yr)
traits$dr_cramps_11yr <- ifelse(traits$dr_cramps_11yr == 2,0, 
                                ifelse(traits$dr_cramps_11yr == 1,1,NA))
traits$dr_cramps_11yr <- factor(traits$dr_cramps_11yr, 
                                levels = c(0,1), 
                                labels = c("No","Yes"))
table(traits$dr_cramps_11yr)

table(traits$dr_cramps_13yr)
traits$dr_cramps_13yr <- ifelse(traits$dr_cramps_13yr == 2,0, 
                                ifelse(traits$dr_cramps_13yr == 1,1,NA))
traits$dr_cramps_13yr <- factor(traits$dr_cramps_13yr, 
                                levels = c(0,1), 
                                labels = c("No","Yes"))
table(traits$dr_cramps_13yr)

table(traits$dr_cramps_14yr)
traits$dr_cramps_14yr <- ifelse(traits$dr_cramps_14yr == 2,0, 
                                ifelse(traits$dr_cramps_14yr == 1,1,NA))
traits$dr_cramps_14yr <- factor(traits$dr_cramps_14yr, 
                                levels = c(0,1), 
                                labels = c("No","Yes"))
table(traits$dr_cramps_14yr)

table(traits$dr_cramps_15yr)
traits$dr_cramps_15yr <- ifelse(traits$dr_cramps_15yr == 2,0, 
                                ifelse(traits$dr_cramps_15yr == 1,1,NA))
traits$dr_cramps_15yr <- factor(traits$dr_cramps_15yr, 
                                levels = c(0,1), 
                                labels = c("No","Yes"))
table(traits$dr_cramps_15yr)

table(traits$dr_cramps_16yr)
traits$dr_cramps_16yr <- ifelse(traits$dr_cramps_16yr == 2,0, 
                                ifelse(traits$dr_cramps_16yr == 1,1,NA))
traits$dr_cramps_16yr <- factor(traits$dr_cramps_16yr, 
                                levels = c(0,1), 
                                labels = c("No","Yes"))
table(traits$dr_cramps_16yr)

table(traits$dr_cramps_17yr)
traits$dr_cramps_17yr <- ifelse(traits$dr_cramps_17yr == 2,0, 
                                ifelse(traits$dr_cramps_17yr == 1,1,NA))
traits$dr_cramps_17yr <- factor(traits$dr_cramps_17yr, 
                                levels = c(0,1), 
                                labels = c("No","Yes"))
table(traits$dr_cramps_17yr)

# Now generating the right case and control status for comparing traits
traits$mod_sev_cramps_15yr <- ifelse(traits$sev_cramps_15yr == "Severe" | traits$sev_cramps_15yr == "Moderate",1,0)
table(traits$mod_sev_cramps_15yr)   # Moderate or severe cramps
traits$mod_sev_dr_cramps <- ifelse(traits$mod_sev_cramps_15yr == 1 & traits$dr_cramps_15yr == "Yes",1,0)
table(traits$mod_sev_dr_cramps)     # Visted the doctor for moderateor severe cramps

# Here, I have gone through each timepoint and asked if the young woman answered yes to dysmenorrhea but no to visiting a doctor then code her as a 1
traits$cramps_nodr_9yr <- ifelse(traits$cramps_9yr == "Yes" & traits$dr_cramps_9yr == "No",1,0)
table(traits$cramps_nodr_9yr)

traits$cramps_nodr_10yr <- ifelse(traits$cramps_10yr == "Yes" & traits$dr_cramps_10yr == "No",1,0)
table(traits$cramps_nodr_10yr)

traits$cramps_nodr_11yr <- ifelse(traits$cramps_11yr == "Yes" & traits$dr_cramps_11yr == "No",1,0)
table(traits$cramps_nodr_11yr)

traits$cramps_nodr_13yr <- ifelse(traits$cramps_13yr == "Yes" & traits$dr_cramps_13yr == "No",1,0)
table(traits$cramps_nodr_13yr)

traits$cramps_nodr_14yr <- ifelse(traits$cramps_14yr == "Yes" & traits$dr_cramps_14yr == "No",1,0)
table(traits$cramps_nodr_14yr)

traits$cramps_nodr_15yr <- ifelse(traits$mod_sev_cramps_15yr == 1 & traits$dr_cramps_15yr == "No",1,0)
table(traits$cramps_nodr_15yr)

traits$cramps_nodr_16yr <- ifelse(traits$cramps_16yr == "Yes" & traits$dr_cramps_16yr == "No",1,0)
table(traits$cramps_nodr_16yr)

traits$cramps_nodr_17yr <- ifelse(traits$cramps_17yr == "Yes" & traits$dr_cramps_17yr == "No",1,0)
table(traits$cramps_nodr_17yr)

# Using these variables, I generated a variable cramps_controls which asking if a young women had reported dysmenorrhea at any timepoint but not visited the dr

traits$cramps_controls <- ifelse(traits$cramps_nodr_9yr == 1 | traits$cramps_nodr_10yr == 1 | traits$cramps_nodr_11yr == 1 | traits$cramps_nodr_13yr == 1 | traits$cramps_nodr_14yr == 1 | 
                                   traits$cramps_nodr_15yr == 1 | traits$cramps_nodr_16yr == 1 | traits$cramps_nodr_17yr == 1 | traits$cramps_8yr == "No" | 
                                   traits$cramps_9yr == "No" | traits$cramps_10yr == "No" | traits$cramps_11yr == "No" | traits$cramps_13yr == "No" | 
                                   traits$cramps_14yr == "No" | traits$cramps_15yr == "No" | traits$sev_cramps_15yr == "Mild" | traits$cramps_16yr == "No" | 
                                   traits$cramps_17yr == "No",1,0)
table(traits$cramps_controls)

# However, this variable captured 2993 women, including 419 young women who had reported no at ≥1 timepoint and yes at ≥1 timepoint - these women needed to be moved from 
# controls to cases. So I generated a variable for ever having visited the doctor for dysmenorrhea

traits$dysmen_drvisit_ever <- ifelse(traits$dr_cramps_9yr == "Yes" |traits$dr_cramps_10yr == "Yes" | traits$dr_cramps_11yr == "Yes" | traits$dr_cramps_13yr == "Yes" | traits$dr_cramps_14yr == "Yes" | 
                                       traits$dr_cramps_15yr == "Yes" | traits$dr_cramps_16yr == "Yes" | traits$dr_cramps_17yr == "Yes",1,0)
table(traits$dysmen_drvisit_ever)

# This variable captured 641 women who had been to the dr ≥1 time during puberty. Now I just needed to remove the 419 from controls and split cases (coded as 1) and controls 
# (coded as 0) in one variable

traits$dysmen_ewas <- NA
traits$dysmen_ewas[traits$cramps_controls ==1] <- 0
traits$dysmen_ewas[traits$dysmen_drvisit_ever ==1] <- 1
traits$dysmen_ewas <- factor(traits$dysmen_ewas,
                             levels = c(0,1),
                             labels = c("Controls", "Cases"))
table(traits$dysmen_ewas)

traits$dysmen_prev <- ifelse(traits$cramps_8yr == "Yes" | traits$cramps_9yr == "Yes" | traits$cramps_10yr == "Yes" | traits$cramps_11yr == "Yes" | traits$cramps_13yr == "Yes"
                             | traits$cramps_14yr == "Yes" | traits$mod_sev_cramps_15yr == 1 | traits$cramps_16yr == "Yes" | traits$cramps_17yr == "Yes",1,0)
table(traits$dysmen_prev)

traits$dysmen_dr_prev <- ifelse(traits$dr_cramps_8yr == "Yes" | traits$dr_cramps_9yr == "Yes" | traits$dr_cramps_10yr == "Yes" | traits$dr_cramps_11yr == "Yes" | traits$dr_cramps_13yr == "Yes"
                                | traits$dr_cramps_14yr == "Yes" | traits$dr_cramps_15yr == "Yes" | traits$dr_cramps_16yr == "Yes" | traits$dr_cramps_17yr == "Yes",1,0)
table(traits$dysmen_dr_prev)

traits$dysmen_controls <- ifelse(traits$cramps_9yr == "No" | traits$cramps_10yr == "No" | traits$cramps_11yr == "No" | traits$cramps_13yr == "No" | 
                                   traits$cramps_14yr == "No" | traits$cramps_15yr == "No" | traits$sev_cramps_15yr =="Mild" | 
                                   traits$cramps_16yr == "No" | traits$cramps_17yr == "No",1,0)
table(traits$dysmen_controls)

traits$dysmen <- NA
traits$dysmen[traits$dysmen_controls ==1] <- 0
traits$dysmen[traits$dysmen_prev ==1] <- 1
traits$dysmen <- factor(traits$dysmen,
                        levels = c(0,1),
                        labels = c("Controls", "Cases"))
table(traits$dysmen)

traits$cramps <- NA
traits$cramps[traits$dysmen == "Controls"] <- 0
traits$cramps[traits$dysmen_ewas == "Cases"] <- 1
traits$cramps <- factor(traits$cramps,
                        levels = c(0,1),
                        labels = c("Controls", "Cases"))
table(traits$cramps)

# For heavy/prolonged bleeding
traits$hmb_nodr_10yr <- ifelse(traits$hmb_10yr == "Yes" & traits$dr_hmb_10yr == "No",1,0)
table(traits$hmb_nodr_10yr)

traits$hmb_nodr_11yr <- ifelse(traits$hmb_11yr == "Yes" & traits$dr_hmb_11yr == "No",1,0)
table(traits$hmb_nodr_11yr)

traits$hmb_nodr_13yr <- ifelse(traits$hmb_13yr == "Yes" & traits$dr_hmb_13yr == "No",1,0)
table(traits$hmb_nodr_13yr)

traits$hmb_nodr_14yr <- ifelse(traits$hmb_14yr == "Yes" & traits$dr_hmb_14yr == "No",1,0)
table(traits$hmb_nodr_14yr)

traits$hmb_nodr_15yr <- ifelse(traits$hmb_15yr == "Yes" & traits$dr_hmb_15yr == "No",1,0)
table(traits$hmb_nodr_15yr)

traits$hmb_nodr_16yr <- ifelse(traits$hmb_16yr == "Yes" & traits$dr_hmb_16yr == "No",1,0)
table(traits$hmb_nodr_16yr)

traits$hmb_nodr_17yr <- ifelse(traits$hmb_17yr == "Yes" & traits$dr_hmb_17yr == "No",1,0)
table(traits$hmb_nodr_17yr)

# Using these variables, I generated a variable hmb_controls which asking if a young women had reported menorrhagia at any timpoint but not visted the dr
# or never reported menorrhagia at all

traits$hmb_controls <- ifelse(traits$hmb_nodr_10yr == 1 | traits$hmb_nodr_11yr == 1 | traits$hmb_nodr_13yr == 1 | traits$hmb_nodr_14yr == 1 | 
                                traits$hmb_nodr_15yr == 1 | traits$hmb_nodr_16yr == 1 | traits$hmb_nodr_17yr == 1 | traits$hmb_8yr == "No" | 
                                traits$hmb_9yr == "No" | traits$hmb_10yr == "No" | traits$hmb_11yr == "No" | traits$hmb_13yr == "No" | 
                                traits$hmb_14yr == "No" | traits$hmb_15yr == "No" | traits$hmb_16yr == "No" | traits$hmb_17yr == "No",1,0)
table(traits$hmb_controls)

# However, this variable captured 4094 women, including 417 young women who had reported no at ≥1 timepoint and yes at ≥1 timepoint - these women needed to be moved from 
# controls to cases. So I generated a variable for ever having visited the doctor for menorrhagia

traits$menorr_drvisit_ever <- ifelse(traits$dr_hmb_10yr == "Yes" | traits$dr_hmb_11yr == "Yes" | traits$dr_hmb_13yr == "Yes" | traits$dr_hmb_14yr == "Yes" | 
                                       traits$dr_hmb_15yr == "Yes" | traits$dr_hmb_16yr == "Yes" | traits$dr_hmb_17yr == "Yes",1,0)
table(traits$menorr_drvisit_ever)

# This variable captured 527 women who had been to the dr ≥1 time during puberty. Now I just needed to remove the 289 from controls and split cases (coded as 1) and controls 
# (coded as 0) in one variable

traits$menorr_ewas <- NA
traits$menorr_ewas[traits$hmb_controls ==1] <- 0
traits$menorr_ewas[traits$menorr_drvisit_ever ==1] <- 1
traits$menorr_ewas <- factor(traits$menorr_ewas,
                             levels = c(0,1),
                             labels = c("Controls", "Cases"))
table(traits$menorr_ewas)

traits$menorr_prev <- ifelse(traits$hmb_8yr == "Yes" | traits$hmb_9yr == "Yes" | traits$hmb_10yr == "Yes" | traits$hmb_11yr == "Yes" | traits$hmb_13yr == "Yes"
                             | traits$hmb_14yr == "Yes" | traits$hmb_15yr == "Yes" | traits$hmb_16yr == "Yes" | traits$hmb_17yr == "Yes",1,0)
table(traits$menorr_prev)

traits$menorr_dr_prev <- ifelse(traits$dr_hmb_8yr == "Yes" | traits$dr_hmb_9yr == "Yes" | traits$dr_hmb_10yr == "Yes" | traits$dr_hmb_11yr == "Yes" | traits$dr_hmb_13yr == "Yes"
                                | traits$dr_hmb_14yr == "Yes" | traits$dr_hmb_15yr == "Yes" | traits$dr_hmb_16yr == "Yes" | traits$dr_hmb_17yr == "Yes",1,0)
table(traits$menorr_dr_prev)

traits$menorr_controls <- ifelse(traits$hmb_9yr == "No" | traits$hmb_10yr == "No" | traits$hmb_11yr == "No" | traits$hmb_13yr == "No" | 
                                   traits$hmb_14yr == "No" | traits$hmb_15yr == "No" | traits$hmb_16yr == "No" | traits$hmb_17yr == "No",1,0)
table(traits$menorr_controls)

traits$menorr <- NA
traits$menorr[traits$menorr_controls ==1] <- 0
traits$menorr[traits$menorr_prev ==1] <- 1
traits$menorr <- factor(traits$menorr,
                        levels = c(0,1),
                        labels = c("Controls", "Cases"))
table(traits$menorr)

traits$hmb <- NA
traits$hmb[traits$menorr == "Controls"] <- 0
traits$hmb[traits$menorr_ewas == "Cases"] <- 1
traits$hmb <- factor(traits$hmb,
                     levels = c(0,1),
                     labels = c("Controls", "Cases"))
table(traits$hmb)

# Load in mp1 to get age at menarche for traits
setwd("/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/Mini Project 1/R data/Data")
load("mp1.Rda")

traits$men_age_m <- mp1$men_age_m
traits$men_age_m_z <- scale(traits$men_age_m)

# Get comorbidity for traits
traits$comorbidity <- mp1$comorbidity
traits$contraception <- mp1$contraception_ewas

# Get cramp and hmb sensitivity analysis variables
traits$cramps_sens <- mp1$cramps_sens
traits$hmb_sens <- mp1$hmb_sens

# Save the dataset cleaned ready for the analysis
save(traits, file = "traits.Rda")

# And save the dataset with comorbidities removed for the supplementary material
# Remove comorbidity by the end of puberty for merging with samplesheet
traits$comorbidity[is.na(traits$comorbidity)] <- 0
table(traits$comorbidity)
comorbidrm <- traits[!(traits$comorbidity == 1),]