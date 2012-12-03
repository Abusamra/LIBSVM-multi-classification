
Table of Contents
=================

- Introduction
- Installation
- Usage
- The importance of this work


Introduction
============
This tool provides a simple interface to LIBSVM, a library for support vector
machines (http://www.csie.ntu.edu.tw/~cjlin/libsvm). It is very easy to use as
the usage and the way of specifying parameters are the same as that of LIBSVM.
This project use the tool of LIBSVM to do multiclassification using SVM in both mode one vs. all
or it calls one vs. rest (OVR) ,and one vs. one (OVO).

Installation
============
this project provides you an easy way to install which is just use it directly.
this project use a compiled version of LIBSVM so you dont need to do the ' make'  
and worry any more if you have the right compiler in you computer.

Usage
============
you can use SVM for multiclassification in both mode OVR, and OVO .So you can compare between them .
in the folder you will find alot of files , but the file you would deal with is the ' main ' file

First : Load the dataset file
**** put your Dataset file in the Data folder that you can find inside project folder.in this project we use function 
to read excel file , so the file must be in excel file .
the data format as follows :data set has to be the first column is the class and the rest is the features , the raws are the samples or observation.
Second : you make sure when you open the MATLAB program that you open the project folder in the 'current folder' tab
so you can see all the folders of the project in this windows, the every thing will go easily.

how to run the code:
you dont need to write any thing you just open the 'main' and you just need to write your Dataset file name in the reading the Dataset section 
then you can run the file even each section alone or all together .

what you expecting to see :
the project will read your dataset and plot your data based on sorted class label you have.
then it will elect the best parameter for SVM (parameter C and gamma) then it will do multiclass 
SVM even OVR or OVO classification .
The result:
the accuracy of each fold will be calculated and the confusion matrix of each fold as well
also the overall accuracy and confusion matrix as well as the figure of the confusion matrix.


The importance of this work
==============================
LIBSVM is very popular tool that can use SVM algorithm in effictive way specially for binary classification 
you can have alot of example of how to use it for binary classification but its the reverse in case of multiclassification 
it gives you a compiled version of LIBSVM so you would not worry any more if you have the right compiler 
in you computer or to download a compiler for it .
it implements a one vs. all and one vs. one which are popular algorithm for SVM multiclassification using N-fold cross validation.



