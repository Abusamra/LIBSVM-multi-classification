
Table of Contents
=================

- Introduction
- Installation
- Usage
- The importance of this work


Introduction
============
This tool provides a simple interface to LIBSVM. LIBSVM is a library for support vector
machines (http://www.csie.ntu.edu.tw/~cjlin/libsvm). 
This project use the tool of LIBSVM to do multiclassification using SVM inusing both methods one vs. all
or it calls one vs. rest (OVR) ,and one vs. one (OVO).it is very easy to use ,and the way of specifying parameters are the same as that of LIBSVM.

Installation
============
this project provides you an easy way to install ,which is just use it directly.
this project use a compiled version of LIBSVM so you dont need to do the ' make'  
and worry any more if you have the right compiler in you computer.

Usage
============
you can use SVM for multiclassification in both mode OVR, and OVO .So you can compare between them .
in the folder you will find alot of files , but the file you would deal with is the  sample.m file.
sample.m file give an example of how you can use the project , call different functions , display the results,and draw figures.

First : Load the dataset file
**** put your Dataset file in the Data folder .In this project we use function to read excel file , so the file must be in excel file .

The data format as follows :data set has to be the first column is the class and the rest is the features , the raws are the samples or observation.for the classes must be numerical , So, if you have text class label please assign for each any number you want but not equal to 0. 
Second :download the uploaded file and folders you found in repository in same folder lets call it for example 'M_SVMproject'.
 You need to make sure when you open the MATLAB program that you open the'M_SVMproject' folder in the 'current folder' tab
so you can see( sample.m ,Data, src) in this windows, the every thing will go easily.

how to run the code:
you dont need to write any thing you just open the 'sample.m' and you just need to write your Dataset file name in the 'reading the Dataset' section 
then you can run the file even each section alone or all together .

what you expecting to see :
the project will read your dataset and plot your data based on sorted class label you have.
then it will select the best parameter for SVM (parameter C and gamma) then it will do multiclass 
SVM even OVR or OVO classification .
The result:
the accuracy of each fold will be calculated and the confusion matrix of each fold as well
also the overall accuracy and confusion matrix as well as the figure of the confusion matrix.


The importance of this work
==============================
LIBSVM is very popular tool that use SVM algorithm in effictive way specially for binary classification. 
you can have alot of example of how to use it for binary classification but its the reverse in case of multiclassification. 
For that ,this work gives you a compiled version of LIBSVM so you would not worry any more if you have the right compiler 
in you computer or to download a compiler for it .
it implements a one vs. all and one vs. one which are popular algorithms for SVM multiclassification using N-fold cross validation.



