################################################################################
#
#
#   Script for cleaning mp1 dataset abstracted from ALSPAC drive
#
#   Author:       Flo Martin
#   Date:         26/10/2020
#   Description:  This script describes the data cleaning processes for the data
#                 being used in mini project 1 describing and investigating 
#                 menstrual and premenstrual symptoms
#
################################################################################

# Using ncol I can see how many columns I have in mp1
ncol(mp1)
# What data class mp1 is 
class(mp1)
# What data column 4 is for example
class(mp1[,4])
# What the names of all the columns are
colnames(mp1)

# Now, I can change the names of the columns from variable names to something
# more indicative of what they are showing
colnames(mp1) [4] <- "men_age_mo"
colnames(mp1) [5] <- "men_age_y"
colnames(mp1) [6] <- "mat_edu"
colnames(mp1) [7] <- "smoked_since_14th_bday"
colnames(mp1) [8] <- "no_of_beers_last30days_16yr"
colnames(mp1) [9] <- "no_of_wines_last30days_16yr"
colnames(mp1) [10] <- "no_of_spirits_last30days_16yr"
colnames(mp1) [11] <- "contraceptive_pill_19yr"
colnames(mp1) [12] <- "contraceptive_injection_19yr"
colnames(mp1) [13] <- "contraceptive_implant_19yr"
colnames(mp1) [14] <- "contraceptive_hormonal_coil_19yr"
colnames(mp1) [15] <- "contraceptive_patch_19yr"
colnames(mp1) [16] <- "given_pill_for_periods_19yr"
colnames(mp1) [17] <- "age_given_pill_for_periods_19yr"
colnames(mp1) [18] <- "sex"
colnames(mp1) [19] <- "ever_tried_cigs_8yr"
colnames(mp1) [20] <- "child_tried_smoking_10yr"
colnames(mp1) [21] <- "freq_child_smokes_10yr"
colnames(mp1) [22] <- "child_drunk_alcohol_10yr"
colnames(mp1) [23] <- "freq_child_drinks_alc_10yr"
colnames(mp1) [24] <- "child_drunk_alcohol_9yr"
colnames(mp1) [25] <- "mat_occ_class"
colnames(mp1) [26] <- "bmi_8yr"
colnames(mp1) [27] <- "vigorous_exercise_8yr"
colnames(mp1) [28] <- "started_period_8yr"
colnames(mp1) [29] <- "hmb_8yr"
colnames(mp1) [30] <- "dr_hmb_8yr"
colnames(mp1) [31] <- "cramps_8yr"
colnames(mp1) [32] <- "dr_cramps_8yr"
colnames(mp1) [33] <- "cramps_all_month_8yr"
colnames(mp1) [34] <- "dr_cramps_all_month_8yr"
colnames(mp1) [35] <- "oral_contraceptives_pastyr_8yr"
colnames(mp1) [36] <- "thyroid_problem_8yr"
colnames(mp1) [37] <- "bmi_9yr"
colnames(mp1) [38] <- "vigorous_exercise_9yr"
colnames(mp1) [39] <- "started_period_9yr"
colnames(mp1) [40] <- "hmb_9yr"
colnames(mp1) [41] <- "dr_hmb_9yr"
colnames(mp1) [42] <- "cramps_9yr"
colnames(mp1) [43] <- "dr_cramps_9yr"
colnames(mp1) [44] <- "cramps_all_month_9yr"
colnames(mp1) [45] <- "dr_cramps_all_month_9yr"
colnames(mp1) [46] <- "oral_contraceptives_pastyr_9yr"
colnames(mp1) [47] <- "thyroid_problem_9yr"
colnames(mp1) [48] <- "bmi_10yr"
colnames(mp1) [49] <- "vigorous_exercise_10yr"
colnames(mp1) [50] <- "started_period_10yr"
colnames(mp1) [51] <- "normal_no_days_bleeding_10yr"
colnames(mp1) [52] <- "hmb_10yr"
colnames(mp1) [53] <- "dr_hmb_10yr"
colnames(mp1) [54] <- "cramps_10yr"
colnames(mp1) [55] <- "dr_cramps_10yr"
colnames(mp1) [56] <- "cramps_all_month_10yr"
colnames(mp1) [57] <- "dr_cramps_all_month_10yr"
colnames(mp1) [58] <- "oral_contraceptives_pastyr_10yr"
colnames(mp1) [59] <- "thyroid_problem_10yr"
colnames(mp1) [60] <- "bmi_11yr"
colnames(mp1) [61] <- "vigorous_exercise_11yr"
colnames(mp1) [62] <- "started_period_11yr"
colnames(mp1) [63] <- "normal_no_days_bleeding_11yr"
colnames(mp1) [64] <- "hmb_11yr"
colnames(mp1) [65] <- "dr_hmb_11yr"
colnames(mp1) [66] <- "cramps_11yr"
colnames(mp1) [67] <- "dr_cramps_11yr"
colnames(mp1) [68] <- "cramps_all_month_11yr"
colnames(mp1) [69] <- "dr_cramps_all_month_11yr"
colnames(mp1) [70] <- "oral_contraceptives_pastyr_11yr"
colnames(mp1) [71] <- "thyroid_problem_11yr"
colnames(mp1) [72] <- "bmi_13yr"
colnames(mp1) [73] <- "vigorous_exercise_13yr"
colnames(mp1) [74] <- "started_period_13yr"
colnames(mp1) [75] <- "normal_no_days_bleeding_13yr"
colnames(mp1) [76] <- "hmb_13yr"
colnames(mp1) [77] <- "dr_hmb_13yr"
colnames(mp1) [78] <- "cramps_13yr"
colnames(mp1) [79] <- "dr_cramps_13yr"
colnames(mp1) [80] <- "cramps_all_month_13yr"
colnames(mp1) [81] <- "dr_cramps_all_month_13yr"
colnames(mp1) [82] <- "oral_contraceptives_pastyr_13yr"
colnames(mp1) [83] <- "thyroid_problem_13yr"
colnames(mp1) [84] <- "bmi_14yr"
colnames(mp1) [85] <- "vigorous_exercise_14yr"
colnames(mp1) [86] <- "started_period_14yr"
colnames(mp1) [87] <- "normal_no_days_bleeding_14yr"
colnames(mp1) [88] <- "hmb_14yr"
colnames(mp1) [89] <- "dr_hmb_1yr"
colnames(mp1) [90] <- "cramps_14yr"
colnames(mp1) [91] <- "dr_cramps_14yr"
colnames(mp1) [92] <- "cramps_all_month_14yr"
colnames(mp1) [93] <- "dr_cramps_all_month_14yr"
colnames(mp1) [94] <- "oral_contraceptives_pastyr_14yr"
colnames(mp1) [95] <- "thyroid_problem_14yr"
colnames(mp1) [96] <- "vigorous_exercise_15yr"
colnames(mp1) [97] <- "started_period_15yr"
colnames(mp1) [98] <- "normal_no_days_bleeding_15yr"
colnames(mp1) [99] <- "hmb_15yr"
colnames(mp1) [100] <- "dr_hmb_15yr"
colnames(mp1) [101] <- "cramps_15yr"
colnames(mp1) [102] <- "severity_cramps_15yr"
colnames(mp1) [103] <- "dr_cramps_15yr"
colnames(mp1) [104] <- "cramps_all_month_15yr"
colnames(mp1) [105] <- "dr_cramps_all_month_15yr"
colnames(mp1) [106] <- "oral_contraceptives_pastyr_15yr"
colnames(mp1) [107] <- "thyroid_problem_15yr"
colnames(mp1) [108] <- "bmi_16yr"
colnames(mp1) [109] <- "vigorous_exercise_16yr"
colnames(mp1) [110] <- "started_period_16yr"
colnames(mp1) [111] <- "normal_no_days_bleeding_16yr"
colnames(mp1) [112] <- "hmb_16yr"
colnames(mp1) [113] <- "dr_hmb_16yr"
colnames(mp1) [114] <- "cramps_16yr"
colnames(mp1) [115] <- "dr_cramps_16yr"
colnames(mp1) [116] <- "cramps_all_month_16yr"
colnames(mp1) [117] <- "dr_cramps_all_month_16yr"
colnames(mp1) [118] <- "oral_contraceptives_pastyr_16yr"
colnames(mp1) [119] <- "thyroid_problem_16yr"
colnames(mp1) [120] <- "bmi_17yr"
colnames(mp1) [121] <- "vigorous_exercise_17yr"
colnames(mp1) [122] <- "started_period_17yr"
colnames(mp1) [123] <- "normal_no_days_bleeding_17yr"
colnames(mp1) [124] <- "hmb_17yr"
colnames(mp1) [125] <- "dr_hmb_17yr"
colnames(mp1) [126] <- "cramps_17yr"
colnames(mp1) [127] <- "dr_cramps_17yr"
colnames(mp1) [128] <- "cramps_all_month_17yr"
colnames(mp1) [129] <- "dr_cramps_all_month_17yr"
colnames(mp1) [130] <- "oral_contraceptives_pastyr_17yr"
colnames(mp1) [131] <- "thyroid_problem_17yr"
colnames(mp1) [132] <- "freq_yp_drinks_wine"
colnames(mp1) [133] <- "freq_yp_drinks_beer"
colnames(mp1) [134] <- "freq_yp_drinks_spirits"
colnames(mp1) [135] <- "freq_yp_drinks_other"
colnames(mp1) [136] <- "teen_has_smoked_12yr"
colnames(mp1) [137] <- "teen_has_smoked_13yr"
colnames(mp1) [138] <- "teen_has_drunk_13yr"
colnames(mp1) [140] <- "teen_smoked_since_15th_bday"


# Now, explore each of the variables:
# Variable maternal education is coded -1, 1, 2, 3, 4, 5 using D1104_C.pdf the labels are as shown below:
table(mp1$mat_edu)
mp1$mat_edu <- factor(mp1$mat_edu, levels = c(-1,1,2,3,4,5), labels = c("Missing","CSE/none","Vocational","O level","A level","Degree"))
table(mp1$mat_edu)

# Variable for smoked since 14th birthday (yes or no), using D1421_CCR.pdf the labels are as shown below:
table(mp1$smoked_since_14th_bday)
mp1$smoked_since_14th_bday <- factor(mp1$smoked_since_14th_bday, levels = c(-10,-1,1,2), labels = c("Not completed","No response","Yes","No"))
table(mp1$smoked_since_14th_bday)

# Variable for number of beers in the last 30 days, using D1422_CCS.pdf the labels are as shown below:
table(mp1$no_of_beers_last30days_16yr)
mp1$no_of_beers_last30days_16yr <- factor(mp1$no_of_beers_last30days_16yr, levels = c(-10,-1,1,2,3,4,5,6,7), labels = c("Missing","No response","Zero","1-2","3-5",
                                                                                                                        "6-9","10-19","20-39","40 or more"))
table(mp1$no_of_beers_last30days_16yr)

# Variable for number of beers in the last 30 days, using D1422_CCS.pdf the labels are as shown below:
table(mp1$no_of_wines_last30days_16yr)
mp1$no_of_wines_last30days_16yr <- factor(mp1$no_of_wines_last30days_16yr, levels = c(-10,-1,1,2,3,4,5,6,7), labels = c("Missing","No response","Zero","1-2","3-5",
                                                                                                                        "6-9","10-19","20-39","40 or more"))
table(mp1$no_of_wines_last30days_16yr)

# Variable for number of spirits in the last 30 days, using D1422_CCS.pdf the labels are as shown below:
table(mp1$no_of_spirits_last30days_16yr)
mp1$no_of_spirits_last30days_16yr <- factor(mp1$no_of_spirits_last30days_16yr, levels = c(-10,-1,1,2,3,4,5,6,7), labels = c("Missing","No response","Zero","1-2","3-5",
                                                                                                                        "6-9","10-19","20-39","40 or more"))
table(mp1$no_of_spirits_last30days_16yr)

# Variable for whether the young woman is currently using the contraceptive pill (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_pill_19yr)
mp1$contraceptive_pill_19yr <- factor(mp1$contraceptive_pill_19yr, levels = c(-10,-3,-1,1,2), labels = c("Not completed","Male","Not known","Yes","No"))
table(mp1$contraceptive_pill_19yr)

# Variable for whether the young woman is currently using the contraceptive injection (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_injection_19yr)
mp1$contraceptive_injection_19yr <- factor(mp1$contraceptive_injection_19yr, levels = c(-10,-3,-1,1,2), labels = c("Not completed","Male","Not known","Yes","No"))
table(mp1$contraceptive_injection_19yr)

# Variable for whether the young woman is currently using the contraceptive implant (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_implant_19yr)
mp1$contraceptive_implant_19yr <- factor(mp1$contraceptive_implant_19yr, levels = c(-10,-3,-1,1,2), labels = c("Not completed","Male","Not known","Yes","No"))
table(mp1$contraceptive_implant_19yr)

# Variable for whether the young woman is currently using the contraceptive coil (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_hormonal_coil_19yr)
mp1$contraceptive_hormonal_coil_19yr <- factor(mp1$contraceptive_hormonal_coil_19yr, levels = c(-10,-3,-1,1,2), labels = c("Not completed","Male","Not known","Yes","No"))
table(mp1$contraceptive_hormonal_coil_19yr)

# Variable for whether the young woman is currently using the contraceptive patch (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_patch_19yr)
mp1$contraceptive_patch_19yr <- factor(mp1$contraceptive_patch_19yr, levels = c(-10,-3,-1,1,2), labels = c("Not completed","Male","Not known","Yes","No"))
table(mp1$contraceptive_patch_19yr)

# Variable for whether the young woman has been given the pill to regulate her period (no or yes), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$given_pill_for_periods_19yr)
mp1$given_pill_for_periods_19yr <- factor(mp1$given_pill_for_periods_19yr, levels = c(-10,-3,-1,1,2), labels = c("Not completed","Male","Not known","No","Yes"))
table(mp1$given_pill_for_periods_19yr)

# Variable for what age young woman were given the pill to regulate her period (age in years), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$age_given_pill_for_periods_19yr)
mp1$age_given_pill_for_periods_19yr <- factor(mp1$age_given_pill_for_periods_19yr, levels = c(-10,-3,-1,11,12,13,14,15,16,17,18,19,20), labels = c("Not completed",
                                                                                                                                                   "Male","Not known",11,12,13,14,
                                                                                                                                                   15,16,17,18,19,20))
table(mp1$age_given_pill_for_periods_19yr)

save(mp1,file="mp1.Rda") # Saved the data set at this point at the end of the day (26/10/20) in MP1 file OneDrive
