function myUQLinkModel = Initialize(name)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% Model type:
ModelOpts.Type = 'UQLink';
ModelOpts.Name = name;

EXE = 'icfep';
EXECPATH = 'E:\tl\RUN\LoadedConductor\RUN1\';
INPUTFILE = 'RUN1.t';
VERSION = '24.0';
TEMPLATEFILEpath = 'RUN1.t.tpl';
OUTPUTPATH = 'E:\tl\RUN\LoadedConductor\RUN1\';
COMMANDLINE = sprintf('%s %s%s %s',EXE, EXECPATH, INPUTFILE, VERSION);
TEMPLATEFILE = sprintf('%s', TEMPLATEFILEpath);
% disp(COMMANDLINE)
% disp(TEMPLATEFILE)

% Provide mandatory options - the command line, i.e.,
% a sample of the command line that will be run on the shell:
ModelOpts.Command = COMMANDLINE ;

% Provide the template file, i.e., a copy of the original input files
% where the inputs of interest are replaced by markers:
ModelOpts.Template = TEMPLATEFILE; %
% Provide additional non-mandatory options -
% Execution path (where ICFEP will be run): 
ModelOpts.ExecutionPath = OUTPUTPATH; % (Likely the current folder.)

% Provide the MATLAB file that is used to retrieve the quantity of interest
% from the code output file:
% The output file it will check is simply list.t. As ICFEP writes to the 
% the zeroth output file (pushing the previous list.t file down to the next 
% available number e.g. list.t9); iteration is not required. 
ModelOpts.Output.FileName = 'list.t';
ModelOpts.Output.Parser = 'readoutput';

ModelOpts.Counter.Digits = 3;

% Specify the format of the variables written in the ICFEP input file:
% This is formatted as scientific notation.
ModelOpts.Format =  {'%1.3E'}; %{'%.1f'};

% Set the display to quiet:
ModelOpts.Display = 'quiet';

%ModelOpts.Archiving.Action = 'delete';

% Create the UQLink wrapper:
myUQLinkModel = uq_createModel(ModelOpts);
% uq_listModels
end

