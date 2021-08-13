#!/bin/bash

SEED=$(($param_start_value + $SLURM_PROCID))
echo -e "node id: $SLURM_NODEID, task id: $SLURM_PROCID, start number: $param_start_value, SEED: $SEED, result folder: $result_folder\n"

pwd
mkdir $result_folder/demo_quick_start$SEED
chmod 755 $result_folder/demo_quick_start$SEED

if [ $SLURM_PROCID -eq 0 ];
then
  echo "copying over files"
  cp $executable_folder/Sta_Rosa_2000.pkl $result_folder/Sta_Rosa_2000.pkl
  cp -R $executable_folder/fire_input $result_folder/fire_input
  cp -R $executable_folder/households $result_folder/households
fi

MPLBACKEND=Agg python run_fireabm.py -nv 10 -sd $SEED -epath $result_folder -ofd demo_quick_start$SEED -strat dist -rg Sta_Rosa_2000.pkl -exdsc 'demo_run' -strd 1.0
