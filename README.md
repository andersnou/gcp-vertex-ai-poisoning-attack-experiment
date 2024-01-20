# gcp-vertex-ai-poisoning-attack

## Data

The dataset is the Stanford Dogs Dataset from http://vision.stanford.edu/aditya86/ImageNetDogs/.
The dataset can also be downloaded from the link.

The dataset contains images of 120 dog breeds with approximately 150 images per class. There is a total of 20 580 images.

## Scripts

There are some bash scripts stored in the `scripts` folder that help with distributing training and test datasets.

The `copy-training-data.sh` and `copy-test-data.sh` scripts can be used to distribute the training and test data from the `data/stanford-dogs-images` folder that contains all the dog images from the Stanford Dogs dataset. The copy-training script copies the first X files from each subfolder to the specified directory. The copy-test script copies the last X files from each subfolder to the specified directory.

Example usage:

1. Copying the first 10 images for training from the Stanford images folder to the training folder:
```
scripts/copy-training-data.sh data/stanford-dogs-images data/training 10
```

2. Copying the last 2 images from the Stanford images folder to the test folder
```
scripts/copy-test-data.sh data/stanford-dogs-images data/test 2
```


The `create-data-csv.sh` script is a helper script for creating the required CSV file to prepare the data for retraining the model in GCP (as specified in this tutorial https://cloud.google.com/vertex-ai/docs/image-data/classification/prepare-data#csv). The script creates a CSV file with the 

Example usage:
1. Creating the data CSV file
```
scripts/create-data-csv.sh data/test data/test.csv test
```

## Notebook

The `EfficientNetV2.ipynb` notebook covers the preparation, training and testing for the experiment.
The notebook has a training job that retrains the tfhub/EfficientNetV2 model on the specified images.
Furthermore, a test job is described in one of the sections.