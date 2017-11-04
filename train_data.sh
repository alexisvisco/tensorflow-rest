WORKING_DIR="tf_files"

BOTTLENECK_DIR="$WORKING_DIR/bottlenecks"
STEPS=3000
MODEL_DIR="$WORKING_DIR/inception"
OUTPUT_GRAPH="$WORKING_DIR/retrained_graph.pb"
OUTPUT_LABELS="$WORKING_DIR/retrained_labels.txt"
DATA_FOLDER="$WORKING_DIR/data"

python train.py \
--bottleneck_dir=$BOTTLENECK_DIR \
--how_many_training_steps $STEPS \
--model_dir=$MODEL_DIR \
--output_graph=$OUTPUT_GRAPH \
--output_labels=$OUTPUT_LABELS \
--image_dir $DATA_FOLDER
