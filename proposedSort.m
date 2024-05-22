function y=proposedSort(x,N)
    %pivot을 평균값으로하고, pivot 보다 크고 작은 part를 A B로 나눈다.
    %part 별로 sorting Algorithm 적용 후 접합.
    %pivot이 없으면 피봇을 포함시키고 정렬시킨 후 나중에 빼주는 방법으로..

    %100만개의 데이터 100개로 average 해서 mean을 구한다?(random sampling)
    % ㄴ not included in this code
    count = 1;
    smallSubset = [];
    largeSubset = [];
    subsetCounter = 0;
    averageValue = x(1);
    %get average pivot
    for i = 2:N
        averageValue = (averageValue+x(i))/2;
    end
    pivot = averageValue;
    for count = 1:N
        if x(count) <= pivot
            smallSubset = [smallSubset,x(count)];
            subsetCounter = subsetCounter+1;
        else
            largeSubset = [x(count),largeSubset];
        end
    end
    A = quickSort(smallSubset,1,subsetCounter);
    B = quickSort(largeSubset,1,N-subsetCounter);
    y = [A,B];
end

