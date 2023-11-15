function [Numerical_output, Numerical_output2, Data_samples] = Evaluatemodel(NumberofSamples, Data_samples)
%EVALUATEMODEL Summary

% Generate an experimental design (ED)
% using Latin Hypercube Sampling:
Data_samples_current = uq_getSample(NumberofSamples,'LHS');

% Carries out model evaluation for the number of stages 
% Numerical_output = [];

% COMPUTATIONAL MODEL WITH UQLINK (WRAPPER OF ICFEP)

% Initialize UQLink:
name = 'Conductor';
myUQLinkModel = Initialize(name);

if isempty(Data_samples) == 0 
    Numerical_output_current = uq_evalModel(myUQLinkModel, Data_samples_current); 
    
    %Combining previous results with new iteration
    Data_samples = vertcat(Data_samples_current,Data_samples);
    [Numerical_output Numerical_output2] = vertcat(Numerical_output_current, Numerical_output);
else
    Data_samples = vertcat(Data_samples_current,Data_samples);
    [Numerical_output Numerical_output2] = uq_evalModel(myUQLinkModel, Data_samples);   
end


end    