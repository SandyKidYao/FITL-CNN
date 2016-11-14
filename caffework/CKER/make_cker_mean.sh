#!/usr/bin/env sh
# Compute the mean image from the imagenet training lmdb
# N.B. this is available in data/ilsvrc12

EXAMPLE=../../yyp/CKER
DATA=../../yyp/CKER
TOOLS=../../build/tools

$TOOLS/compute_image_mean $EXAMPLE/cker_train_lmdb \
  $DATA/cker_mean.binaryproto

echo "Done."
