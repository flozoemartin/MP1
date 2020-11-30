# Analysis Plan for MP1

Author:   Flo Martin (adapted from analysis plan by Dr Gemma Sharp 09/10/20)

Date:     28/10/2020

## Research Question   
What risk factors are associated with menorrhagia and dysmenorrhea in puberty? Is DNA methylation a risk factor in its own right (mechanistically involved in the 
manifestation of these symptoms) or could be a biomarker of other risk factors (which may be causal or predictive)?

## Overview
I am going to using the Avon Longitudinal Study of Parents and Children (ALSPAC) cohort to investigate heavy menstrual bleeding (menorrhagia) and painful periods
(dysmenorrhea) from the onset of menarche throughout puberty. I will first describe the prevalence of these symptoms in ALSPAC at each timepoint from age 8 to age
17 and whether medical advice was sought for these symptoms at each timepoint. I will then describe the prevalence of **ever** visiting the doctor between the ages
of 8 and 17 for either of these symptoms. This will form the descriptive part of my analyses.

Having described the prevalence of both of these symptoms, I will then move onto the second part investigating the role of DNA methylation in heavy or painful
periods. The Accessible Resource for Integrated Epigenomic Studies (ARIES) is a population-based resource of DNA methylation for 1000 mother-child pairs from
ALSPAC (1). Using bluecrystal, I will merge my dataset with data from the methylation "samplesheet" and derive cleaned covariates for each participant. Using this
dataset, I will perform **hypothesis-free EWAS** to identify other risk factors for painful or heavy periods. I will summarise these initial findings then perform
enrichment analyses. Finally, I will run **adjusted EWAS** to identify methylated sites/regions that might be causally related to heavy/painful periods.

### Section 1 - Preparing & cleaning the ALSPAC data

- [x] _**Extract ALSPAC Data**_
  - [x] Extract the ALSPAC variables on periods, menorrhagia and dysmenorrhea from the puberty questionnaires:
    - `pub110-910` for started periods
    - `pub315-915` for normal number of days bleeding
    - `pub120-920` for menorrhagia 
    - `pub122-922` for dysmenorrhea
    - `pub723` for severity of dysmenorrhea    
    - `pub121-921` for visiting a doctor for menorrhagia 
    - `pub123-923` `pub724` for visiting a doctor for dysmenorrhea
  - [x] Extract covariate information: 
    - `men_age` `men_agey` for age at onset of menarche
    - `pub127-927` `ccxf2000-2004` `ccxf3004-3005` for hormonal contraception use
    - `pub128-928` for presence of a thyroid problem
    - `YPB1217` for endometriosis
    - `YPB1216` for polycystic ovary syndrome (PCOS)
    - `YPA3310` for pregnancies
    - `pub105-905` & `fh3019` for body mass index (BMI)
    - `pub109-909` for participation in vigorous physical activity
    - `c645a` `c755` for family socioeconomic position (maternal education & occupational class)
    - `fh8450` `fh8455` `fjsm350` `fjsm450` for smoking
    - `fh8511` `fjal1000` for alcohol
 
 - [x] _**Clean & prepare ALSPAC variables for EWAS**_
    - [x] Rename each variable from ALSPAC identifier to easy to recognise name
    - [x] Assign labels to each category within the categorical variables for ease of use, using the built PDFs in the ALSPAC catalogue
    - [x] Replace any "Missing" or "Not stated" or -10 etc. categories with NA for compatability with R
    - [x] Switch the order of yes and no 1 and 2 to yes and no 0 and 1
    - [x] Derive separate clean variables of interest:
       - `menorr_ewas` for having ever visited the doctor for menorrhagia during puberty ≥1 time (1) or not (experienced outcome & not visited the doctor and not           experienced the outcome) (0)
       - `dysmen_ewas` for having ever visited the doctor for dysmenorrhea during puberty ≥1 time (1) or not (experienced outcome & not visited the doctor and not           experienced the outcome) (0)
    - [x] Derive smoking and alcohol variables for regular vs not regular at each timepoint (15 and 17 years)
       - `reg_smoker_15yr` `reg_smoker_17yr` for regular smoker
       - `reg_drinker_15yr` `reg_drinker_17yr` for regular drinker
       
- [x] _**Merge ALSPAC data with methylation "samplesheet" on bluecrystal**_ available here:

    /panfs/panasas01/dedicated-mrcieu/studies/latest/alspac/epigenetic/methylation/450k/aries/released/2016-05-03/data/samplesheet/data.Robj    

- [x] _**Derive & clean covariates**_ 
  - [x] Derive covariates at the time methylation measurements were taken at a clinic held when the young woman was either 15 or 17 years old:
    - `bmi_meth` BMI at time of methylation measurement
    - `age_meth` age at time of methylation measurement
    - `men_age_m` for age at onset of menarche
    - `contraception_meth` oral contraception at time of methylation measurement
    - `mat_edu` mother's educational attainment at birth
    - `mat_occ_class` mother's occupation at birth
    - `reg_smoker` smoking status (ever regular vs not regular) at time of methylation measurement    
    - `reg_drinker` drinking (alcohol) status (ever regular vs not regular) at time of methylation measurement
    - `comorbidity` any diagnosed endocrinopathy (thyroid problem) or reproductive pathology (PCOS or endometriosis) by the end of puberty
  - [x] Check over dataset for all variables & covariates needed for Step 2
  
- [x] _**Save file on RDSF for access via bluecrystal**_ folder 104

### Section 2 - Hypothesis-free epigenome-wide association studies (EWAS)

- [ ] _**Adapt the EWAS script for the following models**_
  - [x] (i)   Methylation at adolescence ~ ever having visited the doctor for menorrhagia + surrogate variables for batch + age at time of methylation measurement
  - [x] (ii)  Methylation at adolescence ~ ever having visited the doctor for dysmenorrhea + surrogate variables for batch + age at time of methylation measurement
  - [ ] (iii) Methylation at adolescence ~ ever having visited the doctor for menorrhagia + surrogate variables for batch + age at time of methylation measurement               without adjusting for estimated cells
  - [ ] (iv)  Methylation at adolescence ~ ever having visited the doctor for dysmenorrhea + surrogate variables for batch + age at time of methylation measurement               without adjusting for estimated cells
  - [ ] (v)   Model (i) with all cases of endometriosis, PCOS and thyroid problems removed
  - [ ] (vi)  Model (ii) with all cases of endometriosis, PCOS and thyroid problems removed
  
- [ ] _**Summarise EWAS results**_
  - [ ] Create a table summarising the number of CpGs with FDR-adjusted *p* <0.05 or unadjusted *p* <1x10<sup>-5</sup> for each model and number of DMRs according to `dmrff`. 
  - [ ] Look at correlation in effect estimates between models (i) and (ii) and between models (iii) and (iv): do menorrhagia and dysmenorrhea have similar associations with DNA methylation?
  - [ ] Look at the percentage difference in effect estimates between models (i) and (iii) and between models (ii) and (iv): does removing cases of endocrine and reproductive disorders change the results?
  - [ ] Look at the overlap in top hits from both menorrhagia and dysmenorrhea models
  
- [ ] _**Enrichment analysis**_
  - [ ] EWAS catalog:
    - Download latest version of the EWAS catalog from the website
    - Write R function to check enrichment
    - Run enrichment for top CpGs with *p* < 1x10<sup>-5</sup>
    - Run enrichment for any CpGs with significant DMRs
  - [ ] Bioloigical functions (KEGG and GO terms):
    - Install R package `missMethyl`
    - Run enrichment for top CpGs with *p* < 1x10<sup>-5</sup>
    - Run enrichment for any CpGs with significant DMRs
  - [ ] Summarise results - were there any traits or functions associated with the top EWAS results?
  - [ ] Are any of the identified traits assocaited with menorrhagia or dysmenorrhea in ALSPAC?
    - Go back into the ALSPAC data and extract relevant traits

### Section 3 - Adjusted EWAS   
Useful for identifying methylated sits/regions that might be causally associated with menorrhagia/dysmenorrhea

- [ ] _**Adapt the EWAS script for each of the following models**_
  - [ ] (i) Methylation at adolescence ~ ever visited the doctor for menorrhagia + surrogate variables for batch + age at time of methylation measurement + smoking status + mother's education + mother's occupation + houseman estimated cell counts
  - [ ] (ii) Methylation at adolescence ~ ever visited the doctor for dysmenorrhea + surrogate variables for batch + age at time of methylation measurement + smoking status + mother's education + mother's occupation + houseman estimated cell counts

- [ ] _**Summarise adjusted EWAS results**_
  - [ ] Create a table summarising the dataset including all the covariates
  - [ ] Look at the associations between cell counts and menstrual disorders: cell counts can tell us about systemic inflammation as a risk factor for menorrhagia and dysmenorrhea:
    - Cell proportion ~ menorrhagia
    - Cell proportion ~ dysmenorrhea
    - Cell proportion ~ menorrhagia + age + BMI + contraception + smoking + mother's education + mother's occupation
    - Cell proportion ~ dysmenorrhea + age + BMI + contraception + smoking + mother's education + mother's occupation
    
:tada: Finished Mini Project One! :tada:
  
### References
  1. Relton CL, Gaunt T, McArdle W, et al. Data Resource Profile: Accessible Resource for Integrated Epigenomic Studies (ARIES). Int J Epidemiol. 2015;44(4):1181-1190.
