##############################################################################################################################################################
#                                                                                                                                                            #
#       Generating plots for prevalence of outcomes in ALSPAC                                                                                                #
#       Author:       Flo Martin                                                                                                                             #
#       Date started: 23/11/2020                                                                                                                             #
#       Date finished: 03/06/2021                                                                                                                            #
#                                                                                                                                                            #
##############################################################################################################################################################

# Contents #
# line 19 - Environment management #
# line 31 - Figure 1 #
# line 48 - Figure 3 #
# line 129 - Figure 4 #
# line 152 - Table 1 #
# line 214 - Figure 5 #
# line 480 - Figure 6 #

# Load in mp1 for the characteristcs comparison, mp1_nofactor for prevalence figures & traits for coefficient plots
setwd("location/of/the/data/")
load("mp1.Rda")
load("mp1_nofactor.Rda")
load("traits.Rda")

# Load necessary packages
library(ggplot2)
library(ggeasy)
library(tidyr)
library(dplyr)

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

# Figure 3 - graph showing prevalence of dysmenorrhea & menorrhagia across time (8 - 17 years old). Make a dataframe for ggplot to use using mp1_nofactor
timepoints <- c(8,9,10,11,13,14,15,16,17)

men <- c(sum(mp1_nofactor$hmb_8yr,na.rm = TRUE),sum(mp1_nofactor$hmb_9yr,na.rm = TRUE),sum(mp1_nofactor$hmb_10yr,na.rm = TRUE),sum(mp1_nofactor$hmb_11yr,na.rm = TRUE),
         sum(mp1_nofactor$hmb_13yr,na.rm = TRUE),sum(mp1_nofactor$hmb_14yr,na.rm = TRUE),sum(mp1_nofactor$hmb_15yr,na.rm = TRUE),sum(mp1_nofactor$hmb_16yr,na.rm = TRUE),
         sum(mp1_nofactor$hmb_17yr,na.rm = TRUE))

dys <- c(sum(mp1_nofactor$cramps_8yr,na.rm = TRUE),sum(mp1_nofactor$cramps_9yr,na.rm = TRUE),sum(mp1_nofactor$cramps_10yr,na.rm = TRUE),sum(mp1_nofactor$cramps_11yr,na.rm = TRUE),
         sum(mp1_nofactor$cramps_13yr,na.rm = TRUE),sum(mp1_nofactor$cramps_14yr,na.rm = TRUE),sum(mp1_nofactor$mod_sev,na.rm = TRUE),sum(mp1_nofactor$cramps_16yr,na.rm = TRUE),
         sum(mp1_nofactor$cramps_17yr,na.rm = TRUE))

sev_dys <- c(NA,NA,NA,NA,NA,NA,sum(mp1_nofactor$sev_cramps_15yr, na.rm = TRUE),NA,NA)

mild_plus_mod_plus_sev_dys <- c(NA,NA,NA,NA,NA,NA,sum(mp1_nofactor$mild_plus_mod_sev_cramps_15yr, na.rm = TRUE),NA,NA)

men_dr <- c(sum(mp1_nofactor$dr_hmb_8yr,na.rm = TRUE),sum(mp1_nofactor$dr_hmb_9yr,na.rm = TRUE),sum(mp1_nofactor$dr_hmb_10yr,na.rm = TRUE),sum(mp1_nofactor$dr_hmb_11yr,na.rm = TRUE),
            sum(mp1_nofactor$dr_hmb_13yr,na.rm = TRUE),sum(mp1_nofactor$dr_hmb_14yr,na.rm = TRUE),sum(mp1_nofactor$dr_hmb_15yr,na.rm = TRUE),sum(mp1_nofactor$dr_hmb_16yr,na.rm = TRUE),
            sum(mp1_nofactor$dr_hmb_17yr,na.rm = TRUE))

dys_dr <- c(sum(mp1_nofactor$dr_cramps_8yr,na.rm = TRUE),sum(mp1_nofactor$dr_cramps_9yr,na.rm = TRUE),sum(mp1_nofactor$dr_cramps_10yr,na.rm = TRUE),
            sum(mp1_nofactor$dr_cramps_11yr,na.rm = TRUE),sum(mp1_nofactor$dr_cramps_13yr,na.rm = TRUE),sum(mp1_nofactor$dr_cramps_14yr,na.rm = TRUE),
            sum(mp1_nofactor$dr_mod_sev,na.rm = TRUE),sum(mp1_nofactor$dr_cramps_16yr,na.rm = TRUE),sum(mp1_nofactor$dr_cramps_17yr,na.rm = TRUE))

sev_dr <- c(NA,NA,NA,NA,NA,NA,sum(mp1_nofactor$dr_sev,na.rm = TRUE),NA,NA)

mild_mod_sev_dr <- c(NA,NA,NA,NA,NA,NA,sum(mp1_nofactor$dr_mild_mod_sev,na.rm = TRUE),NA,NA)

started <- c(sum(mp1_nofactor$started_period_8yr,na.rm = TRUE),sum(mp1_nofactor$started_period_9yr,na.rm = TRUE),sum(mp1_nofactor$started_period_10yr,na.rm = TRUE),
             sum(mp1_nofactor$started_period_11yr,na.rm = TRUE),sum(mp1_nofactor$started_period_13yr,na.rm = TRUE),sum(mp1_nofactor$started_period_14yr,na.rm = TRUE),
             sum(mp1_nofactor$started_period_15yr,na.rm = TRUE),sum(mp1_nofactor$started_period_16yr,na.rm = TRUE),sum(mp1_nofactor$started_period_17yr,na.rm = TRUE))

prop_men <- c((men/started)*100)

prop_dys <- c((dys/started)*100)

prop_sev_dys <-c((sev_dys/started)*100)

prop_mild_dys <-c((mild_plus_mod_plus_sev_dys/started)*100)

prop_men_dr <- c((men_dr/men)*100)

prop_dys_dr <- c((dys_dr/dys)*100)

prop_sev_dys_dr <- c((sev_dr/sev_dys)*100)

prop_mild_dys_dr <- c((mild_mod_sev_dr/mild_plus_mod_plus_sev_dys)*100)

Plots <- data.frame(timepoints,men,dys,sev_dys,mild_plus_mod_plus_sev_dys,started,prop_men,prop_dys,prop_sev_dys,prop_mild_dys,men_dr,dys_dr,sev_dr,mild_mod_sev_dr,
                    prop_men_dr,prop_dys_dr,prop_sev_dys_dr,prop_mild_dys_dr)

colnames(Plots) [1] <- "Timepoints"
colnames(Plots) [7] <- "Menorrhagia"
colnames(Plots) [8] <- "Dysmenorrhea"
colnames(Plots) [9] <- "Severe dysmenorrhea"
colnames(Plots) [10] <- "Any dysmenorrhea"
colnames(Plots) [15] <- "For menorrhagia"
colnames(Plots) [16] <- "For dysmenorrhea"
colnames(Plots) [17] <- "For severe dysmenorrhea"
colnames(Plots) [18] <- "For any dysmenorrhea"

df <- gather(Plots, key = Symptoms, value = Proportion, c("Menorrhagia", "Dysmenorrhea", "Severe dysmenorrhea", "Any dysmenorrhea"))

df$Symptoms <- factor(df$Symptoms, levels = c("Menorrhagia", "Dysmenorrhea", "Severe dysmenorrhea", "Any dysmenorrhea"))

ggplot() + 
  geom_line(data=df, aes(x = Timepoints, y = Proportion, colour = Symptoms)) +
  geom_point(data=df, aes(x = Timepoints, y = Proportion, colour = Symptoms)) +
  scale_x_continuous(name="Age (years)", breaks = c(8,9,10,11,13,14,15,16,17)) +
  scale_y_continuous(name="Proportion (%)", limits=c(0,90)) + 
  theme_classic() +
  ggtitle("Proportion of adolescents reporting menorrhagia & dysmenorrhea \nat each timepoint in ALSPAC") +
  theme(plot.title = element_text(hjust = 0.5,face="bold")) +
  theme(axis.line = element_line(arrow = arrow(angle = 15, length = unit(.15,"inches"),type = "closed"))) +
  theme(plot.title = element_text(size=18)) +
  theme(axis.title.x = element_text(face="bold", size=16),axis.text.x  = element_text(size=16)) +
  theme(axis.title.y = element_text(face="bold", size=16),axis.text.y  = element_text(size=16)) +
  theme(legend.title = element_text(size=16, face="bold")) +
  theme(legend.text = element_text(size=16, lineheight = 3)) +
  scale_colour_manual(name="Symptoms",values=c("#CC6666","#9966CC","33OO66","#9999CC"),
                      breaks=c("Menorrhagia", "Dysmenorrhea", "Severe dysmenorrhea", "Any dysmenorrhea"))

# Figure 4 - prevalence of visiting a doctor for each symptom at each timepoint

df <- gather(Plots, key = Doctors, value = Proportion, c("For menorrhagia", "For dysmenorrhea", "For severe dysmenorrhea", "For any dysmenorrhea"))

df$Doctors <- factor(df$Doctors, levels = c("For menorrhagia", "For dysmenorrhea", "For severe dysmenorrhea", "For any dysmenorrhea"))

ggplot() + 
  geom_line(data=df, aes(x = Timepoints, y = Proportion, colour = Doctors)) +
  geom_point(data=df, aes(x = Timepoints, y = Proportion, colour = Doctors)) +
  scale_color_manual("Visited the doctor",values=c("#CC6666","#9966CC","33OO66","#9999CC"),
                     labels=c("for menorrhagia", "for dysmenorrhea", "for severe dysmenorrhea", "for any dysmenorrhea")) +
  scale_x_continuous(name="Age (years)", breaks = c(8,9,10,11,13,14,15,16,17)) +
  scale_y_continuous(name="Proportion (%)", limits=c(0,45)) + 
  theme_classic() +
  ggtitle("Proportion of adolescents who reported menorrhagia & dysmenorrhea \nwho went to the doctor at each timepoint in ALSPAC") +
  theme(plot.title = element_text(hjust = 0.5,face="bold")) +
  theme(axis.line = element_line(arrow = arrow(angle = 15, length = unit(.15,"inches"),type = "closed"))) +
  theme(plot.title = element_text(size=18)) +
  theme(axis.title.x = element_text(face="bold", size=16),axis.text.x  = element_text(size=16)) +
  theme(axis.title.y = element_text(face="bold", size=16),axis.text.y  = element_text(size=16)) +
  theme(legend.title = element_text(size=16, face="bold")) +
  theme(legend.text = element_text(size=16, lineheight = 3)) 

# Table 1 - characteristic comparison table between eligible cases and controls for EWAS

# Maternal educational attainment
table(mp1$mat_degree, mp1$cramps, useNA = "always")
table(mp1$mat_degree, mp1$hmb, useNA = "always")

# Age at onset of menarche in months
group_by(mp1, cramps) %>%
  summarise(
    count = n(),
    mean = mean(men_age_m, na.rm = TRUE),
    sd = sd(men_age_m, na.rm = TRUE),
    median = median(men_age_m, na.rm = TRUE)
  )

aggregate(x = mp1$men_age_m,
          by = list(mp1$cramps),
          FUN = mean,
          na.rm = TRUE) 

group_by(mp1, hmb) %>%
  summarise(
    count = n(),
    mean = mean(men_age_m, na.rm = TRUE),
    sd = sd(men_age_m, na.rm = TRUE),
    median = median(men_age_m, na.rm = TRUE)
  )

aggregate(x = mp1$men_age_m,
          by = list(mp1$hmb),
          FUN = mean,
          na.rm = TRUE) 

# BMI at 17 years (TF4/self-report where clinic unavailable)
group_by(mp1, cramps) %>%
  summarise(
    count = n(),
    mean = mean(bmi, na.rm = TRUE),
    sd = sd(bmi, na.rm = TRUE),
    median = median(bmi, na.rm = TRUE)
  )

group_by(mp1, hmb) %>%
  summarise(
    count = n(),
    mean = mean(bmi, na.rm = TRUE),
    sd = sd(bmi, na.rm = TRUE),
    median = median(bmi, na.rm = TRUE)
  )

# Smoking at 17 years (derived from cotinine measured at TF4)
table(mp1$reg_smoker, mp1$cramps, useNA = "always")
table(mp1$reg_smoker, mp1$hmb, useNA = "always")

# Contraception any time during puberty 
table(mp1$contraception_ewas, mp1$cramps, useNA = "always")
table(mp1$contraception_ewas, mp1$hmb, useNA = "always")

# Comorbidity by the age of 22 years
table(mp1$comorbidity_cc, mp1$cramps, useNA = "always")
table(mp1$comorbidity_cc, mp1$hmb, useNA = "always")

# Figure 5 - coefficient plot for binary traits identified a priori and in the hypothesis-gen EWAS
model <- c("Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted",
           "Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP",
           "Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM",
           "Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted",
           "Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP",
           "Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM")

exposure <- c("Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 13 years","Participant smoking at 13 years*","Participant contraception use ever in puberty*","Participant thyroid problem, endometriosis or PCOS*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 13 years","Participant smoking at 13 years*","Participant contraception use ever in puberty*","Participant thyroid problem, endometriosis or PCOS*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 13 years","Participant smoking at 13 years*","Participant contraception use ever in puberty*","Participant thyroid problem, endometriosis or PCOS*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 13 years","Participant smoking at 13 years*","Participant contraception use ever in puberty*","Participant thyroid problem, endometriosis or PCOS*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 13 years","Participant smoking at 13 years*","Participant contraception use ever in puberty*","Participant thyroid problem, endometriosis or PCOS*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 13 years","Participant smoking at 13 years*","Participant contraception use ever in puberty*","Participant thyroid problem, endometriosis or PCOS*")

outcome <- c("Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea")

estimate <- c((coef(summary(glm(data = traits, hmb ~ mat_degree, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ ever_alcohol_preg, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ hdp, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ preeclampsia, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ alcohol_tf1, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ smoked_tf1, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ contraception, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ comorbidity, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = traits, hmb ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ hdp + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ preeclampsia + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ alcohol_tf1 + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ smoked_tf1 + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ contraception + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ comorbidity + mat_edu, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = traits, hmb ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ hdp + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ contraception + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ comorbidity + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ mat_degree, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ ever_alcohol_preg, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ hdp, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ preeclampsia, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ alcohol_tf1, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ smoked_tf1, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ contraception, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ comorbidity, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = traits, cramps ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ hdp + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ preeclampsia + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ alcohol_tf1 + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ smoked_tf1 + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ contraception + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ comorbidity + mat_edu, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = traits, cramps ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ hdp + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ contraception + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ comorbidity + mat_edu + men_age_m, family = binomial)))[2,1]))

se <- c((coef(summary(glm(data = traits, hmb ~ mat_degree, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ ever_alcohol_preg, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ hdp, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ preeclampsia, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ alcohol_tf1, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ smoked_tf1, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ contraception, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ comorbidity, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = traits, hmb ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ hdp + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ preeclampsia + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ alcohol_tf1 + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ smoked_tf1 + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ contraception + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ comorbidity + mat_edu, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = traits, hmb ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ hdp + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ contraception + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ comorbidity + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ mat_degree, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ ever_alcohol_preg, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ hdp, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ preeclampsia, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ alcohol_tf1, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ smoked_tf1, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ contraception, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ comorbidity, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = traits, cramps ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ hdp + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ preeclampsia + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ alcohol_tf1 + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ smoked_tf1 + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ contraception + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ comorbidity + mat_edu, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = traits, cramps ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ hdp + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ contraception + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ comorbidity + mat_edu + men_age_m, family = binomial)))[2,2]))

p <- c((coef(summary(glm(data = traits, hmb ~ mat_degree, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ ever_alcohol_preg, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ hdp, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ preeclampsia, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ alcohol_tf1, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ smoked_tf1, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ contraception, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ comorbidity, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = traits, hmb ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ hdp + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ preeclampsia + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ alcohol_tf1 + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ smoked_tf1 + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ contraception + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ comorbidity + mat_edu, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = traits, hmb ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ hdp + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ contraception + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ comorbidity + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ mat_degree, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ ever_alcohol_preg, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ hdp, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ preeclampsia, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ alcohol_tf1, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ smoked_tf1, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ contraception, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ comorbidity, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = traits, cramps ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ hdp + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ preeclampsia + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ alcohol_tf1 + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ smoked_tf1 + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ contraception + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ comorbidity + mat_edu, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = traits, cramps ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ hdp + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ contraception + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ comorbidity + mat_edu + men_age_m, family = binomial)))[2,4]))

lowci <- (estimate-(1.96*se))
upci <- (estimate+(1.96*se))

or <- exp(estimate)
lci <- exp(lowci)
uci <- exp(upci)

coeff_bin_aam <- data.frame(model,exposure,outcome,estimate,se,lowci,upci,or,lci,uci,p)

library(ggplot2)
library(ggstance)
library(dplyr)

p <- coeff_bin_aam %>%
  arrange(exposure) %>%
  mutate(exposure = factor(exposure, levels=c("Participant thyroid problem, endometriosis or PCOS*","Participant contraception use ever in puberty*","Participant smoking at 13 years*","Participant alcohol use at 13 years","Maternal preeclampsia","Maternal HDP","Maternal smoking in pregnancy","Maternal alcohol use in pregnancy", 
                                              "Maternal education*"))) %>%
  arrange(model) %>%
  mutate(model = factor(model, levels=c("Unadjusted","Adjusted for SEP", "Adjusted for SEP & AAM"))) %>%
  ggplot(aes(y=exposure,x=or, xmin=lci, xmax=uci)) +
  geom_pointrange() +
  geom_vline(xintercept = 1, linetype = "dashed", colour = "red") +
  facet_grid(outcome~model) +
  scale_x_continuous(trans='log10') +
  geom_errorbar(aes(xmin=lci, xmax=uci), width=.2, position=position_dodge(.5)) +
  theme_bw() +
  labs(x="Odds ratio (95% CI)",y="Trait") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))

p

# g <- ggplot_gtable(ggplot_build(p))
# strip_both <- which(grepl('strip-', g$layout$name))
# fills <- c("#FFFFFF","#FFFFFF","#FFFFFF","#FFFFFF","#FFFFFF")
# k <- 1
# for (i in strip_both) {
#  j <- which(grepl('rect', g$grobs[[i]]$grobs[[1]]$childrenOrder))
#  g$grobs[[i]]$grobs[[1]]$children[[j]]$gp$fill <- fills[k]
#  k <- k+1
# }
# grid::grid.draw(g)


# Figure 6 continuous
model <- c("Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted",
           "Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP",
           "Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM",
           "Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted",
           "Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP",
           "Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM")

exposure <- c("Maternal BMI (kg/m²)","Participant gestational age at birth","Participant BMI (kg/m²) at 7 years*","Participant cholesterol (mmol/L) at 7 years","Participant cotinine (ng/mL) at 7 years","Participant non-word repetition scores at 8 years","Participant C-reactive protein (mmol/L) at 9 years","Participant age at menarche (months)*","Participant ACE score at 16 years",
              "Maternal BMI (kg/m²)","Participant gestational age at birth","Participant BMI (kg/m²) at 7 years*","Participant cholesterol (mmol/L) at 7 years","Participant cotinine (ng/mL) at 7 years","Participant non-word repetition scores at 8 years","Participant C-reactive protein (mmol/L) at 9 years","Participant age at menarche (months)*","Participant ACE score at 16 years",
              "Maternal BMI (kg/m²)","Participant gestational age at birth","Participant BMI (kg/m²) at 7 years*","Participant cholesterol (mmol/L) at 7 years","Participant cotinine (ng/mL) at 7 years","Participant non-word repetition scores at 8 years","Participant C-reactive protein (mmol/L) at 9 years","Participant age at menarche (months)*","Participant ACE score at 16 years",
              "Maternal BMI (kg/m²)","Participant gestational age at birth","Participant BMI (kg/m²) at 7 years*","Participant cholesterol (mmol/L) at 7 years","Participant cotinine (ng/mL) at 7 years","Participant non-word repetition scores at 8 years","Participant C-reactive protein (mmol/L) at 9 years","Participant age at menarche (months)*","Participant ACE score at 16 years",
              "Maternal BMI (kg/m²)","Participant gestational age at birth","Participant BMI (kg/m²) at 7 years*","Participant cholesterol (mmol/L) at 7 years","Participant cotinine (ng/mL) at 7 years","Participant non-word repetition scores at 8 years","Participant C-reactive protein (mmol/L) at 9 years","Participant age at menarche (months)*","Participant ACE score at 16 years",
              "Maternal BMI (kg/m²)","Participant gestational age at birth","Participant BMI (kg/m²) at 7 years*","Participant cholesterol (mmol/L) at 7 years","Participant cotinine (ng/mL) at 7 years","Participant non-word repetition scores at 8 years","Participant C-reactive protein (mmol/L) at 9 years","Participant age at menarche (months)*","Participant ACE score at 16 years")

outcome <- c("Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea")

estimate <- c((coef(summary(glm(data = traits, hmb ~ mat_bmi_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ bestgest_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ bmi_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ chol_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ cotinine_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ nonword_8yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ crp_9yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ men_age_m_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ ace_score_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ mat_bmi_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ bestgest_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ bmi_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ chol_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ nonword_8yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ crp_9yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ men_age_m_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ ace_score_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = traits, hmb ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ mat_bmi_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ bestgest_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ bmi_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ chol_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ cotinine_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ nonword_8yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ crp_9yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ men_age_m_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ ace_score_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ mat_bmi_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ bestgest_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ bmi_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ chol_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ nonword_8yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ crp_9yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ men_age_m_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ ace_score_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = traits, cramps ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,1]))

se <- c((coef(summary(glm(data = traits, hmb ~ mat_bmi_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ bestgest_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ bmi_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ chol_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ cotinine_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ nonword_8yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ crp_9yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ men_age_m_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ ace_score_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ mat_bmi_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ bestgest_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ bmi_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ chol_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ nonword_8yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ crp_9yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ men_age_m_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ ace_score_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = traits, hmb ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ mat_bmi_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ bestgest_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ bmi_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ chol_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ cotinine_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ nonword_8yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ crp_9yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ men_age_m_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ ace_score_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ mat_bmi_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ bestgest_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ bmi_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ chol_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ nonword_8yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ crp_9yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ men_age_m_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ ace_score_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = traits, cramps ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,2]))

p <- c((coef(summary(glm(data = traits, hmb ~ mat_bmi_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ bestgest_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ bmi_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ chol_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ cotinine_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ nonword_8yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ crp_9yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ men_age_m_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ ace_score_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ mat_bmi_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ bestgest_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ bmi_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ chol_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ nonword_8yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ crp_9yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ men_age_m_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ ace_score_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = traits, hmb ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ mat_bmi_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ bestgest_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ bmi_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ chol_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ cotinine_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ nonword_8yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ crp_9yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ men_age_m_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ ace_score_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ mat_bmi_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ bestgest_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ bmi_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ chol_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ nonword_8yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ crp_9yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ men_age_m_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ ace_score_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = traits, cramps ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,4]))

lowci <- (estimate-(1.96*se))
upci <- (estimate+(1.96*se))

or <- exp(estimate)
lci <- exp(lowci)
uci <- exp(upci)

# OR, lci & uci derived similarly to Fig 5
coeff_cont_aam <- data.frame(model,exposure,outcome,estimate,se,lowci,upci,or,lci,uci,p)

p <- coeff_cont_aam %>%
  arrange(exposure) %>%
  mutate(exposure = factor(exposure, levels=c("Participant ACE score at 16 years","Participant age at menarche (months)*","Participant C-reactive protein (mmol/L) at 9 years","Participant non-word repetition scores at 8 years",
                                              "Participant cotinine (ng/mL) at 7 years","Participant cholesterol (mmol/L) at 7 years","Participant BMI (kg/m²) at 7 years*","Participant gestational age at birth","Maternal BMI (kg/m²)"))) %>%
  arrange(model) %>%
  mutate(model = factor(model, levels=c("Unadjusted","Adjusted for SEP","Adjusted for SEP & AAM"))) %>%
  ggplot(aes(y=exposure,x=or, xmin=lci, xmax=uci)) +
  geom_pointrange() +
  geom_vline(xintercept = 1, linetype = "dashed", colour = "red") +
  facet_grid(outcome~model) +
  scale_x_continuous(trans='log10') +
  geom_errorbar(aes(xmin=lci, xmax=uci), width=.2, position=position_dodge(.5)) +
  theme_bw() +
  labs(x="Odds ratio (95%CI)",y="Trait") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))

p

