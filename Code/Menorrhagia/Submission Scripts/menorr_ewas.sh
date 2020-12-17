

#!/bin/bash

#PBS -N menorr_ewas
#PBS -l select=1:ncpus=1:mem=900M
#PBS -l walltime=12:00:00

WORK_DIR="/home/ti19522/EWAS/alspac_menstruation_project"
module add lang/r/4.0.3-bioconductor-gcc
cd $WORK_DIR
R CMD BATCH --no-save --no-restore /home/ti19522/EWAS/alspac_menstruation_project/scripts/menorr_ewas.R /home/ti19522/EWAS/alspac_menstruation_project/ewas_results/menorr_ewas.out
