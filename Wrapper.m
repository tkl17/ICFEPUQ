function myUQLinkModel = Wrapper(name)

% Model type:
        ModelOpts.Type = 'UQLink';
        ModelOpts.Name = name;
        EXE = 'icfep';
        EXECPATH = [pwd() '\'];
        INPUTFILE = 'RUN1.t';
        VERSION = '24.0';
        TEMPLATEFILE = 'RUN1.t.tpl'; 
        COMMANDLINE = sprintf('%s %s%s %s',EXE, EXECPATH, INPUTFILE, VERSION);

% Command line 
        ModelOpts.Command = COMMANDLINE ;

% Provide the template file
        ModelOpts.Template = TEMPLATEFILE; 

% Provide  Execution path (where ICFEP will be run): 
        ModelOpts.ExecutionPath = EXECPATH;

% Output file list.t format 
        ModelOpts.Output.FileName = 'list.t';
        ModelOpts.Output.Parser = 'ReadOutput';
        ModelOpts.Counter.Digits = 3;

% Specify the format of the variables ; Set the display to quiet:
        ModelOpts.Format =  {'%1.3E'}; %{'%.1f'};
        ModelOpts.Display = 'quiet';

% Create the UQLink wrapper:
        myUQLinkModel = uq_createModel(ModelOpts);

end

