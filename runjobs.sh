#!/bin/tcsh

echo -e "node id: $SLURM_NODEID, task id: $SLURM_PROCID, start number: $param_start_value\n"

[ ! -d "/$result_folder/" ] && echo "Directory /$result_folder/ DOES NOT exist" 
[ -d "/$result_folder/" ] && echo "Directory /$result_folder/ DOES exist" 

# python run_fireabm.py -nv 10 -sd $seed -epath $out_path -ofd demo_quick_start -strat dist -rg Sta_Rosa_2000.pkl -exdsc 'demo_run' -strd 1.0
