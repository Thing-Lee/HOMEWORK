function y = sorted1( m , n )
a = rand( m , n ) ;
ma = -inf ; w1 = [ ] ;
for i = 1 : m
    for j = 1 : n
        if a( i , j ) >= ma
            ma = a( i , j ) ;
            w = [ i , j ] ;
            w1 = [ w1 ; w ] ;   %������ͬԪ�س��ֶ������ĳ���������
        end
    end
end
y = ma ;