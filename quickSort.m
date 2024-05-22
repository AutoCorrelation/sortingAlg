function [x] = quickSort(x,b,e)     % b= begin, e = end
if b<e
    % devide and Conquer
    [x1,p]=partition(x,b,e);        % devide ( return array and pivot )
    x2=quickSort(x1,b,p-1);         % recursive structure
    x3=quickSort(x2,p+1,e);
    x=x3;
end
end
