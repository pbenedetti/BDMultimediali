
%crea la matrice di D necessaria per fare MDS su k=1 (matrice simmetrica)
%vidualizzo i frame su cui ho calcolate le distanze
%ritorno i valori monodimensionali delle distanze in y e l'asse x del tempo
function [D,x,y] = MDS(f,start,nseq,A,T)
t0 = cputime;
D=zeros(nseq,nseq);
k=1;
for i=1:nseq
    for j=i:nseq
        ti = cputime;
        if (j==i)
            D(i,j)=0;
        else
            D(i,j) = frameSimmDistance(f(i+start).cdata, f(j+start).cdata, A, T);
            D(j,i)=D(i,j);
        end
        ei = cputime-ti;
        tot=nseq;
        fprintf('elemento %d/%d, tempo di calcolo: %d\n',k,tot,ei);
        k=k+1;
    end
end

y = mdscale(D,1);
x = [1:nseq];

%!!!!!!!ATTENTA SENNO TI DA ERRORE!!!!!!!!!
%settare subplot a seconda del numero di immagini che uso!
for h=1:nseq
    subplot(4,5,h),subimage(f(h+start).cdata)
end

efin = cputime-t0;
end