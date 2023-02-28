function y = sorted1( x )
a = randperm( x );
n = length( a ) ;
for i = 1 : n - 1
    for j = n : -1 : i + 1      %起泡法从后往前排序
        if a( j ) < a( j - 1 )
            b = a( j - 1 ) ;
            a( j - 1 ) = a( j ) ;
            a( j ) = b ;
        end
        y = a
    end
end