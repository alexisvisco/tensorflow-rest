# Tensorflow-REST
Tensorflow image classifier with a rest api ! (customisable)

## Description

This repository allow you to train dataset of image to classify external image with a pourcentage.
Example you want to check if an image is a boat, you need to store some images of boat that are really a boat.
Then train data and next you can execute a script with external image, this script will detext if the image is a boat or not.

## Installation 

- First, you need to install python (https://www.python.org/downloads/)
- You need to clone this repo `git clone https://github.com/AlexisVisco/tensorflow-image-rest/`
- Then `cd tensorflow-image-rest`
- Next you need to install all dependencies of this project hopefully just run this command `pip install -r requierments.txt`

You are okay to execute python script now !

## Train a data set ! 

By default, where you have cloned the repository you have a tf_files/data. This is where the magic begins, you need to gather enough image to create a dataset of several collections. 
Yes you can not do just one dataset.

You should have something like that :

```
├── classify.py
├── requierments.txt
├── retrain.py
├── tf_files
│   ├── data
│   │   ├── boats
│   │   │   ├── 00.jpeg
│   │   │   ├── 01.jpeg
│   │   │   ├── 02.jpeg
│   │   │   ├── 03.jpeg
│   │   │   ...
│   │   └── wood
│   │       ├── 00.jpeg
│   │       ├── 01.jpeg
│   │       ├── 02.jpeg
│   │       ...
└── train_data.sh
```

If you have already some dataset to another folder you can edit variable in the training.sh :

```sh
WORKING_DIR="tf_files"

BOTTLENECK_DIR="$WORKING_DIR/bottlenecks"
STEPS=5000
MODEL_DIR="$WORKING_DIR/inception"
OUTPUT_GRAPH="$WORKING_DIR/retrained_graph.pb"
OUTPUT_LABELS="$WORKING_DIR/retrained_labels.txt"
DATA_FOLDER="$WORKING_DIR/data"
...
```

And in the classify.py

```python
...
WORKING_DIRECTORY="tf_files"
TMP_DIRECTORY = "tmp"
TRAINED_LABELS="%s/retrained_labels.txt" % (WORKING_DIRECTORY)
RETRAINED_GRAPH="%s/retrained_graph.pb" % (WORKING_DIRECTORY)
...
```

Then all is done just run `sh train.sh`

You will see something like that : 
![](https://image.prntscr.com/image/za9C8v1cRIChS8UdzyOnug.png)
And the end output is something like this :
```
INFO:tensorflow:Final test accuracy = 100.0% (N=21)
INFO:tensorflow:Froze 2 variables.
Converted 2 variables to const ops.
```

## Classify an image

To classify an image you need to run `python classify.py` in background (with systemctl for instance or screen).
Then to check if you have access to the api just do `curl http://localhost:8989/status/`.

To check a local image just run :

```curl
curl -POST -H "Content-type: application/json" -d 
'{
  "data": [{
    "ext" : "jpg",
    "path" : "/home/images/local01.jpg",
    "type" : "local"
  }]
}'
'localhost:8989/classify_image/'
```

To check a http image just run :

```curl
curl -POST -H "Content-type: application/json" -d 
'{
  "data": [{
    "ext" : "jpg",
    "path" : "http://somedomains.come/somwhere/image.jpg",
    "type" : "url"
  }]
}'
'localhost:8989/classify_image/'
```

Thanks you for reading and don't forget to star it !

