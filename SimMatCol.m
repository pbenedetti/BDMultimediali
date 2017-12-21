%matrice simmetria colors A
colors = zeros(3, 512);
index = 1;
for r=1:8
  for g=1:8
   for b=1:8
       colors(:,index) = [r, g, b];
       index=index+1;
   end
  end
end

max = pdist2([1,1,1],[8,8,8],'euclidean');
A=zeros(512,512);
for i=1:size(A,1)
    for j=1:size(A,2)
        dij = pdist2(colors(:,i)',colors(:,j)','euclidean');
        A(i,j) = 1 - (dij/max);
    end
end