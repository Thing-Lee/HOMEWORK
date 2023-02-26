function m =maxele( a ) 
ii = 1 ;
jj = 1 ;
i = 1 ; j = 1 ; 
m = a( i  ,  j ) ;
for i = 1 : 4   
    for j = 1 : 5
        if m < a( i , j )
            m =  a( i , j ) ;
            ii = i ;
            jj = j ;
        end
    end
end
ii
jj
end