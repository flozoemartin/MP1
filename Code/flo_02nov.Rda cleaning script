#################################################################################################################################################################
#                                                                                                                                                               #
#   Script for cleaning flo_02nov.Rda dataset abstracted from ALSPAC drive                                                                                      #         
#                                                                                                                                                               #
#   Author:       Flo Martin                                                                                                                                    #
#   Start Date:   02/11/2020                                                                                                                                    #
#   Finish Date:  13/11/2020                                                                                                                                    #
#   Description:  This script describes data cleaning for flo_02nov for mini project 1 where minus numbers are replaced with NA, coding for yes and no is       #
#                 switched from 1 & 2 to 0 & 1, and variables are generated for ever having visited the doctor, smoked regularly or drank regulaly. This data   #
#                 is ready to merge with the epigenetic data when I get access to ARIES                                                                         #
#                                                                                                                                                               #
################################################################################################################################################################# 

rm(flo_02nov)
rm(mp1)                         # This clears the mp1 & flo_02nov data in global environment

setwd("/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/Mini Project 1/R Data")

load("flo_02nov.Rda")           # Load in the raw dataset as pulled from R:/Data
mp1 <- data.frame(flo_02nov)    # ...and the create a copy of flo_02nov (blank - no labels) which will allow any changes made to 
                                # the following code be properly implemented in mp1. At the end of this script, R will save the newest copy of mp1.Rda in the R
                                # file in OneDrive. 
colnames(mp1)                   # This allows me to check all the column names and category labels are as they were when pulled from R:/Data

colnames(mp1) [4] <- "men_age_m"
colnames(mp1) [5] <- "men_age_y"
colnames(mp1) [6] <- "mat_edu"
colnames(mp1) [7] <- "mat_occ_class"
colnames(mp1) [8] <- "contraceptive_pill_19yr"
colnames(mp1) [9] <- "contraceptive_injection_19yr"
colnames(mp1) [10] <- "contraceptive_implant_19yr"
colnames(mp1) [11] <- "contraceptive_hormonal_coil_19yr"
colnames(mp1) [12] <- "contraceptive_patch_19yr"
colnames(mp1) [13] <- "given_pill_for_periods_19yr"
colnames(mp1) [14] <- "age_given_pill_for_periods_19yr"
colnames(mp1) [15] <- "sex"
colnames(mp1) [16] <- "bmi_8yr"
colnames(mp1) [17] <- "vigorous_exercise_8yr"
colnames(mp1) [18] <- "started_period_8yr"
colnames(mp1) [19] <- "hmb_8yr"
colnames(mp1) [20] <- "dr_hmb_8yr"
colnames(mp1) [21] <- "cramps_8yr"
colnames(mp1) [22] <- "dr_cramps_8yr"
colnames(mp1) [23] <- "cramps_all_month_8yr"
colnames(mp1) [24] <- "dr_cramps_all_month_8yr"
colnames(mp1) [25] <- "oral_contraceptives_pastyr_8yr"
colnames(mp1) [26] <- "thyroid_problem_8yr"
colnames(mp1) [27] <- "bmi_9yr"
colnames(mp1) [28] <- "vigorous_exercise_9yr"
colnames(mp1) [29] <- "started_period_9yr"
colnames(mp1) [30] <- "hmb_9yr"
colnames(mp1) [31] <- "dr_hmb_9yr"
colnames(mp1) [32] <- "cramps_9yr"
colnames(mp1) [33] <- "dr_cramps_9yr"
colnames(mp1) [34] <- "cramps_all_month_9yr"
colnames(mp1) [35] <- "dr_cramps_all_month_9yr"
colnames(mp1) [36] <- "oral_contraceptives_pastyr_9yr"
colnames(mp1) [37] <- "thyroid_problem_9yr"
colnames(mp1) [38] <- "bmi_10yr"
colnames(mp1) [39] <- "vigorous_exercise_10yr"
colnames(mp1) [40] <- "started_period_10yr"
colnames(mp1) [41] <- "normal_no_days_bleeding_10yr"
colnames(mp1) [42] <- "hmb_10yr"
colnames(mp1) [43] <- "dr_hmb_10yr"
colnames(mp1) [44] <- "cramps_10yr"
colnames(mp1) [45] <- "dr_cramps_10yr"
colnames(mp1) [46] <- "cramps_all_month_10yr"
colnames(mp1) [47] <- "dr_cramps_all_month_10yr"
colnames(mp1) [48] <- "oral_contraceptives_pastyr_10yr"
colnames(mp1) [49] <- "thyroid_problem_10yr"
colnames(mp1) [50] <- "bmi_11yr"
colnames(mp1) [51] <- "vigorous_exercise_11yr"
colnames(mp1) [52] <- "started_period_11yr"
colnames(mp1) [53] <- "normal_no_days_bleeding_11yr"
colnames(mp1) [54] <- "hmb_11yr"
colnames(mp1) [55] <- "dr_hmb_11yr"
colnames(mp1) [56] <- "cramps_11yr"
colnames(mp1) [57] <- "dr_cramps_11yr"
colnames(mp1) [58] <- "cramps_all_month_11yr"
colnames(mp1) [59] <- "dr_cramps_all_month_11yr"
colnames(mp1) [60] <- "oral_contraceptives_pastyr_11yr"
colnames(mp1) [61] <- "thyroid_problem_11yr"
colnames(mp1) [62] <- "bmi_13yr"
colnames(mp1) [63] <- "vigorous_exercise_13yr"
colnames(mp1) [64] <- "started_period_13yr"
colnames(mp1) [65] <- "normal_no_days_bleeding_13yr"
colnames(mp1) [66] <- "hmb_13yr"
colnames(mp1) [67] <- "dr_hmb_13yr"
colnames(mp1) [68] <- "cramps_13yr"
colnames(mp1) [69] <- "dr_cramps_13yr"
colnames(mp1) [70] <- "cramps_all_month_13yr"
colnames(mp1) [71] <- "dr_cramps_all_month_13yr"
colnames(mp1) [72] <- "oral_contraceptives_pastyr_13yr"
colnames(mp1) [73] <- "thyroid_problem_13yr"
colnames(mp1) [74] <- "bmi_14yr"
colnames(mp1) [75] <- "vigorous_exercise_14yr"
colnames(mp1) [76] <- "started_period_14yr"
colnames(mp1) [77] <- "normal_no_days_bleeding_14yr"
colnames(mp1) [78] <- "hmb_14yr"
colnames(mp1) [79] <- "dr_hmb_14yr"
colnames(mp1) [80] <- "cramps_14yr"
colnames(mp1) [81] <- "dr_cramps_14yr"
colnames(mp1) [82] <- "cramps_all_month_14yr"
colnames(mp1) [83] <- "dr_cramps_all_month_14yr"
colnames(mp1) [84] <- "oral_contraceptives_pastyr_14yr"
colnames(mp1) [85] <- "thyroid_problem_14yr"
colnames(mp1) [86] <- "vigorous_exercise_15yr"
colnames(mp1) [87] <- "started_period_15yr"
colnames(mp1) [88] <- "normal_no_days_bleeding_15yr"
colnames(mp1) [89] <- "hmb_15yr"
colnames(mp1) [90] <- "dr_hmb_15yr"
colnames(mp1) [91] <- "cramps_15yr"
colnames(mp1) [92] <- "severity_cramps_15yr"
colnames(mp1) [93] <- "dr_cramps_15yr"
colnames(mp1) [94] <- "cramps_all_month_15yr"
colnames(mp1) [95] <- "dr_cramps_all_month_15yr"
colnames(mp1) [96] <- "oral_contraceptives_pastyr_15yr"
colnames(mp1) [97] <- "thyroid_problem_15yr"
colnames(mp1) [98] <- "bmi_16yr"
colnames(mp1) [99] <- "vigorous_exercise_16yr"
colnames(mp1) [100] <- "started_period_16yr"
colnames(mp1) [101] <- "normal_no_days_bleeding_16yr"
colnames(mp1) [102] <- "hmb_16yr"
colnames(mp1) [103] <- "dr_hmb_16yr"
colnames(mp1) [104] <- "cramps_16yr"
colnames(mp1) [105] <- "dr_cramps_16yr"
colnames(mp1) [106] <- "cramps_all_month_16yr"
colnames(mp1) [107] <- "dr_cramps_all_month_16yr"
colnames(mp1) [108] <- "oral_contraceptives_pastyr_16yr"
colnames(mp1) [109] <- "thyroid_problem_16yr"
colnames(mp1) [110] <- "bmi_17yr"
colnames(mp1) [111] <- "vigorous_exercise_17yr"
colnames(mp1) [112] <- "started_period_17yr"
colnames(mp1) [113] <- "normal_no_days_bleeding_17yr"
colnames(mp1) [114] <- "hmb_17yr"
colnames(mp1) [115] <- "dr_hmb_17yr"
colnames(mp1) [116] <- "cramps_17yr"
colnames(mp1) [117] <- "dr_cramps_17yr"
colnames(mp1) [118] <- "cramps_all_month_17yr"
colnames(mp1) [119] <- "dr_cramps_all_month_17yr"
colnames(mp1) [120] <- "oral_contraceptives_pastyr_17yr"
colnames(mp1) [121] <- "thyroid_problem_17yr"
colnames(mp1) [122] <- "bmi_15yr"
colnames(mp1) [123] <- "smokes_everyday_15yr"
colnames(mp1) [124] <- "smokes_every_week_15yr"
colnames(mp1) [125] <- "drinking_pattern_15yr"
colnames(mp1) [126] <- "smokes_everyday_17yr"
colnames(mp1) [127] <- "smokes_every_week_17yr"
colnames(mp1) [128] <- "freq_yp_drinks_17yr"
colnames(mp1) [129] <- "ever_pregnant"
colnames(mp1) [130] <- "pcos"
colnames(mp1) [131] <- "endometriosis"
colnames(mp1) [132] <- "pcos_imputeno"
colnames(mp1) [133] <- "endometriosis_imputeno"

# Now, explore each of the variables:
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

# Variable maternal occupation
table(mp1$mat_occ_class)
mp1$mat_occ_class <- ifelse(mp1$mat_occ_class == 1,1,
                            ifelse(mp1$mat_occ_class == 2,2,
                                   ifelse(mp1$mat_occ_class == 3,3,
                                          ifelse(mp1$mat_occ_class == 4,4,
                                                 ifelse(mp1$mat_occ_class == 5,5,
                                                        ifelse(mp1$mat_occ_class == 6,6,
                                                               ifelse(mp1$mat_occ_class == 65,7,NA)))))))
mp1$mat_occ_class <- factor(mp1$mat_occ_class,
                            levels = c(1,2,3,4,5,6,7),
                            labels = c("Professional","Managerial/technical","Skilled non-manual","Skilled manual","Semi-skilled","Unskilled","Armed forces"))
table(mp1$mat_occ_class)

# Variable for whether the young woman is currently using the contraceptive pill (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_pill_19yr)
mp1$contraceptive_pill_19yr <- ifelse(mp1$contraceptive_pill_19yr ==1,1, 
                                      ifelse(mp1$contraceptive_pill_19yr == 2,0, NA))
mp1$contraceptive_pill_19yr <- factor(mp1$contraceptive_pill_19yr, 
                                      levels = c(0,1), 
                                      labels = c("No","Yes"))
table(mp1$contraceptive_pill_19yr)

# Variable for whether the young woman is currently using the contraceptive injection (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_injection_19yr)
mp1$contraceptive_injection_19yr <- ifelse(mp1$contraceptive_injection_19yr ==1,1, 
                                           ifelse(mp1$contraceptive_injection_19yr == 2,0, NA))
mp1$contraceptive_injection_19yr <- factor(mp1$contraceptive_injection_19yr, 
                                           levels = c(0,1), 
                                           labels = c("No","Yes"))
table(mp1$contraceptive_injection_19yr)

# Variable for whether the young woman is currently using the contraceptive implant (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_implant_19yr)
mp1$contraceptive_implant_19yr <- ifelse(mp1$contraceptive_implant_19yr ==1,1, 
                                         ifelse(mp1$contraceptive_implant_19yr == 2,0, NA))
mp1$contraceptive_implant_19yr <- factor(mp1$contraceptive_implant_19yr, 
                                         levels = c(0,1), 
                                         labels = c("No","Yes"))
table(mp1$contraceptive_implant_19yr)

# Variable for whether the young woman is currently using the contraceptive coil (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_hormonal_coil_19yr)
mp1$contraceptive_hormonal_coil_19yr <- ifelse(mp1$contraceptive_hormonal_coil_19yr ==1,1, 
                                               ifelse(mp1$contraceptive_hormonal_coil_19yr == 2,0, NA))
mp1$contraceptive_hormonal_coil_19yr <- factor(mp1$contraceptive_hormonal_coil_19yr, 
                                               levels = c(0,1), 
                                               labels = c("No","Yes"))
table(mp1$contraceptive_hormonal_coil_19yr)

# Variable for whether the young woman is currently using the contraceptive patch (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_patch_19yr)
mp1$contraceptive_patch_19yr <- ifelse(mp1$contraceptive_patch_19yr ==1,1, 
                                       ifelse(mp1$contraceptive_patch_19yr == 2,0, NA))
mp1$contraceptive_patch_19yr <- factor(mp1$contraceptive_patch_19yr, 
                                       levels = c(0,1), 
                                       labels = c("No","Yes"))
table(mp1$contraceptive_patch_19yr)

# Variable for whether the young woman has been given the pill to regulate her period (no or yes), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$given_pill_for_periods_19yr)
mp1$given_pill_for_periods_19yr <- ifelse(mp1$given_pill_for_periods_19yr ==1,0, 
                                          ifelse(mp1$given_pill_for_periods_19yr == 2,1, NA))
mp1$given_pill_for_periods_19yr <- factor(mp1$given_pill_for_periods_19yr, 
                                          levels = c(0,1), 
                                          labels = c("No","Yes"))
table(mp1$given_pill_for_periods_19yr)

# Variable for what age young woman were given the pill to regulate her period (age in years), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$age_given_pill_for_periods_19yr)
mp1$age_given_pill_for_periods_19yr[mp1$age_given_pill_for_periods_19yr == -10 | mp1$age_given_pill_for_periods_19yr == -3 | 
                                      mp1$age_given_pill_for_periods_19yr == -1] <- NA
table(mp1$age_given_pill_for_periods_19yr)

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

# Variable for BMI (will categorise the missings later)
table(mp1$bmi_8yr)
mp1$bmi_8yr[mp1$bmi_8yr == -9 | mp1$bmi_8yr == -7 | mp1$bmi_8yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_8yr)
mp1$vigorous_exercise_8yr <- ifelse(mp1$vigorous_exercise_8yr == 1,1,
                                    ifelse(mp1$vigorous_exercise_8yr == 2,2,
                                           ifelse(mp1$vigorous_exercise_8yr == 3,3,
                                                  ifelse(mp1$vigorous_exercise_8yr == 4,4,
                                                         ifelse(mp1$vigorous_exercise_8yr == 5,5, NA)))))
mp1$vigorous_exercise_8yr <- factor(mp1$vigorous_exercise_8yr, 
                                    levels = c(1,2,3,4,5), 
                                    labels = c("None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_8yr)

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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_8yr)
mp1$cramps_all_month_8yr <- ifelse(mp1$cramps_all_month_8yr == 1,1,
                                    ifelse(mp1$cramps_all_month_8yr == 2,0, NA))
mp1$cramps_all_month_8yr <- factor(mp1$cramps_all_month_8yr, 
                                   levels = c(0,1), 
                                   labels = c("No","Yes"))
table(mp1$cramps_all_month_8yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_8yr)
mp1$dr_cramps_all_month_8yr <- ifelse(mp1$dr_cramps_all_month_8yr == 1,1, NA)
mp1$dr_cramps_all_month_8yr <- factor(mp1$dr_cramps_all_month_8yr,
                                      levels = c(1), 
                                      labels = c("Yes"))
table(mp1$dr_cramps_all_month_8yr)

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

# Variable for BMI (will categorise the missings later)
table(mp1$bmi_9yr)
mp1$bmi_9yr[mp1$bmi_9yr == -9 | mp1$bmi_9yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_9yr)
mp1$vigorous_exercise_9yr <- ifelse(mp1$vigorous_exercise_9yr == 1,1,
                                    ifelse(mp1$vigorous_exercise_9yr == 2,2,
                                           ifelse(mp1$vigorous_exercise_9yr == 3,3,
                                                  ifelse(mp1$vigorous_exercise_9yr == 4,4,
                                                         ifelse(mp1$vigorous_exercise_9yr == 5,5, NA)))))
mp1$vigorous_exercise_9yr <- factor(mp1$vigorous_exercise_9yr, 
                                    levels = c(1,2,3,4,5), 
                                    labels = c("None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_9yr)

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
mp1$cramps_9yr <- ifelse(mp1$cramps_9yr == 2,0, NA)
mp1$cramps_9yr <- factor(mp1$cramps_9yr, 
                         levels = c(0), 
                         labels = c("No"))
table(mp1$cramps_9yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_9yr)
mp1$dr_cramps_9yr <- ifelse(mp1$dr_cramps_9yr == 1,1,
                                ifelse(mp1$dr_cramps_9yr == 2,0, NA))
mp1$dr_cramps_9yr <- factor(mp1$dr_cramps_9yr, 
                            levels = c(0,1), 
                            labels = c("No","Yes"))
table(mp1$dr_cramps_9yr)

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_9yr)
mp1$cramps_all_month_9yr <- ifelse(mp1$cramps_all_month_9yr == 1,1,
                                    ifelse(mp1$cramps_all_month_9yr == 2,0, NA))
mp1$cramps_all_month_9yr <- factor(mp1$cramps_all_month_9yr, 
                                   levels = c(0,1), 
                                   labels = c("No","Yes"))
table(mp1$cramps_all_month_9yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_9yr)
mp1$dr_cramps_all_month_9yr <- ifelse(mp1$dr_cramps_all_month_9yr == 2,0, NA)
mp1$dr_cramps_all_month_9yr <- factor(mp1$dr_cramps_all_month_9yr, 
                                      levels = c(0), 
                                      labels = c("No"))
table(mp1$dr_cramps_all_month_9yr)

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

# Variable for BMI (will categorise the missings later)
table(mp1$bmi_10yr)
mp1$bmi_10yr[mp1$bmi_10yr == -10 | mp1$bmi_10yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_10yr)
mp1$vigorous_exercise_10yr <- ifelse(mp1$vigorous_exercise_10yr == 1,1,
                                     ifelse(mp1$vigorous_exercise_10yr == 2,2,
                                            ifelse(mp1$vigorous_exercise_10yr == 3,3,
                                                   ifelse(mp1$vigorous_exercise_10yr == 4,4,
                                                          ifelse(mp1$vigorous_exercise_10yr == 5,5, NA)))))
mp1$vigorous_exercise_10yr <- factor(mp1$vigorous_exercise_10yr, 
                                     levels = c(1,2,3,4,5), 
                                     labels = c("None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_10yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_10yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_10yr <- ifelse(mp1$started_period_10yr == 1,1,
                                  ifelse(mp1$started_period_10yr == 2,0, NA))
mp1$started_period_10yr <- factor(mp1$started_period_10yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$started_period_10yr)

# Variable for normal number of days bleeding:
table(mp1$normal_no_days_bleeding_10yr)
mp1$normal_no_days_bleeding_10yr[mp1$normal_no_days_bleeding_10yr == -10 | mp1$normal_no_days_bleeding_10yr == -9 | mp1$normal_no_days_bleeding_10yr == -7 |
                                   mp1$normal_no_days_bleeding_10yr == -6 | mp1$normal_no_days_bleeding_10yr == -2 | mp1$normal_no_days_bleeding_10yr == -1] <- NA
table(mp1$normal_no_days_bleeding_10yr)

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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_10yr)
mp1$cramps_all_month_10yr <- ifelse(mp1$cramps_all_month_10yr == 1,1,
                                      ifelse(mp1$cramps_all_month_10yr == 2,0, NA))
mp1$cramps_all_month_10yr <- factor(mp1$cramps_all_month_10yr, 
                                    levels = c(0,1), 
                                    labels = c("No","Yes"))
table(mp1$cramps_all_month_10yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_10yr)
mp1$dr_cramps_all_month_10yr <- ifelse(mp1$dr_cramps_all_month_10yr == 2,0,
                                                ifelse(mp1$dr_cramps_all_month_10yr == 1,1, NA))
mp1$dr_cramps_all_month_10yr <- factor(mp1$dr_cramps_all_month_10yr, 
                                       levels = c(0,1), 
                                       labels = c("No","Yes"))
table(mp1$dr_cramps_all_month_10yr)

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

# Variable for BMI (will categorise the missings later)
table(mp1$bmi_11yr)
mp1$bmi_11yr[mp1$bmi_11yr == -10 | mp1$bmi_11yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_11yr)
mp1$vigorous_exercise_11yr <- ifelse(mp1$vigorous_exercise_11yr == 1,1,
                                     ifelse(mp1$vigorous_exercise_11yr == 2,2,
                                            ifelse(mp1$vigorous_exercise_11yr == 3,3,
                                                   ifelse(mp1$vigorous_exercise_11yr == 4,4,
                                                          ifelse(mp1$vigorous_exercise_11yr == 5,5, NA)))))
mp1$vigorous_exercise_11yr <- factor(mp1$vigorous_exercise_11yr, 
                                     levels = c(1,2,3,4,5), 
                                     labels = c("None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_11yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_11yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_11yr <- ifelse(mp1$started_period_11yr == 1,1,
                                  ifelse(mp1$started_period_11yr == 2,0, NA))
mp1$started_period_11yr <- factor(mp1$started_period_11yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$started_period_11yr)

# Variable for normal number of days bleeding:
table(mp1$normal_no_days_bleeding_11yr)
mp1$normal_no_days_bleeding_11yr[mp1$normal_no_days_bleeding_11yr == -10 | mp1$normal_no_days_bleeding_11yr == -9 | mp1$normal_no_days_bleeding_11yr == -7 |
                                   mp1$normal_no_days_bleeding_11yr == -6 | mp1$normal_no_days_bleeding_11yr == -2 | mp1$normal_no_days_bleeding_11yr == -1] <- NA
table(mp1$normal_no_days_bleeding_11yr)


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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_11yr)
mp1$cramps_all_month_11yr <- ifelse(mp1$cramps_all_month_11yr == 1,1,
                                    ifelse(mp1$cramps_all_month_11yr == 2,0, NA))
mp1$cramps_all_month_11yr <- factor(mp1$cramps_all_month_11yr, 
                                    levels = c(0,1), 
                                    labels = c("No","Yes"))
table(mp1$cramps_all_month_11yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_11yr)
mp1$dr_cramps_all_month_11yr <- ifelse(mp1$dr_cramps_all_month_11yr == 2,0,
                                          ifelse(mp1$dr_cramps_all_month_11yr == 1,1, NA))
mp1$dr_cramps_all_month_11yr <- factor(mp1$dr_cramps_all_month_11yr, 
                                       levels = c(0,1), 
                                       labels = c("No","Yes"))
table(mp1$dr_cramps_all_month_11yr)

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

# Variable for BMI (will categorise the missings later)
table(mp1$bmi_13yr)
mp1$bmi_13yr[mp1$bmi_13yr == -10 | mp1$bmi_13yr == -6 | mp1$bmi_13yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_13yr)
mp1$vigorous_exercise_13yr <- ifelse(mp1$vigorous_exercise_13yr == 1,1,
                                     ifelse(mp1$vigorous_exercise_13yr == 2,2,
                                            ifelse(mp1$vigorous_exercise_13yr == 3,3,
                                                   ifelse(mp1$vigorous_exercise_13yr == 4,4,
                                                          ifelse(mp1$vigorous_exercise_13yr == 5,5, NA)))))
mp1$vigorous_exercise_13yr <- factor(mp1$vigorous_exercise_13yr, 
                                     levels = c(1,2,3,4,5), 
                                     labels = c("None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_13yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_13yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_13yr <- ifelse(mp1$started_period_13yr == 1,1,
                                  ifelse(mp1$started_period_13yr == 2,0, NA))
mp1$started_period_13yr <- factor(mp1$started_period_13yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$started_period_13yr)

# Variable for normal number of days bleeding:
table(mp1$normal_no_days_bleeding_13yr)
mp1$normal_no_days_bleeding_13yr[mp1$normal_no_days_bleeding_13yr == -10 | mp1$normal_no_days_bleeding_13yr == -7 | mp1$normal_no_days_bleeding_13yr == -6 |
                                   mp1$normal_no_days_bleeding_13yr == -2 | mp1$normal_no_days_bleeding_13yr == -1] <- NA
table(mp1$normal_no_days_bleeding_13yr)


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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_13yr)
mp1$cramps_all_month_13yr <- ifelse(mp1$cramps_all_month_13yr == 1,1,
                                          ifelse(mp1$cramps_all_month_13yr == 2,0, NA))
mp1$cramps_all_month_13yr <- factor(mp1$cramps_all_month_13yr, 
                                    levels = c(0,1), 
                                    labels = c("No","Yes"))
table(mp1$cramps_all_month_13yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_13yr)
mp1$dr_cramps_all_month_13yr <- ifelse(mp1$dr_cramps_all_month_13yr == 2,0,
                                               ifelse(mp1$dr_cramps_all_month_13yr == 1,1, NA))
mp1$dr_cramps_all_month_13yr <- factor(mp1$dr_cramps_all_month_13yr, 
                                       levels = c(0,1), 
                                       labels = c("No","Yes"))
table(mp1$dr_cramps_all_month_13yr)

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

# Variable for BMI (will categorise the missings later)
table(mp1$bmi_14yr)
mp1$bmi_14yr[mp1$bmi_14yr == -10 | mp1$bmi_14yr == -6 | mp1$bmi_14yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_14yr)
mp1$vigorous_exercise_14yr <- ifelse(mp1$vigorous_exercise_14yr == 1,1,
                                     ifelse(mp1$vigorous_exercise_14yr == 2,2,
                                            ifelse(mp1$vigorous_exercise_14yr == 3,3,
                                                   ifelse(mp1$vigorous_exercise_14yr == 4,4,
                                                          ifelse(mp1$vigorous_exercise_14yr == 5,5, NA)))))
mp1$vigorous_exercise_14yr <- factor(mp1$vigorous_exercise_14yr, 
                                     levels = c(1,2,3,4,5), 
                                     labels = c("None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_14yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_14yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_14yr <- ifelse(mp1$started_period_14yr == 1,1,
                                  ifelse(mp1$started_period_14yr == 2,0, NA))
mp1$started_period_14yr <- factor(mp1$started_period_14yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$started_period_14yr)

# Variable for normal number of days bleeding:
table(mp1$normal_no_days_bleeding_14yr)
mp1$normal_no_days_bleeding_14yr[mp1$normal_no_days_bleeding_14yr == -10 | mp1$normal_no_days_bleeding_14yr == -9 | mp1$normal_no_days_bleeding_14yr == -7 |
                                  mp1$normal_no_days_bleeding_14yr == -3 | mp1$normal_no_days_bleeding_14yr == -2 | mp1$normal_no_days_bleeding_14yr == -1] <- NA
table(mp1$normal_no_days_bleeding_14yr)

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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_14yr)
mp1$cramps_all_month_14yr <- ifelse(mp1$cramps_all_month_14yr == 1,1,
                                           ifelse(mp1$cramps_all_month_14yr == 2,0, NA))
mp1$cramps_all_month_14yr <- factor(mp1$cramps_all_month_14yr, 
                                    levels = c(0,1), 
                                    labels = c("No","Yes"))
table(mp1$cramps_all_month_14yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_14yr)
mp1$dr_cramps_all_month_14yr <- ifelse(mp1$dr_cramps_all_month_14yr == 2,0,
                                          ifelse(mp1$dr_cramps_all_month_14yr == 1,1, NA))
mp1$dr_cramps_all_month_14yr <- factor(mp1$dr_cramps_all_month_14yr, 
                                       levels = c(0,1), 
                                       labels = c("No","Yes"))
table(mp1$dr_cramps_all_month_14yr)

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

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_15yr)
mp1$vigorous_exercise_15yr <- ifelse(mp1$vigorous_exercise_15yr == 1,1,
                                     ifelse(mp1$vigorous_exercise_15yr == 2,2,
                                            ifelse(mp1$vigorous_exercise_15yr == 3,3,
                                                   ifelse(mp1$vigorous_exercise_15yr == 4,4,
                                                          ifelse(mp1$vigorous_exercise_15yr == 5,5, NA)))))
mp1$vigorous_exercise_15yr <- factor(mp1$vigorous_exercise_15yr, 
                                     levels = c(1,2,3,4,5), 
                                     labels = c("None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_15yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_15yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_15yr <- ifelse(mp1$started_period_15yr == 1,1,
                                  ifelse(mp1$started_period_15yr == 2,0, NA))
mp1$started_period_15yr <- factor(mp1$started_period_15yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$started_period_15yr)

# Variable for normal number of days bleeding:
table(mp1$normal_no_days_bleeding_15yr)
mp1$normal_no_days_bleeding_15yr[mp1$normal_no_days_bleeding_15yr == -10 | mp1$normal_no_days_bleeding_15yr == -9 | mp1$normal_no_days_bleeding_15yr == -7 |
                                   mp1$normal_no_days_bleeding_15yr == -6 | mp1$normal_no_days_bleeding_15yr == -3 | mp1$normal_no_days_bleeding_15yr == -2 |
                                   mp1$normal_no_days_bleeding_15yr == -1] <- NA
table(mp1$normal_no_days_bleeding_15yr)

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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_15yr)
mp1$cramps_all_month_15yr <- ifelse(mp1$cramps_all_month_15yr == 1,1,
                                      ifelse(mp1$cramps_all_month_15yr == 2,0, NA))
mp1$cramps_all_month_15yr <- factor(mp1$cramps_all_month_15yr, 
                                    levels = c(0,1), 
                                    labels = c("No","Yes"))
table(mp1$cramps_all_month_15yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_15yr)
mp1$dr_cramps_all_month_15yr <- ifelse(mp1$dr_cramps_all_month_15yr == 2,0,
                                              ifelse(mp1$dr_cramps_all_month_15yr == 1,1, NA))
mp1$dr_cramps_all_month_15yr <- factor(mp1$dr_cramps_all_month_15yr, 
                                       levels = c(0,1), 
                                       labels = c("No","Yes"))
table(mp1$dr_cramps_all_month_15yr)

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

# Variable for participants BMI:
table(mp1$bmi_16yr)
mp1$bmi_16yr[mp1$bmi_16yr == -10 | mp1$bmi_16yr == -1] <- NA

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_16yr)
mp1$vigorous_exercise_16yr <- ifelse(mp1$vigorous_exercise_16yr == 1,1,
                                     ifelse(mp1$vigorous_exercise_16yr == 2,2,
                                            ifelse(mp1$vigorous_exercise_16yr == 3,3,
                                                   ifelse(mp1$vigorous_exercise_16yr == 4,4,
                                                          ifelse(mp1$vigorous_exercise_16yr == 5,5, NA)))))
mp1$vigorous_exercise_16yr <- factor(mp1$vigorous_exercise_16yr, 
                                     levels = c(1,2,3,4,5), 
                                     labels = c("None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_16yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_16yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_16yr <- ifelse(mp1$started_period_16yr == 1,1,
                                  ifelse(mp1$started_period_16yr == 2,0, NA))
mp1$started_period_16yr <- factor(mp1$started_period_16yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$started_period_16yr)

# Variable for normal number of days bleeding:
table(mp1$normal_no_days_bleeding_16yr)
mp1$normal_no_days_bleeding_16yr[mp1$normal_no_days_bleeding_16yr == -10 | mp1$normal_no_days_bleeding_16yr == -9 | mp1$normal_no_days_bleeding_16yr == -7 |
                                   mp1$normal_no_days_bleeding_16yr == -6 | mp1$normal_no_days_bleeding_16yr == -3 | mp1$normal_no_days_bleeding_16yr == -2 |
                                   mp1$normal_no_days_bleeding_16yr == -1] <- NA
table(mp1$normal_no_days_bleeding_16yr)

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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_16yr)
mp1$cramps_all_month_16yr <- ifelse(mp1$cramps_all_month_16yr == 1,1,
                                        ifelse(mp1$cramps_all_month_16yr == 2,0, NA))
mp1$cramps_all_month_16yr <- factor(mp1$cramps_all_month_16yr, 
                                    levels = c(0,1), 
                                    labels = c("No","Yes"))
table(mp1$cramps_all_month_16yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_16yr)
mp1$dr_cramps_all_month_16yr <- ifelse(mp1$dr_cramps_all_month_16yr == 2,0,
                                              ifelse(mp1$dr_cramps_all_month_16yr == 1,1, NA))
mp1$dr_cramps_all_month_16yr <- factor(mp1$dr_cramps_all_month_16yr, 
                                       levels = c(0,1), 
                                       labels = c("No","Yes"))
table(mp1$dr_cramps_all_month_16yr)

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

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_17yr)
mp1$vigorous_exercise_17yr <- ifelse(mp1$vigorous_exercise_17yr == 1,1,
                                     ifelse(mp1$vigorous_exercise_17yr == 2,2,
                                            ifelse(mp1$vigorous_exercise_17yr == 3,3,
                                                   ifelse(mp1$vigorous_exercise_17yr == 4,4,
                                                          ifelse(mp1$vigorous_exercise_17yr == 5,5, NA)))))
mp1$vigorous_exercise_17yr <- factor(mp1$vigorous_exercise_17yr, 
                                     levels = c(1,2,3,4,5), 
                                     labels = c("None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_17yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_17yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_17yr <- ifelse(mp1$started_period_17yr == 1,1,
                                  ifelse(mp1$started_period_17yr == 2,0, NA))
mp1$started_period_17yr <- factor(mp1$started_period_17yr, 
                                  levels = c(0,1), 
                                  labels = c("No","Yes"))
table(mp1$started_period_17yr)

# Variable for normal number of days bleeding:
table(mp1$normal_no_days_bleeding_17yr)
mp1$normal_no_days_bleeding_17yr[mp1$normal_no_days_bleeding_17yr == -10 | mp1$normal_no_days_bleeding_17yr == -9 | mp1$normal_no_days_bleeding_17yr == -7 |
                                   mp1$normal_no_days_bleeding_17yr == -6 | mp1$normal_no_days_bleeding_17yr == -3 | mp1$normal_no_days_bleeding_17yr == -2 |
                                   mp1$normal_no_days_bleeding_17yr == -1] <- NA
table(mp1$normal_no_days_bleeding_17yr)


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

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_17yr)
mp1$cramps_all_month_17yr <- ifelse(mp1$cramps_all_month_17yr == 1,1,
                                        ifelse(mp1$cramps_all_month_17yr == 2,0, NA))
mp1$cramps_all_month_17yr <- factor(mp1$cramps_all_month_17yr, 
                                    levels = c(0,1), 
                                    labels = c("No","Yes"))
table(mp1$cramps_all_month_17yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_17yr)
mp1$dr_cramps_all_month_17yr <- ifelse(mp1$dr_cramps_all_month_17yr == 2,0,
                                          ifelse(mp1$dr_cramps_all_month_17yr == 1,1, NA))
mp1$dr_cramps_all_month_17yr <- factor(mp1$dr_cramps_all_month_17yr, 
                                       levels = c(0,1), 
                                       labels = c("No","Yes"))
table(mp1$dr_cramps_all_month_17yr)

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

# D2109_TF3.pdf:
# Variable for BMI at 15 years (taken at TF3)
table(mp1$bmi_15yr)
mp1$bmi_15yr[mp1$bmi_15yr == -10 | mp1$bmi_15yr == -6 | mp1$bmi_15yr == -1] <- NA

# Variable for whether the young person smokes every day at 15 years
table(mp1$smokes_everyday_15yr)
mp1$smokes_everyday_15yr <- ifelse(mp1$smokes_everyday_15yr == 1,1,
                                   ifelse(mp1$smokes_everyday_15yr == 2,0, NA))
mp1$smokes_everyday_15yr <- factor(mp1$smokes_everyday_15yr,
                                   levels = c(0,1),
                                   labels = c("No","Yes"))
table(mp1$smokes_everyday_15yr)

# Variable for whether the young person smokes every week at 15 years
table(mp1$smokes_every_week_15yr)
mp1$smokes_every_week_15yr <- ifelse(mp1$smokes_every_week_15yr == 1,1,
                                      ifelse(mp1$smokes_every_week_15yr == 2,0, NA))
mp1$smokes_every_week_15yr <- factor(mp1$smokes_every_week_15yr,
                                   levels = c(0,1),
                                   labels = c("No","Yes"))
table(mp1$smokes_every_week_15yr)

# Variable for young persons drinking pattern at 15 years
table(mp1$drinking_pattern_15yr)
mp1$drinking_pattern_15yr <- ifelse(mp1$drinking_pattern_15yr == 1,1,
                                    ifelse(mp1$drinking_pattern_15yr == 2,2,
                                           ifelse(mp1$drinking_pattern_15yr == 3,3,
                                                  ifelse(mp1$drinking_pattern_15yr == 4,4,
                                                         ifelse(mp1$drinking_pattern_15yr == 5,5,
                                                                ifelse(mp1$drinking_pattern_15yr == 6,6, NA))))))
mp1$drinking_pattern_15yr <- factor(mp1$drinking_pattern_15yr,
                                    levels = c(1,2,3,4,5,6),
                                    labels = c("Only tried it once or twice","Used to sometimes, but not now","Sometimes, <once a week",
                                               "Usually drink on 1/2 days a week","Usually drink >2 days a week but not every day",
                                               "Usually drink every day"))
table(mp1$drinking_pattern_15yr)

# D2111_TF4.pdf
# Variable for whether young person smokes every day
table(mp1$smokes_everyday_17yr)
mp1$smokes_everyday_17yr <- ifelse(mp1$smokes_everyday_17yr == 1,1,
                                   ifelse(mp1$smokes_everyday_17yr == 2,0, NA))
mp1$smokes_everyday_17yr <- factor(mp1$smokes_everyday_17yr,
                                   levels = c(0,1),
                                   labels = c("No","Yes"))
table(mp1$smokes_everyday_17yr)

# Variable for whether young person smokes every week
table(mp1$smokes_every_week_17yr)
mp1$smokes_every_week_17yr <- ifelse(mp1$smokes_every_week_17yr == 1,1,
                                     ifelse(mp1$smokes_every_week_17yr == 2,0, NA))
mp1$smokes_every_week_17yr <- factor(mp1$smokes_every_week_17yr,
                                     levels = c(0,1),
                                     labels = c("No","Yes"))
table(mp1$smokes_every_week_17yr)

# Variable for frequency that young person has a drink of alcohol
table(mp1$freq_yp_drinks_17yr)
mp1$freq_yp_drinks_17yr <- ifelse(mp1$freq_yp_drinks_17yr == 1,1,
                                  ifelse(mp1$freq_yp_drinks_17yr == 2,2,
                                         ifelse(mp1$freq_yp_drinks_17yr == 3,3,
                                                ifelse(mp1$freq_yp_drinks_17yr == 4,4,
                                                       ifelse(mp1$freq_yp_drinks_17yr == 5,5, NA)))))
mp1$freq_yp_drinks_17yr <- factor(mp1$freq_yp_drinks_17yr,
                                  levels = c(1,2,3,4,5),
                                  labels = c("Never","Monthly or less","2-4 times a month","2-3 times a week",
                                             "4 or more times a week"))
table(mp1$freq_yp_drinks_17yr)

# Variable for whether young woman has ever been pregnant, using D1425_YPA.pdf:
table(mp1$ever_pregnant)
mp1$ever_pregnant <- ifelse(mp1$ever_pregnant == 1,1,
                            ifelse(mp1$ever_pregnant == 2,0, NA))
mp1$ever_pregnant <- factor(mp1$ever_pregnant,
                            levels = c(0,1),
                            labels = c("No","Yes"))
table(mp1$ever_pregnant)

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

# Here, I have gone through each timepoint and asked if the young woman answered yes to menorrhagia but no to visiting a doctor then code her as a 1

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

mp1$hmb_controls <- ifelse(mp1$hmb_nodr_10yr == 1 | mp1$hmb_nodr_11yr == 1 | mp1$hmb_nodr_13yr == 1 | mp1$hmb_nodr_14yr == 1 | mp1$hmb_nodr_15yr == 1 |
                             mp1$hmb_nodr_16yr == 1 | mp1$hmb_nodr_17yr == 1,1,0)
table(mp1$hmb_controls)

# However, this variable captured 1873 women, including 289 young women who had reported no at ≥1 timepoint and yes at ≥1 timepoint - these women needed to be 
# moved from controls to cases. So I generated a variable for ever having visited the doctor for menorrhagia

mp1$menorr_drvisit_ever <- ifelse(mp1$dr_hmb_10yr == "Yes" | mp1$dr_hmb_11yr == "Yes" | mp1$dr_hmb_13yr == "Yes" | mp1$dr_hmb_14yr == "Yes" | 
                                    mp1$dr_hmb_15yr == "Yes" | mp1$dr_hmb_16yr == "Yes" | mp1$dr_hmb_17yr == "Yes",1,0)
table(mp1$menorr_drvisit_ever)

# This variable captured 527 women who had been to the dr ≥1 time during puberty. Now I just needed to remove the 289 from controls and split split cases 
# (coded as 1) and controls (coded as 0) in one variable

mp1$menorr_ewas <- NA
mp1$menorr_ewas[mp1$hmb_controls ==1] <- 0
mp1$menorr_ewas[mp1$menorr_drvisit_ever ==1] <- 1
table(mp1$menorr_ewas)

# Now, the variable menorr_ewas incorporates cases (women who have visited the doctor ≥1 time during puberty n=527) and controls (women who have reported HMB ≥1 
# time during puberty but have never visited the doctor n=1584)

# Check all the timpoints to make sure no controls have visited the doctor 

table(mp1$menorr_ewas, mp1$dr_hmb_10yr)
table(mp1$menorr_ewas, mp1$dr_hmb_11yr)
table(mp1$menorr_ewas, mp1$dr_hmb_13yr)
table(mp1$menorr_ewas, mp1$dr_hmb_14yr)
table(mp1$menorr_ewas, mp1$dr_hmb_15yr)
table(mp1$menorr_ewas, mp1$dr_hmb_16yr)
table(mp1$menorr_ewas, mp1$dr_hmb_17yr)

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

mp1$cramps_controls <- ifelse(mp1$cramps_nodr_9yr == 1 |mp1$cramps_nodr_10yr == 1 | mp1$cramps_nodr_11yr == 1 | mp1$cramps_nodr_13yr == 1 
                            | mp1$cramps_nodr_14yr == 1 | mp1$cramps_nodr_15yr == 1 | mp1$cramps_nodr_16yr == 1 | mp1$cramps_nodr_17yr == 1,1,0)
table(mp1$cramps_controls)

# However, this variable captured 2993 women, including 419 young women who had reported no at ≥1 timepoint and yes at ≥1 timepoint - these women needed to be 
# moved from controls to cases. So I generated a variable for ever having visited the doctor for dysmenorrhea

mp1$dysmen_drvisit_ever <- ifelse(mp1$dr_cramps_9yr == "Yes" |mp1$dr_cramps_10yr == "Yes" | mp1$dr_cramps_11yr == "Yes" | mp1$dr_cramps_13yr == "Yes" 
                              | mp1$dr_cramps_14yr == "Yes" | mp1$dr_cramps_15yr == "Yes" | mp1$dr_cramps_16yr == "Yes" | mp1$dr_cramps_17yr == "Yes",1,0)
table(mp1$dysmen_drvisit_ever)

# This variable captured 641 women who had been to the dr ≥1 time during puberty. Now I just needed to remove the 419 from controls and split cases (coded as 1) 
# and controls (coded as 0) in one variable

mp1$dysmen_ewas <- NA
mp1$dysmen_ewas[mp1$cramps_controls ==1] <- 0
mp1$dysmen_ewas[mp1$dysmen_drvisit_ever ==1] <- 1
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

# Similarly for smoking and alcohol use, I need to derive a binary variable for each showing whether the young person is regularly smoking
# or drinking at the time of their methylation measurement (15 or 17 years), so generating a variable from the information I have for each of
# those timepoints

table(mp1$smokes_every_week_15yr)
table(mp1$smokes_everyday_15yr)
mp1$reg_smoker_15yr <- ifelse(mp1$smokes_every_week_15yr == "Yes" | mp1$smokes_everyday_15yr == "Yes",1,
                         ifelse(mp1$smokes_every_week_15yr == "No" & mp1$smokes_everyday_15yr == "No", 0, NA))
mp1$reg_smoker_15yr <- factor(mp1$reg_smoker_15yr,
                              levels = c(0,1),
                              labels = c("No", "Yes"))
table(mp1$reg_smoker_15yr)

table(mp1$smokes_every_week_17yr)
table(mp1$smokes_everyday_17yr)
mp1$reg_smoker_17yr <- ifelse(mp1$smokes_every_week_17yr == "Yes" | mp1$smokes_everyday_17yr == "Yes", 1,
                              ifelse(mp1$smokes_every_week_17yr == "No" & mp1$smokes_everyday_17yr == "No", 0, NA))
mp1$reg_smoker_17yr <- factor(mp1$reg_smoker_17yr,
                              levels = c(0,1),
                              labels = c("No", "Yes"))
table(mp1$reg_smoker_17yr)

table(mp1$drinking_pattern_15yr)
mp1$reg_drinker_15yr <- ifelse(mp1$drinking_pattern_15yr == "Only tried it once or twice" | mp1$drinking_pattern_15yr == "Used to sometimes, but not now" |
                                 mp1$drinking_pattern_15yr == "Sometimes, <once a week", 0,
                                    ifelse(mp1$drinking_pattern_15yr == "Usually drink on 1/2 days a week" | 
                                       mp1$drinking_pattern_15yr == "Usually drink >2 days a week but not every day" | 
                                       mp1$drinking_pattern_15yr == "Usually drink every day", 1, NA))
mp1$reg_drinker_15yr <- factor(mp1$reg_drinker_15yr,
                               levels = c(0,1),
                               labels = c("No", "Yes"))
table(mp1$reg_drinker_15yr)

table(mp1$freq_yp_drinks_17yr)
mp1$reg_drinker_17yr <- ifelse(mp1$freq_yp_drinks_17yr == "Never" | mp1$freq_yp_drinks_17yr == "Monthly or less" | 
                                 mp1$freq_yp_drinks_17yr == "2-4 times a month", 0,
                                    ifelse(mp1$freq_yp_drinks_17yr == "2-3 times a week" | mp1$freq_yp_drinks_17yr == "4 or more times a week", 1, NA))
mp1$reg_drinker_17yr <- factor(mp1$reg_drinker_17yr,
                               levels = c(0,1),
                               labels = c("No", "Yes"))
table(mp1$reg_drinker_17yr)

# For comorbidities, thyroid problems, PCOS or endometriosis by the end of puberty, I am making a binary variable covering whether a thyroid problem was present at
# 17 years and whether PCOS or endometriosis had been diagnosed at 22 years (only info we have)

mp1$comorbidity <- ifelse(mp1$thyroid_problem_17yr == "Yes" | mp1$pcos == "Yes" | mp1$endometriosis == "Yes",1,
                               ifelse(mp1$thyroid_problem_17yr == "No" & mp1$pcos == "No" & mp1$endometriosis == "No",0,NA))
table(mp1$comorbidity)

save(mp1, file="mp1.Rda")
