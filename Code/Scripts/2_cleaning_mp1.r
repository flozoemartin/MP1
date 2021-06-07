##############################################################################################################################################################
#                                                                                                                                                            #
#   Script for cleaning mp1 dataset abstracted from ALSPAC drive                                                                                             #         
#                                                                                                                                                            #
#   Author:       Flo Martin                                                                                                                                 #
#   Start Date:   02/11/2020                                                                                                                                 #
#   Finish Date:  04/06/2021                                                                                                                                 #
#   Description:  This script describes data cleaning for flo_27nov for mini project 1                                                                       #                                                                                                                       
#                                                                                                                                                            # 
##############################################################################################################################################################

# Contents #
# line 26 - Environment management #
# line 129 - PUB1 8 years old #
# line 187 - PUB2 9 years old #
# line 250 - PUB3 10 years old #
# line 314 - PUB4 11 years old #
# line 379 - PUB5 13 years old #
# line 444 - PUB6 14 years old #
# line 509 - PUB7 15 years old #
# line 584 - PUB8 16 years old #
# line 649 - PUB9 17 years old #
# line 731 - Deriving symptom cases & controls #
# line 956 - Cleaning & deriving trait variables #

rm(flo_27nov)
rm(mp1)                         # This clears the mp1 & flo_02nov data in global environment

setwd("/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/Mini Project 1/R Data/Data")

load("flo_27nov.Rda")           # Load in the raw dataset as pulled from R:/Data
mp1 <- data.frame(flo_27nov)    # ...and the create a copy of flo_02nov (blank - no labels) which will allow any changes made to 
                                # the following code be properly implemented in mp1. At the end of this script, R will save the 
                                # newest copy of mp1.Rda in the R file in OneDrive.  
colnames(mp1)                   # This allows me to check all the column names and category labels are as they were when pulled 
                                # from R:/Data

colnames(mp1) [4] <- "men_age_m"
colnames(mp1) [6] <- "mat_edu"
colnames(mp1) [16] <- "cotinine_17yr"
colnames(mp1) [17] <- "sex"
colnames(mp1) [20] <- "started_period_8yr"
colnames(mp1) [21] <- "hmb_8yr"
colnames(mp1) [22] <- "dr_hmb_8yr"
colnames(mp1) [23] <- "cramps_8yr"
colnames(mp1) [24] <- "dr_cramps_8yr"
colnames(mp1) [27] <- "oral_contraceptives_pastyr_8yr"
colnames(mp1) [28] <- "thyroid_problem_8yr"
colnames(mp1) [31] <- "started_period_9yr"
colnames(mp1) [32] <- "hmb_9yr"
colnames(mp1) [33] <- "dr_hmb_9yr"
colnames(mp1) [34] <- "cramps_9yr"
colnames(mp1) [35] <- "dr_cramps_9yr"
colnames(mp1) [38] <- "oral_contraceptives_pastyr_9yr"
colnames(mp1) [39] <- "thyroid_problem_9yr"
colnames(mp1) [42] <- "started_period_10yr"
colnames(mp1) [44] <- "hmb_10yr"
colnames(mp1) [45] <- "dr_hmb_10yr"
colnames(mp1) [46] <- "cramps_10yr"
colnames(mp1) [47] <- "dr_cramps_10yr"
colnames(mp1) [50] <- "oral_contraceptives_pastyr_10yr"
colnames(mp1) [51] <- "thyroid_problem_10yr"
colnames(mp1) [54] <- "started_period_11yr"
colnames(mp1) [56] <- "hmb_11yr"
colnames(mp1) [57] <- "dr_hmb_11yr"
colnames(mp1) [58] <- "cramps_11yr"
colnames(mp1) [59] <- "dr_cramps_11yr"
colnames(mp1) [62] <- "oral_contraceptives_pastyr_11yr"
colnames(mp1) [63] <- "thyroid_problem_11yr"
colnames(mp1) [66] <- "started_period_13yr"
colnames(mp1) [68] <- "hmb_13yr"
colnames(mp1) [69] <- "dr_hmb_13yr"
colnames(mp1) [70] <- "cramps_13yr"
colnames(mp1) [71] <- "dr_cramps_13yr"
colnames(mp1) [74] <- "oral_contraceptives_pastyr_13yr"
colnames(mp1) [75] <- "thyroid_problem_13yr"
colnames(mp1) [78] <- "started_period_14yr"
colnames(mp1) [80] <- "hmb_14yr"
colnames(mp1) [81] <- "dr_hmb_14yr"
colnames(mp1) [82] <- "cramps_14yr"
colnames(mp1) [83] <- "dr_cramps_14yr"
colnames(mp1) [86] <- "oral_contraceptives_pastyr_14yr"
colnames(mp1) [87] <- "thyroid_problem_14yr"
colnames(mp1) [89] <- "started_period_15yr"
colnames(mp1) [91] <- "hmb_15yr"
colnames(mp1) [92] <- "dr_hmb_15yr"
colnames(mp1) [93] <- "cramps_15yr"
colnames(mp1) [94] <- "severity_cramps_15yr"
colnames(mp1) [95] <- "dr_cramps_15yr"
colnames(mp1) [98] <- "oral_contraceptives_pastyr_15yr"
colnames(mp1) [99] <- "thyroid_problem_15yr"
colnames(mp1) [102] <- "started_period_16yr"
colnames(mp1) [104] <- "hmb_16yr"
colnames(mp1) [105] <- "dr_hmb_16yr"
colnames(mp1) [106] <- "cramps_16yr"
colnames(mp1) [107] <- "dr_cramps_16yr"
colnames(mp1) [110] <- "oral_contraceptives_pastyr_16yr"
colnames(mp1) [111] <- "thyroid_problem_16yr"
colnames(mp1) [112] <- "bmi_17yr"
colnames(mp1) [114] <- "started_period_17yr"
colnames(mp1) [116] <- "hmb_17yr"
colnames(mp1) [117] <- "dr_hmb_17yr"
colnames(mp1) [118] <- "cramps_17yr"
colnames(mp1) [119] <- "dr_cramps_17yr"
colnames(mp1) [122] <- "oral_contraceptives_pastyr_17yr"
colnames(mp1) [123] <- "thyroid_problem_17yr"
colnames(mp1) [124] <- "bmi_15yr"
colnames(mp1) [128] <- "bmi_17yr_tf4"
colnames(mp1) [133] <- "pcos"
colnames(mp1) [134] <- "endometriosis"
colnames(mp1) [135] <- "pcos_imputeno"
colnames(mp1) [136] <- "endometriosis_imputeno"
colnames(mp1) [141] <- "smoked_reg_during_preg"
colnames(mp1) [142] <- "smoked_in_t1"
colnames(mp1) [143] <- "smoked_18wkgest"

# Variable for participant sex, labels are as shown below:
table(mp1$sex)
table(mp1$sex,mp1$cramps_15yr)  # Used this table to deduce which number was male - no. 1 had no answers for this part of the questionnaire => 2 is female
mp1$sex <- ifelse(mp1$sex == 1,1,
                  ifelse(mp1$sex == 2,2, NA))
mp1$sex <- factor(mp1$sex, 
                  levels = c(1,2), 
                  labels =c("Male","Female"))
table(mp1$sex)
table(mp1$sex,mp1$cramps_15yr)  # Check the labels in the context of a period-related variable to make sure there aren't lots of answers for men which there are 
                                # not!

# Using the D1501_PUB1.pdf (participant 8 years old):

# Variable for whether child has started her period yet:
table(mp1$started_period_8yr, mp1$sex)  # Used sex in here to see if -10 referred to males which it does
mp1$started_period_8yr <- ifelse(mp1$started_period_8yr == 1,1,
                                 ifelse(mp1$started_period_8yr == 2,0, NA))
mp1$started_period_8yr <- factor(mp1$started_period_8yr, 
                                 levels = c(0,1), 
                                 labels = c("No","Yes"))
table(mp1$started_period_8yr)

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_8yr)
mp1$hmb_8yr <- ifelse(mp1$hmb_8yr == 2,0, NA)
mp1$hmb_8yr <- factor(mp1$hmb_8yr, 
                      levels = c(0), 
                      labels = c("No"))
table(mp1$hmb_8yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_8yr)
mp1$dr_hmb_8yr <- ifelse(mp1$dr_hmb_8yr == -2,NA,
                         ifelse(mp1$dr_hmb_8yr == -10,NA,
                                ifelse(mp1$dr_hmb_8yr == -3,NA, NA)))
table(mp1$dr_hmb_8yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_8yr) 
mp1$cramps_8yr <- ifelse(mp1$cramps_8yr == 2,0, NA)
mp1$cramps_8yr <- factor(mp1$cramps_8yr, 
                         levels = c(0), 
                         labels = c("No"))
table(mp1$cramps_8yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_8yr)
mp1$dr_cramps_8yr <- ifelse(mp1$dr_cramps_8yr == -10,NA,
                            ifelse(mp1$dr_cramps_8yr == -3,NA,
                                   ifelse(mp1$dr_cramps_8yr == -2,NA, NA)))
table(mp1$dr_cramps_8yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_8yr)
mp1$oral_contraceptives_pastyr_8yr <- ifelse(mp1$oral_contraceptives_pastyr_8yr == 2,0, NA)
mp1$oral_contraceptives_pastyr_8yr <- factor(mp1$oral_contraceptives_pastyr_8yr, 
                                             levels = c(0), 
                                             labels = c("No"))
table(mp1$oral_contraceptives_pastyr_8yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_8yr)
mp1$thyroid_problem_8yr <- ifelse(mp1$thyroid_problem_8yr == 1,1,
                                         ifelse(mp1$thyroid_problem_8yr == 2,0, NA))
mp1$thyroid_problem_8yr <- factor(mp1$thyroid_problem_8yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$thyroid_problem_8yr)

# Using the D1501_PUB2.pdf (participant 9 years old):

# Variable for whether child has started her period yet:
table(mp1$started_period_9yr, mp1$sex)  # Used sex in here to see if -10 referred to males which it does
mp1$started_period_9yr <- ifelse(mp1$started_period_9yr == 1,1,
                                 ifelse(mp1$started_period_9yr == 2,0, NA))
mp1$started_period_9yr <- factor(mp1$started_period_9yr, 
                                 levels = c(0,1), 
                                 labels = c("No","Yes"))
table(mp1$started_period_9yr)

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_9yr)
mp1$hmb_9yr <- ifelse(mp1$hmb_9yr == 2,0,
                        ifelse(mp1$hmb_9yr == 1,1, NA))
mp1$hmb_9yr <- factor(mp1$hmb_9yr, 
                      levels = c(0,1), 
                      labels = c("No","Yes"))
table(mp1$hmb_9yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_9yr)
mp1$dr_hmb_9yr <- ifelse(mp1$dr_hmb_9yr == 2,0, NA)
mp1$dr_hmb_9yr <- factor(mp1$dr_hmb_9yr, 
                         levels = c(0), 
                         labels = c("No"))
table(mp1$dr_hmb_9yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_9yr)
mp1$cramps_9yr <- ifelse(mp1$cramps_9yr == 2,0,
                         ifelse(mp1$cramps_9yr == 1,1,NA))
mp1$cramps_9yr <- factor(mp1$cramps_9yr, 
                         levels = c(0,1), 
                         labels = c("No","Yes"))
table(mp1$cramps_9yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_9yr)
mp1$dr_cramps_9yr <- ifelse(mp1$dr_cramps_9yr == 1,1,
                                ifelse(mp1$dr_cramps_9yr == 2,0, NA))
mp1$dr_cramps_9yr <- factor(mp1$dr_cramps_9yr, 
                            levels = c(0,1), 
                            labels = c("No","Yes"))
table(mp1$dr_cramps_9yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_9yr)
mp1$oral_contraceptives_pastyr_9yr <- ifelse(mp1$oral_contraceptives_pastyr_9yr == 2,0, NA)
mp1$oral_contraceptives_pastyr_9yr <- factor(mp1$oral_contraceptives_pastyr_9yr, 
                                             levels = c(0), 
                                             labels = c("No"))
table(mp1$oral_contraceptives_pastyr_9yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_9yr)
mp1$thyroid_problem_9yr <- ifelse(mp1$thyroid_problem_9yr == 1,1,
                                    ifelse(mp1$thyroid_problem_9yr == 2,0, NA))
mp1$thyroid_problem_9yr <- factor(mp1$thyroid_problem_9yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$thyroid_problem_9yr)

# Using the D1501_PUB3.pdf (participant 10 years old):

# Variable for whether child has started her period yet:
table(mp1$started_period_10yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_10yr <- ifelse(mp1$started_period_10yr == 1,1,
                                  ifelse(mp1$started_period_10yr == 2,0, NA))
mp1$started_period_10yr <- factor(mp1$started_period_10yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$started_period_10yr)

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_10yr)
mp1$hmb_10yr <- ifelse(mp1$hmb_10yr == 1,1, 
                          ifelse(mp1$hmb_10yr == 2,0, NA))
mp1$hmb_10yr <- factor(mp1$hmb_10yr, 
                       levels = c(0,1), 
                       labels = c("No","Yes"))
table(mp1$hmb_10yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_10yr)
mp1$dr_hmb_10yr <- ifelse(mp1$dr_hmb_10yr == 2,0, 
                                ifelse(mp1$dr_hmb_10yr == 1,1, NA))
mp1$dr_hmb_10yr <- factor(mp1$dr_hmb_10yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(mp1$dr_hmb_10yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_10yr)
mp1$cramps_10yr <- ifelse(mp1$cramps_10yr == 2,0, 
                           ifelse(mp1$cramps_10yr == 1,1, NA))
mp1$cramps_10yr <- factor(mp1$cramps_10yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(mp1$cramps_10yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_10yr)
mp1$dr_cramps_10yr <- ifelse(mp1$dr_cramps_10yr == 1,1,
                                   ifelse(mp1$dr_cramps_10yr == 2,0, NA))
mp1$dr_cramps_10yr <- factor(mp1$dr_cramps_10yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(mp1$dr_cramps_10yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_10yr)
mp1$oral_contraceptives_pastyr_10yr <- ifelse(mp1$oral_contraceptives_pastyr_10yr == 2,0, NA)
mp1$oral_contraceptives_pastyr_10yr <- factor(mp1$oral_contraceptives_pastyr_10yr, 
                                              levels = c(0), 
                                              labels = c("No"))
table(mp1$oral_contraceptives_pastyr_10yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_10yr)
mp1$thyroid_problem_10yr <- ifelse(mp1$thyroid_problem_10yr == 1,1,
                                          ifelse(mp1$thyroid_problem_10yr == 2,0, NA))
mp1$thyroid_problem_10yr <- factor(mp1$thyroid_problem_10yr, 
                                   levels = c(0,1), 
                                   labels = c("No","Yes"))
table(mp1$thyroid_problem_10yr)

# Using the D1501_PUB4.pdf (participant 11 years old):

# Variable for whether child has started her period yet:
table(mp1$started_period_11yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_11yr <- ifelse(mp1$started_period_11yr == 1,1,
                                  ifelse(mp1$started_period_11yr == 2,0, NA))
mp1$started_period_11yr <- factor(mp1$started_period_11yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$started_period_11yr)

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_11yr)
mp1$hmb_11yr <- ifelse(mp1$hmb_11yr == 1,1, 
                            ifelse(mp1$hmb_11yr == 2,0, NA))
mp1$hmb_11yr <- factor(mp1$hmb_11yr, 
                       levels = c(0,1), 
                       labels = c("No","Yes"))
table(mp1$hmb_11yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_11yr)
mp1$dr_hmb_11yr <- ifelse(mp1$dr_hmb_11yr == 2,0, 
                               ifelse(mp1$dr_hmb_11yr == 1,1, NA))
mp1$dr_hmb_11yr <- factor(mp1$dr_hmb_11yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(mp1$dr_hmb_11yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_11yr)
mp1$cramps_11yr <- ifelse(mp1$cramps_11yr == 2,0, 
                            ifelse(mp1$cramps_11yr == 1,1, NA))
mp1$cramps_11yr <- factor(mp1$cramps_11yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(mp1$cramps_11yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_11yr)
mp1$dr_cramps_11yr <- ifelse(mp1$dr_cramps_11yr == 2,0, 
                               ifelse(mp1$dr_cramps_11yr == 1,1, NA))
mp1$dr_cramps_11yr <- factor(mp1$dr_cramps_11yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(mp1$dr_cramps_11yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_11yr)
mp1$oral_contraceptives_pastyr_11yr <- ifelse(mp1$oral_contraceptives_pastyr_11yr == 2,0,
                                                    ifelse(mp1$oral_contraceptives_pastyr_11yr == 1,1, NA))
mp1$oral_contraceptives_pastyr_11yr <- factor(mp1$oral_contraceptives_pastyr_11yr, 
                                              levels = c(0,1), 
                                              labels = c("No","Yes"))
table(mp1$oral_contraceptives_pastyr_11yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_11yr)
mp1$thyroid_problem_11yr <- ifelse(mp1$thyroid_problem_11yr == 1,1,
                                      ifelse(mp1$thyroid_problem_11yr == 2,0, NA))
mp1$thyroid_problem_11yr <- factor(mp1$thyroid_problem_11yr, 
                                   levels = c(0,1), 
                                   labels = c("No","Yes"))
table(mp1$thyroid_problem_11yr)

# Using the D1501_PUB5.pdf (participant 13 years old):

# Variable for whether child has started her period yet:
table(mp1$started_period_13yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_13yr <- ifelse(mp1$started_period_13yr == 1,1,
                                  ifelse(mp1$started_period_13yr == 2,0, NA))
mp1$started_period_13yr <- factor(mp1$started_period_13yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$started_period_13yr)

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_13yr)
mp1$hmb_13yr <- ifelse(mp1$hmb_13yr == 1,1, 
                              ifelse(mp1$hmb_13yr == 2,0, NA))
mp1$hmb_13yr <- factor(mp1$hmb_13yr, 
                       levels = c(0,1), 
                       labels = c("No","Yes"))
table(mp1$hmb_13yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_13yr)
mp1$dr_hmb_13yr <- ifelse(mp1$dr_hmb_13yr == 2,0, 
                               ifelse(mp1$dr_hmb_13yr == 1,1, NA))
mp1$dr_hmb_13yr <- factor(mp1$dr_hmb_13yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(mp1$dr_hmb_13yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_13yr)
mp1$cramps_13yr <- ifelse(mp1$cramps_13yr == 2,0, 
                              ifelse(mp1$cramps_13yr == 1,1, NA))
mp1$cramps_13yr <- factor(mp1$cramps_13yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(mp1$cramps_13yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_13yr)
mp1$dr_cramps_13yr <- ifelse(mp1$dr_cramps_13yr == 1,1,
                                  ifelse(mp1$dr_cramps_13yr == 2,0, NA))
mp1$dr_cramps_13yr <- factor(mp1$dr_cramps_13yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(mp1$dr_cramps_13yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_13yr)
mp1$oral_contraceptives_pastyr_13yr <- ifelse(mp1$oral_contraceptives_pastyr_13yr == 2,0,
                                                    ifelse(mp1$oral_contraceptives_pastyr_13yr == 1,1, NA))
mp1$oral_contraceptives_pastyr_13yr <- factor(mp1$oral_contraceptives_pastyr_13yr, 
                                              levels = c(0,1), 
                                              labels = c("No","Yes"))
table(mp1$oral_contraceptives_pastyr_13yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_13yr)
mp1$thyroid_problem_13yr <- ifelse(mp1$thyroid_problem_13yr == 1,1,
                                          ifelse(mp1$thyroid_problem_13yr == 2,0, NA))
mp1$thyroid_problem_13yr <- factor(mp1$thyroid_problem_13yr, 
                                   levels = c(0,1), 
                                   labels = c("No","Yes"))
table(mp1$thyroid_problem_13yr)

# Using the D1501_PUB6.pdf (participant 14 years old):

# Variable for whether child has started her period yet:
table(mp1$started_period_14yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_14yr <- ifelse(mp1$started_period_14yr == 1,1,
                                  ifelse(mp1$started_period_14yr == 2,0, NA))
mp1$started_period_14yr <- factor(mp1$started_period_14yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$started_period_14yr)

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_14yr)
mp1$hmb_14yr <-  ifelse(mp1$hmb_14yr == 1,1, 
                            ifelse(mp1$hmb_14yr == 2,0, NA))
mp1$hmb_14yr <- factor(mp1$hmb_14yr, 
                       levels = c(0,1), 
                       labels = c("No","Yes"))
table(mp1$hmb_14yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_14yr)
mp1$dr_hmb_14yr <- ifelse(mp1$dr_hmb_14yr == 2,0, 
                                   ifelse(mp1$dr_hmb_14yr == 1,1, NA))
mp1$dr_hmb_14yr <- factor(mp1$dr_hmb_14yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(mp1$dr_hmb_14yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_14yr)
mp1$cramps_14yr <- ifelse(mp1$cramps_14yr == 2,0, 
                          ifelse(mp1$cramps_14yr == 1,1, NA))
mp1$cramps_14yr <- factor(mp1$cramps_14yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(mp1$cramps_14yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_14yr)
mp1$dr_cramps_14yr <- ifelse(mp1$dr_cramps_14yr == 1,1,
                                    ifelse(mp1$dr_cramps_14yr == 2,0, NA))
mp1$dr_cramps_14yr <- factor(mp1$dr_cramps_14yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(mp1$dr_cramps_14yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_14yr)
mp1$oral_contraceptives_pastyr_14yr <- ifelse(mp1$oral_contraceptives_pastyr_14yr == 2,0,
                                                  ifelse(mp1$oral_contraceptives_pastyr_14yr == 1,1, NA))
mp1$oral_contraceptives_pastyr_14yr <- factor(mp1$oral_contraceptives_pastyr_14yr, 
                                              levels = c(0,1), 
                                              labels = c("No","Yes"))
table(mp1$oral_contraceptives_pastyr_14yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_14yr)
mp1$thyroid_problem_14yr <- ifelse(mp1$thyroid_problem_14yr == 1,1,
                                     ifelse(mp1$thyroid_problem_14yr == 2,0, NA))
mp1$thyroid_problem_14yr <- factor(mp1$thyroid_problem_14yr, 
                                   levels = c(0,1), 
                                   labels = c("No","Yes"))
table(mp1$thyroid_problem_14yr)

# Using the D1501_PUB7.pdf (participant 15 years old):

# Variable for whether child has started her period yet:
table(mp1$started_period_15yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_15yr <- ifelse(mp1$started_period_15yr == 1,1,
                                  ifelse(mp1$started_period_15yr == 2,0, NA))
mp1$started_period_15yr <- factor(mp1$started_period_15yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$started_period_15yr)

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_15yr)
mp1$hmb_15yr <- ifelse(mp1$hmb_15yr == 1,1, 
                             ifelse(mp1$hmb_15yr == 2,0, NA))
mp1$hmb_15yr <- factor(mp1$hmb_15yr, 
                       levels = c(0,1), 
                       labels = c("No","Yes"))
table(mp1$hmb_15yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_15yr)
mp1$dr_hmb_15yr <- ifelse(mp1$dr_hmb_15yr == 2,0, 
                                ifelse(mp1$dr_hmb_15yr == 1,1, NA))
mp1$dr_hmb_15yr <- factor(mp1$dr_hmb_15yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(mp1$dr_hmb_15yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_15yr)
mp1$cramps_15yr <- ifelse(mp1$cramps_15yr == 2,0, 
                              ifelse(mp1$cramps_15yr == 1,1, NA))
mp1$cramps_15yr <- factor(mp1$cramps_15yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(mp1$cramps_15yr)

# Variable for severity of cramps associated with period:
table(mp1$severity_cramps_15yr)
mp1$severity_cramps_15yr <- ifelse(mp1$severity_cramps_15yr == 1,1,
                                   ifelse(mp1$severity_cramps_15yr == 2,2,
                                          ifelse(mp1$severity_cramps_15yr == 3,3, NA)))
mp1$severity_cramps_15yr <- factor(mp1$severity_cramps_15yr, 
                                   levels = c(1,2,3), 
                                   labels = c("Mild","Moderate","Severe"))
table(mp1$severity_cramps_15yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_15yr)
mp1$dr_cramps_15yr <- ifelse(mp1$dr_cramps_15yr == 1,1,
                                   ifelse(mp1$dr_cramps_15yr == 2,0, NA))
mp1$dr_cramps_15yr <- factor(mp1$dr_cramps_15yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(mp1$dr_cramps_15yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_15yr)
mp1$oral_contraceptives_pastyr_15yr <- ifelse(mp1$oral_contraceptives_pastyr_15yr == 2,0,
                                                    ifelse(mp1$oral_contraceptives_pastyr_15yr == 1,1, NA))
mp1$oral_contraceptives_pastyr_15yr <- factor(mp1$oral_contraceptives_pastyr_15yr, 
                                              levels = c(0,1), 
                                              labels = c("No","Yes"))
table(mp1$oral_contraceptives_pastyr_15yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_15yr)
mp1$thyroid_problem_15yr <- ifelse(mp1$thyroid_problem_15yr == 1,1,
                                    ifelse(mp1$thyroid_problem_15yr == 2,0, NA))
mp1$thyroid_problem_15yr <- factor(mp1$thyroid_problem_15yr, 
                                   levels = c(0,1), 
                                   labels = c("No","Yes"))
table(mp1$thyroid_problem_15yr)

# Using the D1501_PUB8.pdf (participant 16 years old):

# Variable for whether child has started her period yet:
table(mp1$started_period_16yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_16yr <- ifelse(mp1$started_period_16yr == 1,1,
                                  ifelse(mp1$started_period_16yr == 2,0, NA))
mp1$started_period_16yr <- factor(mp1$started_period_16yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$started_period_16yr)

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_16yr)
mp1$hmb_16yr <-ifelse(mp1$hmb_16yr == 1,1, 
                          ifelse(mp1$hmb_16yr == 2,0, NA))
mp1$hmb_16yr <- factor(mp1$hmb_16yr, 
                       levels = c(0,1), 
                       labels = c("No","Yes"))
table(mp1$hmb_16yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_16yr)
mp1$dr_hmb_16yr <- ifelse(mp1$dr_hmb_16yr == 2,0, 
                               ifelse(mp1$dr_hmb_16yr == 1,1, NA))
mp1$dr_hmb_16yr <- factor(mp1$dr_hmb_16yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(mp1$dr_hmb_16yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_16yr)
mp1$cramps_16yr <- ifelse(mp1$cramps_16yr == 2,0, 
                            ifelse(mp1$cramps_16yr == 1,1, NA))
mp1$cramps_16yr <- factor(mp1$cramps_16yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(mp1$cramps_16yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_16yr)
mp1$dr_cramps_16yr <- ifelse(mp1$dr_cramps_16yr == 1,1,
                                   ifelse(mp1$dr_cramps_16yr == 2,0, NA))
mp1$dr_cramps_16yr <- factor(mp1$dr_cramps_16yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(mp1$dr_cramps_16yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_16yr)
mp1$oral_contraceptives_pastyr_16yr <- ifelse(mp1$oral_contraceptives_pastyr_16yr == 2,0,
                                                 ifelse(mp1$oral_contraceptives_pastyr_16yr == 1,1, NA))
mp1$oral_contraceptives_pastyr_16yr <- factor(mp1$oral_contraceptives_pastyr_16yr, 
                                              levels = c(0,1), 
                                              labels = c("No","Yes"))
table(mp1$oral_contraceptives_pastyr_16yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_16yr)
mp1$thyroid_problem_16yr <- ifelse(mp1$thyroid_problem_16yr == 1,1,
                                          ifelse(mp1$thyroid_problem_16yr == 2,0, NA))
mp1$thyroid_problem_16yr <- factor(mp1$thyroid_problem_16yr, 
                                   levels = c(0,1), 
                                   labels = c("No","Yes"))
table(mp1$thyroid_problem_16yr)

# Using the D1501_PUB9.pdf (participant 17 years old):

# Variable for participants BMI:
table(mp1$bmi_17yr)
mp1$bmi_17yr[mp1$bmi_17yr == -10  | mp1$bmi_17yr == -1] <- NA

table(mp1$bmi_17yr_tf4)
mp1$bmi_17yr_tf4[mp1$bmi_17yr_tf4 == -1 | mp1$bmi_17yr_tf4 == -4 | mp1$bmi_17yr_tf4 == -10] <- NA

mp1$bmi_17yr[is.na(mp1$bmi_17yr)] <- 0
mp1$bmi_17yr_tf4[is.na(mp1$bmi_17yr_tf4)] <- 0
mp1$bmi <- ifelse(mp1$bmi_17yr_tf4 >0,mp1$bmi_17yr_tf4,
                  ifelse(mp1$bmi_17yr_tf4 ==0 & mp1$bmi_17yr >0, mp1$bmi_17yr,NA))
table(mp1$bmi)
mp1$bmi_17yr[mp1$bmi_17yr ==0] <- NA
mp1$bmi_17yr_tf4[mp1$bmi_17yr_tf4 ==0] <- NA

mp1$bmi_cc <- ifelse(is.na(mp1$bmi),0,1)
table(mp1$bmi_cc)

# Variable for whether child has started her period yet:
table(mp1$started_period_17yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_17yr <- ifelse(mp1$started_period_17yr == 1,1,
                                  ifelse(mp1$started_period_17yr == 2,0, NA))
mp1$started_period_17yr <- factor(mp1$started_period_17yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$started_period_17yr)

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_17yr)
mp1$hmb_17yr <- ifelse(mp1$hmb_17yr == 1,1, 
                        ifelse(mp1$hmb_17yr == 2,0, NA))
mp1$hmb_17yr <- factor(mp1$hmb_17yr, 
                       levels = c(0,1), 
                       labels = c("No","Yes"))
table(mp1$hmb_17yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_17yr)
mp1$dr_hmb_17yr <- ifelse(mp1$dr_hmb_17yr == 2,0, 
                                  ifelse(mp1$dr_hmb_17yr == 1,1, NA))
mp1$dr_hmb_17yr <- factor(mp1$dr_hmb_17yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(mp1$dr_hmb_17yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_17yr)
mp1$cramps_17yr <- ifelse(mp1$cramps_17yr == 2,0, 
                              ifelse(mp1$cramps_17yr == 1,1, NA))
mp1$cramps_17yr <- factor(mp1$cramps_17yr, 
                          levels = c(0,1), 
                          labels = c("No","Yes"))
table(mp1$cramps_17yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_17yr)
mp1$dr_cramps_17yr <- ifelse(mp1$dr_cramps_17yr == 1,1,
                                      ifelse(mp1$dr_cramps_17yr == 2,0, NA))
mp1$dr_cramps_17yr <- factor(mp1$dr_cramps_17yr, 
                             levels = c(0,1), 
                             labels = c("No","Yes"))
table(mp1$dr_cramps_17yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_17yr)
mp1$oral_contraceptives_pastyr_17yr <- ifelse(mp1$oral_contraceptives_pastyr_17yr == 2,0,
                                                    ifelse(mp1$oral_contraceptives_pastyr_17yr == 1,1, NA))
mp1$oral_contraceptives_pastyr_17yr <- factor(mp1$oral_contraceptives_pastyr_17yr, 
                                              levels = c(0,1), 
                                              labels = c("No","Yes"))
table(mp1$oral_contraceptives_pastyr_17yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_17yr)
mp1$thyroid_problem_17yr <- ifelse(mp1$thyroid_problem_17yr == 1,1,
                                          ifelse(mp1$thyroid_problem_17yr == 2,0, NA))
mp1$thyroid_problem_17yr <- factor(mp1$thyroid_problem_17yr, 
                                   levels = c(0,1), 
                                   labels = c("No","Yes"))
table(mp1$thyroid_problem_17yr)

# Here, I have gone through each timepoint and asked if the young woman answered yes to menorrhagia but no to visiting a doctor then code her as a 1.
# Next, coded women who had reported not having menorrhagia at each timepoint

mp1$hmb_nodr_10yr <- ifelse(mp1$hmb_10yr == "Yes" & mp1$dr_hmb_10yr == "No",1,0)
table(mp1$hmb_nodr_10yr)

mp1$hmb_nodr_11yr <- ifelse(mp1$hmb_11yr == "Yes" & mp1$dr_hmb_11yr == "No",1,0)
table(mp1$hmb_nodr_11yr)

mp1$hmb_nodr_13yr <- ifelse(mp1$hmb_13yr == "Yes" & mp1$dr_hmb_13yr == "No",1,0)
table(mp1$hmb_nodr_13yr)

mp1$hmb_nodr_14yr <- ifelse(mp1$hmb_14yr == "Yes" & mp1$dr_hmb_14yr == "No",1,0)
table(mp1$hmb_nodr_14yr)

mp1$hmb_nodr_15yr <- ifelse(mp1$hmb_15yr == "Yes" & mp1$dr_hmb_15yr == "No",1,0)
table(mp1$hmb_nodr_15yr)

mp1$hmb_nodr_16yr <- ifelse(mp1$hmb_16yr == "Yes" & mp1$dr_hmb_16yr == "No",1,0)
table(mp1$hmb_nodr_16yr)

mp1$hmb_nodr_17yr <- ifelse(mp1$hmb_17yr == "Yes" & mp1$dr_hmb_17yr == "No",1,0)
table(mp1$hmb_nodr_17yr)

# Using these variables, I generated a variable hmb_controls which asking if a young women had reported menorrhagia at any timpoint but not visted the dr
# or never reported menorrhagia at all

mp1$hmb_controls <- ifelse(mp1$hmb_nodr_10yr == 1 | mp1$hmb_nodr_11yr == 1 | mp1$hmb_nodr_13yr == 1 | mp1$hmb_nodr_14yr == 1 | 
                             mp1$hmb_nodr_15yr == 1 | mp1$hmb_nodr_16yr == 1 | mp1$hmb_nodr_17yr == 1 | mp1$hmb_8yr == "No" | 
                             mp1$hmb_9yr == "No" | mp1$hmb_10yr == "No" | mp1$hmb_11yr == "No" | mp1$hmb_13yr == "No" | 
                             mp1$hmb_14yr == "No" | mp1$hmb_15yr == "No" | mp1$hmb_16yr == "No" | mp1$hmb_17yr == "No",1,0)
table(mp1$hmb_controls)

# However, this variable captured 4094 women, including 417 young women who had reported no at ≥1 timepoint and yes at ≥1 timepoint - these women needed to be 
# moved from controls to cases. So I generated a variable for ever having visited the doctor for menorrhagia

mp1$menorr_drvisit_ever <- ifelse(mp1$dr_hmb_10yr == "Yes" | mp1$dr_hmb_11yr == "Yes" | mp1$dr_hmb_13yr == "Yes" | mp1$dr_hmb_14yr == "Yes" | 
                                    mp1$dr_hmb_15yr == "Yes" | mp1$dr_hmb_16yr == "Yes" | mp1$dr_hmb_17yr == "Yes",1,0)
table(mp1$menorr_drvisit_ever)

# This variable captured 527 women who had been to the dr ≥1 time during puberty. Now I just needed to remove the 289 from controls and split split cases (coded 
# as 1) and controls (coded as 0) in one variable

mp1$menorr_ewas <- NA
mp1$menorr_ewas[mp1$hmb_controls ==1] <- 0
mp1$menorr_ewas[mp1$menorr_drvisit_ever ==1] <- 1
mp1$menorr_ewas <- factor(mp1$menorr_ewas,
                          levels = c(0,1),
                          labels = c("Controls", "Cases"))

# Now, the variable menorr_ewas incorporates cases (women who have visited the doctor ≥1 time during puberty n=527) and controls (women who have reported HMB ≥1 
# time during puberty but have never visited the doctor n=3677)

# Check all the timpoints to make sure no controls have visited the doctor 

table(mp1$menorr_ewas, mp1$dr_hmb_10yr)
table(mp1$menorr_ewas, mp1$dr_hmb_11yr)
table(mp1$menorr_ewas, mp1$dr_hmb_13yr)
table(mp1$menorr_ewas, mp1$dr_hmb_14yr)
table(mp1$menorr_ewas, mp1$dr_hmb_15yr)
table(mp1$menorr_ewas, mp1$dr_hmb_16yr)
table(mp1$menorr_ewas, mp1$dr_hmb_17yr)

# Where menorr_ewas denotes cases as having been to the doctor at least once and controls as never having been to the doctor, the definition for the EWAS is 
# case = ever having been to the dr control = never having reported the symptom:
# Need this weird_16yr variable as there are two people who didn't report to have hmb at 16 years but reported to have been to the doctor for it so needed to
# make this a special variable for my characteristic analysis:
mp1$weird_16yr <- ifelse(is.na(mp1$hmb_16yr) & mp1$dr_hmb_16yr == "Yes",1,NA)
table(mp1$weird_16yr)

# Ever having reported the symptom
mp1$menorr_prev <- ifelse(mp1$hmb_8yr == "Yes" | mp1$hmb_9yr == "Yes" | mp1$hmb_10yr == "Yes" | mp1$hmb_11yr == "Yes" | mp1$hmb_13yr == "Yes"
                          | mp1$hmb_14yr == "Yes" | mp1$hmb_15yr == "Yes" | mp1$hmb_16yr == "Yes" | mp1$weird_16yr ==1 | mp1$hmb_17yr == "Yes",1,0)
table(mp1$menorr_prev)

# Ever reported to not not have the symptom
mp1$menorr_controls <- ifelse(mp1$hmb_8yr == "No" | mp1$hmb_9yr == "No" | mp1$hmb_10yr == "No" | mp1$hmb_11yr == "No" | mp1$hmb_13yr == "No" | 
                                mp1$hmb_14yr == "No" | mp1$hmb_15yr == "No" | mp1$hmb_16yr == "No" | mp1$hmb_17yr == "No",1,0)
table(mp1$menorr_controls)

# Ever reported vs never reported
mp1$menorr <- NA
mp1$menorr[mp1$menorr_controls ==1] <- 0
mp1$menorr[mp1$menorr_prev ==1] <- 1
mp1$menorr <- factor(mp1$menorr,
                     levels = c(0,1),
                     labels = c("Controls", "Cases"))
table(mp1$menorr)

# Ever been to the dr vs never reported
mp1$hmb <- NA
mp1$hmb[mp1$menorr == "Controls"] <- 0
mp1$hmb[mp1$menorr_ewas == "Cases"] <- 1
mp1$hmb <- factor(mp1$hmb,
                  levels = c(0,1),
                  labels = c("Controls", "Cases"))
table(mp1$hmb)

# In order to compare those who reported it but never visited the doctor with those who never reported it (sensitivity analysis)
mp1$hmb_sens <- NA
mp1$hmb_sens[mp1$hmb == "Controls"] <- 0
mp1$hmb_sens[mp1$menorr == "Cases"] <- 1
mp1$hmb_sens[mp1$hmb == "Cases"] <- NA
mp1$hmb_sens <- factor(mp1$hmb_sens,
                       levels = c(0,1),
                       labels = c("Controls", "Cases"))
table(mp1$hmb_sens)

# Similarly for dysmenorrhea:

# Here, I have gone through each timepoint and asked if the young woman answered yes to dysmenorrhea but no to visiting a doctor then code her as a 1

mp1$cramps_nodr_9yr <- ifelse(mp1$cramps_9yr == "Yes" & mp1$dr_cramps_9yr == "No",1,0)
table(mp1$cramps_nodr_9yr)

mp1$cramps_nodr_10yr <- ifelse(mp1$cramps_10yr == "Yes" & mp1$dr_cramps_10yr == "No",1,0)
table(mp1$cramps_nodr_10yr)

mp1$cramps_nodr_11yr <- ifelse(mp1$cramps_11yr == "Yes" & mp1$dr_cramps_11yr == "No",1,0)
table(mp1$cramps_nodr_11yr)

mp1$cramps_nodr_13yr <- ifelse(mp1$cramps_13yr == "Yes" & mp1$dr_cramps_13yr == "No",1,0)
table(mp1$cramps_nodr_13yr)

mp1$cramps_nodr_14yr <- ifelse(mp1$cramps_14yr == "Yes" & mp1$dr_cramps_14yr == "No",1,0)
table(mp1$cramps_nodr_14yr)

mp1$cramps_nodr_15yr <- ifelse(mp1$cramps_15yr == "Yes" & mp1$dr_cramps_15yr == "No",1,0)
table(mp1$cramps_nodr_15yr)

mp1$cramps_nodr_16yr <- ifelse(mp1$cramps_16yr == "Yes" & mp1$dr_cramps_16yr == "No",1,0)
table(mp1$cramps_nodr_16yr)

mp1$cramps_nodr_17yr <- ifelse(mp1$cramps_17yr == "Yes" & mp1$dr_cramps_17yr == "No",1,0)
table(mp1$cramps_nodr_17yr)

# Using these variables, I generated a variable cramps_controls which asking if a young women had reported dysmenorrhea at any timpoint but not visted the dr

mp1$cramps_controls <- ifelse(mp1$cramps_nodr_9yr == 1 | mp1$cramps_nodr_10yr == 1 | mp1$cramps_nodr_11yr == 1 | mp1$cramps_nodr_13yr == 1 | 
                                mp1$cramps_nodr_14yr == 1 | mp1$cramps_nodr_15yr == 1 | mp1$cramps_nodr_16yr == 1 | mp1$cramps_nodr_17yr == 1 | 
                                mp1$cramps_8yr == "No" | mp1$cramps_9yr == "No" | mp1$cramps_10yr == "No" | mp1$cramps_11yr == "No" | mp1$cramps_13yr == "No" | 
                                mp1$cramps_14yr == "No" | mp1$cramps_15yr == "No" | mp1$cramps_16yr == "No" | mp1$cramps_17yr == "No",1,0)
table(mp1$cramps_controls)

# However, this variable captured 2993 women, including 419 young women who had reported no at ≥1 timepoint and yes at ≥1 timepoint - these women needed to be 
# moved from controls to cases. So I generated a variable for ever having visited the doctor for dysmenorrhea

mp1$dysmen_drvisit_ever <- ifelse(mp1$dr_cramps_9yr == "Yes" |mp1$dr_cramps_10yr == "Yes" | mp1$dr_cramps_11yr == "Yes" | mp1$dr_cramps_13yr == "Yes" | 
                                  mp1$dr_cramps_14yr == "Yes" | mp1$dr_cramps_15yr == "Yes" | mp1$dr_cramps_16yr == "Yes" | mp1$dr_cramps_17yr == "Yes",1,0)
table(mp1$dysmen_drvisit_ever)

# This variable captured 641 women who had been to the dr ≥1 time during puberty. Now I just needed to remove the 419 from controls and split cases (coded as 1) 
# and controls (coded as 0) in one variable

mp1$dysmen_ewas <- NA
mp1$dysmen_ewas[mp1$cramps_controls ==1] <- 0
mp1$dysmen_ewas[mp1$dysmen_drvisit_ever ==1] <- 1
mp1$dysmen_ewas <- factor(mp1$dysmen_ewas,
                          levels = c(0,1),
                          labels = c("Controls", "Cases"))
table(mp1$dysmen_ewas)

# Now the variable dysmen_ewas incorporates cases (women who have visited the doctor ≥1 time during puberty for dysmenorrhea n=641) and controls (women who have 
# reported dysmenorrhea but never visited the doctor)

# Check all the timpoints to make sure no controls have visited the doctor 

table(mp1$dysmen_ewas, mp1$dr_cramps_10yr)
table(mp1$dysmen_ewas, mp1$dr_cramps_11yr)
table(mp1$dysmen_ewas, mp1$dr_cramps_13yr)
table(mp1$dysmen_ewas, mp1$dr_cramps_14yr)
table(mp1$dysmen_ewas, mp1$dr_cramps_15yr)
table(mp1$dysmen_ewas, mp1$dr_cramps_16yr)
table(mp1$dysmen_ewas, mp1$dr_cramps_17yr)

# For the other controls, where they have never reported the symptom:
# Similarly to hmb we need to see who ever reported cramps, who ever reported no and who reported to visit the doctor 

# First I need to only include women at 15 years old who reported severe symptoms:
mp1$mod_sev_cramps_15yr <- ifelse(mp1$severity_cramps_15yr == "Severe" | mp1$severity_cramps_15yr == "Moderate",1,0)
table(mp1$mod_sev_cramps_15yr)

mp1$weird_16yr_cramps <- ifelse(mp1$hmb_16yr == "No" & mp1$dr_hmb_16yr == "Yes",1,NA)
table(mp1$weird_16yr_cramps)

# Ever reported the symptom
mp1$dysmen_prev <- ifelse(mp1$cramps_8yr == "Yes" | mp1$cramps_9yr == "Yes" | mp1$cramps_10yr == "Yes" | mp1$cramps_11yr == "Yes" | mp1$cramps_13yr == "Yes"
                          | mp1$cramps_14yr == "Yes" | mp1$mod_sev_cramps_15yr == 1 | (mp1$mod_sev_cramps_15yr == 0 & mp1$dysmen_ewas =="Cases") |
                            mp1$weird_16yr_cramps ==1 | mp1$cramps_16yr == "Yes" | mp1$cramps_17yr == "Yes",1,0)
table(mp1$dysmen_prev)

# Ever reported no to the symptom
mp1$dysmen_controls <- ifelse(mp1$cramps_9yr == "No" | mp1$cramps_10yr == "No" | mp1$cramps_11yr == "No" | mp1$cramps_13yr == "No" | 
                                mp1$cramps_14yr == "No" | mp1$cramps_15yr == "No" | (mp1$severity_cramps_15yr =="Mild" & mp1$dysmen_ewas =="Controls") | 
                                mp1$cramps_16yr == "No" | mp1$cramps_17yr == "No",1,0)
table(mp1$dysmen_controls)

# Ever reported the symptom vs never reported the symptom
mp1$dysmen <- NA
mp1$dysmen[mp1$dysmen_controls ==1] <- 0
mp1$dysmen[mp1$dysmen_prev ==1] <- 1
mp1$dysmen <- factor(mp1$dysmen,
                     levels = c(0,1),
                     labels = c("Controls", "Cases"))
table(mp1$dysmen)

# Ever reported to have visited the doctor vs never reported the symptom
mp1$cramps <- NA
mp1$cramps[mp1$dysmen == "Controls"] <- 0
mp1$cramps[mp1$dysmen_ewas == "Cases"] <- 1
mp1$cramps <- factor(mp1$cramps,
                     levels = c(0,1),
                     labels = c("Controls", "Cases"))
table(mp1$cramps)

# In order to compare those who reported it but never visited the doctor with those who never reported it (sensitivity analysis)
mp1$cramps_sens <- NA
mp1$cramps_sens[mp1$cramps == "Controls"] <- 0
mp1$cramps_sens[mp1$dysmen == "Cases"] <- 1
mp1$cramps_sens[mp1$cramps == "Cases"] <- NA
mp1$cramps_sens <- factor(mp1$cramps_sens,
                     levels = c(0,1),
                     labels = c("Controls", "Cases"))
table(mp1$cramps_sens)

# Using D1426_YPB.pdf
# Variable for ever been diagnosed with PCOS
table(mp1$pcos)
mp1$pcos <- ifelse(mp1$pcos == 1,1,
                   ifelse(mp1$pcos == 2,1,
                          ifelse(mp1$pcos == 3,0, NA)))
mp1$pcos <- factor(mp1$pcos,
                   levels = c(0,1),
                   labels = c("No","Yes"))
table(mp1$pcos)

# Variable for ever been diagnosed with endometrosis
table(mp1$endometriosis)
mp1$endometriosis <- ifelse(mp1$endometriosis == 1,1,
                            ifelse(mp1$endometriosis == 2,1,
                                   ifelse(mp1$endometriosis == 3,0, NA)))
mp1$endometriosis <- factor(mp1$endometriosis,
                            levels = c(0,1),
                            labels = c("No","Yes"))
table(mp1$endometriosis)

# For comorbidities, thyroid problems, PCOS or endometriosis by the end of puberty, I am making a binary variable covering whether a thyroid problem was present at
# 17 years and whether PCOS or endometriosis had been diagnosed at 22 years (only info we have)

mp1$comorbidity <- ifelse(mp1$thyroid_problem_17yr == "Yes" | mp1$pcos == "Yes" | mp1$endometriosis == "Yes",1,NA)
table(mp1$comorbidity)

# To do the analysis I'm assuming missing as a no (limitation)
mp1$comorbidity_cc <- ifelse(mp1$thyroid_problem_17yr == "Yes" | mp1$pcos == "Yes" | mp1$endometriosis == "Yes",1,
                             ifelse(mp1$thyroid_problem_17yr != "Yes" & mp1$pcos != "Yes" & mp1$endometriosis != "Yes",0,NA))
table(mp1$comorbidity_cc, mp1$cramps)

# For contraception ever, I am going to combine all the puberty questions re oral contraceptives in the last 12 months
mp1$contraception_ever <- ifelse(mp1$oral_contraceptives_pastyr_8yr == "Yes" | mp1$oral_contraceptives_pastyr_9yr == "Yes" | 
                                   mp1$oral_contraceptives_pastyr_10yr == "Yes" | mp1$oral_contraceptives_pastyr_11yr == "Yes" | 
                                   mp1$oral_contraceptives_pastyr_13yr == "Yes" | mp1$oral_contraceptives_pastyr_14yr == "Yes" |
                                   mp1$oral_contraceptives_pastyr_15yr == "Yes" | mp1$oral_contraceptives_pastyr_16yr == "Yes" | 
                                   mp1$oral_contraceptives_pastyr_17yr == "Yes",1,0)
table(mp1$contraception_ever)

# Then generate a variable for if contraception has been specifically reported as no

mp1$contraception_never <- ifelse(mp1$oral_contraceptives_pastyr_8yr == "No" | mp1$oral_contraceptives_pastyr_9yr == "No" | 
                                   mp1$oral_contraceptives_pastyr_10yr == "No" | mp1$oral_contraceptives_pastyr_11yr == "No" | 
                                   mp1$oral_contraceptives_pastyr_13yr == "No" | mp1$oral_contraceptives_pastyr_14yr == "No" |
                                   mp1$oral_contraceptives_pastyr_15yr == "No" | mp1$oral_contraceptives_pastyr_16yr == "No" | 
                                   mp1$oral_contraceptives_pastyr_17yr == "No",1,0)
table(mp1$contraception_never)

# From these two variables I can generate a "ever" and "never" variable

mp1$contraception_ewas <- NA
mp1$contraception_ewas[mp1$contraception_never ==1] <- 0
mp1$contraception_ewas[mp1$contraception_ever ==1] <- 1
mp1$contraception_ewas <- factor(mp1$contraception_ewas,
                          levels = c(0,1),
                          labels = c("Never", "Ever"))
table(mp1$contraception_ewas)

# Variable maternal education is coded -1, 1, 2, 3, 4, 5 using D1104_C.pdf the labels are as shown below:
table(mp1$mat_edu)
mp1$mat_edu <- ifelse(mp1$mat_edu == 1,1, 
                      ifelse(mp1$mat_edu == 2,2, 
                             ifelse(mp1$mat_edu == 3,3, 
                                    ifelse(mp1$mat_edu == 4,4, 
                                           ifelse(mp1$mat_edu == 5,5, NA)))))
mp1$mat_edu <- factor(mp1$mat_edu, 
                      levels = c(1,2,3,4,5), 
                      labels = c("CSE/none","Vocational","O level","A level","Degree"))
table(mp1$mat_edu)

# Variable for cotinine measurements at teen focus 4
table(mp1$cotinine_17yr)
mp1$cotinine_17yr[mp1$cotinine_17yr == -2 | mp1$cotinine_17yr == -1] <- NA

# Binary maternal education variable

mp1$mat_degree <- ifelse(mp1$mat_edu == "Degree",1,
                          ifelse(mp1$mat_edu == "A level" | mp1$mat_edu == "O level" | mp1$mat_edu == "Vocational" | mp1$mat_edu == "CSE/none",0,NA))
mp1$mat_degree <- factor(mp1$mat_degree,
                          levels = c(0,1),
                          labels = c("A levels or lower","Degree"))
table(mp1$mat_degree, mp1$cramps)

# D2109_TF3.pdf:
# Variable for BMI at 15 years (taken at TF3)
table(mp1$bmi_15yr)
mp1$bmi_15yr[mp1$bmi_15yr == -10 | mp1$bmi_15yr == -6 | mp1$bmi_15yr == -1] <- NA

# Cotinine measurement binarised from TF4
mp1$reg_smoker <- ifelse(mp1$cotinine_17yr >10,1,0)

# Save cleaned dataset for the generation of the Pheno file for the EWAS
save(mp1, file="mp1.Rda")

# For the EWAS, I need the data in the form of a .csv file
write.csv(mp1, "mp1.csv")

# Remove comorbidity by the end of puberty for merging with samplesheet
mp1$comorbidity[is.na(mp1$comorbidity)] <- 0
table(mp1$comorbidity)
comorbidrm <- mp1[!(mp1$comorbidity == 1),]
table(comorbidrm$menorr_ewas)

save(comorbidrm, file = "comorbidrm.Rda")
write.csv(comorbidrm, "comorbidrm.csv")
