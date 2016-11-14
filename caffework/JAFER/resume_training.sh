#!/usr/bin/env sh

../../build/tools/caffe train \
    --solver=solver.prototxt \
    --snapshot=caffenet_train_10000.solverstate.h5
