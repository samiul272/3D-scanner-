clc
clear all
close all
im=0;
load('matlab1' , 'im');
figure(1);
%imshow(im)
%hold on
red=im(:,:,1);
%figure(2);
%imshow(red)

col=640;
row=480;
n=1;
for i=1:row
    for j=col:-1:1
        
        if ((red(i,j))>225)
            xd(n)=i;
            yd(n)=j;
            n=n+1;
        end
    end
end

%figure(3);
%plot(xd,yd,'*')
%hold on
curv=myPolyFit(4,xd,yd);

   yfin=polyval(curv,xd);
   
   n=length(yfin);
   for i=1:n
       yf(i)=yfin(n-i+1);
   end
   %plot(yfin,xd,'--');
   %hold on
   mult=sin((11/36)*pi);
   Yf=(yf-425);
   R=(Yf./mult);
   Z=xd;
   m=1;
plot(R,Z,'--')
m=1;
n=1;


for i=1:200
    for j=1:length(R)
        r(m,n)=R(j);
        n=n+1;
    end
    m=m+1;
    n=1;
end
n=1;
m=1;
for i=1:200
    for j=1:length(Z)
        z(m,n)=Z(j);
        n=n+1;
    end
    m=m+1;
    n=1;
end
h=0;
m=1;
n=1;
for i=1:200
    for j=1:length(Z)
        theta(m,n)=h;
        n=n+1;
    end
    h=h+(2*pi/200);
    m=m+1;
    n=1;
end
surf(r.*cos(theta),r.*sin(theta),z);