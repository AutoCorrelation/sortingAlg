function x = insertSort(x,N)
   
for i = 2:N
    pivot = x(i);
    % j is index of sorted subset array
    % and i is index of unsorted subset array
    j = i - 1;
    while j > 0 && x(j) > pivot     
        x(j + 1) = x(j);
        j = j - 1;
    end
    % input pivot value to sorted subset array.
    x(j + 1) = pivot;
end