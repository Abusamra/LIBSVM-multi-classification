
clear
close all
clc
%================READIND DATA SET======================
%read yor file that contains your dataset. this read data file excel 
% the format of data set has to be the first column is the class and the
% rest is the features , the raws are the samples.you just need to put yor file in Data folder
% and write the name of the file instead of 'filename'
dirData = './data';
[ndata, text, alldata] = xlsread(fullfile(dirData,'filename.xlsx')) ;
% if you have your data file in another file type just change the 'xlsx' to the propriate extension  

%=======================================================================

%==============DRAWIND THE DATA==========================
% this instruction sort the data acording to the class label 
[sortedDataLabel, permIndex] = sortrows(ndata(:,1));
sortedData = ndata(permIndex,2:end);
% draw the sorted data
figure;
subplot(1,2,1); imagesc(sortedDataLabel); title('class label');
subplot(1,2,2); imagesc(sortedData); title('features');
%========================================================

label=ndata(:,1); % split the class label and put it in the label variable
ndata(:,1)=[];    % ndata contaiins now the only the features
labelList = unique(label);
NClass = length(labelList); 
[Ns D] = size(ndata);
%======================================
cd('./src')
%======================================
% Make the number of fold in cross validation
% Here we will make them into 10 folds, you can change it as you like
Ncv_classif = 10;

% Make the run index for each observation
k=1;
for i=1:210
    if i<= 100
    run(i)=i;
    elseif k<=100
        run(i)=k;
        k=k+1;
    else
        k=1;
         run(i)=k;
    end
end
    
run=run';
runCVIndex = mod(run,Ncv_classif)+1;

%=======================Choosing the best parameter for SVM===========
% #######################
% Parameter selection
% #######################
% First we randomly pick some observations from the training set for parameter selection
tmp = randperm(size(ndata,1));
evalIndex = tmp(1:ceil(size(ndata,1)/2));
evalData = ndata(evalIndex,:);
evalLabel = label(evalIndex,:);

% #######################
% Automatic Cross Validation 
% Parameter selection using n-fold cross validation
% #######################
% ================================================================
% Note that the cross validation for parameter selection can use different
% number of fold. In tis example
% Ncv_param = 3 but 
% Ncv_classif = 5;
% Also note that we don't have to specify the fold for cv for parameter
% selection as the algorithm will pick observations into each fold
% randomly.
% ================================================================
optionCV.stepSize = 5;
optionCV.c = 1;
optionCV.gamma = 1/D;
optionCV.stepSize = 5;
optionCV.bestLog2c = 0;
optionCV.bestLog2g = log2(1/D);
optionCV.epsilon = 0.005;
optionCV.Nlimit = 100;
optionCV.svmCmd = '-q';
Ncv_param = 3; % Ncv-fold cross validation cross validation
[bestc, bestg, bestcv] = automaticParameterSelection(evalLabel, evalData, Ncv_param, optionCV);


%======================================================================
% ===========Classification using N-fold cross validation===============
optionClassif.c = bestc;
optionClassif.gamma = bestg;
optionClassif.NClass = NClass;
optionClassif.svmCmd = '-q';

% multiclass SVM usinf one vs. rest or it calls one v. all.
[predictedLabel, decisValueWinner, totalAccuracy, confusionMatrix, order] = OVR(label, ndata, runCVIndex, Ncv_classif, optionClassif);

% multiclass SVM using one vs. one ,if you want to use it activated by
% removing the percent sign.
%[predictedLabel, decisValueWinner, totalAccuracy, confusionMatrix, order] = one_vs_one(label, ndata, runCVIndex, Ncv_classif, optionClassif);

%============================================================================
% =========Make confusion matrix for the overall classification=======
[confusionMatrixAll,orderAll] = confusionmat(label,predictedLabel);

figure; imagesc(confusionMatrixAll');
xlabel('actual class label');
ylabel('predicted class label');
title(['confusion matrix for overall classification']);
%Calculate the overall accuracy from the overall predicted class label
accuracyAll= trace(confusionMatrixAll)/Ns;
disp(['Total accuracy from ',num2str(Ncv_classif),'-fold cross validation is ',num2str(accuracyAll*100),'%']);
    
 
