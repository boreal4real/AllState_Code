import os, sys
from os import listdir
import tensorflow as tf
import csv

# Read in the image_data
graph_location = "C:\\tmp\\output_graph.pb"

imageID = []
WHPresent = []
RustPresent = []

# Unpersists graph from file
with tf.gfile.FastGFile(graph_location, 'rb') as f:
    graph_def = tf.GraphDef()
    graph_def.ParseFromString(f.read())
    tf.import_graph_def(graph_def, name='')

image_path = "C:\\Test_3Class_resize_299x299\\Noise"
imagesList = listdir(image_path)

with tf.Session() as sess:
    # Feed the image_data as input to the graph and get first prediction
    softmax_tensor = sess.graph.get_tensor_by_name('final_result:0')
    for img in imagesList:
        fullPath = image_path + "\\" + img
        image_data = tf.gfile.FastGFile(fullPath, 'rb').read()
        predictions = sess.run(softmax_tensor, {'DecodeJpeg/contents:0': image_data})

        # Sort to show labels of first prediction in order of confidence
        top_k = predictions[0].argsort()[-len(predictions[0]):][::-1]

        imageID.append(img.split('.')[0])

        if(top_k[0] == 2):
            WHPresent.append(0)
            RustPresent.append(0)
        if(top_k[0] == 0):
            WHPresent.append(1)
            RustPresent.append(0)
        if(top_k[0] == 1):
            WHPresent.append(1)
            RustPresent.append(1)

image_path = "C:\\Test_3Class_resize_299x299\\WaterHeater"
imagesList = listdir(image_path)

with tf.Session() as sess:
    # Feed the image_data as input to the graph and get first prediction
    softmax_tensor = sess.graph.get_tensor_by_name('final_result:0')
    for img in imagesList:
        fullPath = image_path + "\\" + img
        image_data = tf.gfile.FastGFile(fullPath, 'rb').read()
        predictions = sess.run(softmax_tensor, {'DecodeJpeg/contents:0': image_data})

        # Sort to show labels of first prediction in order of confidence
        top_k = predictions[0].argsort()[-len(predictions[0]):][::-1]

        imageID.append(img.split('.')[0])

        if(top_k[0] == 2):
            WHPresent.append(0)
            RustPresent.append(0)
        if(top_k[0] == 0):
            WHPresent.append(1)
            RustPresent.append(0)
        if(top_k[0] == 1):
            WHPresent.append(1)
            RustPresent.append(1)


image_path = "C:\\Test_3Class_resize_299x299\\Rust"
imagesList = listdir(image_path)

with tf.Session() as sess:
    # Feed the image_data as input to the graph and get first prediction
    softmax_tensor = sess.graph.get_tensor_by_name('final_result:0')
    for img in imagesList:
        fullPath = image_path + "\\" + img
        image_data = tf.gfile.FastGFile(fullPath, 'rb').read()
        predictions = sess.run(softmax_tensor, {'DecodeJpeg/contents:0': image_data})

        # Sort to show labels of first prediction in order of confidence
        top_k = predictions[0].argsort()[-len(predictions[0]):][::-1]

        imageID.append(img.split('.')[0])

        if(top_k[0] == 2):
            WHPresent.append(0)
            RustPresent.append(0)
        if(top_k[0] == 0):
            WHPresent.append(1)
            RustPresent.append(0)
        if(top_k[0] == 1):
            WHPresent.append(1)
            RustPresent.append(1)


ofile  = open('InceptionResults_Bal_Test.csv', "w")
goCsv = csv.writer(ofile, delimiter=',', lineterminator='\n')
for x in range(0, len(WHPresent)):
    goCsv.writerow([imageID[x], WHPresent[x], RustPresent[x]])