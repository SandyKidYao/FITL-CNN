
# FITL-CNN

A transfer learning research project on facial information processing with Convolutional Neural Networks (CNN).

## Project Overview

FITL-CNN focuses on transfer learning techniques applied to facial information processing using CNNs. The project includes experiments on face identification and facial emotion recognition using two datasets: CK+ and JAFFE.

## Environment Requirements

- **Operating System**: Ubuntu 14.04
- **GPU**: NVIDIA GPU with compute capability > 2.0
- **Software**:
  - Matlab 2015a
  - Caffe and its dependencies:
    - CUDA 7.5
    - CUDNN 4.0
    - ATLAS
    - OpenCV 3.0
    - Google Logging Library
    - Python 2.7
    - Python Notebook

## Installation

1. **Caffe Installation**:
   Follow the [official Caffe installation guide](http://caffe.berkeleyvision.org/installation.html) for Linux.

2. **Matlab and Dimensionality Reduction Toolbox**:
   - Ensure Matlab is installed with all basic toolboxes.
   - Install [drtoolbox](https://lvdmaaten.github.io/drtoolbox/).

## Project Structure

- `readme.md`: This file
- `matlab/`: Matlab scripts and drtoolbox
- `caffe/`: Caffe scripts and caffe-master
  - `yyp/`: Custom scripts (copy to your Caffe root if Caffe is already installed)

## Usage

### 1. Training CNNs

#### 1.1 Face Identification on CK+ Dataset
1. Navigate to `caffe/yyp/CKID/`
2. Build databases (if not existing):
   ```
   ./create_ckid_imdb.sh
   ./make_ckid_mean.sh
   ```
3. Train CNN:
   ```
   ./train_ckid.sh
   ```

#### 1.2 Facial Emotion Recognition on CK+ Dataset
1. Navigate to `caffe/yyp/CKER/`
2. Build databases (if not existing):
   ```
   ./create_cker_imdb.sh
   ./make_cker_mean.sh
   ```
3. Train CNN:
   ```
   ./train_cker.sh
   ```

#### 1.3 Face Identification on JAFFE Dataset
1. Navigate to `caffe/yyp/JAFID/`
2. Build databases (if not existing):
   ```
   ./create_jaffe_imdb.sh
   ./make_jaffe_mean.sh
   ```
3. Train CNN:
   ```
   ./train_jaffe.sh
   ```

#### 1.4 Facial Emotion Recognition on JAFFE Dataset
1. Navigate to `caffe/yyp/JAFER/`
2. Follow the same steps as in 1.3

### 2. Transfer Learning Experiments

#### 2.1 CK+ Dataset
1. Run Python Notebook with root permissions
2. Open `caffe/yyp/CK EXP SCRIPT/CK_TRANS.ipynb`
3. Follow the instructions in the notebook to run the experiment

#### 2.2 JAFFE Dataset
1. Run Python Notebook with root permissions
2. Open `caffe/yyp/JAFFE EXP SCRIPT/JAFFE_TRANS.ipynb`
3. Follow the instructions in the notebook to run the experiment

### 3. Data Visualization Experiments

#### 3.1 CK+ Dataset
1. Navigate to `caffe/yyp/CKVIS/`
2. Create databases if needed:
   ```
   ./create_ckvis_imdb.sh
   ```
3. Run Python Notebook and open `caffe/yyp/CK EXP SCRIPT/CK_VIS.ipynb`
4. Follow the notebook instructions
5. Run Matlab scripts:
   ```matlab
   addpath(genpath('matlab/drtoolbox'));
   ck_vis_out;
   ck_vis_dis;
   ```

#### 3.2 JAFFE Dataset
1. Navigate to `caffe/yyp/JAFVIS/`
2. Follow similar steps as in 3.1, using JAFFE-specific scripts

## Notes

- Results may vary slightly if databases are recreated due to random selection of training and testing data.
- For CNN structure or hyperparameter modifications, backup and edit the respective `train_val.prototxt` and `solver.prototxt` files.

## Contributing

Please contact the project maintainers for information on contributing to this research project.

