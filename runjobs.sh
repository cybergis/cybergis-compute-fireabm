#!/bin/tcsh

echo -e "node id: $SLURM_NODEID, task id: $SLURM_PROCID, start number: $param_start_value\n"

[ ! -d "/$executable_folder/" ] && echo "Directory /$result_folder/ DOES NOT exist" 
[ -d "/$executable_folder/" ] && echo "Directory /$result_folder/ DOES exist" 

