m = fix(100*rand) ;
k = 1 ;
for k = 1 : 7 
    k = k + 1 ;
    n = input('please input a number:');
    if m == n
        disp('won!');
        break ;
    elseif n > m
        disp('high!');
    else
        disp('low!');
    end
end
disp('game over!');
% ------------------------------------------
m = input('please input the last number:');
n = 2 : m;
for i = 2 : sqrt(m)
    for j = 2*i : i : m
        n(j) = 0;
    end
end
a = find(n ~= 0);
disp(n(a));
% ------------------------------------------
n = input('please input the last number:');
a = zeros(n, 1);    %将a设置为n行1列的空矩阵，元素全为0
a(1) = 1;
a(2) = 2;
for k = 3 : n
    a(k) = a(k-1) + a(k-2);
end
disp(a(n));