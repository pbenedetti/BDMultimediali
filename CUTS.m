function [T,y]=CUTS(y,start,endy)

%inizializzo gli estremi
P1=[start,y(start)];
P2=[endy,y(endy)];

% y=mx+q trovo m e q per la retta passante per P1P2 
% ed m1=-m^-1 coefficiente della retta perpendicolare a P1P2 che mi serve
% per calcolare le distanze
[m,m1,q]=coefEq(P1,P2);

%calcolo le distanze fra la retta e i punti di y
    dBreak=0;
    for i=start:endy
            q1=(-m1*i)+y(i);
            xP=(q1-q)/(m-m1);
            yP=(m1*xP)+q1;

        d=sqrt((i-xP)^2+(y(i)-yP)^2);
            %tengo il punto di y più distante
            if(d>dBreak)
                dBreak=d;
                breakP(1)=i;
                breakP(2)=y(i);
            end
    end

%l'algoritmo preveda che venga data una distanza soglia sotto la quale si
%scartino i punti perchè troppo vicini (approssimazione)
max=0.08;
ind=1;
if(dBreak>=max)


%procedo verso sinistra
[T1,y]=faAlgo(y,start,breakP(1));
%procedo verso destra
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
