#!/usr/bin/bash

# for Mac temp files cleaning
find . -name "._*" -type f -print
find . -name "._*" -type f -delete

# Function to display the confirmation prompt
confirm() {
  echo "WARNING: to prepare safetensors_2_onnx converter env,
                 this cli-tool needs to force reinstalling all necessary pack,
                 from conda to current-conda-env's pip state."
  echo "IT'S A High-Risk Operation! be careful you choose."
  while true; do
    read -r -p "Ops: yes no [y/n] or cancel [c] ?" yn
    case $yn in
    [Yy]*) return 0 ;;
    [Nn]*) return 1 ;;
    [Cc]*)
      echo "CANCELED..."
      exit
      ;;
    *) echo "Please answer YES, NO, or CANCEL." ;;
    esac
  done
}

env_skipped() {
  echo "Skip converter environment security..."
  echo "Try to convert without env_check..."
}

env_prepare() {
  echo "Installing converter environment..."

  conda uninstall safetensors transformers diffusers
  conda uninstall torch torchaudio torchvision
  conda uninstall llvm-openmp intel-openmp
  conda uninstall pyarrow pillow image

  pip install pip_search

  conda install nomkl
  conda install numpy scipy pandas tensorflow
  pip install regex protobuf
  pip install pyarrow pillow image
  pip install numpy scipy pandas tensorflow
  pip install torch==2.2.0 torchaudio==2.2.0 torchvision==0.17.0
  pip install safetensors transformers==4.40.0 diffusers
  pip install optimum

  echo "Installed..."
}

# do script
if confirm; then
  env_prepare
else
  env_skipped
fi
