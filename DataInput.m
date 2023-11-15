function myInput = DataInput(Input_name, parameter1,parameter2, type)
%DATAINPUT Summary of this function goes here
%   Detailed explanation goes here

if ismatrix(parameter1)
    % tilde means this variable is deleted immediately and is therefore
    % unused. 
    [~,c] = size(parameter1);
    for ii = 1:c
        InputOpts.Marginals(ii).Name = Input_name{ii};
        InputOpts.Marginals(ii).Type = type{ii};
        InputOpts.Marginals(ii).Parameters = [parameter1(ii) parameter2(ii)];

    end
end


% Create the INPUT object
myInput = uq_createInput(InputOpts);

end

