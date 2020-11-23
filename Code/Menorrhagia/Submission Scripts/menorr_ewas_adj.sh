
#!/bin/bash
#
#
#PBS -l nodes=1:ppn=1,walltime=12:00:00

WORK_DIR="/newhome/ti19522/EWAS/alspac_menstruation_project"
module add languages/R-3.6.3

R CMD BATCH --no-save --no-restore '--args menorr_ewas houseman Cells Pheno B 15up age_meth,men_age_m,contraception_meth,mat_edu,mat_occ_class,reg_smoker,reg_drinker,comorbidity /newhome/ti19522/EWAS/alspac_menstruation_project' /newhome/ti19522/common_files/meffil_EWAS_script.r /newhome/ti19522/EWAS/alspac_menstruation_project/menorr_ewas_adj.out

