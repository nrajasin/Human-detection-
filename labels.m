clc;
clear all;
close all;

srcFiles = dir('Train\images');
srcFiles(1:2)=[];
%str0 = ['D:\Western\Machine learning\Assignment 1\TenCategories\Training'];  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    str=['Train\images\train (',int2str(i),').jpg'];
    filename = str;
    I = imread(filename);
    p.data{i}=I;
    
   
    
     
        
end

m=length(srcFiles);
num_non_people=1218;
num_people=600;

for i=1:m
    if i<=num_non_people
       trainlabels(i)=1;
    else
       trainlabels(i)=2;
       
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

srcFilestest = dir('Test\images');
srcFilestest(1:2)=[];
%str0 = ['D:\Western\Machine learning\Assignment 1\TenCategories\Testing'];  % the folder in which ur images exists
for i = 1 : length(srcFilestest)
    str=['Test\images\test (',int2str(i),').jpg'];
    filename = str;
    I = imread(filename);
    ptest.data{i}=I;
    
    
        
end

n=length(srcFilestest);

num_non_people=300;
num_people=300;

for k=1:n
    if k<=num_non_people
       testlabels(k)=1;
    else
       testlabels(k)=2;
       
    end
end

save('labels.mat','testlabels','trainlabels') 