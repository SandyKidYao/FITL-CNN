#!/usr/bin/env sh
# Create the imagenet lmdb inputs
# N.B. set the path to the imagenet train + val data dirs

EXAMPLE=../../yyp/JAFVIS
DATA=../../yyp/JAFVIS
TOOLS=../../build/tools

TRAIN_DATA_ROOT=../../yyp/JAFVIS/
VAL_DATA_ROOT=../../yyp/JAFVIS/

# Set RESIZE=true to resize the images to 256x256. Leave as false if images have
# already been resized using another tool.
RESIZE=false
if $RESIZE; then
  RESIZE_HEIGHT=64
  RESIZE_WIDTH=64
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

if [ ! -d "$TRAIN_DATA_ROOT" ]; then
  echo "Error: TRAIN_DATA_ROOT is not a path to a directory: $TRAIN_DATA_ROOT"
  echo "Set the TRAIN_DATA_ROOT variable in create_jaffe.sh to the path" \
       "where the Jaffe training data is stored."
  exit 1
fi

if [ ! -d "$VAL_DATA_ROOT" ]; then
  echo "Error: VAL_DATA_ROOT is not a path to a directory: $VAL_DATA_ROOT"
  echo "Set the VAL_DATA_ROOT variable in create_jaffe.sh to the path" \
       "where the Jaffe validation data is stored."
  exit 1
fi

echo "Creating ER lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    $TRAIN_DATA_ROOT \
    $DATA/visER.txt \
    $EXAMPLE/jafvis_er_lmdb

echo "Creating ID lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    $VAL_DATA_ROOT \
    $DATA/visID.txt \
    $EXAMPLE/jafvis_id_lmdb

echo "Done."
