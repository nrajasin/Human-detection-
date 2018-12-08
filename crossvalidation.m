clc
clear all
close all

load features.mat
load labels.mat


run('libsvm-3.21\matlab\make.m');

trainingdata=Trainfeature;


trainlabels=trainlabels';

instances=(double(trainingdata));



for k=1:10
  
Indices = crossvalind('Kfold', 1818, 10) ;

    cvmdlloss=[];
    
    test = (Indices == k); train = ~test;
   
    
    model=svmtrain(trainlabels(train,:),instances(train,:), '-t 0 -c 10 ');
    
    predicted_label(:,k) = svmpredict(trainlabels(test,:), instances(test,:), model);
      
   
    

   CP = classperf(trainlabels(test,:),  predicted_label(:,k));
    
  crossval(k) =CP.ErrorRate;
end


%%%%%%%%training error 

 model=svmtrain(trainlabels,instances, '-t 0 -c 10 ');
    
 predicted_labelt = svmpredict(trainlabels, instances, model);
      
 CPt = classperf(trainlabels,  predicted_labelt);
 crossval_error=mean(crossval)
 train_error=CPt.ErrorRate