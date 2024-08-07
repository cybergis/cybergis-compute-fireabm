#!/bin/bash

echo "starting runjobs.sh"

echo "installing networkx and osmnx"
pip install --upgrade networkx==2.5.1 --quiet
pip install --upgrade osmnx==1.0.1 --quiet

echo "installing networkx and osmnx complete"

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

MPLBACKEND=Agg python run_fireabm.py -nv 2 -sd $SEED -epath $result_folder -ofd demo_quick_start$SEED -strat dist -rg Sta_Rosa_2000.pkl -exdsc 'demo_run' -strd 1.0


if [ $SLURM_PROCID -eq 0 ];
then
  echo "checking in result folder"
  ls -l $result_folder/demo_quick_start$SEED
  echo "cleaning up"
  rm $result_folder/Sta_Rosa_2000.pkl
  rm -r $result_folder/fire_input
  rm -r $result_folder/households
fi
