function y = balls(x)
y = 0 ;
s = 100 ;
for a = 1 : x
    s = s / 2 ;
    y = y + 2*s + s ;
end
s