

clc
clear all
close all

load features.mat
load labels.mat

srcFiles = dir('Training');
run('libsvm-3.21\matlab\make.m');



trainingdata=Trainfeature;
trainingdata=normr(trainingdata);


trainlabels=trainlabels';

instances=(double(trainingdata));


model = TreeBagger(200,instances,trainlabels);

   
 %%%%%%%%%testing%%%%%%%%%
 

 testdata=Testfeature;
 testdata=normr(testdata);
 
 testinstances=double(testdata);

 
 testlabels=testlabels';
 
 predicted_label =predict(model,testinstances);
      
 CPt = classperf(testlabels, str2double(predicted_label));
 
 test_error=CPt.ErrorRate