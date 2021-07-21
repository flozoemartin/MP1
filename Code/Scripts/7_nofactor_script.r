##############################################################################################################################################################
#                                                                                                                                                            #
#   Script for generating a "factor-less" mp1 dataset abstracted from ALSPAC drive for the creation of figures 3 & 4                                         #
#   Only need the started period, symptom and dr visits for symptom variables for this dataset                                                               #
#                                                                                                                                                            #
#   Author:       Flo Martin                                                                                                                                 #
#   Start Date:   23/11/2020                                                                                                                                 #
#   Finish Date:  24/11/2020                                                                                                                                 #
#   Description:  This script describes generating a cleaned dataset with no factor variable for generating plots of MP1 data                                #                                                                                                                       
#                                                                                                                                                            #
############################################################################################################################################################## 

# Contents #
# line 25 - Environment management #
# line 81 - PUB1 8 years old #
# line 109 - PUB2 9 years old #
# line 134 - PUB3 10 years old #
# line 161 - PUB4 11 years old #
# line 188 - PUB5 13 years old #
# line 215 - PUB6 14 years old #
# line 242 - PUB7 15 years old #
# line 275 - PUB8 16 years old #
# line 302 - PUB9 17 years old #

setwd("location/of/the/data/")

load("flo_27nov.Rda")                    # Load in the raw dataset as pulled from R:/Data
mp1_nofactor <- data.frame(flo_27nov)    # ...and the create a copy of flo_02nov (blank - no labels) which will allow any changes made to 
                                         # the following code be properly implemented in mp1. At the end of this script, R will save the newest copy of 
                                         # mp1.Rda in the R file in OneDrive. 
colnames(mp1_nofactor)                   # This allows me to check all the column names and category labels are as they were when pulled from R:/Data

colnames(mp1_nofactor) [20] <- "started_period_8yr"
colnames(mp1_nofactor) [21] <- "hmb_8yr"
colnames(mp1_nofactor) [22] <- "dr_hmb_8yr"
colnames(mp1_nofactor) [23] <- "cramps_8yr"
colnames(mp1_nofactor) [24] <- "dr_cramps_8yr"
colnames(mp1_nofactor) [31] <- "started_period_9yr"
colnames(mp1_nofactor) [32] <- "hmb_9yr"
colnames(mp1_nofactor) [33] <- "dr_hmb_9yr"
colnames(mp1_nofactor) [34] <- "cramps_9yr"
colnames(mp1_nofactor) [35] <- "dr_cramps_9yr"
colnames(mp1_nofactor) [42] <- "started_period_10yr"
colnames(mp1_nofactor) [44] <- "hmb_10yr"
colnames(mp1_nofactor) [45] <- "dr_hmb_10yr"
colnames(mp1_nofactor) [46] <- "cramps_10yr"
colnames(mp1_nofactor) [47] <- "dr_cramps_10yr"
colnames(mp1_nofactor) [54] <- "started_period_11yr"
colnames(mp1_nofactor) [56] <- "hmb_11yr"
colnames(mp1_nofactor) [57] <- "dr_hmb_11yr"
colnames(mp1_nofactor) [58] <- "cramps_11yr"
colnames(mp1_nofactor) [59] <- "dr_cramps_11yr"
colnames(mp1_nofactor) [66] <- "started_period_13yr"
colnames(mp1_nofactor) [68] <- "hmb_13yr"
colnames(mp1_nofactor) [69] <- "dr_hmb_13yr"
colnames(mp1_nofactor) [70] <- "cramps_13yr"
colnames(mp1_nofactor) [71] <- "dr_cramps_13yr"
colnames(mp1_nofactor) [78] <- "started_period_14yr"
colnames(mp1_nofactor) [80] <- "hmb_14yr"
colnames(mp1_nofactor) [81] <- "dr_hmb_14yr"
colnames(mp1_nofactor) [82] <- "cramps_14yr"
colnames(mp1_nofactor) [83] <- "dr_cramps_14yr"
colnames(mp1_nofactor) [89] <- "started_period_15yr"
colnames(mp1_nofactor) [91] <- "hmb_15yr"
colnames(mp1_nofactor) [92] <- "dr_hmb_15yr"
colnames(mp1_nofactor) [93] <- "cramps_15yr"
colnames(mp1_nofactor) [94] <- "severity_cramps_15yr"
colnames(mp1_nofactor) [95] <- "dr_cramps_15yr"
colnames(mp1_nofactor) [102] <- "started_period_16yr"
colnames(mp1_nofactor) [104] <- "hmb_16yr"
colnames(mp1_nofactor) [105] <- "dr_hmb_16yr"
colnames(mp1_nofactor) [106] <- "cramps_16yr"
colnames(mp1_nofactor) [107] <- "dr_cramps_16yr"
colnames(mp1_nofactor) [112] <- "bmi_17yr"
colnames(mp1_nofactor) [114] <- "started_period_17yr"
colnames(mp1_nofactor) [116] <- "hmb_17yr"
colnames(mp1_nofactor) [117] <- "dr_hmb_17yr"
colnames(mp1_nofactor) [118] <- "cramps_17yr"
colnames(mp1_nofactor) [119] <- "dr_cramps_17yr"

# Using the D1501_PUB1.pdf (participant 8 years old):

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_8yr, mp1_nofactor$sex)  # Used sex in here to see if -10 referred to males which it does
mp1_nofactor$started_period_8yr <- ifelse(mp1_nofactor$started_period_8yr == 1,1,
                                           ifelse(mp1_nofactor$started_period_8yr == 2,0, NA))

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1_nofactor$hmb_8yr)
mp1_nofactor$hmb_8yr <- ifelse(mp1_nofactor$hmb_8yr == 2,0, NA)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1_nofactor$dr_hmb_8yr)
mp1_nofactor$dr_hmb_8yr <- ifelse(mp1_nofactor$dr_hmb_8yr == -2,NA,
                                ifelse(mp1_nofactor$dr_hmb_8yr == -10,NA,
                                       ifelse(mp1_nofactor$dr_hmb_8yr == -3,NA, NA)))

# Variable for whether child has ever had severe cramps associated with period:
table(mp1_nofactor$cramps_8yr) 
mp1_nofactor$cramps_8yr <- ifelse(mp1_nofactor$cramps_8yr == 2,0, NA)


# Variable for whether her doctor was contacted for severe cramps:
table(mp1_nofactor$dr_cramps_8yr)
mp1_nofactor$dr_cramps_8yr <- ifelse(mp1_nofactor$dr_cramps_8yr == -10,NA,
                                    ifelse(mp1_nofactor$dr_cramps_8yr == -3,NA,
                                          ifelse(mp1_nofactor$dr_cramps_8yr == -2,NA, NA)))

# Using the D1501_PUB2.pdf (participant 9 years old):

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_9yr, mp1_nofactor$sex)  # Used sex in here to see if -10 referred to males which it does
mp1_nofactor$started_period_9yr <- ifelse(mp1_nofactor$started_period_9yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_9yr == 2,0, NA))

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1_nofactor$hmb_9yr)
mp1_nofactor$hmb_9yr <- ifelse(mp1_nofactor$hmb_9yr == 2,0,
                              ifelse(mp1_nofactor$hmb_9yr == 1,1, NA))

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1_nofactor$dr_hmb_9yr)
mp1_nofactor$dr_hmb_9yr <- ifelse(mp1_nofactor$dr_hmb_9yr == 2,0, NA)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1_nofactor$cramps_9yr)
mp1_nofactor$cramps_9yr <- ifelse(mp1_nofactor$cramps_9yr == 2,0, NA)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1_nofactor$dr_cramps_9yr)
mp1_nofactor$dr_cramps_9yr <- ifelse(mp1_nofactor$dr_cramps_9yr == 1,1,
                                    ifelse(mp1_nofactor$dr_cramps_9yr == 2,0, NA))

# Using the D1501_PUB3.pdf (participant 10 years old):

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_10yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1_nofactor$started_period_10yr <- ifelse(mp1_nofactor$started_period_10yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_10yr == 2,0, NA))

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1_nofactor$hmb_10yr)
mp1_nofactor$hmb_10yr <- ifelse(mp1_nofactor$hmb_10yr == 1,1, 
                              ifelse(mp1_nofactor$hmb_10yr == 2,0, NA))

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1_nofactor$dr_hmb_10yr)
mp1_nofactor$dr_hmb_10yr <- ifelse(mp1_nofactor$dr_hmb_10yr == 2,0, 
                                  ifelse(mp1_nofactor$dr_hmb_10yr == 1,1, NA))

# Variable for whether child has ever had severe cramps associated with period:
table(mp1_nofactor$cramps_10yr)
mp1_nofactor$cramps_10yr <- ifelse(mp1_nofactor$cramps_10yr == 2,0, 
                                  ifelse(mp1_nofactor$cramps_10yr == 1,1, NA))

# Variable for whether her doctor was contacted for severe cramps:
table(mp1_nofactor$dr_cramps_10yr)
mp1_nofactor$dr_cramps_10yr <- ifelse(mp1_nofactor$dr_cramps_10yr == 1,1,
                                      ifelse(mp1_nofactor$dr_cramps_10yr == 2,0, NA))

# Using the D1501_PUB4.pdf (participant 11 years old):

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_11yr, mp1_nofactor$sex)  # Used sex in here to see if -7 referred to males which it does
mp1_nofactor$started_period_11yr <- ifelse(mp1_nofactor$started_period_11yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_11yr == 2,0, NA))

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1_nofactor$hmb_11yr)
mp1_nofactor$hmb_11yr <- ifelse(mp1_nofactor$hmb_11yr == 1,1, 
                               ifelse(mp1_nofactor$hmb_11yr == 2,0, NA))

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1_nofactor$dr_hmb_11yr)
mp1_nofactor$dr_hmb_11yr <- ifelse(mp1_nofactor$dr_hmb_11yr == 2,0, 
                                   ifelse(mp1_nofactor$dr_hmb_11yr == 1,1, NA))

# Variable for whether child has ever had severe cramps associated with period:
table(mp1_nofactor$cramps_11yr)
mp1_nofactor$cramps_11yr <- ifelse(mp1_nofactor$cramps_11yr == 2,0, 
                                  ifelse(mp1_nofactor$cramps_11yr == 1,1, NA))

# Variable for whether her doctor was contacted for severe cramps:
table(mp1_nofactor$dr_cramps_11yr)
mp1_nofactor$dr_cramps_11yr <- ifelse(mp1_nofactor$dr_cramps_11yr == 2,0, 
                                      ifelse(mp1_nofactor$dr_cramps_11yr == 1,1, NA))

# Using the D1501_PUB5.pdf (participant 13 years old):

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_13yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1_nofactor$started_period_13yr <- ifelse(mp1_nofactor$started_period_13yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_13yr == 2,0, NA))

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1_nofactor$hmb_13yr)
mp1_nofactor$hmb_13yr <- ifelse(mp1_nofactor$hmb_13yr == 1,1, 
                                ifelse(mp1_nofactor$hmb_13yr == 2,0, NA))

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1_nofactor$dr_hmb_13yr)
mp1_nofactor$dr_hmb_13yr <- ifelse(mp1_nofactor$dr_hmb_13yr == 2,0, 
                                  ifelse(mp1_nofactor$dr_hmb_13yr == 1,1, NA))

# Variable for whether child has ever had severe cramps associated with period:
table(mp1_nofactor$cramps_13yr)
mp1_nofactor$cramps_13yr <- ifelse(mp1_nofactor$cramps_13yr == 2,0, 
                                  ifelse(mp1_nofactor$cramps_13yr == 1,1, NA))

# Variable for whether her doctor was contacted for severe cramps:
table(mp1_nofactor$dr_cramps_13yr)
mp1_nofactor$dr_cramps_13yr <- ifelse(mp1_nofactor$dr_cramps_13yr == 1,1,
                                      ifelse(mp1_nofactor$dr_cramps_13yr == 2,0, NA))

# Using the D1501_PUB6.pdf (participant 14 years old):

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_14yr, mp1_nofactor$sex)  # Used sex in here to see if -7 referred to males which it does
mp1_nofactor$started_period_14yr <- ifelse(mp1_nofactor$started_period_14yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_14yr == 2,0, NA))

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1_nofactor$hmb_14yr)
mp1_nofactor$hmb_14yr <-  ifelse(mp1_nofactor$hmb_14yr == 1,1, 
                                ifelse(mp1_nofactor$hmb_14yr == 2,0, NA))

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1_nofactor$dr_hmb_14yr)
mp1_nofactor$dr_hmb_14yr <- ifelse(mp1_nofactor$dr_hmb_14yr == 2,0, 
                                  ifelse(mp1_nofactor$dr_hmb_14yr == 1,1, NA))

# Variable for whether child has ever had severe cramps associated with period:
table(mp1_nofactor$cramps_14yr)
mp1_nofactor$cramps_14yr <- ifelse(mp1_nofactor$cramps_14yr == 2,0, 
                                  ifelse(mp1_nofactor$cramps_14yr == 1,1, NA))

# Variable for whether her doctor was contacted for severe cramps:
table(mp1_nofactor$dr_cramps_14yr)
mp1_nofactor$dr_cramps_14yr <- ifelse(mp1_nofactor$dr_cramps_14yr == 1,1,
                                      ifelse(mp1_nofactor$dr_cramps_14yr == 2,0, NA))

# Using the D1501_PUB7.pdf (participant 15 years old):

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_15yr, mp1_nofactor$sex)  # Used sex in here to see if -7 referred to males which it does
mp1_nofactor$started_period_15yr <- ifelse(mp1_nofactor$started_period_15yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_15yr == 2,0, NA))

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1_nofactor$hmb_15yr)
mp1_nofactor$hmb_15yr <- ifelse(mp1_nofactor$hmb_15yr == 1,1, 
                              ifelse(mp1_nofactor$hmb_15yr == 2,0, NA))

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1_nofactor$dr_hmb_15yr)
mp1_nofactor$dr_hmb_15yr <- ifelse(mp1_nofactor$dr_hmb_15yr == 2,0, 
                                  ifelse(mp1_nofactor$dr_hmb_15yr == 1,1, NA))

# Variable for whether child has ever had severe cramps associated with period:
table(mp1_nofactor$cramps_15yr)
mp1_nofactor$cramps_15yr <- ifelse(mp1_nofactor$cramps_15yr == 2,0, 
                                  ifelse(mp1_nofactor$cramps_15yr == 1,1, NA))

# Variable for severity of cramps associated with period:
table(mp1_nofactor$severity_cramps_15yr)
mp1_nofactor$severity_cramps_15yr <- ifelse(mp1_nofactor$severity_cramps_15yr == 1,1,
                                           ifelse(mp1_nofactor$severity_cramps_15yr == 2,2,
                                                  ifelse(mp1_nofactor$severity_cramps_15yr == 3,3, NA)))

# Variable for whether her doctor was contacted for severe cramps:
table(mp1_nofactor$dr_cramps_15yr)
mp1_nofactor$dr_cramps_15yr <- ifelse(mp1_nofactor$dr_cramps_15yr == 1,1,
                                      ifelse(mp1_nofactor$dr_cramps_15yr == 2,0, NA))

# Using the D1501_PUB8.pdf (participant 16 years old):

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_16yr, mp1_nofactor$sex)  # Used sex in here to see if -7 referred to males which it does
mp1_nofactor$started_period_16yr <- ifelse(mp1_nofactor$started_period_16yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_16yr == 2,0, NA))

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1_nofactor$hmb_16yr)
mp1_nofactor$hmb_16yr <-ifelse(mp1_nofactor$hmb_16yr == 1,1, 
                              ifelse(mp1_nofactor$hmb_16yr == 2,0, NA))

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1_nofactor$dr_hmb_16yr)
mp1_nofactor$dr_hmb_16yr <- ifelse(mp1_nofactor$dr_hmb_16yr == 2,0, 
                                  ifelse(mp1_nofactor$dr_hmb_16yr == 1,1, NA))

# Variable for whether child has ever had severe cramps associated with period:
table(mp1_nofactor$cramps_16yr)
mp1_nofactor$cramps_16yr <- ifelse(mp1_nofactor$cramps_16yr == 2,0, 
                                  ifelse(mp1_nofactor$cramps_16yr == 1,1, NA))

# Variable for whether her doctor was contacted for severe cramps:
table(mp1_nofactor$dr_cramps_16yr)
mp1_nofactor$dr_cramps_16yr <- ifelse(mp1_nofactor$dr_cramps_16yr == 1,1,
                                      ifelse(mp1_nofactor$dr_cramps_16yr == 2,0, NA))

# Using the D1501_PUB9.pdf (participant 17 years old):

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_17yr, mp1_nofactor$sex)  # Used sex in here to see if -7 referred to males which it does
mp1_nofactor$started_period_17yr <- ifelse(mp1_nofactor$started_period_17yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_17yr == 2,0, NA))

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1_nofactor$hmb_17yr)
mp1_nofactor$hmb_17yr <- ifelse(mp1_nofactor$hmb_17yr == 1,1, 
                              ifelse(mp1_nofactor$hmb_17yr == 2,0, NA))

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1_nofactor$dr_hmb_17yr)
mp1_nofactor$dr_hmb_17yr <- ifelse(mp1_nofactor$dr_hmb_17yr == 2,0, 
                                  ifelse(mp1_nofactor$dr_hmb_17yr == 1,1, NA))

# Variable for whether child has ever had severe cramps associated with period:
table(mp1_nofactor$cramps_17yr)
mp1_nofactor$cramps_17yr <- ifelse(mp1_nofactor$cramps_17yr == 2,0, 
                                  ifelse(mp1_nofactor$cramps_17yr == 1,1, NA))

# Variable for whether her doctor was contacted for severe cramps:
table(mp1_nofactor$dr_cramps_17yr)
mp1_nofactor$dr_cramps_17yr <- ifelse(mp1_nofactor$dr_cramps_17yr == 1,1,
                                      ifelse(mp1_nofactor$dr_cramps_17yr == 2,0, NA))

# These variables give me the right numbers to be able to generate proportions of girls who reported each level of severity
table(mp1_nofactor$severity_cramps_15yr)
mp1_nofactor$sev_cramps_15yr <- ifelse(mp1_nofactor$severity_cramps_15yr == 3,1,0)
table(mp1_nofactor$sev_cramps_15yr)

mp1_nofactor$mod_plus_sev_dys <- ifelse(mp1_nofactor$severity_cramps_15yr == 3 | mp1_nofactor$severity_cramps_15yr == 2,1,0)
table(mp1_nofactor$mod_plus_sev_dys)

mp1_nofactor$mild_plus_mod_sev_cramps_15yr <- ifelse(mp1_nofactor$severity_cramps_15yr == 3 | mp1_nofactor$severity_cramps_15yr == 2 | 
                                                       mp1_nofactor$severity_cramps_15yr == 1,1,0)
table(mp1_nofactor$mild_plus_mod_sev_cramps_15yr)

# These variables give me the right numbers to be able to generate proportions of girls who reported going to the doctor
mp1_nofactor$dr_sev <- ifelse(mp1_nofactor$severity_cramps_15yr == 3 & mp1_nofactor$dr_cramps_15yr == 1,1,0)
table(mp1_nofactor$dr_sev)

mp1_nofactor$mod_sev <- ifelse(mp1_nofactor$severity_cramps_15yr == 2 | mp1_nofactor$severity_cramps_15yr == 3,1,0)
table(mp1_nofactor$mod_sev)

mp1_nofactor$dr_mod_sev <- ifelse(mp1_nofactor$mod_sev == 1 & mp1_nofactor$dr_cramps_15yr == 1,1,0)
table(mp1_nofactor$dr_mod_sev)

mp1_nofactor$dr_mild_mod_sev <- ifelse(mp1_nofactor$cramps_15yr == 1 & mp1_nofactor$dr_cramps_15yr == 1,1,0)
table(mp1_nofactor$dr_mild_mod_sev)

# Save the dataset for use making figures 3 & 4
save(mp1_nofactor, file="mp1_nofactor.Rda")
