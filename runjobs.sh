#!/bin/tcsh

SEED=param_start_value+SLURM_PROCID
echo -e "node id: $SLURM_NODEID, task id: $SLURM_PROCID, start number: $param_start_value, SEED: $SEED\n"
