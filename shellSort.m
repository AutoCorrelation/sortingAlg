function [x] = shellSort(x,n)
% set h as interval of shell sorting algorithm
h = n/2; 
% iterate below while part
while h>=1
    for i = 1:h
        % divide input array and 
        % input that subset array in insertSort.
        x(i:h:end) = insertSort(x(i:h:end),n/h);
    end
    % reduce h interval by dividing h by 2
    h = h/2;
end
end