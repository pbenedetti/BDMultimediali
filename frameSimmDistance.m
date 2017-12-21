function d = frameSimmDistance(f1, f2, A, T)

gf1 = rgb2gray(f1);
gf2 = rgb2gray(f2);
sf1 = single(gf1);
sf2 = single(gf2);

f1cHist = rgbhist(f1,8,1);
f2cHist = rgbhist(f2,8,1);
f1tHist = texhist(gf1,16,8,1);
f2tHist = texhist(gf2,16,8,1);
[~, d1] = vl_sift(sf1);
[~, d2] = vl_sift(sf2);
[~, scores12] = vl_ubcmatch(d1, d2);
[~, scores21] = vl_ubcmatch(d2, d1);

%distanza quaratica per l'istogramma dei colori
distF12c = sqrt((f1cHist-f2cHist)'*A*(f1cHist-f2cHist))/sqrt(2);
%distanza quadratica per l'istogramma delle texture
distF12t = sqrt((f1tHist-f2tHist)'*T*(f1tHist-f2tHist))/sqrt(2);
%distanza come rapporto fra #scores / #distanze
distF12s = 1 - (size(scores12,2)+size(scores21,2))/((size(d1, 2)+size(d2, 2)));


d = 0.6*distF12s + 0.2*distF12c + 0.2*distF12t;
end