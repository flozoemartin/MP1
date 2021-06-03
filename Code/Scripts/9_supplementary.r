##############################################################################################################################################################
#                                                                                                                                                            #
#       Supplementary material for mini project 1 manuscript                                                                                                 #
#       Author:         Flo Martin                                                                                                                           #
#       Date started:   19/11/2020                                                                                                                           #
#       Date finished:  03/06/2021                                                                                                                           #
#                                                                                                                                                            #
##############################################################################################################################################################

setwd("/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/Mini Project 1/R Data/Data")
load("mp1.Rda")
load("traits.Rda")
load("traits_comorbidrm.Rda")

library(ggstance)
library(ggplot2)
library(dplyr)

# Figure 1 - coefficient plot of binary traits identified a prioiri and hypothesis-gen EWAS with cases of comorbidity removed

model <- c("Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted",
           "Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP",
           "Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM",
           "Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted",
           "Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP",
           "Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM")

exposure <- c("Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 17 years","Participant contraception use ever in puberty*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 17 years","Participant contraception use ever in puberty*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 17 years","Participant contraception use ever in puberty*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 17 years","Participant contraception use ever in puberty*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 17 years","Participant contraception use ever in puberty*",
              "Maternal education*","Maternal alcohol use in pregnancy","Maternal smoking in pregnancy","Maternal HDP","Maternal preeclampsia","Participant alcohol use at 17 years","Participant contraception use ever in puberty*")

outcome <- c("Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea")

estimate <- c((coef(summary(glm(data = comorbidrm, hmb ~ mat_degree, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ hdp, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ reg_drinker, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ contraception, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ hdp + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ reg_drinker + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ contraception + mat_edu, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ hdp + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ reg_drinker + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ contraception + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ mat_degree, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ hdp, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ reg_drinker, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ contraception, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ hdp + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ reg_drinker + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ contraception + mat_edu, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ hdp + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ reg_drinker + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ contraception + mat_edu + men_age_m, family = binomial)))[2,1]))


se <- c((coef(summary(glm(data = comorbidrm, hmb ~ mat_degree, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ hdp, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ reg_drinker, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ contraception, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ hdp + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ reg_drinker + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ contraception + mat_edu, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ hdp + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ reg_drinker + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ contraception + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ mat_degree, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ hdp, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ reg_drinker, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ contraception, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ hdp + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ reg_drinker + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ contraception + mat_edu, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ hdp + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ reg_drinker + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ contraception + mat_edu + men_age_m, family = binomial)))[2,2]))


p <- c((coef(summary(glm(data = comorbidrm, hmb ~ mat_degree, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ hdp, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ reg_drinker, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ contraception, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ hdp + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ reg_drinker + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ contraception + mat_edu, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = comorbidrm, hmb ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ hdp + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ reg_drinker + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ contraception + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ mat_degree, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ hdp, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ reg_drinker, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ contraception, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ hdp + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ reg_drinker + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ contraception + mat_edu, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = comorbidrm, cramps ~ ever_alcohol_preg + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ smoking_mother_ever_pregnancy_binary + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ hdp + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ preeclampsia + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ reg_drinker + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ contraception + mat_edu + men_age_m, family = binomial)))[2,4]))

lowci <- (estimate-(1.96*se))
upci <- (estimate+(1.96*se))

or <- exp(estimate)
lci <- exp(lowci)
uci <- exp(upci)

comorbidrm_bin_aam <- data.frame(model,exposure,outcome,estimate,se,lowci,upci,or,lci,uci,p)

p <- comorbidrm_bin_aam %>%
  arrange(exposure) %>%
  mutate(exposure = factor(exposure, levels=c("Participant contraception use ever in puberty*","Participant alcohol use at 17 years","Maternal preeclampsia","Maternal HDP","Maternal smoking in pregnancy","Maternal alcohol use in pregnancy", 
                                              "Maternal education*"))) %>%
  arrange(model) %>%
  mutate(model = factor(model, levels=c("Unadjusted","Adjusted for SEP", "Adjusted for SEP & AAM"))) %>%
  ggplot(aes(y=exposure,x=or,colour=p<0.05, xmin=lci, xmax=uci)) +
  geom_pointrange() +
  geom_vline(xintercept = 1) +
  facet_grid(outcome~model) +
  scale_x_continuous(trans='log10') +
  geom_errorbar(aes(xmin=lci, xmax=uci), width=.2, position=position_dodge(.5)) +
  theme_bw() +
  labs(x="Odds ratio (95% CI)",y="Trait", title="Binary traits associated with dysmenorrhea & menorrhagia with comorbidity cases removed") +
  scale_colour_manual(values=c("#999999", "#660000"), name = "P < 0.05", labels =c("False","True")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))

g <- ggplot_gtable(ggplot_build(p))
strip_both <- which(grepl('strip-', g$layout$name))
fills <- c("#FFFFFF","#FFFFFF","#FFFFFF","#9999CC","#CC6666")
k <- 1
for (i in strip_both) {
  j <- which(grepl('rect', g$grobs[[i]]$grobs[[1]]$childrenOrder))
  g$grobs[[i]]$grobs[[1]]$children[[j]]$gp$fill <- fills[k]
  k <- k+1
}
grid::grid.draw(g)

# Figure 2 - coefficient plot of continuous traits identified a prioiri and hypothesis-gen EWAS with cases of comorbidity removed

model <- c("Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted",
           "Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP",
           "Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM",
           "Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted","Unadjusted",
           "Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP","Adjusted for SEP",
           "Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM","Adjusted for SEP & AAM")

exposure <- c("Maternal BMI (kg/m²)","Gestational age at birth","Cognitive score at 6 years","Age at menarche (months)*","ACE score at 16 years","BMI (kg/m²) at 17 years*","Cotinine (ng/mL) at 17 years","C-reactive protein (mmol/L) at 17 years","Cholesterol (mmol/L) at 17 years",
              "Maternal BMI (kg/m²)","Gestational age at birth","Cognitive score at 6 years","Age at menarche (months)*","ACE score at 16 years","BMI (kg/m²) at 17 years*","Cotinine (ng/mL) at 17 years","C-reactive protein (mmol/L) at 17 years","Cholesterol (mmol/L) at 17 years",
              "Maternal BMI (kg/m²)","Gestational age at birth","Cognitive score at 6 years","Age at menarche (months)*","ACE score at 16 years","BMI (kg/m²) at 17 years*","Cotinine (ng/mL) at 17 years","C-reactive protein (mmol/L) at 17 years","Cholesterol (mmol/L) at 17 years",
              "Maternal BMI (kg/m²)","Gestational age at birth","Cognitive score at 6 years","Age at menarche (months)*","ACE score at 16 years","BMI (kg/m²) at 17 years*","Cotinine (ng/mL) at 17 years","C-reactive protein (mmol/L) at 17 years","Cholesterol (mmol/L) at 17 years",
              "Maternal BMI (kg/m²)","Gestational age at birth","Cognitive score at 6 years","Age at menarche (months)*","ACE score at 16 years","BMI (kg/m²) at 17 years*","Cotinine (ng/mL) at 17 years","C-reactive protein (mmol/L) at 17 years","Cholesterol (mmol/L) at 17 years",
              "Maternal BMI (kg/m²)","Gestational age at birth","Cognitive score at 6 years","Age at menarche (months)*","ACE score at 16 years","BMI (kg/m²) at 17 years*","Cotinine (ng/mL) at 17 years","C-reactive protein (mmol/L) at 17 years","Cholesterol (mmol/L) at 17 years")

outcome <- c("Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia","Menorrhagia",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea",
             "Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea","Dysmenorrhea")

estimate <- c((coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ gest_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ cog_score_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ men_age_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ ace_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ bmi_17_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ crp_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ chol_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ gest_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ cog_score_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ men_age_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ ace_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ bmi_17_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ crp_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ chol_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ gest_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ cog_score_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = comorbidrm, hmb ~ ace_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ bmi_17_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ crp_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, hmb ~ chol_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ gest_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ cog_score_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ men_age_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ ace_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ bmi_17_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ crp_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ chol_z, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ gest_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ cog_score_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ men_age_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ ace_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ bmi_17_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ crp_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ chol_z + mat_edu, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ gest_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ cog_score_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              NA,
              (coef(summary(glm(data = comorbidrm, cramps ~ ace_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ bmi_17_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ crp_z + mat_edu + men_age_m, family = binomial)))[2,1]),
              (coef(summary(glm(data = comorbidrm, cramps ~ chol_z + mat_edu + men_age_m, family = binomial)))[2,1]))

se <- c((coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ gest_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ cog_score_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ men_age_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ ace_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ bmi_17_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ crp_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ chol_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ gest_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ cog_score_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ men_age_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ ace_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ bmi_17_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ crp_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ chol_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ gest_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ cog_score_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = comorbidrm, hmb ~ ace_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ bmi_17_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ crp_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, hmb ~ chol_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ gest_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ cog_score_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ men_age_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ ace_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ bmi_17_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ crp_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ chol_z, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ gest_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ cog_score_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ men_age_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ ace_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ bmi_17_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ crp_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ chol_z + mat_edu, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ gest_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ cog_score_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        NA,
        (coef(summary(glm(data = comorbidrm, cramps ~ ace_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ bmi_17_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ crp_z + mat_edu + men_age_m, family = binomial)))[2,2]),
        (coef(summary(glm(data = comorbidrm, cramps ~ chol_z + mat_edu + men_age_m, family = binomial)))[2,2]))

p <- c((coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ gest_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ cog_score_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ men_age_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ ace_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ bmi_17_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ crp_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ chol_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ gest_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ cog_score_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ men_age_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ ace_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ bmi_17_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ crp_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ chol_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ gest_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ cog_score_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = comorbidrm, hmb ~ ace_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ bmi_17_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ cotinine_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ crp_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, hmb ~ chol_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ gest_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ cog_score_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ men_age_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ ace_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ bmi_17_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ crp_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ chol_z, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ gest_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ cog_score_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ men_age_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ ace_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ bmi_17_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ crp_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ chol_z + mat_edu, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ mat_bmi_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ gest_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ cog_score_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       NA,
       (coef(summary(glm(data = comorbidrm, cramps ~ ace_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ bmi_17_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ cotinine_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ crp_z + mat_edu + men_age_m, family = binomial)))[2,4]),
       (coef(summary(glm(data = comorbidrm, cramps ~ chol_z + mat_edu + men_age_m, family = binomial)))[2,4]))

lowci <- (estimate-(1.96*se))
upci <- (estimate+(1.96*se))

or <- exp(estimate)
lci <- exp(lowci)
uci <- exp(upci)

comorbidrm_cont_aam <- data.frame(model,exposure,outcome,estimate,se,lowci,upci,or,lci,uci,p)

p <- comorbidrm_cont_aam %>%
  arrange(exposure) %>%
  mutate(exposure = factor(exposure, levels=c("Cholesterol (mmol/L) at 17 years","C-reactive protein (mmol/L) at 17 years","Cotinine (ng/mL) at 17 years","BMI (kg/m²) at 17 years*",
                                              "ACE score at 16 years","Age at menarche (months)*","Cognitive score at 6 years","Gestational age at birth","Maternal BMI (kg/m²)"))) %>%
  arrange(model) %>%
  mutate(model = factor(model, levels=c("Unadjusted","Adjusted for SEP","Adjusted for SEP & AAM"))) %>%
  ggplot(aes(y=exposure,x=or,colour=p<0.05, xmin=lci, xmax=uci)) +
  geom_pointrange() +
  geom_vline(xintercept = 1) +
  facet_grid(outcome~model) +
  scale_x_continuous(trans='log10') +
  geom_errorbar(aes(xmin=lci, xmax=uci), width=.2, position=position_dodge(.5)) +
  theme_bw() +
  labs(x="Odds ratio (95%CI)",y="Trait", title="Continuous traits associated with dysmenorrhea & menorrhagia with comorbidity cases removed") +
  scale_colour_manual(values=c("#999999", "#660000"), name = "P < 0.05", labels =c("False","True")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"))

g <- ggplot_gtable(ggplot_build(p))
strip_both <- which(grepl('strip-', g$layout$name))
fills <- c("#FFFFFF","#FFFFFF", "#FFFFFF","#9999CC","#CC6666")
k <- 1
for (i in strip_both) {
  j <- which(grepl('rect', g$grobs[[i]]$grobs[[1]]$childrenOrder))
  g$grobs[[i]]$grobs[[1]]$children[[j]]$gp$fill <- fills[k]
  k <- k+1
}
grid::grid.draw(g)

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
