#!/bin/bash

SEED=$(($param_start_value + $SLURM_PROCID))
echo -e "node id: $SLURM_NODEID, task id: $SLURM_PROCID, start number: $param_start_value, SEED: $SEED\n"
mkdir demo_quick_start
MPLBACKEND=Agg python run_fireabm.py -nv 10 -sd $SEED -epath $result_folder -ofd demo_quick_start -strat dist -rg Sta_Rosa_2000.pkl -exdsc 'demo_run' -strd 1.0
