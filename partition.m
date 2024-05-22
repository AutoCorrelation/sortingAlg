function [a,p] = partition(a,L,R)
low = L;
high = R;
%set pivot as L (fisrt index in input array)
pivot = a(L);

%loop until low index cross high index
while low<high
    while low<=R&&a(low)<=pivot
        low=low+1;
    end
    while high>=L&&a(high)>pivot
        high = high-1;
    end
    if low<high
        swap = a(low);
        a(low) = a(high);
        a(high) = swap;
    end
end
% after low index cross high index
swap = a(L);
a(L) = a(high);
a(high) = swap;
%return pivot index
p = high;
end

