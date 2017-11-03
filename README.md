# tensorflow-image-rest
Tensorflow image classifier with rest api !

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
|-- tf_files
|   `-- data <-- Here create folder per dataset.
|-- classify.py
|-- requierments.txt
|-- train_data.sh
`-- train.py
```

If you have already some dataset to another folder you can edit variable in the training.sh :

```
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

```
...
WORKING_DIRECTORY="tf_files"
TRAINED_LABELS="%s/retrained_labels.txt" % (WORKING_DIRECTORY)
RETRAINED_GRAPH="%s/retrained_graph.pb" % (WORKING_DIRECTORY)
...
```

Then all is done just run `sh train.sh`

## Classify an image

To classify an image you need to run `python classify.py` in background (with systemctl for instance or screen).
Then to check if you have access to the api just do `curl http://localhost:8989/status/`.

At the moment you can only check images on the hard drive of your machine which means that you have to send the path of the image.

To check an image just run :

```
curl -POST -H "Content-type: application/json" -d 
'{
  "data": ["/home/test/tmp/image0.jpg"]
}'
'localhost:8989/classify_image/'
```

Thanks you for reading and don't forget to star it !

