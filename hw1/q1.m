% Define the input signal and its probabilities
symbols = {'A', 'B', 'C', 'D', 'E', 'F','G','H'};
probabilities = [0.02, 0.02, 0.04, 0.04, 0.12, 0.12,0.15,0.49];

% Create the Huffman dictionary
dict = huffmandict(symbols, probabilities);
disp('Encoded signal:');
disp(dict);

