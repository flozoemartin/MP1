##############################################################################################################################################################
#                                                                                                                                                            #
#       Supplementary material for mini project 1 manuscript                                                                                                 #
#       Author:         Flo Martin                                                                                                                           #
#       Date started:   19/11/2020                                                                                                                           #
#       Date finished:  21/12/2021                                                                                                                           #
#                                                                                                                                                            #
##############################################################################################################################################################

# Contents #
# line 18 - Environment management #
# line 27 - Figure 1 #
# line 220 - Figure 2 #
# line 447 - Table 3 #
# line 514 - Table 4 #
# line 547 - Table 5 #

setwd("location/of/the/data/")
load("mp1.Rda")
load("traits.Rda")
load("traits_comorbidrm.Rda")

library(ggstance)
library(ggplot2)
library(dplyr)

# Figure 1 - coefficient plot of binary traits identified a prioiri and hypothesis-gen EWAS with cases of comorbidity removed

model <- c("Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted",
           "Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP",
           "Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM",
           "Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted",
           "Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP",
           "Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM")

exposure <- c("Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 13 years","Participant smoking at 13 years*","Participant contraception use ever in puberty*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 13 years","Participant smoking at 13 years*","Participant contraception use ever in puberty*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 13 years","Participant smoking at 13 years*","Participant contraception use ever in puberty*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 13 years","Participant smoking at 13 years*","Participant contraception use ever in puberty*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 13 years","Participant smoking at 13 years*","Participant contraception use ever in puberty*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 13 years","Participant smoking at 13 years*","Participant contraception use ever in puberty*")

outcome <- c("Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea")

estimate <- c((coef(summary(glm(data = comorbidrm, hmb ~ mat_degree, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ hdp, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ alcohol_tf1, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ smoked_tf1, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ contraception, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ hdp + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ alcohol_tf1 + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ smoked_tf1 + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ contraception + mat_edu, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ hdp + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ contraception + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ mat_degree, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ hdp, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ alcohol_tf1, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ smoked_tf1, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ contraception, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ hdp + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ alcohol_tf1 + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ smoked_tf1 + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ contraception + mat_edu, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ hdp + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ contraception + mat_edu + men_age_m, family = binomial)))[2,1]))

se <- c((coef(summary(glm(data = comorbidrm, hmb ~ mat_degree, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ hdp, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ alcohol_tf1, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ smoked_tf1, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ contraception, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ hdp + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ alcohol_tf1 + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ smoked_tf1 + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ contraception + mat_edu, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ hdp + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ contraception + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ mat_degree, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ hdp, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ alcohol_tf1, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ smoked_tf1, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ contraception, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ hdp + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ alcohol_tf1 + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ smoked_tf1 + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ contraception + mat_edu, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ hdp + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ contraception + mat_edu + men_age_m, family = binomial)))[2,2]))

p <- c((coef(summary(glm(data = comorbidrm, hmb ~ mat_degree, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ hdp, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ alcohol_tf1, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ smoked_tf1, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ contraception, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ hdp + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ alcohol_tf1 + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ smoked_tf1 + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ contraception + mat_edu, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ hdp + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ contraception + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ mat_degree, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ hdp, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ alcohol_tf1, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ smoked_tf1, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ contraception, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ hdp + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ alcohol_tf1 + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ smoked_tf1 + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ contraception + mat_edu, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ hdp + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ contraception + mat_edu + men_age_m, family = binomial)))[2,4]))

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

# Figure 2 - coefficient plot of continuous traits identified a prioiri and hypothesis-gen EWAS with cases of comorbidity removed

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

estimate <- c((coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ bestgest_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ bmi_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ chol_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ nonword_8yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ crp_9yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ men_age_m_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ ace_score_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ bestgest_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ bmi_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ chol_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ nonword_8yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ crp_9yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ men_age_m_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ ace_score_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = comorbidrm, hmb ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ bestgest_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ bmi_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ chol_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ nonword_8yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ crp_9yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ men_age_m_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ ace_score_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ bestgest_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ bmi_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ chol_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ nonword_8yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ crp_9yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ men_age_m_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ ace_score_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = comorbidrm, cramps ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,1]))

se <- c((coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ bestgest_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ bmi_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ chol_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ nonword_8yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ crp_9yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ men_age_m_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ ace_score_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ bestgest_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ bmi_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ chol_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ nonword_8yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ crp_9yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ men_age_m_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ ace_score_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = comorbidrm, hmb ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ bestgest_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ bmi_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ chol_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ nonword_8yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ crp_9yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ men_age_m_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ ace_score_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ bestgest_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ bmi_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ chol_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ nonword_8yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ crp_9yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ men_age_m_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ ace_score_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = comorbidrm, cramps ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,2]))

p <- c((coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ bestgest_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ bmi_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ chol_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ nonword_8yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ crp_9yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ men_age_m_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ ace_score_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ bestgest_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ bmi_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ chol_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ nonword_8yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ crp_9yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ men_age_m_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ ace_score_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = comorbidrm, hmb ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ bestgest_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ bmi_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ chol_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ nonword_8yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ crp_9yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ men_age_m_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ ace_score_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ bestgest_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ bmi_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ chol_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ nonword_8yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ crp_9yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ men_age_m_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ ace_score_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = comorbidrm, cramps ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,4]))

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

# Table 3 - comparison of characteristics of less severe cases (reported it but not been to the doctor) vs never reported it
# Maternal educational attainment
table(mp1$mat_degree, mp1$cramps_sens, useNA = "always")
table(mp1$mat_degree, mp1$hmb_sens, useNA = "always")

# Age at onset of menarche
group_by(mp1, cramps_sens) %>%
  summarise(
    count = n(),
    mean = mean(men_age_m, na.rm = TRUE),
    sd = sd(men_age_m, na.rm = TRUE),
    median = median(men_age_m, na.rm = TRUE)
  )
aggregate(x = mp1$men_age_m,
          by = list(mp1$cramps_sens),
          FUN = mean,
          na.rm = TRUE) 
# Number of missing in AAM variable
table(mp1$men_age_cc, mp1$cramps_sens)

group_by(mp1, hmb_sens) %>%
  summarise(
    count = n(),
    mean = mean(men_age_m, na.rm = TRUE),
    sd = sd(men_age_m, na.rm = TRUE),
    median = median(men_age_m, na.rm = TRUE)
  )
aggregate(x = mp1$men_age_m,
          by = list(mp1$hmb_sens),
          FUN = mean,
          na.rm = TRUE) 
# Number of missing in AAM variable
table(mp1$men_age_cc, mp1$hmb_sens)

# BMI at 17 years old
group_by(mp1, cramps_sens) %>%
  summarise(
    count = n(),
    mean = mean(bmi, na.rm = TRUE),
    sd = sd(bmi, na.rm = TRUE),
    median = median(bmi, na.rm = TRUE)
  )

table(mp1$bmi_cc, mp1$cramps_sens)

group_by(mp1, hmb_sens) %>%
  summarise(
    count = n(),
    mean = mean(bmi, na.rm = TRUE),
    sd = sd(bmi, na.rm = TRUE),
    median = median(bmi, na.rm = TRUE)
  )

table(mp1$bmi_cc, mp1$hmb_sens)

# Cotinine at 17 years old
table(mp1$reg_smoker, mp1$cramps_sens, useNA = "always")
table(mp1$reg_smoker, mp1$hmb_sens, useNA = "always")

# Contraception any time during puberty
table(mp1$contraception_ewas, mp1$cramps_sens, useNA = "always")
table(mp1$contraception_ewas, mp1$hmb_sens, useNA = "always")

# Comorbidity reported by age 22
table(mp1$comorbidity_cc, mp1$cramps_sens, useNA = "always")
table(mp1$comorbidity_cc, mp1$hmb_sens, useNA = "always")

# Table 4 - binary characteristics from the coefficient plots proportion showing missing
# Maternal educational attainment
table(traits$mat_degree, traits$cramps, useNA = "always")
table(traits$mat_degree, traits$hmb, useNA = "always")

# Alcohol exposure during pregnancy
table(traits$ever_alcohol_preg, traits$cramps, useNA = "always")
table(traits$ever_alcohol_preg, traits$hmb, useNA = "always")

# Smoking exposure during pregnancy
table(traits$smoking_mother_ever_pregnancy_binary, traits$cramps, useNA = "always")
table(traits$smoking_mother_ever_pregnancy_binary, traits$hmb, useNA = "always")

# Maternal HDP
table(traits$hdp, traits$cramps, useNA = "always")
table(traits$hdp, traits$hmb, useNA = "always")

# Maternal preeclampsia
table(traits$preeclampsia, traits$cramps, useNA = "always")
table(traits$preeclampsia, traits$hmb, useNA = "always")

# Drinking at 17 years old
table(traits$reg_drinker, traits$cramps, useNA = "always")
table(traits$reg_drinker, traits$hmb, useNA = "always")

# Contraception any time during puberty
table(traits$contraception, traits$cramps, useNA = "always")
table(traits$contraception, traits$hmb, useNA = "always")

# Comorbidity by the age of 22
table(traits$comorbidity, traits$cramps, useNA = "always")
table(traits$comorbidity, traits$hmb, useNA = "always")

# Table 5 - continous characteristics from the coefficient plots proportion showing missing
# Maternal pre-pregnancy BMI
aggregate(x = traits$mat_bmi,
          by = list(traits$cramps),
          FUN = mean,
          na.rm = TRUE) 
aggregate(x = traits$mat_bmi,
          by = list(traits$cramps),
          FUN = sd,
          na.rm = TRUE) 

aggregate(x = traits$mat_bmi,
          by = list(traits$hmb),
          FUN = mean,
          na.rm = TRUE) 
aggregate(x = traits$mat_bmi,
          by = list(traits$hmb),
          FUN = sd,
          na.rm = TRUE) 

table(traits$mat_bmi_cc, traits$cramps)
table(traits$mat_bmi_cc, traits$hmb)

# Gestational age at delivery
aggregate(x = traits$bestgest,
          by = list(traits$cramps),
          FUN = mean,
          na.rm = TRUE) 
aggregate(x = traits$bestgest,
          by = list(traits$cramps),
          FUN = sd,
          na.rm = TRUE) 

aggregate(x = traits$bestgest,
          by = list(traits$hmb),
          FUN = mean,
          na.rm = TRUE) 
aggregate(x = traits$bestgest,
          by = list(traits$hmb),
          FUN = sd,
          na.rm = TRUE) 

table(traits$gest_cc, traits$cramps)
table(traits$gest_cc, traits$hmb)

# Cognitive score at age 6
aggregate(x = traits$cognitive_score_6yr,
          by = list(traits$cramps),
          FUN = mean,
          na.rm = TRUE)
aggregate(x = traits$cognitive_score_6yr,
          by = list(traits$cramps),
          FUN = sd,
          na.rm = TRUE)

aggregate(x = traits$cognitive_score_6yr,
          by = list(traits$hmb),
          FUN = mean,
          na.rm = TRUE)
aggregate(x = traits$cognitive_score_6yr,
          by = list(traits$hmb),
          FUN = sd,
          na.rm = TRUE)

table(traits$cog_score_cc, traits$cramps)
table(traits$cog_score_cc, traits$hmb)

# Age at onset of menarche
aggregate(x = traits$men_age_m,
          by = list(traits$cramps),
          FUN = mean,
          na.rm = TRUE)
aggregate(x = traits$men_age_m,
          by = list(traits$cramps),
          FUN = sd,
          na.rm = TRUE)

aggregate(x = traits$men_age_m,
          by = list(traits$hmb),
          FUN = mean,
          na.rm = TRUE)
aggregate(x = traits$men_age_m,
          by = list(traits$hmb),
          FUN = sd,
          na.rm = TRUE)

table(traits$men_age_cc, traits$cramps)
table(traits$men_age_cc, traits$hmb)

# Cumulative ACE score at age 16
aggregate(x = traits$ace_score,
          by = list(traits$cramps),
          FUN = mean,
          na.rm = TRUE) 
aggregate(x = traits$ace_score,
          by = list(traits$cramps),
          FUN = sd,
          na.rm = TRUE) 

aggregate(x = traits$ace_score,
          by = list(traits$hmb),
          FUN = mean,
          na.rm = TRUE) 
aggregate(x = traits$ace_score,
          by = list(traits$hmb),
          FUN = sd,
          na.rm = TRUE) 

table(traits$ace_cc, traits$cramps)
table(traits$ace_cc, traits$hmb)

# BMI at 17 years old
aggregate(x = traits$bmi,
          by = list(traits$cramps),
          FUN = mean,
          na.rm = TRUE) 
aggregate(x = traits$bmi,
          by = list(traits$cramps),
          FUN = sd,
          na.rm = TRUE) 

aggregate(x = traits$bmi,
          by = list(traits$hmb),
          FUN = mean,
          na.rm = TRUE) 
aggregate(x = traits$bmi,
          by = list(traits$hmb),
          FUN = sd,
          na.rm = TRUE) 

table(traits$bmi_cc, traits$cramps)
table(traits$bmi_cc, traits$hmb)

# Cotinine at 17 years old
aggregate(x = traits$cotinine_tf4,
          by = list(traits$cramps),
          FUN = mean,
          na.rm = TRUE) 
aggregate(x = traits$cotinine_tf4,
          by = list(traits$cramps),
          FUN = sd,
          na.rm = TRUE) 

aggregate(x = traits$cotinine_tf4,
          by = list(traits$hmb),
          FUN = mean,
          na.rm = TRUE) 
aggregate(x = traits$cotinine_tf4,
          by = list(traits$hmb),
          FUN = sd,
          na.rm = TRUE)

table(traits$reg_smoker, traits$cramps)
table(traits$reg_smoker, traits$hmb)

# CRP at 17 years old
aggregate(x = traits$crp_tf4,
          by = list(traits$cramps),
          FUN = mean,
          na.rm = TRUE) 
aggregate(x = traits$crp_tf4,
          by = list(traits$cramps),
          FUN = sd,
          na.rm = TRUE) 

aggregate(x = traits$crp_tf4,
          by = list(traits$hmb),
          FUN = mean,
          na.rm = TRUE) 
aggregate(x = traits$crp_tf4,
          by = list(traits$hmb),
          FUN = sd,
          na.rm = TRUE) 

table(traits$crp_cc, traits$cramps)
table(traits$crp_cc, traits$hmb)

# Total serum cholesterol at 17 years old
aggregate(x = traits$serum_chol_tf4,
          by = list(traits$cramps),
          FUN = mean,
          na.rm = TRUE) 
aggregate(x = traits$serum_chol_tf4,
          by = list(traits$cramps),
          FUN = sd,
          na.rm = TRUE) 

aggregate(x = traits$serum_chol_tf4,
          by = list(traits$hmb),
          FUN = mean,
          na.rm = TRUE) 
aggregate(x = traits$serum_chol_tf4,
          by = list(traits$hmb),
          FUN = sd,
          na.rm = TRUE) 

table(traits$chol_cc, traits$cramps)
table(traits$chol_cc, traits$hmb)

# Supplementary figure 3
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

estimate <- c((coef(summary(glm(data = traits, hmb_sens ~ mat_degree, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ ever_alcohol_preg, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ hdp, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ preeclampsia, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ alcohol_tf1, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ smoked_tf1, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ contraception, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ comorbidity, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = traits, hmb_sens ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ hdp + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ preeclampsia + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ alcohol_tf1 + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ smoked_tf1 + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ contraception + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ comorbidity + mat_edu, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = traits, hmb_sens ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ hdp + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ contraception + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ comorbidity + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ mat_degree, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ ever_alcohol_preg, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ hdp, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ preeclampsia, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ alcohol_tf1, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ smoked_tf1, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ contraception, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ comorbidity, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = traits, cramps_sens ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ hdp + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ preeclampsia + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ alcohol_tf1 + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ smoked_tf1 + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ contraception + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ comorbidity + mat_edu, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = traits, cramps_sens ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ hdp + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ contraception + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ comorbidity + mat_edu + men_age_m, family = binomial)))[2,1]))

se <- c((coef(summary(glm(data = traits, hmb_sens ~ mat_degree, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ ever_alcohol_preg, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ hdp, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ preeclampsia, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ alcohol_tf1, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ smoked_tf1, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ contraception, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ comorbidity, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = traits, hmb_sens ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ hdp + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ preeclampsia + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ alcohol_tf1 + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ smoked_tf1 + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ contraception + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ comorbidity + mat_edu, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = traits, hmb_sens ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ hdp + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ contraception + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ comorbidity + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ mat_degree, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ ever_alcohol_preg, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ hdp, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ preeclampsia, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ alcohol_tf1, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ smoked_tf1, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ contraception, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ comorbidity, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = traits, cramps_sens ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ hdp + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ preeclampsia + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ alcohol_tf1 + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ smoked_tf1 + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ contraception + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ comorbidity + mat_edu, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = traits, cramps_sens ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ hdp + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ contraception + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ comorbidity + mat_edu + men_age_m, family = binomial)))[2,2]))

p <- c((coef(summary(glm(data = traits, hmb_sens ~ mat_degree, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ ever_alcohol_preg, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ hdp, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ preeclampsia, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ alcohol_tf1, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ smoked_tf1, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ contraception, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ comorbidity, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = traits, hmb_sens ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ hdp + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ preeclampsia + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ alcohol_tf1 + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ smoked_tf1 + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ contraception + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ comorbidity + mat_edu, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = traits, hmb_sens ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ hdp + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ contraception + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ comorbidity + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ mat_degree, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ ever_alcohol_preg, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ hdp, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ preeclampsia, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ alcohol_tf1, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ smoked_tf1, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ contraception, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ comorbidity, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = traits, cramps_sens ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ hdp + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ preeclampsia + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ alcohol_tf1 + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ smoked_tf1 + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ contraception + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ comorbidity + mat_edu, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = traits, cramps_sens ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ hdp + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ alcohol_tf1 + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ smoked_tf1 + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ contraception + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ comorbidity + mat_edu + men_age_m, family = binomial)))[2,4]))

lowci <- (estimate-(1.96*se))
upci <- (estimate+(1.96*se))

or <- exp(estimate)
lci <- exp(lowci)
uci <- exp(upci)

coeff_bin_aam_sens <- data.frame(model,exposure,outcome,estimate,se,lowci,upci,or,lci,uci,p)

library(ggplot2)

p <- coeff_bin_aam_sens %>%
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

# Supplementary figure 4 continuous
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

estimate <- c((coef(summary(glm(data = traits, hmb_sens ~ mat_bmi_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ bestgest_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ bmi_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ chol_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ cotinine_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ nonword_8yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ crp_9yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ men_age_m_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ ace_score_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ mat_bmi_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ bestgest_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ bmi_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ chol_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ nonword_8yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ crp_9yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ men_age_m_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ ace_score_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, hmb_sens ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = traits, hmb_sens ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ mat_bmi_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ bestgest_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ bmi_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ chol_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ cotinine_7yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ nonword_8yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ crp_9yr_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ men_age_m_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ ace_score_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ mat_bmi_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ bestgest_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ bmi_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ chol_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ nonword_8yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ crp_9yr_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ men_age_m_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ ace_score_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = traits, cramps_sens ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = traits, cramps_sens ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,1]))

se <- c((coef(summary(glm(data = traits, hmb_sens ~ mat_bmi_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ bestgest_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ bmi_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ chol_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ cotinine_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ nonword_8yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ crp_9yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ men_age_m_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ ace_score_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ mat_bmi_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ bestgest_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ bmi_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ chol_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ nonword_8yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ crp_9yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ men_age_m_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ ace_score_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, hmb_sens ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = traits, hmb_sens ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ mat_bmi_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ bestgest_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ bmi_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ chol_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ cotinine_7yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ nonword_8yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ crp_9yr_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ men_age_m_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ ace_score_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ mat_bmi_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ bestgest_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ bmi_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ chol_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ nonword_8yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ crp_9yr_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ men_age_m_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ ace_score_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = traits, cramps_sens ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = traits, cramps_sens ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,2]))

p <- c((coef(summary(glm(data = traits, hmb_sens ~ mat_bmi_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ bestgest_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ bmi_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ chol_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ cotinine_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ nonword_8yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ crp_9yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ men_age_m_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ ace_score_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ mat_bmi_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ bestgest_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ bmi_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ chol_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ nonword_8yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ crp_9yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ men_age_m_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ ace_score_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, hmb_sens ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = traits, hmb_sens ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ mat_bmi_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ bestgest_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ bmi_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ chol_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ cotinine_7yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ nonword_8yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ crp_9yr_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ men_age_m_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ ace_score_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ mat_bmi_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ bestgest_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ bmi_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ chol_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ cotinine_7yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ nonword_8yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ crp_9yr_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ men_age_m_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ ace_score_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ bestgest_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ bmi_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ chol_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ cotinine_7yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ nonword_8yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = traits, cramps_sens ~ crp_9yr_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = traits, cramps_sens ~ ace_score_z + mat_edu + men_age_m, family = binomial)))[2,4]))

lowci <- (estimate-(1.96*se))
upci <- (estimate+(1.96*se))

or <- exp(estimate)
lci <- exp(lowci)
uci <- exp(upci)

# OR, lci & uci derived similarly to Fig 5
coeff_cont_aam_sens <- data.frame(model,exposure,outcome,estimate,se,lowci,upci,or,lci,uci,p)

p <- coeff_cont_aam_sens %>%
  arrange(exposure) %>%
  mutate(exposure = factor(exposure, levels=c("Participant ACE score at 16 years","Participant age at menarche (months)*","Participant C-reactive protein (mmol/L) at 9 years","Participant non-word repetition scores at 8 years",
                                              "Participant cotinine (ng/mL) at 7 years","Participant cholesterol (mmol/L) at 7 years","Participant BMI (kg/m²) at 7 years*","Participant gestational age at birth","Maternal BMI (kg/m²)"))) %>%
  arrange(model) %>%
  mutate(model = factor(model, levels=c("Unadjusted","Adjusted for SEP","Adjusted for SEP & AAM"))) %>%
  ggplot(aes(y=exposure,x=or, xmin=lci, xmax=uci)) +
  geom_pointrange() +
  geom_vline(xintercept = 1, linetype = "dashed", colour = "red") +
  facet_grid(outcome~model) +
  scale_x_continuous(trans='log10', breaks = c(0.8,1,1.5)) +
  geom_errorbar(aes(xmin=lci, xmax=uci), width=.2, position=position_dodge(.5)) +
  theme_bw() +
  labs(x="Odds ratio (95%CI)",y="Trait") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))


p


