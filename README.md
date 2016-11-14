# FITL-CNN
A transfer learning research on facial information processing with CNN

###########  Environment requirement  ######################

OS: Ubuntu 14.04
GPU: A GPU made by NVIDIA with computability higher than 2.0
Software:
	Matlab 2015a
	Libraries for Caffe:
		1. CUDA 7.5
		2. CUDNN 4.0
		3. ATLAS
		4. OpenCV 3.0
		5. Google Logging Library
		6. Python 2.7
		7. Python Notebook

###########  Prepare works  ######################

1. Install and compile Caffe correctly. The link below is official installation instruction. Please follow this instruction and install Caffe under linux.

	http://caffe.berkeleyvision.org/installation.html

2. Make sure the Matlab is working fine with all the basic toolboxes. Install drtoolbox correctly. The link below is the official site for this toolbox.

	https://lvdmaaten.github.io/drtoolbox/

###########  File information  ######################

1. readme.txt ------ introduction file
2. matlab.zip ------ matlab scripts and drtoolbox
	to run scripts, extract this zip to the matlab root
3. caffe.zip ------- caffe scripts and caffe-master
	to run the scripts, install and compile Caffe first
	if you have installed caffe in your computer, please copy caffe/yyp folder into your caffe root

###########  Code package instruction  ######################

1. Training CNNs

1.1 Training CNNs for face identification on CK+ data set
STEPS:
	1. Open caffe/yyp/CKID folder
	2. Build databases (if the lmdb folders are exist, go to next step)
		a. check the images in 'id_label48'
		b. Run 'create_ckid_imdb.sh' (need root permission)
		c. Run 'make_ckid_mean.sh'
	3. Training CNNs
		a. Run 'train_ckid.sh'
		b. Models could be check in folder 'ckid_mod'
	*4. Change CNN structure
		a. Backup 'train_val.prototxt'
		b. Modify 'train_val.prototxt'
	*5. Modify CNN training hyper-parameters
		a. Backup 'solver.prototxt'
		b. Modify 'solver.prototxt'

	(*not necessary)

1.2 Training CNNs for facial emotion recognition on CK+ data set
STEPS:
	1. Open caffe/yyp/CKER folder
	2. Build databases (if the lmdb folders are exist, go to next step)
		a. check the images in 'er_label48'
		b. Run 'create_cker_imdb.sh' (need root permission)
		c. Run 'make_cker_mean.sh'
	3. Training CNNs
		a. Run 'train_cker.sh'
		b. Models could be check in folder 'cker_mod'
	*4. Change CNN structure
		a. Backup 'train_val.prototxt'
		b. Modify 'train_val.prototxt'
	*5. Modify CNN training hyper-parameters
		a. Backup 'solver.prototxt'
		b. Modify 'solver.prototxt'

	(*not necessary)

1.3 Training CNNs for face identification on JAFFE data set
STEPS:
	1. Open caffe/yyp/JAFID folder
	2. Build databases (if the lmdb folders are exist, go to next step)
		a. check the images in 'jaffe'
		b. Run 'create_jaffe_imdb.sh' (need root permission)
		c. Run 'make_jaffe_mean.sh'
	3. Training CNNs
		a. Run 'train_jaffe.sh'
		b. Models could be check in folder 'jaffe_mod'
	*4. Change CNN structure
		a. Backup 'train_val.prototxt'
		b. Modify 'train_val.prototxt'
	*5. Modify CNN training hyper-parameters
		a. Backup 'solver.prototxt'
		b. Modify 'solver.prototxt'

	(*not necessary)

1.4 Training CNNs for facial emotion recognition on JAFFE data set
STEPS:
	1. Open caffe/yyp/JAFER folder
	2. Build databases (if the lmdb folders are exist, go to next step)
		a. check the images in 'jaffe'
		b. Run 'create_jaffe_imdb.sh' (need root permission)
		c. Run 'make_jaffe_mean.sh'
	3. Training CNNs
		a. Run 'train_jaffe.sh'
		b. Models could be check in folder 'jaffe_mod'
	*4. Change CNN structure
		a. Backup 'train_val.prototxt'
		b. Modify 'train_val.prototxt'
	*5. Modify CNN training hyper-parameters
		a. Backup 'solver.prototxt'
		b. Modify 'solver.prototxt'

	(*not necessary)

1.5 Copy the model trained out of *_mod folder for experiments


2. Transfer learning experiment

2.1 Transfer learning on CK+ data set
STEPS:
	1. Run Python Notebook with root permission
	2. Open script caffe/yyp/CK EXP SCRIPT/CK_TRANS.ipynb
	3. If you want to change the architecture and weights, change variables 'model_def, model_weights' and 'target_solver' to the address for the files you want
	4. Run the script CELL 1 to 3
	5. Run CELL 4 and check the network structure at CELL 4
	6. Run CELL 5 and change the layers to transfer at CELL 5 and check the initial train loss
	7. Run CELL 6 and open the terminal to check the test loss and test acc after fine tuning
	8. Repeat 3-7 to build all 4 types of transferred models with 0-3 transferred layers.

2.2 Transfer learning on JAFFE data set
STEPS:
	1. Run Python Notebook with root permission
	2. Open script caffe/yyp/JAFFE EXP SCRIPT/JAFFE_TRANS.ipynb
	3. If you want to change the architecture and weights, change variables 'model_def, model_weights' and 'target_solver' to the address for the files you want
	4. Run the script CELL 1 to 3
	5. Run CELL 4 and check the network structure at CELL 4
	6. Run CELL 5 and change the layers to transfer at CELL 5 and check the initial train loss
	7. Run CELL 6 and open the terminal to check the test loss and test acc after fine tuning
	8. Repeat 3-7 to build all 4 types of transferred models with 0-3 transferred layers.

3. Data visualization experiment

3.1 Visualization on CK+
STEP:
	1. Open folder caffe/yyp/CKVIS
	2. check *lmdb folders or create them by running 'create_ckvis_imdb.sh'
	3. Run Python Notebook with root permission
	4. Open script caffe/yyp/CK EXP SCRIPT/CK_VIS.ipynb
	5. Run CELL 1-4 and check the network structure
	6. Run CELL 5 to save feature maps into '.mat' database
	7. Run CELL 7 and modify its parameters to view feature maps in square
	8. Run CELL 8 to view weights in first conv layer in square
	9. Run CELL 9 and modify its parameters to view histograms of weights in each conv layer
	10. Run matlab
	11. Change path to /matlab
	12. add matlab/drtoolbox and its subfolder into path
	13. run ck_vis_out.m and view the feature maps for emotion recognition and face identification
	14. run ck_vis_dis.m and view the feature distribution

3.2 Visualization on JAFFE
STEP:
	1. Open folder caffe/yyp/JAFVIS
	2. check *lmdb folders or create them by running 'create_jafvis_imdb.sh'
	3. Run Python Notebook with root permission
	4. Open script caffe/yyp/JAFFE EXP SCRIPT/JAFFE_VIS.ipynb
	5. Run CELL 1-4 and check the network structure
	6. Run CELL 5 to save feature maps into '.mat' database
	7. Run CELL 7 and modify its parameters to view feature maps in square
	8. Run CELL 8 to view weights in first conv layer in square
	9. Run CELL 9 and modify its parameters to view hitograms of weights in each conv layer
	10. Run matlab
	11. Change path to /matlab
	12. add matlab/drtoolbox and its subfolder into path
	13. run jaffe_vis_out.m and view the feature maps for emotion recognition and face identification
	14. run jaffe_vis_dis.m and view the feature distribution


It should be noticed that, if you create the databases you may get different experiment results beacuse the training data and testing data are seleted randomly. The contents of trainig database and testing data base are changed. However, the results shoudn't have large difference.
