function [x] = radixSort(x,N)
    %floor function accepted
    % case 10의 자리 수 까지.
    % inhance 진법 변환.을 통해...
    maxValue = x(1);
    for i = 2:N             %get maxValue and its digit
        if x(i)>maxValue
            maxValue = x(i);
        end
    end
    maxDigit = floor(log10(maxValue)+1);            % use log10 to know its 몇자리 수 

    for digit = 1:maxDigit  %increase digit to maxDigit and do radixSort
        buckets = cell(10,1);   %make buckets to save arrays
        for i = 1:N         
            r = rem(floor(x(i)/10^(digit-1)),10);    % get its digit
            buckets{r+1} = [buckets{r+1},x(i)];
        end
        x = [];
        for j = 1:10
            x = [x,buckets{j}];
        end
    end

end
% function [x] = radixSort(x, N)
%     % Find the maximum value to determine the number of digits
%     maxValue = x(1);
%     for i = 2:N             %get maxValue and its digit
%         if x(i)>maxValue
%             maxValue = x(i);
%         end
%     end
%     maxDigit = floor(log10(maxValue) + 1); % Determine the number of digits in the largest number
% 
%     for digit = 1:maxDigit
%         % Initialize count array and output array
%         count = zeros(1, 10);
%         output = zeros(1, N);
% 
%         % Count occurrences of each digit
%         for i = 1:N
%             index = rem(floor(x(i) / 10^(digit - 1)), 10) + 1;
%             count(index) = count(index) + 1;
%         end
% 
%         % Convert count to actual position
%         for i = 2:10
%             count(i) = count(i) + count(i - 1);
%         end
% 
%         % Build the output array
%         for i = N:-1:1
%             index = rem(floor(x(i) / 10^(digit - 1)), 10) + 1;
%             output(count(index)) = x(i);
%             count(index) = count(index) - 1;
%         end
% 
%         % Copy the sorted elements back to the original array
%         x = output;
%     end
% end