

#!/bin/bash
#
#
#PBS -l nodes=1:ppn=1,walltime=12:00:00

WORK_DIR="/newhome/ti19522/EWAS/alspac_menstruation_project"
module add languages/R-3.4.1-ATLAS

R CMD BATCH --no-save --no-restore '--args dysmen_ewas houseman Cells mp1 B 15up age_meth,men_age_m,contraception_meth,mat_edu,mat_occ_class,reg_smoker,reg_drinker,comorbidity /newhome/ti19522/EWAS' /newhome/ti19522/common_files/meffil_EWAS_script.r /newhome/ti19522/EWAS/alspac_menstruation_project/dysmen_ewas.out
