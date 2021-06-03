#################################################################################################################################################################
#                                                                                                                                                               #
#   Script for generating a "factor-less" mp1 dataset abstracted from ALSPAC drive                                                                              #         
#                                                                                                                                                               #
#   Author:       Flo Martin                                                                                                                                    #
#   Start Date:   23/11/2020                                                                                                                                    #
#   Finish Date:  24/11/2020                                                                                                                                    #
#   Description:  This script describes generating a cleaned dataset with no factor variable for generating plots of MP1 data                                   #                                                                                                                       
#                                                                                                                                                               #
################################################################################################################################################################# 

rm(flo_02nov)
rm(mp1_nofactor)                         # This clears the mp1_nofactor & flo_02nov data in global environment

setwd("/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/Mini Project 1/R Data")

load("flo_02nov.Rda")                    # Load in the raw dataset as pulled from R:/Data
mp1_nofactor <- data.frame(flo_02nov)    # ...and the create a copy of flo_02nov (blank - no labels) which will allow any changes made to 
                                         # the following code be properly implemented in mp1. At the end of this script, R will save the newest copy of 
                                         # mp1_nofactor.Rda in the R file in OneDrive. 
colnames(mp1_nofactor)                   # This allows me to check all the column names and category labels are as they were when pulled from R:/Data

colnames(mp1_nofactor) [4] <- "men_age_m"
colnames(mp1_nofactor) [5] <- "men_age_y"
colnames(mp1_nofactor) [6] <- "mat_edu"
colnames(mp1_nofactor) [7] <- "mat_occ_class"
colnames(mp1_nofactor) [8] <- "contraceptive_pill_19yr"
colnames(mp1_nofactor) [9] <- "contraceptive_injection_19yr"
colnames(mp1_nofactor) [10] <- "contraceptive_implant_19yr"
colnames(mp1_nofactor) [11] <- "contraceptive_hormonal_coil_19yr"
colnames(mp1_nofactor) [12] <- "contraceptive_patch_19yr"
colnames(mp1_nofactor) [13] <- "given_pill_for_periods_19yr"
colnames(mp1_nofactor) [14] <- "age_given_pill_for_periods_19yr"
colnames(mp1_nofactor) [15] <- "sex"
colnames(mp1_nofactor) [16] <- "bmi_8yr"
colnames(mp1_nofactor) [17] <- "vigorous_exercise_8yr"
colnames(mp1_nofactor) [18] <- "started_period_8yr"
colnames(mp1_nofactor) [19] <- "hmb_8yr"
colnames(mp1_nofactor) [20] <- "dr_hmb_8yr"
colnames(mp1_nofactor) [21] <- "cramps_8yr"
colnames(mp1_nofactor) [22] <- "dr_cramps_8yr"
colnames(mp1_nofactor) [23] <- "cramps_all_month_8yr"
colnames(mp1_nofactor) [24] <- "dr_cramps_all_month_8yr"
colnames(mp1_nofactor) [25] <- "oral_contraceptives_pastyr_8yr"
colnames(mp1_nofactor) [26] <- "thyroid_problem_8yr"
colnames(mp1_nofactor) [27] <- "bmi_9yr"
colnames(mp1_nofactor) [28] <- "vigorous_exercise_9yr"
colnames(mp1_nofactor) [29] <- "started_period_9yr"
colnames(mp1_nofactor) [30] <- "hmb_9yr"
colnames(mp1_nofactor) [31] <- "dr_hmb_9yr"
colnames(mp1_nofactor) [32] <- "cramps_9yr"
colnames(mp1_nofactor) [33] <- "dr_cramps_9yr"
colnames(mp1_nofactor) [34] <- "cramps_all_month_9yr"
colnames(mp1_nofactor) [35] <- "dr_cramps_all_month_9yr"
colnames(mp1_nofactor) [36] <- "oral_contraceptives_pastyr_9yr"
colnames(mp1_nofactor) [37] <- "thyroid_problem_9yr"
colnames(mp1_nofactor) [38] <- "bmi_10yr"
colnames(mp1_nofactor) [39] <- "vigorous_exercise_10yr"
colnames(mp1_nofactor) [40] <- "started_period_10yr"
colnames(mp1_nofactor) [41] <- "normal_no_days_bleeding_10yr"
colnames(mp1_nofactor) [42] <- "hmb_10yr"
colnames(mp1_nofactor) [43] <- "dr_hmb_10yr"
colnames(mp1_nofactor) [44] <- "cramps_10yr"
colnames(mp1_nofactor) [45] <- "dr_cramps_10yr"
colnames(mp1_nofactor) [46] <- "cramps_all_month_10yr"
colnames(mp1_nofactor) [47] <- "dr_cramps_all_month_10yr"
colnames(mp1_nofactor) [48] <- "oral_contraceptives_pastyr_10yr"
colnames(mp1_nofactor) [49] <- "thyroid_problem_10yr"
colnames(mp1_nofactor) [50] <- "bmi_11yr"
colnames(mp1_nofactor) [51] <- "vigorous_exercise_11yr"
colnames(mp1_nofactor) [52] <- "started_period_11yr"
colnames(mp1_nofactor) [53] <- "normal_no_days_bleeding_11yr"
colnames(mp1_nofactor) [54] <- "hmb_11yr"
colnames(mp1_nofactor) [55] <- "dr_hmb_11yr"
colnames(mp1_nofactor) [56] <- "cramps_11yr"
colnames(mp1_nofactor) [57] <- "dr_cramps_11yr"
colnames(mp1_nofactor) [58] <- "cramps_all_month_11yr"
colnames(mp1_nofactor) [59] <- "dr_cramps_all_month_11yr"
colnames(mp1_nofactor) [60] <- "oral_contraceptives_pastyr_11yr"
colnames(mp1_nofactor) [61] <- "thyroid_problem_11yr"
colnames(mp1_nofactor) [62] <- "bmi_13yr"
colnames(mp1_nofactor) [63] <- "vigorous_exercise_13yr"
colnames(mp1_nofactor) [64] <- "started_period_13yr"
colnames(mp1_nofactor) [65] <- "normal_no_days_bleeding_13yr"
colnames(mp1_nofactor) [66] <- "hmb_13yr"
colnames(mp1_nofactor) [67] <- "dr_hmb_13yr"
colnames(mp1_nofactor) [68] <- "cramps_13yr"
colnames(mp1_nofactor) [69] <- "dr_cramps_13yr"
colnames(mp1_nofactor) [70] <- "cramps_all_month_13yr"
colnames(mp1_nofactor) [71] <- "dr_cramps_all_month_13yr"
colnames(mp1_nofactor) [72] <- "oral_contraceptives_pastyr_13yr"
colnames(mp1_nofactor) [73] <- "thyroid_problem_13yr"
colnames(mp1_nofactor) [74] <- "bmi_14yr"
colnames(mp1_nofactor) [75] <- "vigorous_exercise_14yr"
colnames(mp1_nofactor) [76] <- "started_period_14yr"
colnames(mp1_nofactor) [77] <- "normal_no_days_bleeding_14yr"
colnames(mp1_nofactor) [78] <- "hmb_14yr"
colnames(mp1_nofactor) [79] <- "dr_hmb_14yr"
colnames(mp1_nofactor) [80] <- "cramps_14yr"
colnames(mp1_nofactor) [81] <- "dr_cramps_14yr"
colnames(mp1_nofactor) [82] <- "cramps_all_month_14yr"
colnames(mp1_nofactor) [83] <- "dr_cramps_all_month_14yr"
colnames(mp1_nofactor) [84] <- "oral_contraceptives_pastyr_14yr"
colnames(mp1_nofactor) [85] <- "thyroid_problem_14yr"
colnames(mp1_nofactor) [86] <- "vigorous_exercise_15yr"
colnames(mp1_nofactor) [87] <- "started_period_15yr"
colnames(mp1_nofactor) [88] <- "normal_no_days_bleeding_15yr"
colnames(mp1_nofactor) [89] <- "hmb_15yr"
colnames(mp1_nofactor) [90] <- "dr_hmb_15yr"
colnames(mp1_nofactor) [91] <- "cramps_15yr"
colnames(mp1_nofactor) [92] <- "severity_cramps_15yr"
colnames(mp1_nofactor) [93] <- "dr_cramps_15yr"
colnames(mp1_nofactor) [94] <- "cramps_all_month_15yr"
colnames(mp1_nofactor) [95] <- "dr_cramps_all_month_15yr"
colnames(mp1_nofactor) [96] <- "oral_contraceptives_pastyr_15yr"
colnames(mp1_nofactor) [97] <- "thyroid_problem_15yr"
colnames(mp1_nofactor) [98] <- "bmi_16yr"
colnames(mp1_nofactor) [99] <- "vigorous_exercise_16yr"
colnames(mp1_nofactor) [100] <- "started_period_16yr"
colnames(mp1_nofactor) [101] <- "normal_no_days_bleeding_16yr"
colnames(mp1_nofactor) [102] <- "hmb_16yr"
colnames(mp1_nofactor) [103] <- "dr_hmb_16yr"
colnames(mp1_nofactor) [104] <- "cramps_16yr"
colnames(mp1_nofactor) [105] <- "dr_cramps_16yr"
colnames(mp1_nofactor) [106] <- "cramps_all_month_16yr"
colnames(mp1_nofactor) [107] <- "dr_cramps_all_month_16yr"
colnames(mp1_nofactor) [108] <- "oral_contraceptives_pastyr_16yr"
colnames(mp1_nofactor) [109] <- "thyroid_problem_16yr"
colnames(mp1_nofactor) [110] <- "bmi_17yr"
colnames(mp1_nofactor) [111] <- "vigorous_exercise_17yr"
colnames(mp1_nofactor) [112] <- "started_period_17yr"
colnames(mp1_nofactor) [113] <- "normal_no_days_bleeding_17yr"
colnames(mp1_nofactor) [114] <- "hmb_17yr"
colnames(mp1_nofactor) [115] <- "dr_hmb_17yr"
colnames(mp1_nofactor) [116] <- "cramps_17yr"
colnames(mp1_nofactor) [117] <- "dr_cramps_17yr"
colnames(mp1_nofactor) [118] <- "cramps_all_month_17yr"
colnames(mp1_nofactor) [119] <- "dr_cramps_all_month_17yr"
colnames(mp1_nofactor) [120] <- "oral_contraceptives_pastyr_17yr"
colnames(mp1_nofactor) [121] <- "thyroid_problem_17yr"
colnames(mp1_nofactor) [122] <- "bmi_15yr"
colnames(mp1_nofactor) [123] <- "smokes_everyday_15yr"
colnames(mp1_nofactor) [124] <- "smokes_every_week_15yr"
colnames(mp1_nofactor) [125] <- "drinking_pattern_15yr"
colnames(mp1_nofactor) [126] <- "smokes_everyday_17yr"
colnames(mp1_nofactor) [127] <- "smokes_every_week_17yr"
colnames(mp1_nofactor) [128] <- "freq_yp_drinks_17yr"
colnames(mp1_nofactor) [129] <- "ever_pregnant"
colnames(mp1_nofactor) [130] <- "pcos"
colnames(mp1_nofactor) [131] <- "endometriosis"
colnames(mp1_nofactor) [132] <- "pcos_imputeno"
colnames(mp1_nofactor) [133] <- "endometriosis_imputeno"

# Now, explore each of the variables:
# Variable maternal education is coded -1, 1, 2, 3, 4, 5 using D1104_C.pdf the labels are as shown below:
table(mp1_nofactor$mat_edu)
mp1_nofactor$mat_edu <- ifelse(mp1_nofactor$mat_edu == 1,1, 
                             ifelse(mp1_nofactor$mat_edu == 2,2, 
                                    ifelse(mp1_nofactor$mat_edu == 3,3, 
                                          ifelse(mp1_nofactor$mat_edu == 4,4, 
                                                ifelse(mp1_nofactor$mat_edu == 5,5, NA)))))

# Variable maternal occupation
table(mp1_nofactor$mat_occ_class)
mp1_nofactor$mat_occ_class <- ifelse(mp1_nofactor$mat_occ_class == 1,1,
                                    ifelse(mp1_nofactor$mat_occ_class == 2,2,
                                          ifelse(mp1_nofactor$mat_occ_class == 3,3,
                                                 ifelse(mp1_nofactor$mat_occ_class == 4,4,
                                                         ifelse(mp1_nofactor$mat_occ_class == 5,5,
                                                               ifelse(mp1_nofactor$mat_occ_class == 6,6,
                                                                      ifelse(mp1_nofactor$mat_occ_class == 65,7,NA)))))))

# Variable for whether the young woman is currently using the contraceptive pill (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1_nofactor$contraceptive_pill_19yr)
mp1_nofactor$contraceptive_pill_19yr <- ifelse(mp1_nofactor$contraceptive_pill_19yr ==1,1, 
                                              ifelse(mp1_nofactor$contraceptive_pill_19yr == 2,0, NA))

# Variable for whether the young woman is currently using the contraceptive injection (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1_nofactor$contraceptive_injection_19yr)
mp1_nofactor$contraceptive_injection_19yr <- ifelse(mp1_nofactor$contraceptive_injection_19yr ==1,1, 
                                                    ifelse(mp1_nofactor$contraceptive_injection_19yr == 2,0, NA))

# Variable for whether the young woman is currently using the contraceptive implant (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1_nofactor$contraceptive_implant_19yr)
mp1_nofactor$contraceptive_implant_19yr <- ifelse(mp1_nofactor$contraceptive_implant_19yr ==1,1, 
                                                  ifelse(mp1_nofactor$contraceptive_implant_19yr == 2,0, NA))

# Variable for whether the young woman is currently using the contraceptive coil (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1_nofactor$contraceptive_hormonal_coil_19yr)
mp1_nofactor$contraceptive_hormonal_coil_19yr <- ifelse(mp1_nofactor$contraceptive_hormonal_coil_19yr ==1,1, 
                                                        ifelse(mp1_nofactor$contraceptive_hormonal_coil_19yr == 2,0, NA))

# Variable for whether the young woman is currently using the contraceptive patch (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1_nofactor$contraceptive_patch_19yr)
mp1_nofactor$contraceptive_patch_19yr <- ifelse(mp1_nofactor$contraceptive_patch_19yr ==1,1, 
                                                ifelse(mp1_nofactor$contraceptive_patch_19yr == 2,0, NA))

# Variable for whether the young woman has been given the pill to regulate her period (no or yes), using D1456_CCXF.pdf the labels are as shown below:
table(mp1_nofactor$given_pill_for_periods_19yr)
mp1_nofactor$given_pill_for_periods_19yr <- ifelse(mp1_nofactor$given_pill_for_periods_19yr ==1,0, 
                                                    ifelse(mp1_nofactor$given_pill_for_periods_19yr == 2,1, NA))

# Variable for what age young woman were given the pill to regulate her period (age in years), using D1456_CCXF.pdf the labels are as shown below:
table(mp1_nofactor$age_given_pill_for_periods_19yr)
mp1_nofactor$age_given_pill_for_periods_19yr[mp1_nofactor$age_given_pill_for_periods_19yr == -10 | mp1_nofactor$age_given_pill_for_periods_19yr == -3 | 
                                            mp1_nofactor$age_given_pill_for_periods_19yr == -1] <- NA

# Variable for participant sex, labels are as shown below:
table(mp1_nofactor$sex)
table(mp1_nofactor$sex,mp1_nofactor$cramps_15yr)  # Used this table to deduce which number was male - no. 1 had no answers for this part of the questionnaire 
                                                  # => 2 is female
mp1_nofactor$sex <- ifelse(mp1_nofactor$sex == 1,1,
                            ifelse(mp1_nofactor$sex == 2,2, NA))

table(mp1_nofactor$sex,mp1_nofactor$cramps_15yr)  # Check the labels in the context of a period-related variable to make sure there aren't lots of answers for 
                                                  # men which there are not! 

# Variable for BMI (will categorise the missings later)
table(mp1_nofactor$bmi_8yr)
mp1_nofactor$bmi_8yr[mp1_nofactor$bmi_8yr == -9 | mp1_nofactor$bmi_8yr == -7 | mp1_nofactor$bmi_8yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1_nofactor$vigorous_exercise_8yr)
mp1_nofactor$vigorous_exercise_8yr <- ifelse(mp1_nofactor$vigorous_exercise_8yr == 1,1,
                                            ifelse(mp1_nofactor$vigorous_exercise_8yr == 2,2,
                                                  ifelse(mp1_nofactor$vigorous_exercise_8yr == 3,3,
                                                          ifelse(mp1_nofactor$vigorous_exercise_8yr == 4,4,
                                                                  ifelse(mp1_nofactor$vigorous_exercise_8yr == 5,5, NA)))))

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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1_nofactor$cramps_all_month_8yr)
mp1_nofactor$cramps_all_month_8yr <- ifelse(mp1_nofactor$cramps_all_month_8yr == 1,1,
                                          ifelse(mp1_nofactor$cramps_all_month_8yr == 2,0, NA))

# Variable for whether her doctor was contacted for period type pains:
table(mp1_nofactor$dr_cramps_all_month_8yr)
mp1_nofactor$dr_cramps_all_month_8yr <- ifelse(mp1_nofactor$dr_cramps_all_month_8yr == 1,1, NA)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1_nofactor$oral_contraceptives_pastyr_8yr)
mp1_nofactor$oral_contraceptives_pastyr_8yr <- ifelse(mp1_nofactor$oral_contraceptives_pastyr_8yr == 2,0, NA)

# Variable for whether child has a thyroid problem:
table(mp1_nofactor$thyroid_problem_8yr)
mp1_nofactor$thyroid_problem_8yr <- ifelse(mp1_nofactor$thyroid_problem_8yr == 1,1,
                                          ifelse(mp1_nofactor$thyroid_problem_8yr == 2,0, NA))

# Using the D1501_PUB2.pdf (participant 9 years old):

# Variable for BMI (will categorise the missings later)
table(mp1_nofactor$bmi_9yr)
mp1_nofactor$bmi_9yr[mp1_nofactor$bmi_9yr == -9 | mp1_nofactor$bmi_9yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1_nofactor$vigorous_exercise_9yr)
mp1_nofactor$vigorous_exercise_9yr <- ifelse(mp1_nofactor$vigorous_exercise_9yr == 1,1,
                                            ifelse(mp1_nofactor$vigorous_exercise_9yr == 2,2,
                                                   ifelse(mp1_nofactor$vigorous_exercise_9yr == 3,3,
                                                         ifelse(mp1_nofactor$vigorous_exercise_9yr == 4,4,
                                                                 ifelse(mp1_nofactor$vigorous_exercise_9yr == 5,5, NA)))))

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


# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1_nofactor$cramps_all_month_9yr)
mp1_nofactor$cramps_all_month_9yr <- ifelse(mp1_nofactor$cramps_all_month_9yr == 1,1,
                                            ifelse(mp1_nofactor$cramps_all_month_9yr == 2,0, NA))

# Variable for whether her doctor was contacted for period type pains:
table(mp1_nofactor$dr_cramps_all_month_9yr)
mp1_nofactor$dr_cramps_all_month_9yr <- ifelse(mp1_nofactor$dr_cramps_all_month_9yr == 2,0, NA)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1_nofactor$oral_contraceptives_pastyr_9yr)
mp1_nofactor$oral_contraceptives_pastyr_9yr <- ifelse(mp1_nofactor$oral_contraceptives_pastyr_9yr == 2,0, NA)

# Variable for whether child has a thyroid problem:
table(mp1_nofactor$thyroid_problem_9yr)
mp1_nofactor$thyroid_problem_9yr <- ifelse(mp1_nofactor$thyroid_problem_9yr == 1,1,
                                           ifelse(mp1_nofactor$thyroid_problem_9yr == 2,0, NA))

# Using the D1501_PUB3.pdf (participant 10 years old):

# Variable for BMI (will categorise the missings later)
table(mp1_nofactor$bmi_10yr)
mp1_nofactor$bmi_10yr[mp1_nofactor$bmi_10yr == -10 | mp1_nofactor$bmi_10yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1_nofactor$vigorous_exercise_10yr)
mp1_nofactor$vigorous_exercise_10yr <- ifelse(mp1_nofactor$vigorous_exercise_10yr == 1,1,
                                              ifelse(mp1_nofactor$vigorous_exercise_10yr == 2,2,
                                                    ifelse(mp1_nofactor$vigorous_exercise_10yr == 3,3,
                                                          ifelse(mp1_nofactor$vigorous_exercise_10yr == 4,4,
                                                                ifelse(mp1_nofactor$vigorous_exercise_10yr == 5,5, NA)))))

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_10yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1_nofactor$started_period_10yr <- ifelse(mp1_nofactor$started_period_10yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_10yr == 2,0, NA))

# Variable for normal number of days bleeding:
table(mp1_nofactor$normal_no_days_bleeding_10yr)
mp1_nofactor$normal_no_days_bleeding_10yr[mp1_nofactor$normal_no_days_bleeding_10yr == -10 | mp1_nofactor$normal_no_days_bleeding_10yr == -9 | 
                                          mp1_nofactor$normal_no_days_bleeding_10yr == -7 | mp1_nofactor$normal_no_days_bleeding_10yr == -6 | 
                                          mp1_nofactor$normal_no_days_bleeding_10yr == -2 | mp1_nofactor$normal_no_days_bleeding_10yr == -1] <- NA

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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1_nofactor$cramps_all_month_10yr)
mp1_nofactor$cramps_all_month_10yr <- ifelse(mp1_nofactor$cramps_all_month_10yr == 1,1,
                                            ifelse(mp1_nofactor$cramps_all_month_10yr == 2,0, NA))

# Variable for whether her doctor was contacted for period type pains:
table(mp1_nofactor$dr_cramps_all_month_10yr)
mp1_nofactor$dr_cramps_all_month_10yr <- ifelse(mp1_nofactor$dr_cramps_all_month_10yr == 2,0,
                                                ifelse(mp1_nofactor$dr_cramps_all_month_10yr == 1,1, NA))

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1_nofactor$oral_contraceptives_pastyr_10yr)
mp1_nofactor$oral_contraceptives_pastyr_10yr <- ifelse(mp1_nofactor$oral_contraceptives_pastyr_10yr == 2,0, NA)

# Variable for whether child has a thyroid problem:
table(mp1_nofactor$thyroid_problem_10yr)
mp1_nofactor$thyroid_problem_10yr <- ifelse(mp1_nofactor$thyroid_problem_10yr == 1,1,
                                            ifelse(mp1_nofactor$thyroid_problem_10yr == 2,0, NA))

# Using the D1501_PUB4.pdf (participant 11 years old):

# Variable for BMI (will categorise the missings later)
table(mp1_nofactor$bmi_11yr)
mp1_nofactor$bmi_11yr[mp1_nofactor$bmi_11yr == -10 | mp1_nofactor$bmi_11yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1_nofactor$vigorous_exercise_11yr)
mp1_nofactor$vigorous_exercise_11yr <- ifelse(mp1_nofactor$vigorous_exercise_11yr == 1,1,
                                            ifelse(mp1_nofactor$vigorous_exercise_11yr == 2,2,
                                                   ifelse(mp1_nofactor$vigorous_exercise_11yr == 3,3,
                                                          ifelse(mp1_nofactor$vigorous_exercise_11yr == 4,4,
                                                                ifelse(mp1_nofactor$vigorous_exercise_11yr == 5,5, NA)))))

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_11yr, mp1_nofactor$sex)  # Used sex in here to see if -7 referred to males which it does
mp1_nofactor$started_period_11yr <- ifelse(mp1_nofactor$started_period_11yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_11yr == 2,0, NA))

# Variable for normal number of days bleeding:
table(mp1_nofactor$normal_no_days_bleeding_11yr)
mp1_nofactor$normal_no_days_bleeding_11yr[mp1_nofactor$normal_no_days_bleeding_11yr == -10 | mp1_nofactor$normal_no_days_bleeding_11yr == -9 | 
                                          mp1_nofactor$normal_no_days_bleeding_11yr == -7 | mp1_nofactor$normal_no_days_bleeding_11yr == -6 | 
                                          mp1_nofactor$normal_no_days_bleeding_11yr == -2 | mp1_nofactor$normal_no_days_bleeding_11yr == -1] <- NA

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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1_nofactor$cramps_all_month_11yr)
mp1_nofactor$cramps_all_month_11yr <- ifelse(mp1_nofactor$cramps_all_month_11yr == 1,1,
                                            ifelse(mp1_nofactor$cramps_all_month_11yr == 2,0, NA))

# Variable for whether her doctor was contacted for period type pains:
table(mp1_nofactor$dr_cramps_all_month_11yr)
mp1_nofactor$dr_cramps_all_month_11yr <- ifelse(mp1_nofactor$dr_cramps_all_month_11yr == 2,0,
                                                ifelse(mp1_nofactor$dr_cramps_all_month_11yr == 1,1, NA))

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1_nofactor$oral_contraceptives_pastyr_11yr)
mp1_nofactor$oral_contraceptives_pastyr_11yr <- ifelse(mp1_nofactor$oral_contraceptives_pastyr_11yr == 2,0,
                                                      ifelse(mp1_nofactor$oral_contraceptives_pastyr_11yr == 1,1, NA))

# Variable for whether child has a thyroid problem:
table(mp1_nofactor$thyroid_problem_11yr)
mp1_nofactor$thyroid_problem_11yr <- ifelse(mp1_nofactor$thyroid_problem_11yr == 1,1,
                                           ifelse(mp1_nofactor$thyroid_problem_11yr == 2,0, NA))

# Using the D1501_PUB5.pdf (participant 13 years old):

# Variable for BMI (will categorise the missings later)
table(mp1_nofactor$bmi_13yr)
mp1_nofactor$bmi_13yr[mp1_nofactor$bmi_13yr == -10 | mp1_nofactor$bmi_13yr == -6 | mp1_nofactor$bmi_13yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1_nofactor$vigorous_exercise_13yr)
mp1_nofactor$vigorous_exercise_13yr <- ifelse(mp1_nofactor$vigorous_exercise_13yr == 1,1,
                                            ifelse(mp1_nofactor$vigorous_exercise_13yr == 2,2,
                                                  ifelse(mp1_nofactor$vigorous_exercise_13yr == 3,3,
                                                        ifelse(mp1_nofactor$vigorous_exercise_13yr == 4,4,
                                                              ifelse(mp1_nofactor$vigorous_exercise_13yr == 5,5, NA)))))

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_13yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1_nofactor$started_period_13yr <- ifelse(mp1_nofactor$started_period_13yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_13yr == 2,0, NA))

# Variable for normal number of days bleeding:
table(mp1_nofactor$normal_no_days_bleeding_13yr)
mp1_nofactor$normal_no_days_bleeding_13yr[mp1_nofactor$normal_no_days_bleeding_13yr == -10 | mp1_nofactor$normal_no_days_bleeding_13yr == -7 | 
                                          mp1_nofactor$normal_no_days_bleeding_13yr == -6 | mp1_nofactor$normal_no_days_bleeding_13yr == -2 | 
                                          mp1_nofactor$normal_no_days_bleeding_13yr == -1] <- NA

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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1_nofactor$cramps_all_month_13yr)
mp1_nofactor$cramps_all_month_13yr <- ifelse(mp1_nofactor$cramps_all_month_13yr == 1,1,
                                    ifelse(mp1_nofactor$cramps_all_month_13yr == 2,0, NA))

# Variable for whether her doctor was contacted for period type pains:
table(mp1_nofactor$dr_cramps_all_month_13yr)
mp1_nofactor$dr_cramps_all_month_13yr <- ifelse(mp1_nofactor$dr_cramps_all_month_13yr == 2,0,
                                               ifelse(mp1_nofactor$dr_cramps_all_month_13yr == 1,1, NA))

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1_nofactor$oral_contraceptives_pastyr_13yr)
mp1_nofactor$oral_contraceptives_pastyr_13yr <- ifelse(mp1_nofactor$oral_contraceptives_pastyr_13yr == 2,0,
                                                        ifelse(mp1_nofactor$oral_contraceptives_pastyr_13yr == 1,1, NA))

# Variable for whether child has a thyroid problem:
table(mp1_nofactor$thyroid_problem_13yr)
mp1_nofactor$thyroid_problem_13yr <- ifelse(mp1_nofactor$thyroid_problem_13yr == 1,1,
                                   ifelse(mp1_nofactor$thyroid_problem_13yr == 2,0, NA))

# Using the D1501_PUB6.pdf (participant 14 years old):

# Variable for BMI (will categorise the missings later)
table(mp1_nofactor$bmi_14yr)
mp1_nofactor$bmi_14yr[mp1_nofactor$bmi_14yr == -10 | mp1_nofactor$bmi_14yr == -6 | mp1_nofactor$bmi_14yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1_nofactor$vigorous_exercise_14yr)
mp1_nofactor$vigorous_exercise_14yr <- ifelse(mp1_nofactor$vigorous_exercise_14yr == 1,1,
                                            ifelse(mp1_nofactor$vigorous_exercise_14yr == 2,2,
                                                   ifelse(mp1_nofactor$vigorous_exercise_14yr == 3,3,
                                                          ifelse(mp1_nofactor$vigorous_exercise_14yr == 4,4,
                                                                ifelse(mp1_nofactor$vigorous_exercise_14yr == 5,5, NA)))))

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_14yr, mp1_nofactor$sex)  # Used sex in here to see if -7 referred to males which it does
mp1_nofactor$started_period_14yr <- ifelse(mp1_nofactor$started_period_14yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_14yr == 2,0, NA))

# Variable for normal number of days bleeding:
table(mp1_nofactor$normal_no_days_bleeding_14yr)
mp1_nofactor$normal_no_days_bleeding_14yr[mp1_nofactor$normal_no_days_bleeding_14yr == -10 | mp1_nofactor$normal_no_days_bleeding_14yr == -9 | 
                                          mp1_nofactor$normal_no_days_bleeding_14yr == -7 | mp1_nofactor$normal_no_days_bleeding_14yr == -3 | 
                                          mp1_nofactor$normal_no_days_bleeding_14yr == -2 | mp1_nofactor$normal_no_days_bleeding_14yr == -1] <- NA

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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1_nofactor$cramps_all_month_14yr)
mp1_nofactor$cramps_all_month_14yr <- ifelse(mp1_nofactor$cramps_all_month_14yr == 1,1,
                                            ifelse(mp1_nofactor$cramps_all_month_14yr == 2,0, NA))

# Variable for whether her doctor was contacted for period type pains:
table(mp1_nofactor$dr_cramps_all_month_14yr)
mp1_nofactor$dr_cramps_all_month_14yr <- ifelse(mp1_nofactor$dr_cramps_all_month_14yr == 2,0,
                                               ifelse(mp1_nofactor$dr_cramps_all_month_14yr == 1,1, NA))

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1_nofactor$oral_contraceptives_pastyr_14yr)
mp1_nofactor$oral_contraceptives_pastyr_14yr <- ifelse(mp1_nofactor$oral_contraceptives_pastyr_14yr == 2,0,
                                              ifelse(mp1_nofactor$oral_contraceptives_pastyr_14yr == 1,1, NA))

# Variable for whether child has a thyroid problem:
table(mp1_nofactor$thyroid_problem_14yr)
mp1_nofactor$thyroid_problem_14yr <- ifelse(mp1_nofactor$thyroid_problem_14yr == 1,1,
                                            ifelse(mp1_nofactor$thyroid_problem_14yr == 2,0, NA))

# Using the D1501_PUB7.pdf (participant 15 years old):

# Variable for frequency of participation in vigorous activity:
table(mp1_nofactor$vigorous_exercise_15yr)
mp1_nofactor$vigorous_exercise_15yr <- ifelse(mp1_nofactor$vigorous_exercise_15yr == 1,1,
                                              ifelse(mp1_nofactor$vigorous_exercise_15yr == 2,2,
                                                    ifelse(mp1_nofactor$vigorous_exercise_15yr == 3,3,
                                                          ifelse(mp1_nofactor$vigorous_exercise_15yr == 4,4,
                                                                ifelse(mp1_nofactor$vigorous_exercise_15yr == 5,5, NA)))))

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_15yr, mp1_nofactor$sex)  # Used sex in here to see if -7 referred to males which it does
mp1_nofactor$started_period_15yr <- ifelse(mp1_nofactor$started_period_15yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_15yr == 2,0, NA))

# Variable for normal number of days bleeding:
table(mp1_nofactor$normal_no_days_bleeding_15yr)
mp1_nofactor$normal_no_days_bleeding_15yr[mp1_nofactor$normal_no_days_bleeding_15yr == -10 | mp1_nofactor$normal_no_days_bleeding_15yr == -9 | 
                                          mp1_nofactor$normal_no_days_bleeding_15yr == -7 | mp1_nofactor$normal_no_days_bleeding_15yr == -6 | 
                                          mp1_nofactor$normal_no_days_bleeding_15yr == -3 | mp1_nofactor$normal_no_days_bleeding_15yr == -2 |
                                          mp1_nofactor$normal_no_days_bleeding_15yr == -1] <- NA

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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1_nofactor$cramps_all_month_15yr)
mp1_nofactor$cramps_all_month_15yr <- ifelse(mp1_nofactor$cramps_all_month_15yr == 1,1,
                                            ifelse(mp1_nofactor$cramps_all_month_15yr == 2,0, NA))

# Variable for whether her doctor was contacted for period type pains:
table(mp1_nofactor$dr_cramps_all_month_15yr)
mp1_nofactor$dr_cramps_all_month_15yr <- ifelse(mp1_nofactor$dr_cramps_all_month_15yr == 2,0,
                                                ifelse(mp1_nofactor$dr_cramps_all_month_15yr == 1,1, NA))

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1_nofactor$oral_contraceptives_pastyr_15yr)
mp1_nofactor$oral_contraceptives_pastyr_15yr <- ifelse(mp1_nofactor$oral_contraceptives_pastyr_15yr == 2,0,
                                                      ifelse(mp1_nofactor$oral_contraceptives_pastyr_15yr == 1,1, NA))

# Variable for whether child has a thyroid problem:
table(mp1_nofactor$thyroid_problem_15yr)
mp1_nofactor$thyroid_problem_15yr <- ifelse(mp1_nofactor$thyroid_problem_15yr == 1,1,
                                   ifelse(mp1_nofactor$thyroid_problem_15yr == 2,0, NA))

# Using the D1501_PUB8.pdf (participant 16 years old):

# Variable for participants BMI:
table(mp1_nofactor$bmi_16yr)
mp1_nofactor$bmi_16yr[mp1_nofactor$bmi_16yr == -10 | mp1_nofactor$bmi_16yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1_nofactor$vigorous_exercise_16yr)
mp1_nofactor$vigorous_exercise_16yr <- ifelse(mp1_nofactor$vigorous_exercise_16yr == 1,1,
                                            ifelse(mp1_nofactor$vigorous_exercise_16yr == 2,2,
                                                  ifelse(mp1_nofactor$vigorous_exercise_16yr == 3,3,
                                                        ifelse(mp1_nofactor$vigorous_exercise_16yr == 4,4,
                                                              ifelse(mp1_nofactor$vigorous_exercise_16yr == 5,5, NA)))))

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_16yr, mp1_nofactor$sex)  # Used sex in here to see if -7 referred to males which it does
mp1_nofactor$started_period_16yr <- ifelse(mp1_nofactor$started_period_16yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_16yr == 2,0, NA))

# Variable for normal number of days bleeding:
table(mp1_nofactor$normal_no_days_bleeding_16yr)
mp1_nofactor$normal_no_days_bleeding_16yr[mp1_nofactor$normal_no_days_bleeding_16yr == -10 | mp1_nofactor$normal_no_days_bleeding_16yr == -9 | 
                                          mp1_nofactor$normal_no_days_bleeding_16yr == -7 | mp1_nofactor$normal_no_days_bleeding_16yr == -6 | 
                                          mp1_nofactor$normal_no_days_bleeding_16yr == -3 | mp1_nofactor$normal_no_days_bleeding_16yr == -2 |
                                          mp1_nofactor$normal_no_days_bleeding_16yr == -1] <- NA

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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1_nofactor$cramps_all_month_16yr)
mp1_nofactor$cramps_all_month_16yr <- ifelse(mp1_nofactor$cramps_all_month_16yr == 1,1,
                                            ifelse(mp1_nofactor$cramps_all_month_16yr == 2,0, NA))

# Variable for whether her doctor was contacted for period type pains:
table(mp1_nofactor$dr_cramps_all_month_16yr)
mp1_nofactor$dr_cramps_all_month_16yr <- ifelse(mp1_nofactor$dr_cramps_all_month_16yr == 2,0,
                                                ifelse(mp1_nofactor$dr_cramps_all_month_16yr == 1,1, NA))

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1_nofactor$oral_contraceptives_pastyr_16yr)
mp1_nofactor$oral_contraceptives_pastyr_16yr <- ifelse(mp1_nofactor$oral_contraceptives_pastyr_16yr == 2,0,
                                                      ifelse(mp1_nofactor$oral_contraceptives_pastyr_16yr == 1,1, NA))

# Variable for whether child has a thyroid problem:
table(mp1_nofactor$thyroid_problem_16yr)
mp1_nofactor$thyroid_problem_16yr <- ifelse(mp1_nofactor$thyroid_problem_16yr == 1,1,
                                            ifelse(mp1_nofactor$thyroid_problem_16yr == 2,0, NA))

# Using the D1501_PUB9.pdf (participant 17 years old):

# Variable for participants BMI:
table(mp1_nofactor$bmi_17yr)
mp1_nofactor$bmi_17yr[mp1_nofactor$bmi_17yr == -10  | mp1_nofactor$bmi_17yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1_nofactor$vigorous_exercise_17yr)
mp1_nofactor$vigorous_exercise_17yr <- ifelse(mp1_nofactor$vigorous_exercise_17yr == 1,1,
                                            ifelse(mp1_nofactor$vigorous_exercise_17yr == 2,2,
                                                  ifelse(mp1_nofactor$vigorous_exercise_17yr == 3,3,
                                                        ifelse(mp1_nofactor$vigorous_exercise_17yr == 4,4,
                                                              ifelse(mp1_nofactor$vigorous_exercise_17yr == 5,5, NA)))))

# Variable for whether child has started her period yet:
table(mp1_nofactor$started_period_17yr, mp1_nofactor$sex)  # Used sex in here to see if -7 referred to males which it does
mp1_nofactor$started_period_17yr <- ifelse(mp1_nofactor$started_period_17yr == 1,1,
                                          ifelse(mp1_nofactor$started_period_17yr == 2,0, NA))

# Variable for normal number of days bleeding:
table(mp1_nofactor$normal_no_days_bleeding_17yr)
mp1_nofactor$normal_no_days_bleeding_17yr[mp1_nofactor$normal_no_days_bleeding_17yr == -10 | mp1_nofactor$normal_no_days_bleeding_17yr == -9 | 
                                           mp1_nofactor$normal_no_days_bleeding_17yr == -7 | mp1_nofactor$normal_no_days_bleeding_17yr == -6 | 
                                           mp1_nofactor$normal_no_days_bleeding_17yr == -3 | mp1_nofactor$normal_no_days_bleeding_17yr == -2 |
                                           mp1_nofactor$normal_no_days_bleeding_17yr == -1] <- NA

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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1_nofactor$cramps_all_month_17yr)
mp1_nofactor$cramps_all_month_17yr <- ifelse(mp1_nofactor$cramps_all_month_17yr == 1,1,
                                            ifelse(mp1_nofactor$cramps_all_month_17yr == 2,0, NA))

# Variable for whether her doctor was contacted for period type pains:
table(mp1_nofactor$dr_cramps_all_month_17yr)
mp1_nofactor$dr_cramps_all_month_17yr <- ifelse(mp1_nofactor$dr_cramps_all_month_17yr == 2,0,
                                                ifelse(mp1_nofactor$dr_cramps_all_month_17yr == 1,1, NA))

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1_nofactor$oral_contraceptives_pastyr_17yr)
mp1_nofactor$oral_contraceptives_pastyr_17yr <- ifelse(mp1_nofactor$oral_contraceptives_pastyr_17yr == 2,0,
                                                      ifelse(mp1_nofactor$oral_contraceptives_pastyr_17yr == 1,1, NA))

# Variable for whether child has a thyroid problem:
table(mp1_nofactor$thyroid_problem_17yr)
mp1_nofactor$thyroid_problem_17yr <- ifelse(mp1_nofactor$thyroid_problem_17yr == 1,1,
                                            ifelse(mp1_nofactor$thyroid_problem_17yr == 2,0, NA))

# D2109_TF3.pdf:
# Variable for BMI at 15 years (taken at TF3)
table(mp1_nofactor$bmi_15yr)
mp1_nofactor$bmi_15yr[mp1_nofactor$bmi_15yr == -10 | mp1_nofactor$bmi_15yr == -6 | mp1_nofactor$bmi_15yr == -1] <- NA

# Variable for whether the young person smokes every day at 15 years
table(mp1_nofactor$smokes_everyday_15yr)
mp1_nofactor$smokes_everyday_15yr <- ifelse(mp1_nofactor$smokes_everyday_15yr == 1,1,
                                            ifelse(mp1_nofactor$smokes_everyday_15yr == 2,0, NA))

# Variable for whether the young person smokes every week at 15 years
table(mp1_nofactor$smokes_every_week_15yr)
mp1_nofactor$smokes_every_week_15yr <- ifelse(mp1_nofactor$smokes_every_week_15yr == 1,1,
                                              ifelse(mp1_nofactor$smokes_every_week_15yr == 2,0, NA))

# Variable for young persons drinking pattern at 15 years
table(mp1_nofactor$drinking_pattern_15yr)
mp1_nofactor$drinking_pattern_15yr <- ifelse(mp1_nofactor$drinking_pattern_15yr == 1,1,
                                            ifelse(mp1_nofactor$drinking_pattern_15yr == 2,2,
                                                  ifelse(mp1_nofactor$drinking_pattern_15yr == 3,3,
                                                          ifelse(mp1_nofactor$drinking_pattern_15yr == 4,4,
                                                                ifelse(mp1_nofactor$drinking_pattern_15yr == 5,5,
                                                                      ifelse(mp1_nofactor$drinking_pattern_15yr == 6,6, NA))))))

# D2111_TF4.pdf
# Variable for whether young person smokes every day
table(mp1_nofactor$smokes_everyday_17yr)
mp1_nofactor$smokes_everyday_17yr <- ifelse(mp1_nofactor$smokes_everyday_17yr == 1,1,
                                            ifelse(mp1_nofactor$smokes_everyday_17yr == 2,0, NA))

# Variable for whether young person smokes every week
table(mp1_nofactor$smokes_every_week_17yr)
mp1_nofactor$smokes_every_week_17yr <- ifelse(mp1_nofactor$smokes_every_week_17yr == 1,1,
                                              ifelse(mp1_nofactor$smokes_every_week_17yr == 2,0, NA))

# Variable for frequency that young person has a drink of alcohol
table(mp1_nofactor$freq_yp_drinks_17yr)
mp1_nofactor$freq_yp_drinks_17yr <- ifelse(mp1_nofactor$freq_yp_drinks_17yr == 1,1,
                                          ifelse(mp1_nofactor$freq_yp_drinks_17yr == 2,2,
                                                ifelse(mp1_nofactor$freq_yp_drinks_17yr == 3,3,
                                                        ifelse(mp1_nofactor$freq_yp_drinks_17yr == 4,4,
                                                              ifelse(mp1_nofactor$freq_yp_drinks_17yr == 5,5, NA)))))

# Variable for whether young woman has ever been pregnant, using D1425_YPA.pdf:
table(mp1_nofactor$ever_pregnant)
mp1_nofactor$ever_pregnant <- ifelse(mp1_nofactor$ever_pregnant == 1,1,
                                    ifelse(mp1_nofactor$ever_pregnant == 2,0, NA))

# Using D1426_YPB.pdf
# Variable for ever been diagnosed with PCOS
table(mp1_nofactor$pcos)
mp1_nofactor$pcos <- ifelse(mp1_nofactor$pcos == 1,1,
                           ifelse(mp1_nofactor$pcos == 2,1,
                                  ifelse(mp1_nofactor$pcos == 3,0, NA)))

# Variable for ever been diagnosed with endometrosis
table(mp1_nofactor$endometriosis)
mp1_nofactor$endometriosis <- ifelse(mp1_nofactor$endometriosis == 1,1,
                                    ifelse(mp1_nofactor$endometriosis == 2,1,
                                          ifelse(mp1_nofactor$endometriosis == 3,0, NA)))

# Here, I have gone through each timepoint and asked if the young woman answered yes to menorrhagia but no to visiting a doctor then code her as a 1

mp1_nofactor$hmb_nodr_10yr <- ifelse(mp1_nofactor$hmb_10yr == 1 & mp1_nofactor$dr_hmb_10yr == 0,1,0)
table(mp1_nofactor$hmb_nodr_10yr)

mp1_nofactor$hmb_nodr_11yr <- ifelse(mp1_nofactor$hmb_11yr == 1 & mp1_nofactor$dr_hmb_11yr == 0,1,0)
table(mp1_nofactor$hmb_nodr_11yr)

mp1_nofactor$hmb_nodr_13yr <- ifelse(mp1_nofactor$hmb_13yr == 1 & mp1_nofactor$dr_hmb_13yr == 0,1,0)
table(mp1_nofactor$hmb_nodr_13yr)

mp1_nofactor$hmb_nodr_14yr <- ifelse(mp1_nofactor$hmb_14yr == 1 & mp1_nofactor$dr_hmb_14yr == 0,1,0)
table(mp1_nofactor$hmb_nodr_14yr)

mp1_nofactor$hmb_nodr_15yr <- ifelse(mp1_nofactor$hmb_15yr == 1 & mp1_nofactor$dr_hmb_15yr == 0,1,0)
table(mp1_nofactor$hmb_nodr_15yr)

mp1_nofactor$hmb_nodr_16yr <- ifelse(mp1_nofactor$hmb_16yr == 1 & mp1_nofactor$dr_hmb_16yr == 0,1,0)
table(mp1_nofactor$hmb_nodr_16yr)

mp1_nofactor$hmb_nodr_17yr <- ifelse(mp1_nofactor$hmb_17yr == 1 & mp1_nofactor$dr_hmb_17yr == 0,1,0)
table(mp1_nofactor$hmb_nodr_17yr)

# Using these variables, I generated a variable hmb_controls which asking if a young women had reported menorrhagia at any timpoint but not visted the dr

mp1_nofactor$hmb_controls <- ifelse(mp1_nofactor$hmb_nodr_10yr == 1 | mp1_nofactor$hmb_nodr_11yr == 1 | mp1_nofactor$hmb_nodr_13yr == 1 | 
                             mp1_nofactor$hmb_nodr_14yr == 1 | mp1_nofactor$hmb_nodr_15yr == 1 | mp1_nofactor$hmb_nodr_16yr == 1 | 
                             mp1_nofactor$hmb_nodr_17yr == 1,1,0)

# However, this variable captured 1873 women, including 289 young women who had reported no at ≥1 timepoint and yes at ≥1 timepoint - these women needed to 
# be moved from controls to cases. So I generated a variable for ever having visited the doctor for menorrhagia

mp1_nofactor$menorr_drvisit_ever <- ifelse(mp1_nofactor$dr_hmb_10yr == 1 | mp1_nofactor$dr_hmb_11yr == 1 | mp1_nofactor$dr_hmb_13yr == 1 | 
                                    mp1_nofactor$dr_hmb_14yr == 1 | mp1_nofactor$dr_hmb_15yr == 1 | mp1_nofactor$dr_hmb_16yr == 1 | 
                                    mp1_nofactor$dr_hmb_17yr == 1,1,0)
table(mp1_nofactor$menorr_drvisit_ever)

# This variable captured 527 women who had been to the dr ≥1 time during puberty. Now I just needed to remove the 289 from controls and split split cases 
# (coded as 1) and controls (coded as 0) in one variable

mp1_nofactor$menorr_ewas <- NA
mp1_nofactor$menorr_ewas[mp1_nofactor$hmb_controls ==1] <- 0
mp1_nofactor$menorr_ewas[mp1_nofactor$menorr_drvisit_ever ==1] <- 1

# Now, the variable menorr_ewas incorporates cases (women who have visited the doctor ≥1 time during puberty n=527) and controls (women who have reported 
# HMB ≥1 time during puberty but have never visited the doctor n=1584)

# Similarly for dysmenorrhea:

# Here, I have gone through each timepoint and asked if the young woman answered yes to dysmenorrhea but no to visiting a doctor then code her as a 1

mp1_nofactor$cramps_nodr_9yr <- ifelse(mp1_nofactor$cramps_9yr == 1 & mp1_nofactor$dr_cramps_9yr == 0,1,0)
table(mp1_nofactor$cramps_nodr_9yr)

mp1_nofactor$cramps_nodr_10yr <- ifelse(mp1_nofactor$cramps_10yr == 1 & mp1_nofactor$dr_cramps_10yr == 0,1,0)
table(mp1_nofactor$cramps_nodr_10yr)

mp1_nofactor$cramps_nodr_11yr <- ifelse(mp1_nofactor$cramps_11yr == 1 & mp1_nofactor$dr_cramps_11yr == 0,1,0)
table(mp1_nofactor$cramps_nodr_11yr)

mp1_nofactor$cramps_nodr_13yr <- ifelse(mp1_nofactor$cramps_13yr == 1 & mp1_nofactor$dr_cramps_13yr == 0,1,0)
table(mp1_nofactor$cramps_nodr_13yr)

mp1_nofactor$cramps_nodr_14yr <- ifelse(mp1_nofactor$cramps_14yr == 1 & mp1_nofactor$dr_cramps_14yr == 0,1,0)
table(mp1_nofactor$cramps_nodr_14yr)

mp1_nofactor$cramps_nodr_15yr <- ifelse(mp1_nofactor$cramps_15yr == 1 & mp1_nofactor$dr_cramps_15yr == 0,1,0)
table(mp1_nofactor$cramps_nodr_15yr)

mp1_nofactor$cramps_nodr_16yr <- ifelse(mp1_nofactor$cramps_16yr == 1 & mp1_nofactor$dr_cramps_16yr == 0,1,0)
table(mp1_nofactor$cramps_nodr_16yr)

mp1_nofactor$cramps_nodr_17yr <- ifelse(mp1_nofactor$cramps_17yr == 1 & mp1_nofactor$dr_cramps_17yr == 0,1,0)
table(mp1_nofactor$cramps_nodr_17yr)

# Using these variables, I generated a variable cramps_controls which asking if a young women had reported dysmenorrhea at any timpoint but not visted the dr

mp1_nofactor$cramps_controls <- ifelse(mp1_nofactor$cramps_nodr_9yr == 1 |mp1_nofactor$cramps_nodr_10yr == 1 | mp1_nofactor$cramps_nodr_11yr == 1 | 
                                mp1_nofactor$cramps_nodr_13yr == 1 | mp1_nofactor$cramps_nodr_14yr == 1 | mp1_nofactor$cramps_nodr_15yr == 1 |
                                mp1_nofactor$cramps_nodr_16yr == 1 | mp1_nofactor$cramps_nodr_17yr == 1,1,0)
table(mp1_nofactor$cramps_controls)

# However, this variable captured 2993 women, including 419 young women who had reported no at ≥1 timepoint and yes at ≥1 timepoint - these women needed to 
# be moved from controls to cases. So I generated a variable for ever having visited the doctor for dysmenorrhea

mp1_nofactor$dysmen_drvisit_ever <- ifelse(mp1_nofactor$dr_cramps_9yr == 1 |mp1_nofactor$dr_cramps_10yr == 1 | mp1_nofactor$dr_cramps_11yr == 1 | 
                                    mp1_nofactor$dr_cramps_13yr == 1 | mp1_nofactor$dr_cramps_14yr == 1 | mp1_nofactor$dr_cramps_15yr == 1 | 
                                    mp1_nofactor$dr_cramps_16yr == 1 | mp1_nofactor$dr_cramps_17yr == 1,1,0)
table(mp1_nofactor$dysmen_drvisit_ever)

# This variable captured 641 women who had been to the dr ≥1 time during puberty. Now I just needed to remove the 419 from controls and split cases 
# (coded as 1) and controls (coded as 0) in one variable

mp1_nofactor$dysmen_ewas <- NA
mp1_nofactor$dysmen_ewas[mp1_nofactor$cramps_controls ==1] <- 0
mp1_nofactor$dysmen_ewas[mp1_nofactor$dysmen_drvisit_ever ==1] <- 1

# Now the variable dysmen_ewas incorporates cases (women who have visited the doctor ≥1 time during puberty for dysmenorrhea n=641) and controls (women 
# who have reported dysmenorrhea but never visited the doctor)

# Check all the timpoints to make sure no controls have visited the doctor 

table(mp1_nofactor$dysmen_ewas, mp1_nofactor$dr_cramps_10yr)
table(mp1_nofactor$dysmen_ewas, mp1_nofactor$dr_cramps_11yr)
table(mp1_nofactor$dysmen_ewas, mp1_nofactor$dr_cramps_13yr)
table(mp1_nofactor$dysmen_ewas, mp1_nofactor$dr_cramps_14yr)
table(mp1_nofactor$dysmen_ewas, mp1_nofactor$dr_cramps_15yr)
table(mp1_nofactor$dysmen_ewas, mp1_nofactor$dr_cramps_16yr)
table(mp1_nofactor$dysmen_ewas, mp1_nofactor$dr_cramps_17yr)

# Similarly for smoking and alcohol use, I need to derive a binary variable for each showing whether the young person is regularly smoking
# or drinking at the time of their methylation measurement (15 or 17 years), so generating a variable from the information I have for each of
# those timepoints

table(mp1_nofactor$smokes_every_week_15yr)
table(mp1_nofactor$smokes_everyday_15yr)
mp1_nofactor$reg_smoker_15yr <- ifelse(mp1_nofactor$smokes_every_week_15yr == 1 | mp1_nofactor$smokes_everyday_15yr == 1,1,
                              ifelse(mp1_nofactor$smokes_every_week_15yr == 0 & mp1_nofactor$smokes_everyday_15yr == 0, 0, NA))

table(mp1_nofactor$smokes_every_week_17yr)
table(mp1_nofactor$smokes_everyday_17yr)
mp1_nofactor$reg_smoker_17yr <- ifelse(mp1_nofactor$smokes_every_week_17yr == 1 | mp1_nofactor$smokes_everyday_17yr == 1, 1,
                              ifelse(mp1_nofactor$smokes_every_week_17yr == 0 & mp1_nofactor$smokes_everyday_17yr == 0, 0, NA))

mp1_nofactor$reg_smoker_ever <- ifelse(mp1_nofactor$reg_smoker_15yr == 1 | mp1_nofactor$reg_smoker_17yr == 1,1,0)
table(mp1_nofactor$reg_smoker_ever)

table(mp1_nofactor$drinking_pattern_15yr)
mp1_nofactor$reg_drinker_15yr <- ifelse(mp1_nofactor$drinking_pattern_15yr == 1 | mp1_nofactor$drinking_pattern_15yr == 2 |
                                 mp1_nofactor$drinking_pattern_15yr == 3, 0,
                               ifelse(mp1_nofactor$drinking_pattern_15yr == 4 | mp1_nofactor$drinking_pattern_15yr == 5 |
                                        mp1_nofactor$drinking_pattern_15yr == 6, 1, NA))

table(mp1_nofactor$freq_yp_drinks_17yr)
mp1_nofactor$reg_drinker_17yr <- ifelse(mp1_nofactor$freq_yp_drinks_17yr == 1 | mp1_nofactor$freq_yp_drinks_17yr == 2 | mp1_nofactor$freq_yp_drinks_17yr == 3, 0,
                               ifelse(mp1_nofactor$freq_yp_drinks_17yr == 4 | mp1_nofactor$freq_yp_drinks_17yr == 5, 1, NA))

mp1_nofactor$reg_drinker_ever <- ifelse(mp1_nofactor$reg_drinker_15yr == 1 | mp1_nofactor$reg_drinker_17yr == 1,1,0)
table(mp1_nofactor$reg_drinker_ever)

# For comorbidities, thyroid problems, PCOS or endometriosis by the end of puberty, I am making a binary variable covering whether a thyroid problem was 
# present at 17 years and whether PCOS or endometriosis had been diagnosed at 22 years (only info we have)

mp1_nofactor$comorbidity <- ifelse(mp1_nofactor$thyroid_problem_17yr == 1 | mp1_nofactor$pcos == 1 | mp1_nofactor$endometriosis == 1,1,
                          ifelse(mp1_nofactor$thyroid_problem_17yr == 0 & mp1_nofactor$pcos == 0 & mp1_nofactor$endometriosis == 0,0,NA))
table(mp1_nofactor$comorbidity)

# For contraception ever, I am going to combine all the puberty questions re oral contraceptives in the last 12 months
mp1_nofactor$contraception_ever <- ifelse(mp1_nofactor$oral_contraceptives_pastyr_8yr == 1 | mp1_nofactor$oral_contraceptives_pastyr_9yr == 1 | 
                                   mp1_nofactor$oral_contraceptives_pastyr_10yr == 1 | mp1_nofactor$oral_contraceptives_pastyr_11yr == 1 | 
                                   mp1_nofactor$oral_contraceptives_pastyr_13yr == 1 | mp1_nofactor$oral_contraceptives_pastyr_14yr == 1 |
                                   mp1_nofactor$oral_contraceptives_pastyr_15yr == 1 | mp1_nofactor$oral_contraceptives_pastyr_16yr == 1 | 
                                   mp1_nofactor$oral_contraceptives_pastyr_17yr == 1,1,0)
table(mp1_nofactor$contraception_ever)

# Then generate a variable for if contraception has been specifically reported as no

mp1_nofactor$contraception_never <- ifelse(mp1_nofactor$oral_contraceptives_pastyr_8yr == 0 | mp1_nofactor$oral_contraceptives_pastyr_9yr == 0 | 
                                    mp1_nofactor$oral_contraceptives_pastyr_10yr == 0 | mp1_nofactor$oral_contraceptives_pastyr_11yr == 0 | 
                                    mp1_nofactor$oral_contraceptives_pastyr_13yr == 0 | mp1_nofactor$oral_contraceptives_pastyr_14yr == 0 |
                                    mp1_nofactor$oral_contraceptives_pastyr_15yr == 0 | mp1_nofactor$oral_contraceptives_pastyr_16yr == 0 | 
                                    mp1_nofactor$oral_contraceptives_pastyr_17yr == 0,1,0)
table(mp1_nofactor$contraception_never)

# From these two variables I can generate a "ever" and "never" variable

mp1_nofactor$contraception_ewas <- NA
mp1_nofactor$contraception_ewas[mp1_nofactor$contraception_never ==1] <- 0
mp1_nofactor$contraception_ewas[mp1_nofactor$contraception_ever ==1] <- 1

# Binary maternal education variable

mp1_nofactor$mat_edu_bin <- ifelse(mp1_nofactor$mat_edu == 5 | mp1_nofactor$mat_edu == 4,1,
                          ifelse(mp1_nofactor$mat_edu == 3 | mp1_nofactor$mat_edu == 2 | mp1_nofactor$mat_edu == 1,0,NA))

# Binary maternal occupational class

mp1_nofactor$mat_occ_bin <- ifelse(mp1_nofactor$mat_occ_class == 6,0,
                          ifelse(mp1_nofactor$mat_occ_class == 1 | mp1_nofactor$mat_occ_class == 2 | mp1_nofactor$mat_occ_class == 3 |
                                   mp1_nofactor$mat_occ_class == 4 | mp1_nofactor$mat_occ_class == 5 | mp1_nofactor$mat_occ_class == 7,1,NA))

save(mp1_nofactor, file="mp1_nofactor.Rda")
