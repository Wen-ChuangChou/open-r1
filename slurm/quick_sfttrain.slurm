#!/bin/bash
#SBATCH --job-name=open-r1-sft
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
######SBATCH --exclusive
######SBATCH --gres=gpu:1
#SBATCH --gpus-per-node=4
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#SBATCH --time=2:00:00
#SBATCH --partition=capella  # Adjust this for your cluster
#SBATCH --output=./logs/%x-%j.out
#SBATCH --err=./logs/%x-%j.err
#SBATCH --mail-user=wen-chuang.chou@tu-dresden.de
#SBATCH --mail-type=ALL
######SBATCH --requeue


module load release/24.04  GCCcore/13.2.0 Python/3.11.5 CUDA/12.4.0
source env/openr1/bin/activate

srun accelerate launch --config_file recipes/accelerate_configs/zero3.yaml src/open_r1/sft.py \
    --config recipes/Qwen2.5-1.5B-Instruct/sft/my_config.yaml