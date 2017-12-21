function H = texhist(imm, magBins, dirBins, nInd)


if(nargin<4)
    nInd=0;
    % Default is un-normalized histogram
end

[mag, dir] = imgradient(imm, 'sobel');
mag = uint8(mag);
dir = uint8(dir);

thresh = multithresh(mag,magBins-1);
valuesMax = [thresh max(mag(:))];
[treshMag, ~] = imquantize(mag,thresh,valuesMax);

thresh2 = multithresh(dir,dirBins-1);
valuesMax2 = [thresh2 max(dir(:))];
[treshDir, ~] = imquantize(dir,thresh2,valuesMax2);

magIndex = unique(treshMag);
dirIndex = unique(treshDir);
H=zeros(magBins,dirBins);
for i=1:size(treshMag,1)
    for j=1:size(treshMag,2)
        x = find(magIndex==treshMag(i,j));
        y = find(dirIndex==treshDir(i,j));
        H(x,y) = H(x,y) + 1;
    end
end

H=H(:);

if(nInd==1)
    H=H./sum(H);
    % l1 normalization
else if(nInd==2)
        H=normc(H);
        % l2 normalization
    end
end
