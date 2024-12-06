
imageSize = 256;
randomDifferences = randi([-10, 10], 1, 10);
I_gray = cumsum(randomDifferences, 2);
I_diff =  [I_gray(:, 1), diff(I_gray, 1, 2)]; % Compute the difference between adjacent pixels


% Huffman encoding
I_gray = double(I_gray);
symbols = unique(I_gray(:));
counts = hist(I_gray(:), symbols);
prob = counts / sum(counts);
dict = huffmandict(symbols, prob);
comp = huffmanenco(I_gray(:), dict);




% Ensure I_diff is double-precision
I_diff = double(I_diff);

% Huffman encoding
symbols = unique(I_diff(:));
counts = hist(I_diff(:), symbols);
prob = counts / sum(counts);
dict = huffmandict(symbols, prob);
comp_diff = huffmanenco(I_diff(:), dict);

% Display the original and compressed image sizes
disp(['Original image size: ', num2str(numel(I_gray)*8), ' bits']);
disp(['Compressed image size: ', num2str(numel(comp)), ' bits']);
disp(['Compressed diff image size: ', num2str(numel(comp_diff)), ' bits']);
