function[]=Filtrage()

%TESTS FONCTION GAUSSIENNE
[im, map]=imread('girafesIV.png');
[m,n]=size(im);
figure('Name','Test de filtres sur l image de girafe pour K=0.001 et K=0.00001','NumberTitle','off');
subplot(1,3,1),image(im);
colormap(map);
title('Image d origine');

%On calcule le spectre de l image recuperee
IM=fftshift(fft2(im));

%TEST POUR K=0.001
%Construction de fonctions de transfert de filtres
H=zeros(m,n);

for i=1:m
    for j=1:n
        H(i,j)=exp(-0.001*((floor(m/2)-i)*(floor(m/2)-i)+(floor(n/2)-j)*(floor(n/2)-j)));
    end
end

%Produit simple entre le spectre de l image et le filtre
PRODUIT=IM.*H;

%On recupere l image a partir du spectre
produit=ifft2(fftshift(PRODUIT));

produit=abs(produit);
maxi=max(max(produit));
mini=min(min(produit));
produit=(log(produit)-log(mini))/(log(maxi)-log(mini))*255;

subplot(1,3,2),image(produit);
colormap(map);
title('Filtre pour K=0.001');

%TEST POUR K=0.00001
%Construction de fonctions de transfert de filtres
H=zeros(m,n);

for i=1:m
    for j=1:n
        H(i,j)=exp(-0.00001*((floor(m/2)-i)*(floor(m/2)-i)+(floor(n/2)-j)*(floor(n/2)-j)));
    end
end

%Produit simple entre le spectre de l image et le filtre
PRODUIT=IM.*H;

produit=ifft2(fftshift(PRODUIT));

produit=abs(produit);
maxi=max(max(produit));
mini=min(min(produit));
produit=(log(produit)-log(mini))/(log(maxi)-log(mini))*255;

subplot(1,3,3),image(produit);
colormap(map);
title('Filtre pour K=0.00001');

%On remarque que plus la valeur de K est faible, plus l'image 
%avec le filtre ressemble a l'i


%APPLICATION
%Recuperation de l'image et affichage
figure('Name','Reduction de l image girafes','NumberTitle','off');
subplot(1,3,1),image(im);
colormap(map);
title('Image d origine');

%On copie 1 pixel sur 4
imReduit=zeros(floor(m/4)+1,floor(n/4)+1);
ligne=1;
for i=1:4:m
    colonne=1;
    for j=1:4:n
        imReduit(ligne,colonne)=im(i,j);
        colonne=colonne+1;
    end
ligne=ligne+1;
end

subplot(1,3,2),image(imReduit);
title('Image reduite en prenant 1 point sur 4');


%Application du filtrage pour lisser l'image avant le zoom
%construction du filtre
H=zeros(m,n);

for i=1:m
    for j=1:n
        H(i,j)=exp(-0.01*((floor(m/2)-i)*(floor(m/2)-i)+(floor(n/2)-j)*(floor(n/2)-j)));
    end
end

%Produit simple entre le spectre de l image et le filtre
PRODUIT=IM.*H;

produit=ifft2(fftshift(PRODUIT));

produit=abs(produit);
maxi=max(max(produit));
mini=min(min(produit));
produit=(log(produit)-log(mini))/(log(maxi)-log(mini))*255;

%On copie 1 pixel sur 4
imReduit=zeros(floor(m/4)+1,floor(n/4)+1);
ligne=1;
for i=1:4:m
    colonne=1;
    for j=1:4:n
        imReduit(ligne,colonne)=produit(i,j);
        colonne=colonne+1;
    end
ligne=ligne+1;
end

subplot(1,3,3),image(imReduit);
title('Image reduite avec lissage');

end