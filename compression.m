DNA = string(importdata('DNA_Sequence.txt'));

%% Initialize dictionary with character set and set codes to each
% Define the character set and codes
characters = {'A', 'C', 'G', 'T'};
codes = [1, 2, 3, 4];

% Create the container map object
D1 = containers.Map(characters, codes);

%% STRING = first character of I/P file
PREV = DNA{1}(1); %G

code = 5; 

index = {}; 
output_code = {};

D2 = dictionary();


for i = 1:strlength(DNA)
    if (i < strlength(DNA)-1) %NOT EOF
        CURR = DNA{1}(i+1); %T -> A
    end
    
    if(isKey(D1, strcat(PREV,CURR))) %KEY IS PRESENT
        PREV = strcat(PREV,CURR);   %GT   
    else
        index{end+1} = code; % Add index to output_code
        output_code{end+1} = D1(PREV); 

        D1(strcat(PREV,CURR)) = code; % Add new Key:Values

        D2(strcat(PREV,CURR)) = output_code{end};

        code = code+1;
        PREV = CURR;
    end
end

index{end+1} = code;
display(index)

Compressed_Codes = D1; %Compressed (51) + Entry (A,T,G,C) 
display(Compressed_Codes);

output_code{end+1} = D1(PREV)
display(output_code);

display(D2) % Entry -> Output

maximum = max(cell2mat(output_code))


bit_count_code = 6 * length(output_code)

%{
new = DNA{1}(1);
str = strcat(OLD,new) 
%}

%{
if isKey(D1, str)
    disp('True');
else 
    disp('False');
end
%}

%{
valuesArray = D1.values; % Get array of all values
keysArray = D1.keys; % Get array of all keys
index = find(strcmp(keysArray, 'G')); % Find index of 'value2' in values array
if ~isempty(index) % Check if index was found
    key = keysArray{index}; % Get corresponding key from keys array
    disp('Found');
    disp(index)
else
    disp('False')
    disp(index);
end
%}

%value = D1('G')


%{
NEW = DNA{1}(i+1)

%}

%{
if(~isempty(find(strcmp(keysArray, "A"))))
    disp("True")
else
    disp("False")
end


index = find(strcmp(D1.keys, 'T'));
D1('BG') = 5;
OLD = ['N']

output_code{end+1} = 2;
output_code{end+1} = 3;
output_code

OLD = ''
class(OLD)
%}


num_of_bits = 0;

while (2^(num_of_bits)) - 1 <= maximum
    num_of_bits = num_of_bits + 1;
end


bit_count_code = num_of_bits * length(output_code)
