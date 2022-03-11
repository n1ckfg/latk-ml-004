# Informative Drawings: Learning to generate line drawings that convey geometry and semantics

### [[project page]](TODO) [[paper]](TODO) [[video]](TODO) [[demo]](TODO)


## Setup

### Clone this repository

```
git clone https://github.com/carolineec/informative-drawings.git
cd informative-drawings
```

### Install dependencies
We provide an environment.yml file listing the dependences and to create a conda environment. Our model uses Pytorch 1.7.1

```
conda env create -f environment.yml
conda activate drawings
```

## Testing
Pre-trained model is available [here](https://drive.google.com/file/d/1up167zkluR-RIUdr433JbQU43_w9hbgg/view?usp=sharing), place the model weights in `checkpoints`.

```
cd checkpoints
unzip model.zip
```

run pre-trained model on images in `--dataroot`. Replace `examples ` with the folder path containing your input images.

```
python test.py --name contourstyle --dataroot examples
```

Results will be saved to the `results` directory by default. You can change the save location by specifying the file path with `--results_dir`. 

## Training

We provide a pre-trained networks for mapping ImageNet features into depth images [here](https://drive.google.com/file/d/1XYpn7Kgr7HaSnNOVdOeAhAX8FM4YAitl/view?usp=sharing). Place the pre-trained features to depth network in the `./checkpoints/feats2Geom` folder.

```
cd checkpoints/feats2Geom
unzip feats2depth.zip
```

To train a model from scratch use the following command.

```
python train.py --name contourstyle \
--dataroot pathtophotographs \
--depthroot pathtodepthdataset \
--root2 pathtolinedrawings \
--no_flip
```
Because the model start making grayscale photos if trained enough, it is recommended to save model checkpoints frequently by using `--save_epoch_freq 1`.

## Citation

If you find this work useful please use the following citation:

```
TODO
```

## Acknowledgements

Model code adapted from [pix2pixHD](https://github.com/NVIDIA/pix2pixHD) and [pytorch-CycleGAN-and-pix2pix](https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix)
