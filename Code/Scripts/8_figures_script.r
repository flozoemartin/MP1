##############################################################################################################################################################
#                                                                                                                                                            #
#       Generating plots for prevalence of outcomes in ALSPAC                                                                                                #
#       Author:       Flo Martin                                                                                                                             #
#       Date started: 23/11/2020                                                                                                                             #
#       Date finished: 03/06/2021                                                                                                                            #
#                                                                                                                                                            #
##############################################################################################################################################################

# Load in mp1 for the characteristcs comparison, mp1_nofactor for prevalence figures & traits for coefficient plots
setwd("/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/Mini Project 1/R Data/Data")
load("mp1.Rda")
load("mp1_nofactor.Rda")
load("traits.Rda")

# Figure 1 - flow diagram of participants through the study
table(mp1$sex, mp1$kz011b)  # This gives me number of males and females stratified by alive at 1yr

# Responders to at least one puberty questionnaire regarding the period section
mp1$responders <- ifelse(mp1$started_period_8yr == "Yes" | mp1$started_period_9yr == "Yes" | mp1$started_period_10yr == "Yes" |
                           mp1$started_period_11yr == "Yes" | mp1$started_period_13yr == "Yes" | mp1$started_period_14yr == "Yes" | 
                           mp1$started_period_15yr == "Yes" | mp1$started_period_16yr == "Yes" | mp1$started_period_17yr == "Yes",1,0)
table(mp1$responders)

# Ever reported either symptom any time during puberty
table(mp1$dysmen_prev)
table(mp1$menorr_prev)

# Cases and controls in the EWAS
table(mp1$cramps)
table(mp1$hmb)

# Figure 2 - graph showing prevalence of dysmenorrhea & menorrhagia across time (8 - 17 years old)
