function [T,y]=faAlgo(y,start,endy)
%inizializzo

P1=[start,y(start)];
P2=[endy,y(endy)];


[m,m1,q]=coefEq(P1,P2);
%[B,dB]=breakpoint(y,q,m,m1);
    dBreak=0;
    for i=start:endy
            q1=(-m1*i)+y(i);
            xP=(q1-q)/(m-m1);
            yP=(m1*xP)+q1;

        d=sqrt((i-xP)^2+(y(i)-yP)^2);

            if(d>dBreak)
                dBreak=d;
                breakP(1)=i;
                breakP(2)=y(i);
            end
    end

%resize
%y=resize(y,B);
max=0.08;

if(dBreak>=max)

%a destra1
[T1,y]=faAlgo(y,start,breakP(1));
%a sinistra1
[T2,y]=faAlgo(y,breakP(1),endy);

[c1,r1]=size(T1);
[c2,r2]=size(T2);
for(i=1:r1+r2)
    if(i<=r1)
        T(i)=T1(i);
    end
    if(i>r1)
            T(i)=T2(i-r1);
    end
end

else
    T=[y(start),y(endy)];
end
