function[]=LocalisationFormesParCorrelation()

%Creation de la matrice 1024 contenant la forme 'n'
n=zeros(1024);

nTemp=255*[1 1 1 1 1 1 1 0;
           0 1 1 1 1 1 1 1;
           0 0 1 1 0 0 1 1;
           0 0 1 1 0 0 1 1;
           0 0 1 1 0 0 1 1;
           0 0 1 1 0 0 1 1;
           0 1 1 0 0 0 1 1];

for i=1:7
    for j=1:8
    n(i,j)=nTemp(i,j);
    end
end
     
%Creation de la matrice 1024 contenant la forme '?'
interro=zeros(1024);

interroTemp=255*[0 0 1 1 1 1 0 0;
                 0 1 1 1 1 1 1 0;
                 1 1 0 0 0 0 1 1;
                 0 0 0 0 0 0 1 1;
                 0 0 0 0 0 1 1 0;
                 0 0 0 0 1 1 0 0;
                 0 0 0 1 1 0 0 0;
                 0 0 0 1 1 0 0 0;
                 0 0 0 0 0 0 0 0;
                 0 0 0 1 1 0 0 0;
                 0 0 0 1 1 0 0 0];
                 
for i=1:11
    for j=1:8
        interro(i,j)=interroTemp(i,j);
    end
end

%Creation de la matrice 1024 contenant la forme '?inversé'
interroInv=zeros(1024);       

interroInvTemp=255*[0 0 0 1 1 0 0 0;
                    0 0 0 1 1 0 0 0;
                    0 0 0 0 0 0 0 0;
                    0 0 0 1 1 0 0 0;
                    0 0 0 1 1 0 0 0;
                    0 0 1 1 0 0 0 0;
                    0 1 1 0 0 0 0 0;
                    1 1 0 0 0 0 0 0;
                    1 1 0 0 0 0 1 1;
                    0 1 1 1 1 1 1 0;
                    0 0 1 1 1 1 0 0];
                 
for i=1:11
    for j=1:8
        interroInv(i,j)=interroInvTemp(i,j);
    end
end


%Creation de la matrice 1024 contenant l image avec les formes a compter
[im, map]=imread('imageFormes.png');

%Representation de l'ensembles des matrices crees
subplot(2,4,1),image(n);
colormap(map);
subplot(2,4,2),image(interro);
colormap(map);
subplot(2,4,3),image(interroInv);
colormap(map);
subplot(2,4,4),image(im);
colormap(map);

%On inverse l'image
im=rot90(im,2);


%On calcule les transformees de fourier des matrices 
N=fftshift(fft2(n));
INTERRO=fftshift(fft2(interro));
INTERROINV=fftshift(fft2(interroInv));
IM=fftshift(fft2(im));

%Produit de convolution
CONVN=N.*IM;
CONVINTERRO=INTERRO.*IM;
CONVINTERROINV=INTERROINV.*IM;


%Transformee inverse de fourier
convN=fftshift(ifft2(CONVN));
convInterro=fftshift(ifft2(CONVINTERRO));
convInterroInv=fftshift(ifft2(CONVINTERROINV));


subplot(2,4,5),plot(convN);
subplot(2,4,6),plot(convInterro);
subplot(2,4,7),plot(convInterroInv);


%Pour chaque max trouve, on implemente le nombre de forme
nbN=0;
nbInterro=0;
nbInterroInv=0;

maxN=max(max(convN));
maxInterro=max(max(convInterro));
maxInterroInv=max(max(convInterroInv));

for i=1:1024
    for j=1:1024
        if convN(i,j)>=0.98*maxN
            nbN=nbN+1;
        end
        if convInterro(i,j)>=0.98*maxInterro
            nbInterro=nbInterro+1;
        end
        if convInterroInv(i,j)>=0.98*maxInterroInv
           nbInterroInv=nbInterroInv+1;
        end
    end
end

nbN
nbInterro
nbInterroInv

end