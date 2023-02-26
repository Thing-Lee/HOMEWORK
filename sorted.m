function y = sorted(x)
for i = 1 : 9
    for j = 1 : 10-i
        if x( j ) > x( j + 1 )
            a = x( j );
            x( j ) = x( j + 1 ); 
            x( j + 1 ) = a ;
        end
    end
    y = x ;
end