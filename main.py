import os

print('running main...\n')

print('SLURM_NODEID\n')
print(os.environ['SLURM_NODEID'])

print('SLURM_PROCID\n')
print(os.environ['SLURM_PROCID'])
