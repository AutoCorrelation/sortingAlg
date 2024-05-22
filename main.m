clear all
close all
clc
format long

% speed test
iter = 1e3;
setX = 5;
setNum = [2^9 2^10 2^11 2^12 2^13];

timesum_quickSort = 0;
timesum_enhancedquickSort = 0;
timesum_insertSort = 0;
timesum_shellSort = 0;
timesum_radixSort = 0;
arr_averageTime_quickSort = [];
arr_averageTime_enhancedquickSort = [];
arr_averageTime_insertSort = [];
arr_averageTime_shellSort = [];
arr_averageTime_radixSort = [];
result_quickSort = [];
result_enhancedquickSort = [];
result_insertSort = [];
result_shellSort = [];
result_radixSort = [];
for n = 1:setX
    set = setNum(n);
    for i = 1:1:iter
        
        X = randi(set,1,set);
        N = length(X);
%quick sorting part begin
        t_quick = tic;
        result_quickSort = quickSort(X, 1,N);
        t1 = toc(t_quick);
        timesum_quickSort = timesum_quickSort + t1;
%quick sorting part end

%enhanced quick sorting part begin
        t_ehanced_q = tic;
        result_enhancedquickSort=proposedSort(X,N);
        t2 = toc(t_ehanced_q);
        timesum_enhancedquickSort = timesum_enhancedquickSort + t2;
%enhanced quick sorting part end

%insert sorting part begin
        t_insert = tic;
        result_insertSort = insertSort(X,N);
        t1 = toc(t_insert);
        timesum_insertSort = timesum_insertSort + t1;
%insert sorting part end
        
%shell sorting part begin
        t_shell = tic;
        result_shellSort = shellSort(X,N);
        t1 = toc(t_shell);
        timesum_shellSort = timesum_shellSort + t1;
%shell sorting part end

%radix sorting part begin
        t_radix = tic;
        result_radixSort = radixSort(X,N);
        t1 = toc(t_radix);
        timesum_radixSort = timesum_radixSort + t1;
%radix sorting part end
    end
    avrageTime_quick = timesum_quickSort/iter;
    avrageTime_enhanced_quick = timesum_enhancedquickSort/iter;
    avrageTime_insert = timesum_insertSort/iter;
    avrageTime_shell = timesum_shellSort/iter;
    avrageTime_radix = timesum_radixSort/iter;
    arr_averageTime_quickSort(n) = avrageTime_quick;
    arr_averageTime_enhancedquickSort(n) = avrageTime_enhanced_quick;
    arr_averageTime_insertSort(n) = avrageTime_insert;
    arr_averageTime_shellSort(n) = avrageTime_shell;
    arr_averageTime_radixSort(n) = avrageTime_radix;
end


figure
xlabel("2^n");
ylabel("sec");
hold on

plot(setNum,arr_averageTime_quickSort,'-*r',LineWidth=1.5);
plot(setNum,arr_averageTime_enhancedquickSort,'-*g',LineWidth=1.5);
plot(setNum,arr_averageTime_insertSort,'-*b',LineWidth=1.5);
plot(setNum,arr_averageTime_shellSort,'-*c',LineWidth=1.5);
plot(setNum,arr_averageTime_radixSort,'-*m',LineWidth=1.5);

legend("quickSorting","enhanced quickSorting","insertSort","shellSort","radixSort");
hold off