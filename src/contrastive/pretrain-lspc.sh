#!/bin/bash
BATCH_SIZE="1024"
LEARNING_RATE="0.00005"
TEMPERATURE="0.07"
AUG="all-"

commands=(
    "run_pretraining_roberta.sh"
    "run_pretraining_ssv_roberta.sh"
)

sizes=("small" "medium" "large" "xlarge")


print_message() {
    local timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$timestamp] ==========================================================================="
    echo "[$timestamp] Running: $1"
    echo "[$timestamp] Dataset: $2"
    echo "[$timestamp] Command: $3"
    echo "[$timestamp] Batch Size: $BATCH_SIZE"
    echo "[$timestamp] Learning Rate: $LEARNING_RATE"
    echo "[$timestamp] Temperature: $TEMPERATURE"
    if [ -n "$4" ]; then
        echo "[$timestamp] Size: $4"
    fi
    if [ -n "$5" ]; then
        echo "[$timestamp] Aug: $5"
    fi
    echo "[$timestamp] ==========================================================================="
}

handle_interrupt() {
    echo "[$(date +"%Y-%m-%d %H:%M:%S")] Script interrupted. Aborting all runs."
    exit 1
}

trap handle_interrupt SIGINT


# Run commands for lspc with sizes
for size in "${sizes[@]}"; do
    for cmd in "${commands[@]}"; do
        print_message "Pre-training" "lspc" $cmd $size
        bash lspc/$cmd $BATCH_SIZE $LEARNING_RATE $TEMPERATURE $size
        print_message "Pre-training" "lspc" $cmd $size $AUG
        bash lspc/$cmd $BATCH_SIZE $LEARNING_RATE $TEMPERATURE $size $AUG
    done
done

echo "[$(date +"%Y-%m-%d %H:%M:%S")] All tasks completed successfully."
