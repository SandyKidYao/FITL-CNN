#!/usr/bin/env sh
# Compute the mean image from the imagenet training lmdb
# N.B. this is available in data/ilsvrc12

EXAMPLE=../JAFID
DATA=../JAFID
TOOLS=../../build/tools

$TOOLS/compute_image_mean $EXAMPLE/jaffe_train_lmdb \
  $EXAMPLE/jaffe_mean_id.binaryproto

echo "Done."
