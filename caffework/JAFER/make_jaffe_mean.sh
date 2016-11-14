#!/usr/bin/env sh
# Compute the mean image from the imagenet training lmdb
# N.B. this is available in data/ilsvrc12

EXAMPLE=../JAFER
DATA=../JAFER
TOOLS=../../build/tools


$TOOLS/compute_image_mean $EXAMPLE/jaffe_train_lmdb \
  $EXAMPLE/jaffe_mean_er.binaryproto

echo "Done."
