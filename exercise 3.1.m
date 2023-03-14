% --------------------椭球面---------------------------
subplot(2, 2, 1)
title('abc');
a = 2;
b = 3;
c = 1;
phi = 0 : .1 : 2*pi ;
theta = phi' ;
x = a*sin(theta)*cos(phi);
y = b*sin(theta)*sin(phi);
z = c*cos(theta)*ones(size(phi));
mesh(x,y,z)

% --------------------椭圆抛物面---------------------------
subplot(2, 2, 2)
title('椭圆抛物面');
a = 3/2;
b = 1;
x = -3 : .1 : 3 ;
y = -3 : .1 : 3 ;
[X , Y] = meshgrid(x , y);
Z = X .^2/a^2 + Y.^2/b^2;
mesh(X,Y,Z)

% --------------------单叶双曲面---------------------------
subplot(2, 2, 3)
a = 2;
b = 3;
c = 4;
phi = 0 : .1 : 2*pi+.1;
theta = (-1 : .1 : 1)' ;
x = a*cosh(theta)*cos(phi);
y = b*cosh(theta)*sin(phi);
z = c*sinh(theta)*ones(size(phi));
mesh(x,y,z)

% --------------------双曲抛物面---------------------------
subplot(2, 2, 4)
a = sqrt(3);
b = sqrt(3);
x = -2 : .1 : 2 ;
y = -2 : .1 : 2 ;
[X , Y] = meshgrid(x , y);
Z = X.^2/a^2 - Y.^2/b^2;
mesh(X,Y,Z)

h = gca;
view(h , 30 , 50)   %静态图及视角
axis vis3d    %动态图
v = .05;    %步长，控制旋转速度
try
    for i = 0 : v : 1000
        view(h , i , 30)    %视角
        drawnow
    end
end

% --------------------马鞍面---------------------------
x = -3 : .1 : 3 ;
y = -3 : .1 : 3 ;
[X , Y]  = meshgrid(x , y);
Z = X .* Y ;
mesh(X,Y,Z)

% --------------------旋转面---------------------------
x = -3 : .1 : 3 ;
y = -3 : .1 : 3 ;
[X , Y]  = meshgrid(x , y);
Z = exp(X.^2 + Y.^2);
mesh(X,Y,Z)

% --------------------圆锥面---------------------------
a = 1;
b = 1;
x = -3 : .1 : 3 ;
y = -3 : .1 : 3 ;
[X , Y] = meshgrid(x , y);
Z = sqrt(X.^2/a^2 + Y.^2/b^2);
mesh(X,Y,Z)
hold on
mesh(X,Y,-Z)

% --------------------环面---------------------------
x = -1/40 : .1 : 1/40 ;
y = -1/40 : .1 : 1/40 ;
[X , Y] = meshgrid(x , y);
Z = sqrt(1 - (1 - sqrt(X.^2 + Y.^2)) .^2);
mesh(X,Y,Z)
hold on
mesh(X,Y,-Z)

% --------------------正螺面---------------------------
x = -2*pi : .1 : 2*pi ;
y = -2*pi : .1 : 2*pi ;
[X , Y] = meshgrid(x , y);
Z = atan(X./Y);
mesh(X,Y,Z)

h = gca;
view(h , 30 , 50)   %静态图及视角
axis vis3d    %动态图
v = .05;    %步长，控制旋转速度
try
    for i = 0 : v : 1000
        view(h , i , 30)    %视角
        drawnow
    end
end