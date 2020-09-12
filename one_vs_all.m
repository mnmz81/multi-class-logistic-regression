function [precision1,precision2,precision3,recall1,recall2,recall3] = one_vs_all(Xt,theta1,theta2,theta3,y)
    [m n] = size(Xt);
    Xtest = [ones(m, 1) Xt];
    %%calculation the  3 prediction
    prediction1 = sigmoid2020(-Xtest*theta1);
    prediction2 = sigmoid2020(-Xtest*theta2);
    prediction3 = sigmoid2020(-Xtest*theta3);
    prediction = zeros(m,1);
    %%find the max prediction
    for i = 1:m
        if prediction1(i,:)>=prediction2(i,:) && prediction1(i,:)>=prediction3(i,:)
            prediction(i,:) = 1;
        elseif prediction2(i,:)>=prediction1(i,:) && prediction2(i,:)>=prediction3(i,:)
            prediction(i,:) = 2;
        else
            prediction(i,:) = 3;
        end
    end
    %%calculation the Error
    C = confusionmat(y,prediction);
    precision1 = C(1,1)/sum(C(:,1));
    precision2 = C(2,2)/sum(C(:,2));
    precision3 = C(3,3)/sum(C(:,3));
    recall1 = C(1,1)/sum(C(1,:));
    recall2 = C(2,2)/sum(C(2,:));
    recall3 = C(3,3)/sum(C(3,:));
    fmeas1 = 2*(precision1*recall1)/(precision1 + recall1);
    fmeas2 = 2*(precision2*recall2)/(precision2 + recall2);
    fmeas3 = 2*(precision3*recall3)/(precision3 + recall3);
    disp('Precision and Recall for class 1 are:');disp(precision1);disp(recall1);
    disp('Precision and Recall for class 2 are:');disp(precision2); disp(recall2);
    disp('Precision and Recall for class 3 are:');disp(precision3); disp(recall3);
    disp('F measure for class 1 is:');disp(fmeas1);
    disp('F measure for class 2 is:');disp(fmeas2);
    disp('F measure for class 3 is:');disp(fmeas3);
    Acc = sum(diag(C))/sum(C(:));
    disp('Accuracy of the system is:');disp(Acc)
end







