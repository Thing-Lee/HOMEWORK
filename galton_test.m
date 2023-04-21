% m = input('m=');
m = 16;%层数
% n = input('n=');
n = 3000;%球数
x(n) = 0 ;
yy(m+1) = 0;
for i = 1 : n
    for j = 1 : m
        if rand > 0.5
            x(i) = x(i) + 1;
        else
            x(i) = x(i) - 1;
        end
    end
end
count = 0;
for j = -m : 2 : m
    count = count + 1
    for i = 1 : n
        if x(i) == j
            yy(count) = yy(count) + 1;
        end
    end
    yy;
    bar(yy)
end


function galtonNailBD
% fig axes设置
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
fig=figure();
screenSize=get(0,'ScreenSize');
fig.Position=[screenSize(1,[3,4])./10,...
    screenSize(4).*0.5,screenSize(4).*0.8];
fig.Name='galtonBySlandarer';
fig.NumberTitle='off';
fig.Resize='off';
fig.MenuBar='none';
ax=axes(fig);
ax.Position=[0 0 1 1];
hold(ax,'on');
ax.XLim=[-6.5 6.5];
ax.YLim=[0 20.5];
ax.XTick=[];
ax.YTick=[];
ax.XColor='none';
ax.YColor='none';
ax.Color=[.1 .1 .1];
%ax.DataAspectRatio=[1 1 1];

% 绘制基础背景
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
plot([1 ; 1]*(-5.5:1:5.5),[0 ; 8].*ones(2,12),'LineWidth',2.5,'Color',[1,1,1].*.8)
scatterSet=[];
for k=1:12
    tX=(1:k)-(1+k)/2;
    tY=(20-k).*ones(1,k);
    scatterSet=[scatterSet;[tX',tY']];
end
scatter(scatterSet(:,1),scatterSet(:,2),60,'filled','CData',[1 1 1].*.8);
plot([-6.5,-6.5,-1.5,-1,-1,-6.5,-6.5,6.5,6.5,1,1,1.5,6.5,6.5],...
     [8,20.5,20.5,19.8,19,8,0,0,8,19,19.8,20.5,20.5,8],...
     'LineWidth',4,'Color',[1,1,1].*.6);
 
% 制作图像句柄
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
scatter(0,20,60,'LineWidth',2,'CData',[140,196,123]./255)
accHdl=scatter([],[],30,'LineWidth',2,'CData',[140,196,123]./255);
pathHdl=plot(-10,-10,'LineWidth',2,'Color',[181,200,219]./255);
arrowHdl=text(-10,7.2,'↓','HorizontalAlignment','center','FontSize',40,'Color',[181,200,219]./255);
kerHdl=plot(-10,-10,'LineWidth',3,'Color',[180,64,71]./255);

% 模拟实验
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
X=-6:6;Y=zeros(1,13);ballSet=[];
N=100;
for n=1:N
    xyBegin=[0,19.5];fullPath=[0,20;xyBegin];
    tPath=randi(2,[1,12])-1.5;
    for i=1:length(tPath)
        xyBegin=xyBegin+[tPath(i),-0.5];
        fullPath=[fullPath;xyBegin];
        xyBegin=xyBegin+[0,-0.5];
        fullPath=[fullPath;xyBegin];
    end
    % 绘制路径
    pathHdl.XData=fullPath(:,1);
    pathHdl.YData=fullPath(:,2);
    arrowHdl.Position(1)=xyBegin(1);
    
    % 绘制下方堆积小球
    Y=Y+(xyBegin(1)==X);
    ballSet=[ballSet;xyBegin(1),Y(xyBegin(1)==X).*0.3];
    accHdl.XData=ballSet(:,1);
    accHdl.YData=ballSet(:,2);
    
    % 绘制核密度曲线
    [yi,xi]=ksdensity(ballSet(:,1));
    kerHdl.XData=xi;
    kerHdl.YData=yi.*n.*0.3;
    
    
    drawnow
    pause(0.5)
end
disp(ballSet(:,1)')
disp(ballSet(:,2)')

end







m=3000,n=16,y0=3,w=10000,v=1000
ballnum=zeros(1,n+1);
p=0.5,q=1-p
for i=n+1:-1:1
    x(i,1)=0.5*(n-i+1);
    y(i,1)=(n-i+1)+y0;
    for j=2:1:i
        x(i,j)=x(i,1)+(j-1)*1;
        y(i,j)=y(i,1);
    end
end
mm=moviein(m)
for i=1:1:m
    s=rand(1,w);
    xi=x(1,1);
    yi=y(1,1);
    k=1;d=1;
    subplot(1,2,1)
    for j=1:1:n
        
        plot(x(1:n,:),y(1:n,:),'o',x(n+1,:),y(n+1,:),'-')
        axis([-2 n+2 0 y0+n+1]),hold on
        k=k+1;
        if s(j)>p
            d=d+0;
        else
            d=d+1;
        end
        xt=x(k,d);yt=y(k,d);
        h=plot([xi,xt],[yi,yt]);axis([-2 n+2 0 y0+n+1])
        xi=xt;yi=yt;
    end
    ballnum(d)=ballnum(d)+1;
    % ballnum1=3*ballnum./m;
    title('Galton test');
    subplot(1,2,2)
    bar([0:n],ballnum),axis([-2 n+2 0 100])
    mm(i)=getframe;
    title('Bar');
    hold off
end