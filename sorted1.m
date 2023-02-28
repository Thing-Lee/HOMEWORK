function y = sorted1( m , n )
a = rand( m , n ) ;
ma = -inf ; w1 = [ ] ;
for i = 1 : m
    for j = 1 : n
        if a( i , j ) >= ma
            ma = a( i , j ) ;
            w = [ i , j ] ;
            w1 = [ w1 ; w ] ;   %当有相同元素出现多个坐标的常见处理方法
        end
    end
end
y = ma ;