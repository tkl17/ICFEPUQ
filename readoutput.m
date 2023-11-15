function  Y = ReadOutput(outputfilename)

global sampleNumber
sampleNumber = sampleNumber + 1;


% ====================function parameters=================================
%==========================================================================
%coord_1: coordinate for output one
%coord_2: coordinate for output two
%output1: output value one
%output2: output value two



%=================================data process=============================
%=========================================================================
% Keyword that identify the requested output
        search_string = '      *        INCREMENT PLOTTING DATA              INCREMENT:   1        *';


%get the outputfile name
        [~,outputfilename,~] = fileparts(outputfilename);

%read all lines in outputfile 
        textinc = string(readlines('list.t'));
% find the initial  line started with 
        found = find(strcmp(textinc, search_string));

% Shorten cell array to only after the search string.
        if isempty(found)
            warning(['Search string "' search_string '" not found in file: .t']);
            return
        else
            textinc_shortened = textinc(found:end);
        end

% define the increment number and every increment starting line
% read the max increment
%         TPL_text = string(readlines(['Pile.t' '.tpl']));
%         Incre_Text = TPL_text(3);
%         Split_incre = split(Incre_Text);
%         incre_max = Split_incre(3);
%         incre_max = strrep(incre_max,',','');
%         incre_max = str2num(incre_max);
%         inc = 1:incre_max;

        inc = [1 2 3 4 5 6 7 8];
        increment = string(inc);
        
        for k=1:size(inc,2)
            incre_N = sprintf('%4d', k);
            increment(k) = append('      *        INCREMENT PLOTTING DATA              INCREMENT:',incre_N,'        *');
        end

%loop to get the output and save the output the new file "FE_Result"

%count number for total increment
        j = 0;% j for output1
%initial data for output        
        coord_1 = [];
        coord_2 = [];
        output1=zeros(0,0);% output1 for output1
        output2=zeros(0,0);% findata for output2

% for loop1 to get the results
        
        for i=1:length(textinc_shortened)
            % start with the every increment output beginning line 
            if  contains(textinc_shortened(i),increment)
                %====================Output one======================
                %====================================================
                    % get the first line and last line including the output
                    First_line_1 = i+18; 
                    Last_line_1 = First_line_1 + 100;
            
                    % save results of interest
                    j=j+1;
                    t=str2double(split(textinc_shortened(First_line_1:Last_line_1))); 
                    coord_1 = t(:,5)';  % coordinates for output1
                    output1(:,j)=t(:,7);  % output1
                %====================Output two======================
                %====================================================
                %output 2 only for the last increment
                if j == max(inc)
                % get the first line and last line including the output
                    First_line_2 = Last_line_1+32; 
                    Last_line_2 = First_line_2 + length(inc);
            
                % save results of interest
                    t=str2double(split(textinc_shortened(First_line_2:Last_line_2))); 
                    coord_2 = t(:,4); % coordinates for output2
                    output2(:,1)=t(:,5);  % output2
                end
            end
        end


%=====================export result=================================
%===================================================================

% create a new folder to save the results
        subfolder = 'FE_Result';
        if ~exist(subfolder, 'dir')
            mkdir(subfolder);
        end
% save result for output1 - output 1/finddata2 - output2
        fileNumber = sprintf('%03d', sampleNumber);
        filename = [outputfilename fileNumber];
        save(fullfile(subfolder, filename), 'coord_1','coord_2','output1','output2');

        disp([filename  ' is finished!'])

%All result have been saved in file FE_Reuslt, no need for UQLAB output
        Y = 'Null';

end



