glcm = graycomatrix(G);
[n_glcm,ps] = mapminmax(glcm);
ENT = entropy(glcm)
IDM = 0.0;
[n,m] = size(glcm);
for i = 1:n
    for j = 1:m
        IDM = IDM + n_glcm(i,j)/(1+(i-j)^2);
    end
end
IDM
stats = graycoprops(glcm)


