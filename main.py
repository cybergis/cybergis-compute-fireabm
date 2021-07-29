import os
import subprocess

### print info about running script! ----- vvv

print('running main...\n')

print('SLURM_NODEID: ')
sys_node_id = os.environ['SLURM_NODEID']
print(sys_node_id)

print('SLURM_PROCID: ')
sys_task_id = os.environ['SLURM_NODEID']
print(sys_task_id)

### print info about running script! ----- ^^^

out_path = os.getcwd()  # save current path as working directory

if not os.path.isdir('demo_quick_start'):  # create output directory
    os.mkdir('demo_quick_start')

### run simulation!

# set up arguments
args = ["python run_fireabm.py -nv 10 -sd ",
		sys_task_id, # the random seed is set to the task id
		" -epath ",
		out_path, # the outpath is set to the current directory
		"-ofd demo_quick_start -strat dist -rg Sta_Rosa_2000.pkl",
		" -exdsc 'demo_run' -strd 1.0"]

# for this example, only run with 10 or fewer tasks
if int(os.environ['SLURM_NTASKS']) > 10:
	print("please resubmit with 10 or fewer tasks")
else:
	return_value = subprocess.call(args)