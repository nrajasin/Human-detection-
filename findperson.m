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



 model=svmtrain(trainlabels,instances, '-t 0 -c 4 ');
   
 %%%%%%%%%testing%%%%%%%%%
 

 testdata=Testfeature;
 testdata=normr(testdata);
 
 testinstances=double(testdata);

 
 testlabels=testlabels';
 
 predicted_label = svmpredict(testlabels, testinstances, model);
      
 CPt = classperf(testlabels,  predicted_label);
 
 test_error=CPt.ErrorRate