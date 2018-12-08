clc;
clear all;
close all;

run('vlfeat-0.9.20/toolbox/vl_setup');

load labels.mat

srcFiles = dir('Train\images');
srcFiles(1:2)=[];

for i = 1 : length(srcFiles)
    str=['Train\images\train (',int2str(i),').jpg'];
    filename = str;
    I = imread(filename);
    p.data{i}=I;
    
    
    
     
       
     
 end
    
    

m=length(srcFiles);
num_classes=2;

%%%% r= resize
r=150;
for i=1:m
    
   im=p.data{i};
   % from 50 by 50 to 250 by 250 in steps 0f 100
   im=imresize(im,[r r]);
       
    pics.data{i} = (im);
    
    
        
    
    
end
cellSize=10;


for i=1:m
    %orientations  4 to 14 in steps of 2
    hog = vl_hog(single(pics.data{i}), cellSize, 'numOrientations',10) ;
    concat=[];
         for c=1:size(hog,3)      
             concat=[concat hog(:,:,c)];
       
        
         end
        
    
   X(i,:)=(reshape(concat,1,[]));
end




Trainfeature=X;






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%              Testing            %%%%%%%%%%%%%%%%%%%%%%%%%%%




srcFilestest = dir('Test\images');
srcFilestest(1:2)=[];
%str0 = ['D:\Western\Machine learning\Assignment 1\TenCategories\Testing'];  % the folder in which ur images exists
for i = 1 : length(srcFilestest)
    str=['Test\images\test (',int2str(i),').jpg'];
    filename = str;
    I = imread(filename);
    ptest.data{i}=I;
    
    str=['test(',int2str(i),').jpg'];
    %imwrite(ptest.data{i},str);
    
        
end

m=length(srcFilestest);
r=150;

for i=1:m
    
   im=ptest.data{i};
   
   im=imresize(im,[r r]);
       
    picstest.data{i} = (im);
     if size(im,3)==1
    
    picstest.data{i}(:,:,2)=zeros(r,r); 
    picstest.data{i}(:,:,3)=zeros(r,r); 
    end
    
   
end



for i=1:m
    %orientations  4 to 14 in steps of 2
    hog = vl_hog(single(picstest.data{i}), cellSize, 'numOrientations',10) ;
    concatt=[];
         for d=1:size(hog,3)      
             concatt=[concatt hog(:,:,d)];
       
        
         end
           
       
        
    
    Xtest(i,:)=(reshape(concatt,1,[]));
    
end
    
Testfeature=Xtest;

save('features.mat','Trainfeature','Testfeature') 