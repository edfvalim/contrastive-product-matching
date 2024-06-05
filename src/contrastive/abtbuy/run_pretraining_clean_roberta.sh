#!/bin/bash
#SBATCH --partition=gpu_8
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --time=12:00:00
#SBATCH --export=NONE
BATCH=$1
LR=$2
TEMP=$3
AUG=$4
CUDA_VISIBLE_DEVICES=0 python run_pretraining_deepmatcher.py \
    --do_train \
	--dataset_name=abt-buy \
	--clean=True \
    --train_file /home/eduardovalim/Documents/contrastive-product-matching/data/processed/abt-buy/contrastive/abt-buy-train.pkl.gz \
	--id_deduction_set /home/eduardovalim/Documents/contrastive-product-matching/data/interim/abt-buy/abt-buy-train.json.gz \
	--tokenizer="roberta-base" \
	--grad_checkpoint=True \
    --output_dir /home/eduardovalim/Documents/contrastive-product-matching/reports/contrastive/abtbuy-clean-$AUG$BATCH-$LR-$TEMP-roberta-base/ \
	--temperature=$TEMP \
	--per_device_train_batch_size=$BATCH \
	--learning_rate=$LR \
	--weight_decay=0.01 \
	--num_train_epochs=50 \
	--lr_scheduler_type="linear" \
	--warmup_ratio=0.05 \
	--max_grad_norm=1.0 \
	--fp16 \
	--dataloader_num_workers=4 \
	--disable_tqdm=True \
	--save_strategy="epoch" \
	--logging_strategy="epoch" \
	--augment=$AUG \
