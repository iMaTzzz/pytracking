#!/bin/bash

echo ""
echo ""
echo "****************** Installing pytorch with cuda10 ******************"
#conda install -y pytorch torchvision cudatoolkit=10.0 -c pytorch
#pip install torch==1.13.1+cu116 torchvision==0.14.1+cu116 --extra-index-url https://download.pytorch.org/whl/cu116
pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113

echo ""
echo ""
echo "****************** Installing matplotlib ******************"
conda install -y matplotlib

echo ""
echo ""
echo "****************** Installing pandas ******************"
conda install -y pandas

echo ""
echo ""
echo "****************** Installing tqdm ******************"
conda install -y tqdm

echo ""
echo ""
echo "****************** Installing opencv ******************"
pip install opencv-python

echo ""
echo ""
echo "****************** Installing tensorboard ******************"
pip install tb-nightly

echo ""
echo ""
echo "****************** Installing visdom ******************"
pip install visdom

echo ""
echo ""
echo "****************** Installing scikit-image ******************"
pip install scikit-image

echo ""
echo ""
echo "****************** Installing tikzplotlib ******************"
pip install tikzplotlib

echo ""
echo ""
echo "****************** Installing gdown ******************"
pip install gdown

echo ""
echo ""
echo "****************** Installing cython ******************"
conda install -y cython

echo ""
echo ""
echo "****************** Installing coco toolkit ******************"
pip install pycocotools

echo ""
echo ""
echo "****************** Installing LVIS toolkit ******************"
pip install lvis


echo ""
echo ""
echo "******** Installing spatial-correlation-sampler. Note: This is required only for KYS tracker **********"
pip install spatial-correlation-sampler

echo ""
echo ""
echo "****************** Installing jpeg4py python wrapper ******************"
pip install jpeg4py 

echo ""
echo ""
echo "****************** Installing timm ******************"
pip install timm 

echo ""
echo ""
echo "****************** Installing ninja-build to compile PreROIPooling ******************"
echo "************************* Need sudo privilege ******************"
sudo apt-get install ninja-build

echo ""
echo ""
echo "****************** Downloading networks ******************"
mkdir pytracking/networks

echo ""
echo ""
echo "****************** DiMP50 Network ******************"
gdown https://drive.google.com/uc\?id\=1qgachgqks2UGjKx-GdO1qylBDdB1f9KN -O pytracking/networks/dimp50.pth
# gdown https://drive.google.com/uc\?id\=1MAjrRJDCbL0DSjUKFyDkUuYS1-cYBNjk -O pytracking/networks/dimp18.pth

# echo ""
# echo ""
# echo "****************** ATOM Network ******************"
# gdown https://drive.google.com/uc\?id\=1VNyr-Ds0khjM0zaq6lU-xfY74-iWxBvU -O pytracking/networks/atom_default.pth

# echo ""
# echo ""
# echo "****************** ECO Network ******************"
# gdown https://drive.google.com/uc\?id\=1aWC4waLv_te-BULoy0k-n_zS-ONms21S -O pytracking/networks/resnet18_vggmconv1.pth

echo ""
echo ""
echo "****************** Setting up environment ******************"
python -c "from pytracking.evaluation.environment import create_default_local_file; create_default_local_file()"
python -c "from ltr.admin.environment import create_default_local_file; create_default_local_file()"


echo ""
echo ""
echo "****************** Installing jpeg4py ******************"
sudo apt-get install libturbojpeg

echo ""
echo ""
echo "****************** Installation complete! ******************"

echo ""
echo ""
echo "****************** More networks can be downloaded from the google drive folder https://drive.google.com/drive/folders/1WVhJqvdu-_JG1U-V0IqfxTUa1SBPnL0O ******************"
echo "****************** Or, visit the model zoo at https://github.com/visionml/pytracking/blob/master/MODEL_ZOO.md ******************"
