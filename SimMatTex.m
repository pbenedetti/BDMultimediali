%matrice simmetria delle texture T (indipendenti da valori)
textures = zeros(2, 128);
index = 1;
for m=1:16
  for d=1:8
       textures(:,index) = [m, d];
       index=index+1;
  end
end

max = pdist2([1,1],[16,8],'euclidean');
T=zeros(128,128);
for i=1:size(T,1)
    for j=1:size(T,2)
        dij = pdist2(textures(:,i)',textures(:,j)','euclidean');
        T(i,j) = 1 - (dij/max);
    end
end