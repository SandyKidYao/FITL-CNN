#!/usr/bin/env sh
# Compute the mean image from the imagenet training lmdb
# N.B. this is available in data/ilsvrc12

EXAMPLE=../../yyp/CKID
DATA=../../yyp/CKID
TOOLS=../../build/tools

$TOOLS/compute_image_mean $EXAMPLE/ckid_train_lmdb \
  $DATA/ckid_mean.binaryproto

echo "Done."
