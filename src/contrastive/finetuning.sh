#!/bin/bash

LEARNING_RATE="0.00005"
BATCH_SIZE="512"
TEMPERATURE="0.07"

run_command() {
    command=$1
    start_time=$(date +"%Y-%m-%d %H:%M:%S")
    echo "======================================================="
    echo "Starting: $command"
    echo "Start Time: $start_time"
    echo "======================================================="
    eval $command
    if [ $? -ne 0 ]; then
        echo "Error: Command failed - $command"
        exit 1
    else
        end_time=$(date +"%Y-%m-%d %H:%M:%S")
        echo "Completed: $command"
        echo "End Time: $end_time"
        echo "======================================================="
    fi
}


commands=(
    "bash abtbuy/run_finetune_siamese_frozen_nosplit_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE"
    "bash abtbuy/run_finetune_siamese_frozen_nosplit_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE all-"
    "bash abtbuy/run_finetune_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE"
    "bash abtbuy/run_finetune_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE all-"
    "bash abtbuy/run_finetune_siamese_unfrozen_nosplit_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE"
    "bash abtbuy/run_finetune_siamese_unfrozen_nosplit_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE all-"
    "bash abtbuy/run_finetune_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE"
    "bash abtbuy/run_finetune_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE all-"
    "bash abtbuy/run_finetune_ssv_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE"
    "bash abtbuy/run_finetune_ssv_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE all-"
    "bash abtbuy/run_finetune_ssv_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE"
    "bash abtbuy/run_finetune_ssv_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE all-"
    "bash amazongoogle/run_finetune_siamese_frozen_nosplit_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE"
    "bash amazongoogle/run_finetune_siamese_frozen_nosplit_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE all-"
    "bash amazongoogle/run_finetune_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE"
    "bash amazongoogle/run_finetune_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE all-"
    "bash amazongoogle/run_finetune_siamese_unfrozen_nosplit_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE"
    "bash amazongoogle/run_finetune_siamese_unfrozen_nosplit_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE all-"
    "bash amazongoogle/run_finetune_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE"
    "bash amazongoogle/run_finetune_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE all-"
    "bash amazongoogle/run_finetune_ssv_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE"
    "bash amazongoogle/run_finetune_ssv_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE all-"
    "bash amazongoogle/run_finetune_ssv_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE"
    "bash amazongoogle/run_finetune_ssv_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE all-"
    "bash lspc/run_finetune_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE small"
    "bash lspc/run_finetune_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE small all-"
    "bash lspc/run_finetune_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE small"
    "bash lspc/run_finetune_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE small all-"
    "bash lspc/run_finetune_ssv_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE small"
    "bash lspc/run_finetune_ssv_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE small all-"
    "bash lspc/run_finetune_ssv_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE small"
    "bash lspc/run_finetune_ssv_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE small all-"
    "bash lspc/run_finetune_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE medium"
    "bash lspc/run_finetune_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE medium all-"
    "bash lspc/run_finetune_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE medium"
    "bash lspc/run_finetune_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE medium all-"
    "bash lspc/run_finetune_ssv_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE medium"
    "bash lspc/run_finetune_ssv_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE medium all-"
    "bash lspc/run_finetune_ssv_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE medium"
    "bash lspc/run_finetune_ssv_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE medium all-"
    "bash lspc/run_finetune_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE large"
    "bash lspc/run_finetune_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE large all-"
    "bash lspc/run_finetune_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE large"
    "bash lspc/run_finetune_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE large all-"
    "bash lspc/run_finetune_ssv_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE large"
    "bash lspc/run_finetune_ssv_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE large all-"
    "bash lspc/run_finetune_ssv_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE large"
    "bash lspc/run_finetune_ssv_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE large all-"
    "bash lspc/run_finetune_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE xlarge"
    "bash lspc/run_finetune_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE xlarge all-"
    "bash lspc/run_finetune_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE xlarge"
    "bash lspc/run_finetune_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE xlarge all-"
    "bash lspc/run_finetune_ssv_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE xlarge"
    "bash lspc/run_finetune_ssv_siamese_frozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE xlarge all-"
    "bash lspc/run_finetune_ssv_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE xlarge"
    "bash lspc/run_finetune_ssv_siamese_unfrozen_roberta.sh $BATCH_SIZE $LEARNING_RATE $TEMPERATURE xlarge all-"
)

trap ctrl_c INT

function ctrl_c() {
    echo "Execution stopped by the user."
    exit 1
}

for cmd in "${commands[@]}"; do
    run_command "$cmd"
done

echo "FINISHED!"
