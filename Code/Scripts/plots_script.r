##############################################################################################################################################################
#                                                                                                                                                            #
#       Generating plots for prevalence of outcomes in ALSPAC                                                                                                #
#       Author:       Flo Martin                                                                                                                             #
#       Date started: 23/11/2020                                                                                                                             #
#                                                                                                                                                            #
##############################################################################################################################################################

# The following uses mp1_nofactor_nofactor with NO FACTOR VALUES for each timepoint variable!!

load("/Users/ti19522/OneDrive - University of Bristol/Documents/PhD/Year 1/Mini Project 1/R Data/mp1_nofactor_nofactor.Rda")

# To make a nice plot of prevalence of dysmenorrhea & menorrhagia in ALSPAC, I am generating a new data frame

timepoints <- c(8,9,10,11,13,14,15,16,17)

men <- c(sum(mp1_nofactor$hmb_8yr,na.rm = TRUE),sum(mp1_nofactor$hmb_9yr,na.rm = TRUE),sum(mp1_nofactor$hmb_10yr,na.rm = TRUE),
         sum(mp1_nofactor$hmb_11yr,na.rm = TRUE),sum(mp1_nofactor$hmb_13yr,na.rm = TRUE),sum(mp1_nofactor$hmb_14yr,na.rm = TRUE),
         sum(mp1_nofactor$hmb_15yr,na.rm = TRUE),sum(mp1_nofactor$hmb_16yr,na.rm = TRUE),sum(mp1_nofactor$hmb_17yr,na.rm = TRUE))
         
dys <- c(sum(mp1_nofactor$cramps_8yr,na.rm = TRUE),sum(mp1_nofactor$cramps_9yr,na.rm = TRUE),sum(mp1_nofactor$cramps_10yr,na.rm = TRUE),
         sum(mp1_nofactor$cramps_11yr,na.rm = TRUE),sum(mp1_nofactor$cramps_13yr,na.rm = TRUE),sum(mp1_nofactor$cramps_14yr,na.rm = TRUE),
         sum(mp1_nofactor$cramps_15yr,na.rm = TRUE),sum(mp1_nofactor$cramps_16yr,na.rm = TRUE),sum(mp1_nofactor$cramps_17yr,na.rm = TRUE))
         
men_dr <- c(sum(mp1_nofactor$dr_hmb_8yr,na.rm = TRUE),sum(mp1_nofactor$dr_hmb_9yr,na.rm = TRUE),sum(mp1_nofactor$dr_hmb_10yr,na.rm = TRUE),
            sum(mp1_nofactor$dr_hmb_11yr,na.rm = TRUE),sum(mp1_nofactor$dr_hmb_13yr,na.rm = TRUE),sum(mp1_nofactor$dr_hmb_14yr,na.rm = TRUE),
            sum(mp1_nofactor$dr_hmb_15yr,na.rm = TRUE),sum(mp1_nofactor$dr_hmb_16yr,na.rm = TRUE),sum(mp1_nofactor$dr_hmb_17yr,na.rm = TRUE))
            
dys_dr <- c(sum(mp1_nofactor$dr_cramps_8yr,na.rm = TRUE),sum(mp1_nofactor$dr_cramps_9yr,na.rm = TRUE),sum(mp1_nofactor$dr_cramps_10yr,na.rm = TRUE),
            sum(mp1_nofactor$dr_cramps_11yr,na.rm = TRUE),sum(mp1_nofactor$dr_cramps_13yr,na.rm = TRUE),sum(mp1_nofactor$dr_cramps_14yr,na.rm = TRUE),
            sum(mp1_nofactor$dr_cramps_15yr,na.rm = TRUE),sum(mp1_nofactor$dr_cramps_16yr,na.rm = TRUE),sum(mp1_nofactor$dr_cramps_17yr,na.rm = TRUE))
            
started <- c(sum(mp1_nofactor$started_period_8yr,na.rm = TRUE),sum(mp1_nofactor$started_period_9yr,na.rm = TRUE),
             sum(mp1_nofactor$started_period_10yr,na.rm = TRUE),sum(mp1_nofactor$started_period_11yr,na.rm = TRUE),
             sum(mp1_nofactor$started_period_13yr,na.rm = TRUE),sum(mp1_nofactor$started_period_14yr,na.rm = TRUE),
             sum(mp1_nofactor$started_period_15yr,na.rm = TRUE),sum(mp1_nofactor$started_period_16yr,na.rm = TRUE),
             sum(mp1_nofactor$started_period_17yr,na.rm = TRUE))
             
prop_men <- c((men/started)*100)
prop_dys <- c((dys/started)*100)

prop_men_dr <- c((men_dr/men)*100)
prop_dys_dr <- c((dys_dr/dys)*100)

Plots <- data.frame(timepoints,men,dys,started,prop_men,prop_dys,men_dr,dys_dr,prop_men_dr,prop_dys_dr)

library(ggplot2)

# This plot shows, for each outcome, how many women are suffering out the number of girls who stated that they had started their period at each timepoint
plot <- ggplot(Plots, aes(timepoints)) + 
  geom_line(aes(y = prop_men, colour = "Proportion of women suffering from menorrhagia")) + 
  geom_line(aes(y = prop_dys, colour = "Proportion of women suffering from dysmenorrhea"))

plot + scale_x_continuous(name="Timepoints (years)", breaks = c(8,9,10,11,13,14,15,16,17)) +
  scale_y_continuous(name="Proportion (%)", limits=c(0, 85)) + theme_classic() + 
  scale_color_manual(values=c("#CC6666", "#9999CC")) + ggtitle("Proportion of women suffering from dysmenorrhea & menorrhagia in ALSPAC") 
  + labs(colour = "Outcomes")

# This plot shows, for each outcome, how many women visited the dr out of the girls who had stated that they had experienced the outcome
plot <- ggplot(Plots, aes(timepoints)) + 
  geom_line(aes(y = prop_men_dr, colour = "Visiting the dr for menorrhagia")) + 
  geom_line(aes(y = prop_dys_dr, colour = "Visiting the dr for dysmenorrhea"))

plot + scale_x_continuous(name="Timepoints (years)", breaks = c(8,9,10,11,13,14,15,16,17)) +
  scale_y_continuous(name="Proportion (%)", limits=c(0, 85)) + theme_classic() + 
  scale_color_manual(values=c("#CC6666", "#9999CC")) + ggtitle("Proportion of women visiting the dr for dysmenorrhea & menorrhagia in ALSPAC") 
  + labs(colour = "Outcomes")

# This plot shows how many girls reported menorrhagia & how many went to the dr
plot <- ggplot(Plots, aes(timepoints)) + 
  geom_line(aes(y = prop_men, colour = "Experienced menorrhagia")) + 
  geom_line(aes(y = prop_men_dr, colour = "Visited the dr"))

plot + scale_x_continuous(name="Timepoints (years)", breaks = c(8,9,10,11,13,14,15,16,17)) +
  scale_y_continuous(name="Proportion (%)", limits=c(0, 40)) + theme_classic() + 
  scale_color_manual(values=c("#CC6666", "#9999CC")) + ggtitle("Proportion of women experiencing menorrhagia vs visiting the dr") + labs(colour = "Outcomes")

# This plot shows how many girls reported dysmenorrhea & how many went to the dr
plot <- ggplot(Plots, aes(timepoints)) + 
  geom_line(aes(y = prop_dys, colour = "Experienced dysmenorrhea")) + 
  geom_line(aes(y = prop_dys_dr, colour = "Visited the dr"))

plot + scale_x_continuous(name="Timepoints (years)", breaks = c(8,9,10,11,13,14,15,16,17)) +
  scale_y_continuous(name="Proportion (%)", limits=c(0, 85)) + theme_classic() + 
  scale_color_manual(values=c("#CC6666", "#9999CC")) + ggtitle("Proportion of women experiencing dysmenorrhea vs visiting the dr") + labs(colour = "Outcomes")



