#################################################################################################################################################################
#                                                                                                                                                               #
#   Script for cleaning labels in mp1 dataset abstracted from ALSPAC drive                                                                                      #
#                                                                                                                                                               #
#   Author:       Flo Martin                                                                                                                                    #
#   Start Date:   26/10/2020                                                                                                                                    #
#   Description:  This script describes data cleaning for flo_26oct for mini project 1                                                                          #
#                                                                                                                                                               #
################################################################################################################################################################# 

rm(flo_26oct)
rm(mp1)                         # This clears the mp1 & flo_26oct data in global environment

setwd("/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/Mini Project 1/R Data")

load("flo_26oct.Rda")           # Load in the raw dataset as pulled from R:/Data
mp1 <- data.frame(flo_26oct)    # ...and the create a copy of flo_26oct (blank - no labels) which will allow any changes made to 
                                # the following code be properly implemented in mp1. At the end of this script, R will save the newest copy of mp1.Rda in the R
                                # file in OneDrive. 
colnames(mp1)                   # This allows me to check all the column names and category labels are as they were when pulled from R:/Data

# Now, I can change the names of the columns from variable names to something more indicative of what they are showing
colnames(mp1) [4] <- "men_age_m"
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
colnames(mp1) [89] <- "dr_hmb_14yr"
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
# Label the categories within each variable:
# Variable maternal education is coded -1, 1, 2, 3, 4, 5 using D1104_C.pdf the labels are as shown below:
table(mp1$mat_edu)
mp1$mat_edu <- factor(mp1$mat_edu, 
                      levels = c(-1,1,2,3,4,5), 
                      labels = c("Missing","CSE/none","Vocational","O level","A level","Degree"))
table(mp1$mat_edu)

# Variable for smoked since 14th birthday (yes or no), using D1421_CCR.pdf the labels are as shown below:
table(mp1$smoked_since_14th_bday)
mp1$smoked_since_14th_bday <- factor(mp1$smoked_since_14th_bday, 
                                     levels = c(-10,-1,1,2), 
                                     labels = c("Not completed","No response","Yes","No"))
table(mp1$smoked_since_14th_bday)

# Variable for number of beers in the last 30 days, using D1422_CCS.pdf the labels are as shown below:
table(mp1$no_of_beers_last30days_16yr)
mp1$no_of_beers_last30days_16yr <- factor(mp1$no_of_beers_last30days_16yr, 
                                          levels = c(-10,-1,1,2,3,4,5,6,7), 
                                          labels = c("Missing","No response","Zero","1-2","3-5","6-9","10-19","20-39","40 or more"))
table(mp1$no_of_beers_last30days_16yr)

# Variable for number of beers in the last 30 days, using D1422_CCS.pdf the labels are as shown below:
table(mp1$no_of_wines_last30days_16yr)
mp1$no_of_wines_last30days_16yr <- factor(mp1$no_of_wines_last30days_16yr, 
                                          levels = c(-10,-1,1,2,3,4,5,6,7), 
                                          labels = c("Missing","No response","Zero","1-2","3-5","6-9","10-19","20-39","40 or more"))
table(mp1$no_of_wines_last30days_16yr)

# Variable for number of spirits in the last 30 days, using D1422_CCS.pdf the labels are as shown below:
table(mp1$no_of_spirits_last30days_16yr)
mp1$no_of_spirits_last30days_16yr <- factor(mp1$no_of_spirits_last30days_16yr, 
                                            levels = c(-10,-1,1,2,3,4,5,6,7), 
                                            labels = c("Missing","No response","Zero","1-2","3-5","6-9","10-19","20-39","40 or more"))
table(mp1$no_of_spirits_last30days_16yr)

# Variable for whether the young woman is currently using the contraceptive pill (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_pill_19yr)
mp1$contraceptive_pill_19yr <- factor(mp1$contraceptive_pill_19yr, 
                                      levels = c(-10,-3,-1,1,2), 
                                      labels = c("Not completed","Male","Not known","Yes","No"))
table(mp1$contraceptive_pill_19yr)

# Variable for whether the young woman is currently using the contraceptive injection (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_injection_19yr)
mp1$contraceptive_injection_19yr <- factor(mp1$contraceptive_injection_19yr, 
                                           levels = c(-10,-3,-1,1,2), 
                                           labels = c("Not completed","Male","Not known","Yes","No"))
table(mp1$contraceptive_injection_19yr)

# Variable for whether the young woman is currently using the contraceptive implant (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_implant_19yr)
mp1$contraceptive_implant_19yr <- factor(mp1$contraceptive_implant_19yr, 
                                         levels = c(-10,-3,-1,1,2), 
                                         labels = c("Not completed","Male","Not known","Yes","No"))
table(mp1$contraceptive_implant_19yr)

# Variable for whether the young woman is currently using the contraceptive coil (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_hormonal_coil_19yr)
mp1$contraceptive_hormonal_coil_19yr <- factor(mp1$contraceptive_hormonal_coil_19yr, 
                                               levels = c(-10,-3,-1,1,2), 
                                               labels = c("Not completed","Male","Not known","Yes","No"))
table(mp1$contraceptive_hormonal_coil_19yr)

# Variable for whether the young woman is currently using the contraceptive patch (yes or no), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$contraceptive_patch_19yr)
mp1$contraceptive_patch_19yr <- factor(mp1$contraceptive_patch_19yr, 
                                       levels = c(-10,-3,-1,1,2), 
                                       labels = c("Not completed","Male","Not known","Yes","No"))
table(mp1$contraceptive_patch_19yr)

# Variable for whether the young woman has been given the pill to regulate her period (no or yes), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$given_pill_for_periods_19yr)
mp1$given_pill_for_periods_19yr <- factor(mp1$given_pill_for_periods_19yr, 
                                          levels = c(-10,-3,-1,1,2), 
                                          labels = c("Not completed","Male","Not known","No","Yes"))
table(mp1$given_pill_for_periods_19yr)

# Variable for what age young woman were given the pill to regulate her period (age in years), using D1456_CCXF.pdf the labels are as shown below:
table(mp1$age_given_pill_for_periods_19yr)
mp1$age_given_pill_for_periods_19yr <- factor(mp1$age_given_pill_for_periods_19yr, 
                                              levels = c(-10,-3,-1,11,12,13,14,15,16,17,18,19,20), 
                                              labels = c("Not completed","Male","Not known",11,12,13,14,15,16,17,18,19,20))
table(mp1$age_given_pill_for_periods_19yr)

# Variable for participant sex, labels are as shown below:
table(mp1$sex)
table(mp1$sex,mp1$cramps_15yr)  # Used this table to deduce which number was male - no. 1 had no answers for this part of the questionnaire => 2 is female
mp1$sex <- factor(mp1$sex, 
                  levels = c(-1,1,2), 
                  labels =c("Missing","Male","Female"))
table(mp1$sex)
table(mp1$sex,mp1$cramps_15yr)  # Check the labels in the context of a period-related variable to make sure there aren't lots of answers for men which there are 
                                #not!

# Variable for having ever tried cigarettes at 8 years old, using D2103_F08.pdf, labels are as shown below:
table(mp1$ever_tried_cigs_8yr)
mp1$ever_tried_cigs_8yr <- factor(mp1$ever_tried_cigs_8yr, 
                                  levels = c(-2,-1,1,2), 
                                  labels = c("Not known","Missing","Yes","No"))
table(mp1$ever_tried_cigs_8yr)

# Variable for whether the child has smoked a cigarette at 10 years old, using D2105_F10.pdf, labels are as shown:
table(mp1$child_tried_smoking_10yr)
mp1$child_tried_smoking_10yr <- factor(mp1$child_tried_smoking_10yr, 
                                       levels = c(-9,-4,-2,-1,1,2), 
                                       labels = c("Did not do F&S","Child refused","Did not start task","Missing","Yes","No"))
table(mp1$child_tried_smoking_10yr)

# Variable for the frequency that the child has smoked cigarettes at 10 years old, using D2105_F10.pdf, labels are as shown:
table(mp1$freq_child_smokes_10yr)
mp1$freq_child_smokes_10yr <- factor(mp1$freq_child_smokes_10yr, 
                                     levels = c(-9,-3,-2,-1,1,2,3), 
                                     labels = c("Did not do F&S","Child not done","Did not start task","Missing","Once a week in the last 6 months",
                                                "More than 4 times in the last 6 months","Less than 3 times in the last 6 months"))
table(mp1$freq_child_smokes_10yr)

# Variable for whether the child has drunk alcohol at 10 years old, using D2105_F10.pdf, labels are as shown:
table(mp1$child_drunk_alcohol_10yr)
mp1$child_drunk_alcohol_10yr <- factor(mp1$child_drunk_alcohol_10yr, 
                                       levels = c(-9,-2,-1,1,2), 
                                       labels = c("Did not do F&S","Did not start task","Missing","Yes","No"))
table(mp1$child_drunk_alcohol_10yr)

# Variable for the frequency that the child has drunk alcohol at 10 years old, using D2105_F10.pdf, labels are as shown:
table(mp1$freq_child_drinks_alc_10yr)
mp1$freq_child_drinks_alc_10yr <- factor(mp1$freq_child_drinks_alc_10yr, 
                                         levels = c(-9,-5,-3,-2,-1,1,2,3), 
                                         labels = c("Did not do F&S","Child said don't know","Child not done","Did not start task","Missing",
                                                    "1 time per week","More than 4 times","1-3 times"))
table(mp1$freq_child_drinks_alc_10yr)

# Variable for whether a child has drunk alcohol at 9 years old from parents point of view, using D1318_KU.pdf, labels are as shown:
table(mp1$child_drunk_alcohol_9yr)
mp1$child_drunk_alcohol_9yr <- factor(mp1$child_drunk_alcohol_9yr, 
                                      levels = c(-10,-1,1,2,3,4), 
                                      labels = c("Not known","Missing","Yes parents know","Probably","Possibly","Don't know"))
table(mp1$child_drunk_alcohol_9yr)

# Variable for maternal social class based on occupation (can't find the categories at the moment)
table(mp1$mat_occ_class)

# Using the D1501_PUB1.pdf (participant 8 years old):

# Variable for BMI (will categorise the missings later)
table(mp1$bmi_8yr)

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_8yr)
mp1$vigorous_exercise_8yr <- factor(mp1$vigorous_exercise_8yr, 
                                    levels = c(-7,-1,1,2,3,4,5), 
                                    labels = c(-7,"Missing","None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_8yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_8yr, mp1$sex)  # Used sex in here to see if -10 referred to males which it does
mp1$started_period_8yr <- factor(mp1$started_period_8yr, 
                                 levels = c(-10,-1,1,2), 
                                 labels = c("Male","Missing","Yes","No"))
table(mp1$started_period_8yr)

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_8yr)
mp1$hmb_8yr <- factor(mp1$hmb_8yr, 
                      levels = c(-10,-2,-1,2), 
                      labels = c("Male","Not started periods","Missing","No"))
table(mp1$hmb_8yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_8yr)
mp1$dr_hmb_8yr <- factor(mp1$dr_hmb_8yr, 
                         levels = c(-10,-3,-2,-1), 
                         labels = c("Male","No heavy bleeding","Not started period","Missing"))
table(mp1$dr_hmb_8yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_8yr)
mp1$cramps_8yr <- factor(mp1$cramps_8yr, 
                         levels = c(-10,-2,-1,2), 
                         labels = c("Male","Not started periods","Missing","No"))
table(mp1$cramps_8yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_8yr)
mp1$dr_cramps_8yr <- factor(mp1$dr_cramps_8yr, 
                            levels = c(-10,-3,-2,-1), 
                            labels = c("Male","No severe cramps","Not started period","Missing"))
table(mp1$dr_cramps_8yr)

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_8yr)
mp1$cramps_all_month_8yr <- factor(mp1$cramps_all_month_8yr, 
                                   levels = c(-10,-2,-1,1,2), 
                                   labels = c("Male","Not started periods","Missing","Yes","No"))
table(mp1$cramps_all_month_8yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_8yr)
mp1$dr_cramps_all_month_8yr <- factor(mp1$dr_cramps_all_month_8yr,
                                      levels = c(-10,-3,-2,-1,1), 
                                      labels = c("Male","No period type pains","Not started periods","Missing","Yes"))
table(mp1$dr_cramps_all_month_8yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_8yr)
mp1$oral_contraceptives_pastyr_8yr <- factor(mp1$oral_contraceptives_pastyr_8yr, 
                                             levels = c(-10,-2,-1,2), 
                                             labels = c("Male","Not started periods","Missing","No"))
table(mp1$oral_contraceptives_pastyr_8yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_8yr)
mp1$thyroid_problem_8yr <- factor(mp1$thyroid_problem_8yr, 
                                  levels = c(-10,-1,1,2), 
                                  labels = c("Male","Missing","Yes","No"))
table(mp1$thyroid_problem_8yr)

# Using the D1501_PUB2.pdf (participant 9 years old):

# Variable for BMI (will categorise the missings later)
table(mp1$bmi_9yr)

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_9yr)
mp1$vigorous_exercise_9yr <- factor(mp1$vigorous_exercise_9yr, 
                                    levels = c(-1,1,2,3,4,5), 
                                    labels = c("Missing","None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_9yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_9yr, mp1$sex)  # Used sex in here to see if -10 referred to males which it does
mp1$started_period_9yr <- factor(mp1$started_period_9yr, 
                                 levels = c(-10,-6,1,2), 
                                 labels = c("Male","Missing whole menstruation section","Yes","No"))
table(mp1$started_period_9yr)

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_9yr)
mp1$hmb_9yr <- factor(mp1$hmb_9yr, 
                      levels = c(-10,-6,-2,-1,1,2), 
                      labels = c("Male","Missing whole menstruation section","Not started periods","Missing","Yes","No"))
table(mp1$hmb_9yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_9yr)
mp1$dr_hmb_9yr <- factor(mp1$dr_hmb_9yr, 
                         levels = c(-10,-6,-3,-2,-1,2), 
                         labels = c("Male","Missing whole menstruation section","No heavy bleeding","Not started period","Missing","No"))
table(mp1$dr_hmb_9yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_9yr)
mp1$cramps_9yr <- factor(mp1$cramps_9yr, 
                         levels = c(-10,-6,-2,-1,1,2), 
                         labels = c("Male","Missing whole menstruation section","Not started periods","Missing","Yes","No"))
table(mp1$cramps_9yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_9yr)
mp1$dr_cramps_9yr <- factor(mp1$dr_cramps_9yr, 
                            levels = c(-10,-6,-3,-2,-1,1,2), 
                            labels = c("Male","Missing whole menstruation section","No severe cramps","Not started period","Missing","Yes","No"))
table(mp1$dr_cramps_9yr)

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_9yr)
mp1$cramps_all_month_9yr <- factor(mp1$cramps_all_month_9yr, 
                                   levels = c(-10,-6,-2,-1,1,2), 
                                   labels = c("Male","Missing whole menstruation section","Not started periods","Missing","Yes","No"))
table(mp1$cramps_all_month_9yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_9yr)
mp1$dr_cramps_all_month_9yr <- factor(mp1$dr_cramps_all_month_9yr, 
                                      levels = c(-10,-6,-3,-2,-1,2), 
                                      labels = c("Male","Missing whole menstruation section","No period type pains","Not started periods",
                                                 "Missing","No"))
table(mp1$dr_cramps_all_month_9yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_9yr)
mp1$oral_contraceptives_pastyr_9yr <- factor(mp1$oral_contraceptives_pastyr_9yr, 
                                             levels = c(-10,-2,-1,2), 
                                             labels = c("Male","Not started periods","Missing","No"))
table(mp1$oral_contraceptives_pastyr_9yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_9yr)
mp1$thyroid_problem_9yr <- factor(mp1$thyroid_problem_9yr, 
                                  levels = c(-10,-1,1,2), 
                                  labels = c("Male","Missing","Yes","No"))
table(mp1$thyroid_problem_9yr)

# Using the D1501_PUB3.pdf (participant 10 years old):

# Variable for BMI (will categorise the missings later)
table(mp1$bmi_10yr)

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_10yr)
mp1$vigorous_exercise_10yr <- factor(mp1$vigorous_exercise_10yr, 
                                     levels = c(-10,-1,1,2,3,4,5), 
                                     labels = c(-10,"Missing","None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_10yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_10yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_10yr <- factor(mp1$started_period_10yr, 
                                  levels = c(-10,-7,-6,1,2), 
                                  labels = c(-10,"Male","Missing whole menstruation section","Yes","No"))
table(mp1$started_period_10yr)

# Variable for normal number of days bleeding:
table(mp1$normal_no_days_bleeding_10yr)
mp1$normal_no_days_bleeding_10yr <- factor(mp1$normal_no_days_bleeding_10yr, 
                                           levels = c(-10,-9,-7,-6,-2,-1,1,2,3,4,5,6,7,8,10), 
                                           labels = c(-10,"Don't know","Male","Questions A4 to A9 omitted","Periods not started","Not stated",
                                                      1,2,3,4,5,6,7,8,10))
table(mp1$normal_no_days_bleeding_10yr)


# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_10yr)
mp1$hmb_10yr <- factor(mp1$hmb_10yr, 
                       levels = c(-10,-7,-6,-5,-2,1,2), 
                       labels = c(-10,"Male","Missing whole menstruation section","Question A8a omitted","Not started periods","Yes","No"))
table(mp1$hmb_10yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_10yr)
mp1$dr_hmb_10yr <- factor(mp1$dr_hmb_10yr, 
                          levels = c(-10,-7,-6,-5,-3,-2,1,2), 
                          labels = c(-10,"Male","Missing whole menstruation section","Question A8a omitted","No heavy bleeding",
                                     "Not started period","Yes","No"))
table(mp1$dr_hmb_10yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_10yr)
mp1$cramps_10yr <- factor(mp1$cramps_10yr, 
                          levels = c(-10,-7,-6,-5,-2,1,2), 
                          labels = c(-10,"Male","Missing whole menstruation section","Question A8b omitted","Not started periods","Yes","No"))
table(mp1$cramps_10yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_10yr)
mp1$dr_cramps_10yr <- factor(mp1$dr_cramps_10yr, 
                             levels = c(-10,-7,-6,-5,-3,-2,1,2), 
                             labels = c(-10,"Male","Missing whole menstruation section","Question A8b","No severe cramps",
                                        "Not started period","Yes","No"))
table(mp1$dr_cramps_10yr)

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_10yr)
mp1$cramps_all_month_10yr <- factor(mp1$cramps_all_month_10yr,
                                    levels = c(-10,-7,-6,-5,-2,1,2), 
                                    labels = c(-10,"Male","Missing whole menstruation section","Question A8c omitted",
                                               "Not started periods","Yes","No"))
table(mp1$cramps_all_month_10yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_10yr)
mp1$dr_cramps_all_month_10yr <- factor(mp1$dr_cramps_all_month_10yr, 
                                       levels = c(-10,-7,-6,-5,-3,-2,1,2), 
                                       labels = c(-10,"Male","Missing whole menstruation section","Question A8c omitted","No period type pains",
                                                  "Not started periods","Yes","No"))
table(mp1$dr_cramps_all_month_10yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_10yr)
mp1$oral_contraceptives_pastyr_10yr <- factor(mp1$oral_contraceptives_pastyr_10yr, 
                                              levels = c(-10,-7,-6,-2,-1,2), 
                                              labels = c(-10,"Male","Missing whole menstruation section","Not started periods","Missing","No"))
table(mp1$oral_contraceptives_pastyr_10yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_10yr)
mp1$thyroid_problem_10yr <- factor(mp1$thyroid_problem_10yr, 
                                   levels = c(-10,-7,-1,1,2), 
                                   labels = c(-10,"Male","Missing","Yes","No"))
table(mp1$thyroid_problem_10yr)

# Using the D1501_PUB4.pdf (participant 11 years old):

# Variable for BMI (will categorise the missings later)
table(mp1$bmi_11yr)

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_11yr)
mp1$vigorous_exercise_11yr <- factor(mp1$vigorous_exercise_11yr, 
                                     levels = c(-10,-1,1,2,3,4,5), 
                                     labels = c(-10,"Missing","None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_11yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_11yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_11yr <- factor(mp1$started_period_11yr, 
                                  levels = c(-10,-7,-6,1,2), 
                                  labels = c(-10,"Male","Missing whole menstruation section","Yes","No"))
table(mp1$started_period_11yr)

# Variable for normal number of days bleeding:
table(mp1$normal_no_days_bleeding_11yr)
mp1$normal_no_days_bleeding_11yr <- factor(mp1$normal_no_days_bleeding_11yr, 
                                           levels = c(-10,-9,-7,-6,-2,-1,0,1,2,3,4,5,6,7,8,9,10,11,12,14), 
                                           labels = c(-10,"Don't know","Male","Questions A4 to A9 omitted","Periods not started","Not stated",
                                                      0,1,2,3,4,5,6,7,8,9,10,11,12,14))
table(mp1$normal_no_days_bleeding_11yr)


# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_11yr)
mp1$hmb_11yr <- factor(mp1$hmb_11yr, 
                       levels = c(-10,-7,-6,-5,-2,1,2), 
                       labels = c(-10,"Male","Missing whole menstruation section","Question A8a omitted","Not started periods","Yes","No"))
table(mp1$hmb_11yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_11yr)
mp1$dr_hmb_11yr <- factor(mp1$dr_hmb_11yr, 
                          levels = c(-10,-7,-6,-5,-3,-2,-1,1,2), 
                          labels = c(-10,"Male","Missing whole menstruation section","Question A8a omitted","No heavy bleeding",
                                     "Not started period","Not stated","Yes","No"))
table(mp1$dr_hmb_11yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_11yr)
mp1$cramps_11yr <- factor(mp1$cramps_11yr, 
                          levels = c(-10,-7,-6,-5,-2,1,2), 
                          labels = c(-10,"Male","Missing whole menstruation section","Question A8b omitted","Not started periods","Yes","No"))
table(mp1$cramps_11yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_11yr)
mp1$dr_cramps_11yr <- factor(mp1$dr_cramps_11yr, 
                             levels = c(-10,-7,-6,-5,-3,-2,-1,1,2), 
                             labels = c(-10,"Male","Missing whole menstruation section","Question A8b","No severe cramps","Not started period",
                                        "Not stated","Yes","No"))
table(mp1$dr_cramps_11yr)

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_11yr)
mp1$cramps_all_month_11yr <- factor(mp1$cramps_all_month_11yr, 
                                    levels = c(-10,-7,-6,-5,-2,1,2), 
                                    labels = c(-10,"Male","Missing whole menstruation section","Question A8c omitted","Not started periods",
                                               "Yes","No"))
table(mp1$cramps_all_month_11yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_11yr)
mp1$dr_cramps_all_month_11yr <- factor(mp1$dr_cramps_all_month_11yr, 
                                       levels = c(-10,-7,-6,-5,-3,-2,-1,1,2), 
                                       labels = c(-10,"Male","Missing whole menstruation section","Question A8c omitted","No period type pains",
                                                  "Not started periods","Not stated","Yes","No"))
table(mp1$dr_cramps_all_month_11yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_11yr)
mp1$oral_contraceptives_pastyr_11yr <- factor(mp1$oral_contraceptives_pastyr_11yr, 
                                              levels = c(-10,-7,-6,-2,-1,1,2), 
                                              labels = c(-10,"Male","Missing whole menstruation section","Not started periods","Not stated","Yes","No"))
table(mp1$oral_contraceptives_pastyr_11yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_11yr)
mp1$thyroid_problem_11yr <- factor(mp1$thyroid_problem_11yr, 
                                   levels = c(-10,-7,-1,1,2), 
                                   labels = c(-10,"Male","Not stated","Yes","No"))
table(mp1$thyroid_problem_11yr)

# Using the D1501_PUB5.pdf (participant 13 years old):

# Variable for BMI (will categorise the missings later)
table(mp1$bmi_13yr)

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_13yr)
mp1$vigorous_exercise_13yr <- factor(mp1$vigorous_exercise_13yr, 
                                     levels = c(-10,-6,-1,1,2,3,4,5), 
                                     labels = c(-10,"Section A omitted","Not stated","None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_13yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_13yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_13yr <- factor(mp1$started_period_13yr, 
                                  levels = c(-10,-7,-6,-1,1,2), 
                                  labels = c(-10,"Male","Section A omitted","Not stated","Yes","No"))
table(mp1$started_period_13yr)

# Variable for normal number of days bleeding:
table(mp1$normal_no_days_bleeding_13yr)
mp1$normal_no_days_bleeding_13yr <- factor(mp1$normal_no_days_bleeding_13yr, 
                                           levels = c(-10,-7,-6,-2,-1,1,2,3,4,5,6,7,8,9,10,11,12,15,22), 
                                           labels = c(-10,"Male","Section A omitted","Periods not started","Not stated",1,2,3,4,5,6,7,8,9,10,11,12,15,22))
table(mp1$normal_no_days_bleeding_13yr)


# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_13yr)
mp1$hmb_13yr <- factor(mp1$hmb_13yr, 
                       levels = c(-10,-7,-6,-2,-1,1,2), 
                       labels = c(-10,"Male","Section A omitted","Not started periods","Not stated","Yes","No"))
table(mp1$hmb_13yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_13yr)
mp1$dr_hmb_13yr <- factor(mp1$dr_hmb_13yr, 
                          levels = c(-10,-7,-6,-3,-2,-1,1,2), 
                          labels = c(-10,"Male","Section A omitted","No heavy bleeding","Not started period","Not stated","Yes","No"))
table(mp1$dr_hmb_13yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_13yr)
mp1$cramps_13yr <- factor(mp1$cramps_13yr, 
                          levels = c(-10,-7,-6,-2,-1,1,2), 
                          labels = c(-10,"Male","Section A omitted","Not started periods","Not stated","Yes","No"))
table(mp1$cramps_13yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_13yr)
mp1$dr_cramps_13yr <- factor(mp1$dr_cramps_13yr, 
                             levels = c(-10,-7,-6,-3,-2,-1,1,2), 
                             labels = c(-10,"Male","Section A omitted","No severe cramps","Not started period","Not stated","Yes","No"))
table(mp1$dr_cramps_13yr)

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_13yr)
mp1$cramps_all_month_13yr <- factor(mp1$cramps_all_month_13yr, 
                                    levels = c(-10,-7,-6,-2,-1,1,2), 
                                    labels = c(-10,"Male","Section A omitted","Not started periods","Not stated","Yes","No"))
table(mp1$cramps_all_month_13yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_13yr)
mp1$dr_cramps_all_month_13yr <- factor(mp1$dr_cramps_all_month_13yr, 
                                       levels = c(-10,-7,-6,-3,-2,-1,1,2), 
                                       labels = c(-10,"Male","Section A omitted","No period type pains","Not started periods","Not stated","Yes","No"))
table(mp1$dr_cramps_all_month_13yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_13yr)
mp1$oral_contraceptives_pastyr_13yr <- factor(mp1$oral_contraceptives_pastyr_13yr, 
                                              levels = c(-10,-7,-6,-2,-1,1,2), 
                                              labels = c(-10,"Male","Section A omitted","Not started periods","Not stated","Yes","No"))
table(mp1$oral_contraceptives_pastyr_13yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_13yr)
mp1$thyroid_problem_13yr <- factor(mp1$thyroid_problem_13yr, 
                                   levels = c(-10,-7,-6,-1,1,2), 
                                   labels = c(-10,"Male","Section A omitted","Not stated","Yes","No"))
table(mp1$thyroid_problem_13yr)

# Using the D1501_PUB6.pdf (participant 14 years old):

# Variable for BMI (will categorise the missings later)
table(mp1$bmi_14yr)

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_14yr)
mp1$vigorous_exercise_14yr <- factor(mp1$vigorous_exercise_14yr, 
                                     levels = c(-10,-6,-1,1,2,3,4,5), 
                                     labels = c(-10,"Section A omitted","Not stated","None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_14yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_14yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_14yr <- factor(mp1$started_period_14yr, 
                                  levels = c(-10,-7,-1,1,2), 
                                  labels = c(-10,"Male","Not stated","Yes","No"))
table(mp1$started_period_14yr)

# Variable for normal number of days bleeding:
table(mp1$normal_no_days_bleeding_14yr)
mp1$normal_no_days_bleeding_14yr <- factor(mp1$normal_no_days_bleeding_14yr, 
                                           levels = c(-10,-9,-7,-3,-2,-1,2,3,4,5,6,7,8,9,10,11,12,14,28,30,35), 
                                           labels = c(-10,"Don't know","Male","It varies","Periods not started","Not stated",2,3,4,5,6,7,8,9,10,11,12,14,28,30,35))
table(mp1$normal_no_days_bleeding_14yr)

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_14yr)
mp1$hmb_14yr <- factor(mp1$hmb_14yr, 
                       levels = c(-10,-7,-2,-1,1,2), 
                       labels = c(-10,"Male","Not started periods","Not stated","Yes","No"))
table(mp1$hmb_14yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_14yr)
mp1$dr_hmb_14yr <- factor(mp1$dr_hmb_14yr, 
                          levels = c(-10,-7,-3,-2,-1,1,2), 
                          labels = c(-10,"Male","No heavy bleeding","Not started period","Not stated","Yes","No"))
table(mp1$dr_hmb_14yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_14yr)
mp1$cramps_14yr <- factor(mp1$cramps_14yr, 
                          levels = c(-10,-7,-2,-1,1,2), 
                          labels = c(-10,"Male","Not started periods","Not stated","Yes","No"))
table(mp1$cramps_14yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_14yr)
mp1$dr_cramps_14yr <- factor(mp1$dr_cramps_14yr, 
                             levels = c(-10,-7,-3,-2,-1,1,2), 
                             labels = c(-10,"Male","No severe cramps","Not started period","Not stated","Yes","No"))
table(mp1$dr_cramps_14yr)

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_14yr)
mp1$cramps_all_month_14yr <- factor(mp1$cramps_all_month_14yr, 
                                    levels = c(-10,-7,-2,-1,1,2), 
                                    labels = c(-10,"Male","Not started periods","Not stated","Yes","No"))
table(mp1$cramps_all_month_14yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_14yr)
mp1$dr_cramps_all_month_14yr <- factor(mp1$dr_cramps_all_month_14yr, 
                                       levels = c(-10,-7,-3,-2,-1,1,2), 
                                       labels = c(-10,"Male","No period type pains","Not started periods","Not stated","Yes","No"))
table(mp1$dr_cramps_all_month_14yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_14yr)
mp1$oral_contraceptives_pastyr_14yr <- factor(mp1$oral_contraceptives_pastyr_14yr, 
                                              levels = c(-10,-7,-2,-1,1,2,9), 
                                              labels = c(-10,"Male","Not started periods","Not stated","Yes","No","Don't know"))
table(mp1$oral_contraceptives_pastyr_14yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_14yr)
mp1$thyroid_problem_14yr <- factor(mp1$thyroid_problem_14yr, 
                                   levels = c(-10,-7,-1,1,2,9), 
                                   labels = c(-10,"Male","Not stated","Yes","No","Don't know"))
table(mp1$thyroid_problem_14yr)

# Using the D1501_PUB7.pdf (participant 15 years old):

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_15yr)
mp1$vigorous_exercise_15yr <- factor(mp1$vigorous_exercise_15yr, 
                                     levels = c(-10,-1,1,2,3,4,5), 
                                     labels = c(-10,"Not stated","None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_15yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_15yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_15yr <- factor(mp1$started_period_15yr, 
                                  levels = c(-10,-7,-6,1,2), 
                                  labels = c(-10,"Male","Questions A2 to A7 omitted","Yes","No"))
table(mp1$started_period_15yr)

# Variable for normal number of days bleeding:
table(mp1$normal_no_days_bleeding_15yr)
mp1$normal_no_days_bleeding_15yr <- factor(mp1$normal_no_days_bleeding_15yr, 
                                           levels = c(-10,-9,-7,-6,-3,-2,-1,0,2,3,4,5,6,7,8,9,10,13,20), 
                                           labels = c(-10,"Don't know","Male","Questions A2 to A7 omitted","It varies","Periods not started",
                                                      "Not stated",0,2,3,4,5,6,7,8,9,10,13,20))
table(mp1$normal_no_days_bleeding_15yr)

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_15yr)
mp1$hmb_15yr <- factor(mp1$hmb_15yr, 
                       levels = c(-10,-7,-6,-5,-2,-1,1,2), 
                       labels = c(-10,"Male","Questions A2 to A7 omitted","Question A6a omitted","Not started periods","Not stated","Yes","No"))
table(mp1$hmb_15yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_15yr)
mp1$dr_hmb_15yr <- factor(mp1$dr_hmb_15yr, 
                          levels = c(-10,-7,-6,-5,-3,-2,-1,1,2), 
                          labels = c(-10,"Male","Questions A2 to A7 omitted","Question A6a omitted","No heavy bleeding","Not started period",
                                     "Not stated","Yes","No"))
table(mp1$dr_hmb_15yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_15yr)
mp1$cramps_15yr <- factor(mp1$cramps_15yr, 
                          levels = c(-10,-7,-6,-2,-1,1,2), 
                          labels = c(-10,"Male","Questions A2 to A7 omitted","Not started periods","Not stated","Yes","No"))
table(mp1$cramps_15yr)

# Variable for severity of cramps associated with period:
table(mp1$severity_cramps_15yr)
mp1$severity_cramps_15yr <- factor(mp1$severity_cramps_15yr, 
                                   levels = c(-10,-7,-6,-5,-3,-2,-1,1,2,3), 
                                   labels = c(-10,"Male","Questions A2 to A7 omitted","Question A6b omitted","No pain","Periods not started",
                                              "Not stated","Mild","Moderate","Severe"))
table(mp1$severity_cramps_15yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_15yr)
mp1$dr_cramps_15yr <- factor(mp1$dr_cramps_15yr, 
                             levels = c(-10,-7,-6,-5,-3,-2,-1,1,2), 
                             labels = c(-10,"Male","Questions A2 to A7 omitted","Question A6b omitted","No severe cramps","Not started period",
                                        "Not stated","Yes","No"))
table(mp1$dr_cramps_15yr)

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_15yr)
mp1$cramps_all_month_15yr <- factor(mp1$cramps_all_month_15yr, 
                                    levels = c(-10,-7,-6,-5,-2,1,2), 
                                    labels = c(-10,"Male","Questions A2 to A7 omitted","Question A6c omitted","Not started periods","Yes","No"))
table(mp1$cramps_all_month_15yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_15yr)
mp1$dr_cramps_all_month_15yr <- factor(mp1$dr_cramps_all_month_15yr, 
                                       levels = c(-10,-7,-6,-5,-3,-2,-1,1,2), 
                                       labels = c(-10,"Male","Questions A2 to A7 omitted","Question A6c omitted","No period type pains",
                                                  "Not started periods","Not stated","Yes","No"))
table(mp1$dr_cramps_all_month_15yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_15yr)
mp1$oral_contraceptives_pastyr_15yr <- factor(mp1$oral_contraceptives_pastyr_15yr, 
                                              levels = c(-10,-7,-6,-2,-1,1,2,9), 
                                              labels = c(-10,"Male","Questions A2 to A7 omitted","Not started periods","Not stated","Yes","No",
                                                         "Don't know"))
table(mp1$oral_contraceptives_pastyr_15yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_15yr)
mp1$thyroid_problem_15yr <- factor(mp1$thyroid_problem_15yr, 
                                   levels = c(-10,-7,-1,1,2,9), 
                                   labels = c(-10,"Male","Not stated","Yes","No","Don't know"))
table(mp1$thyroid_problem_15yr)

# Using the D1501_PUB8.pdf (participant 16 years old):

# Variable for participants BMI:
table(mp1$bmi_16yr)

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_16yr)
mp1$vigorous_exercise_16yr <- factor(mp1$vigorous_exercise_16yr, 
                                     levels = c(-10,-1,1,2,3,4,5), 
                                     labels = c(-10,"Not stated","None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_16yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_16yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_16yr <- factor(mp1$started_period_16yr, 
                                  levels = c(-10,-7,-6,1,2), 
                                  labels = c(-10,"Male","Questions A4 to A9 omitted","Yes","No"))
table(mp1$started_period_16yr)

# Variable for normal number of days bleeding:
table(mp1$normal_no_days_bleeding_16yr)
mp1$normal_no_days_bleeding_16yr <- factor(mp1$normal_no_days_bleeding_16yr, 
                                           levels = c(-10,-9,-7,-6,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10,14), 
                                           labels = c(-10,"Don't know","Male","Questions A4 to A9 omitted","It varies","Periods not started",
                                                      "Not stated",0,1,2,3,4,5,6,7,8,9,10,14))
table(mp1$normal_no_days_bleeding_16yr)

# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_16yr)
mp1$hmb_16yr <- factor(mp1$hmb_16yr, 
                       levels = c(-10,-7,-6,-5,-2,1,2), 
                       labels = c(-10,"Male","Questions A4 to A9 omitted","Question A8a omitted","Not started periods","Yes","No"))
table(mp1$hmb_16yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_16yr)
mp1$dr_hmb_16yr <- factor(mp1$dr_hmb_16yr, 
                          levels = c(-10,-7,-6,-5,-3,-2,-1,1,2), 
                          labels = c(-10,"Male","Questions A4 to A9 omitted","Question A8a omitted","No heavy bleeding","Not started period",
                                     "Not stated","Yes","No"))
table(mp1$dr_hmb_16yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_16yr)
mp1$cramps_16yr <- factor(mp1$cramps_16yr, 
                          levels = c(-10,-7,-6,-5,-2,1,2), 
                          labels = c(-10,"Male","Questions A4 to A9 omitted","Question A8b omitted","Not started periods","Yes","No"))
table(mp1$cramps_16yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_16yr)
mp1$dr_cramps_16yr <- factor(mp1$dr_cramps_16yr, 
                             levels = c(-10,-7,-6,-5,-3,-2,-1,1,2), 
                             labels = c(-10,"Male","Questions A4 to A9 omitted","Question A8b omitted","No severe cramps","Not started period",
                                        "Not stated","Yes","No"))
table(mp1$dr_cramps_16yr)

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_16yr)
mp1$cramps_all_month_16yr <- factor(mp1$cramps_all_month_16yr, 
                                    levels = c(-10,-7,-6,-5,-2,1,2), 
                                    labels = c(-10,"Male","Questions A4 to A9 omitted","Question A8c omitted","Not started periods","Yes","No"))
table(mp1$cramps_all_month_16yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_16yr)
mp1$dr_cramps_all_month_16yr <- factor(mp1$dr_cramps_all_month_16yr, 
                                       levels = c(-10,-7,-6,-5,-3,-2,-1,1,2), 
                                       labels = c(-10,"Male","Questions A4 to A9 omitted","Question A8c omitted","No period type pains",
                                                  "Not started periods","Not stated","Yes","No"))
table(mp1$dr_cramps_all_month_16yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_16yr)
mp1$oral_contraceptives_pastyr_16yr <- factor(mp1$oral_contraceptives_pastyr_16yr, 
                                              levels = c(-10,-7,-6,-2,-1,1,2,9), 
                                              labels = c(-10,"Male","Questions A4 to A9 omitted","Not started periods","Not stated","Yes","No",
                                                         "Don't know"))
table(mp1$oral_contraceptives_pastyr_16yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_16yr)
mp1$thyroid_problem_16yr <- factor(mp1$thyroid_problem_16yr, 
                                   levels = c(-10,-7,-1,1,2,9), 
                                   labels = c(-10,"Male","Not stated","Yes","No","Don't know"))
table(mp1$thyroid_problem_16yr)

# Using the D1501_PUB9.pdf (participant 17 years old):

# Variable for participants BMI:
table(mp1$bmi_17yr)

# Variable for frequency of participation in vigorous activity:
table(mp1$vigorous_exercise_17yr)
mp1$vigorous_exercise_17yr <- factor(mp1$vigorous_exercise_17yr, 
                                     levels = c(-10,-1,1,2,3,4,5), 
                                     labels = c(-10,"Not stated","None","Less than once a week","1-3 times a week","4-6 times a week","Daily"))
table(mp1$vigorous_exercise_17yr)

# Variable for whether child has started her period yet:
table(mp1$started_period_17yr, mp1$sex)  # Used sex in here to see if -7 referred to males which it does
mp1$started_period_17yr <- factor(mp1$started_period_17yr, 
                                  levels = c(-10,-7,-6,1,2), 
                                  labels = c(-10,"Male","Questions A4 to A9 omitted","Yes","No"))
table(mp1$started_period_17yr)

# Variable for normal number of days bleeding:
table(mp1$normal_no_days_bleeding_17yr)
mp1$normal_no_days_bleeding_17yr <- factor(mp1$normal_no_days_bleeding_17yr, 
                                           levels = c(-10,-9,-7,-6,-3,-2,-1,0,2,3,4,5,6,7,8,9,10,11,12,14,21,24,60), 
                                           labels = c(-10,"Don't know","Male","Questions A4 to A9 omitted","It varies","Periods not started",
                                                      "Not stated",0,2,3,4,5,6,7,8,9,10,11,12,14,21,24,60))
table(mp1$normal_no_days_bleeding_17yr)


# Variable for whether child has ever had heavy or prolonged bleeding:
table(mp1$hmb_17yr)
mp1$hmb_17yr <- factor(mp1$hmb_17yr, 
                       levels = c(-10,-7,-6,-5,-2,1,2), 
                       labels = c(-10,"Male","Questions A4 to A9 omitted","Question A8a omitted","Not started periods","Yes","No"))
table(mp1$hmb_17yr)

# Variable for whether her doctor was contacted for heavy bleeding:
table(mp1$dr_hmb_17yr)
mp1$dr_hmb_17yr <- factor(mp1$dr_hmb_17yr, 
                          levels = c(-10,-7,-6,-5,-3,-2,-1,1,2), 
                          labels = c(-10,"Male","Questions A4 to A9 omitted","Question A8a omitted","No heavy bleeding",
                                     "Not started period","Not stated","Yes","No"))
table(mp1$dr_hmb_17yr)

# Variable for whether child has ever had severe cramps associated with period:
table(mp1$cramps_17yr)
mp1$cramps_17yr <- factor(mp1$cramps_17yr, 
                          levels = c(-10,-7,-6,-5,-2,1,2), 
                          labels = c(-10,"Male","Questions A4 to A9 omitted","Question A8b omitted","Not started periods","Yes","No"))
table(mp1$cramps_17yr)

# Variable for whether her doctor was contacted for severe cramps:
table(mp1$dr_cramps_17yr)
mp1$dr_cramps_17yr <- factor(mp1$dr_cramps_17yr, 
                             levels = c(-10,-7,-6,-5,-3,-2,-1,1,2), 
                             labels = c(-10,"Male","Questions A4 to A9 omitted","Question A8b omitted","No severe cramps",
                                        "Not started period","Not stated","Yes","No"))
table(mp1$dr_cramps_17yr)

# Variable for whether child has period type pains for most of the month even when not bleeding:
table(mp1$cramps_all_month_17yr)
mp1$cramps_all_month_17yr <- factor(mp1$cramps_all_month_17yr, 
                                    levels = c(-10,-7,-6,-5,-2,1,2), 
                                    labels = c(-10,"Male","Questions A4 to A9 omitted","Question A8c omitted","Not started periods","Yes",
                                               "No"))
table(mp1$cramps_all_month_17yr)

# Variable for whether her doctor was contacted for period type pains:
table(mp1$dr_cramps_all_month_17yr)
mp1$dr_cramps_all_month_17yr <- factor(mp1$dr_cramps_all_month_17yr, 
                                       levels = c(-10,-7,-6,-5,-3,-2,-1,1,2), 
                                       labels = c(-10,"Male","Questions A4 to A9 omitted","Question A8c omitted","No period type pains",
                                                  "Not started periods","Not stated","Yes","No"))
table(mp1$dr_cramps_all_month_17yr)

# Variable for whether child has taken oral contraceptives for any reason in the last 12 months:
table(mp1$oral_contraceptives_pastyr_17yr)
mp1$oral_contraceptives_pastyr_17yr <- factor(mp1$oral_contraceptives_pastyr_17yr, 
                                              levels = c(-10,-7,-6,-2,-1,1,2,9), 
                                              labels = c(-10,"Male","Questions A4 to A9 omitted","Not started periods","Not stated","Yes","No",
                                                         "Don't know"))
table(mp1$oral_contraceptives_pastyr_17yr)

# Variable for whether child has a thyroid problem:
table(mp1$thyroid_problem_17yr)
mp1$thyroid_problem_17yr <- factor(mp1$thyroid_problem_17yr, 
                                   levels = c(-10,-7,-1,1,2,9), 
                                   labels = c(-10,"Male","Not stated","Yes","No","Don't know"))
table(mp1$thyroid_problem_17yr)

# Using D1321_TA.pdf where participant is 13 years old
# Variable for the frequency that the young person has drunk wine:

table(mp1$freq_yp_drinks_wine)
mp1$freq_yp_drinks_wine <- factor(mp1$freq_yp_drinks_wine,
                                  levels = c(-10,-1,1,2,3,4),
                                  labels = c("Not completed", "No response","> Once a week","Once a week","< Once a week","Not at all"))
table(mp1$freq_yp_drinks_wine)

# Variable for the frequency that the young person has drunk beer:

table(mp1$freq_yp_drinks_beer)
mp1$freq_yp_drinks_beer <- factor(mp1$freq_yp_drinks_beer,
                                  levels = c(-10,-1,1,2,3,4),
                                  labels = c("Not completed", "No response","> Once a week","Once a week","< Once a week","Not at all"))
table(mp1$freq_yp_drinks_beer)

# Variable for the frequency that the young person has drunk spirits:

table(mp1$freq_yp_drinks_spirits)
mp1$freq_yp_drinks_spirits <- factor(mp1$freq_yp_drinks_spirits,
                                  levels = c(-10,-1,1,2,3,4),
                                  labels = c("Not completed", "No response","> Once a week","Once a week","< Once a week","Not at all"))
table(mp1$freq_yp_drinks_spirits)

# Variable for the frequency that the young person has drunk other alcohol:

table(mp1$freq_yp_drinks_other)
mp1$freq_yp_drinks_other <- factor(mp1$freq_yp_drinks_other,
                                  levels = c(-10,-1,0,1,2,3,4),
                                  labels = c("Not completed", "No response","Relevant text but no box ticked","> Once a week","Once a week",
                                             "< Once a week","Not at all"))
table(mp1$freq_yp_drinks_other)

# Variable for whether the teenager has smoked cigarettes, using D2107_TF1.pdf using the labels below:
table(mp1$teen_has_smoked_12yr)
mp1$teen_has_smoked_12yr <- factor(mp1$teen_has_smoked_12yr,
                                   levels = c(-10,-6,-5,-1,1,2),
                                   labels = c(-10,"Did not start the session","Did not start the task","Missing","Yes","No"))
table(mp1$teen_has_smoked_12yr)

# Using D2108_TF2.pdf where participant is 13 years old
# Variable for whether teenager has smoked cigarettes
table(mp1$teen_has_smoked_13yr)
mp1$teen_has_smoked_13yr <- factor(mp1$teen_has_smoked_13yr,
                                   levels = c(-10,-6,-5,1,2),
                                   labels = c(-10,"Did not start session","Did not start task","Yes","No"))
table(mp1$teen_has_smoked_13yr)

# Variable for whether the teenager has had a whole drink of alcohol
table(mp1$teen_has_drunk_13yr)
mp1$teen_has_drunk_13yr <- factor(mp1$teen_has_drunk_13yr,
                                  levels = c(-10,-9,-6,-5,1,2),
                                  labels = c(-10,"Don't know","Did not start session","Did not start task","Yes","No"))
table(mp1$teen_has_drunk_13yr)

save(mp1,file="mp1.Rda") # Saved the data set at this point at the end of the day (27/10/20) in MP1 file OneDrive
