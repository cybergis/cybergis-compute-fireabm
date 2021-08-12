#!/bin/bash

SEED=$(($param_start_value + $SLURM_PROCID))
echo -e "node id: $SLURM_NODEID, task id: $SLURM_PROCID, start number: $param_start_value, SEED: $SEED, result folder: $result_folder\n"
mkdir demo_quick_start$SEED
chmod 755 demo_quick_start$SEED
ls -l
MPLBACKEND=Agg python run_fireabm.py -nv 10 -sd $SEED -epath $result_folder -ofd demo_quick_start$SEED -strat dist -rg Sta_Rosa_2000.pkl -exdsc 'demo_run' -strd 1.0
