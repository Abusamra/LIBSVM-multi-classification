function [predictedLabel, decisValueWinner, totalAccuracy, confusionMatrix, order] = one_vs_one(label, data,run, Ncv_classif, option)

if exist('option','var')
    c = option.c;
    g = option.gamma;
    NClass = option.NClass;
    svmCmd = option.svmCmd;
end

% Prepare/initialize some matrices to store some information
confusionMatrix = zeros(NClass,NClass,Ncv_classif);
order = zeros(NClass,Ncv_classif);
totalAccuracy = zeros(1,Ncv_classif);
predictedLabel = label*0;
decisValueWinner = label*0;

% SVM parameters
% the best parameters are obtained from some cross validation process
cmd = ['-c ',num2str(c),' -g ',num2str(g),' ',svmCmd];

for ncv = 1:Ncv_classif
    
    testIndex = run == ncv;
    trainIndex = run ~= ncv;
    trainData = data(trainIndex,:);
    trainLabel = label(trainIndex,:);
    testData = data(testIndex,:);
    testLabel = label(testIndex,:);
    NTest = sum(testIndex,1);
    
    % #######################
    % Train the SVM in one-vs-one(OVO) mode
    % #######################
    model = svmtrain(trainLabel, trainData, cmd);
    
    % #######################
    % Classify samples using OVR model
    % #######################
    [predict_label, accuracy, decis_values] = svmpredict(testLabel, testData, model);
    [decis_value_winner, label_out] = max(decis_values,[],2);
    predictedLabel(testIndex) = label_out;
    decisValueWinner(testIndex) = decis_value_winner;
    % #######################
    % Make confusion matrix
    % #######################
  %  [confusionMatrix(:,:,ncv),order(:,ncv)] = confusionmat(testLabel,label_out);
  %  totalAccuracy(ncv) = trace(confusionMatrix(:,:,ncv))/NTest;
  %  disp(['Fold ', num2str(ncv),' -- Total accuracy from the SVM: ',num2str(totalAccuracy(ncv)*100),'%']);
 
    
% % %     % Plot the confusion matrix for each fold
% % %     figure; imagesc(confusionMatrix(:,:,ncv)');
% % %     xlabel('actual class label');
% % %     ylabel('predicted class label');
% % %     title(['confusion matrix for fold ',num2str(ncv)]);
    

end