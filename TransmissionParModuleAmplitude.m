function []=TransmissionParModuleAmplitude(f1,f2)
%Definition des parametres de base
N=16384;
a=-25;
b=25;
Te=(b-a)/N;

%Vecteur colonne que l on utilisera pour la representation en frequences
f=(-1/(2*Te) : 1/(Te*N) : 1/(2*Te)-1/(Te*N) );

%Creation des signaux s1 et s2 que l'on va transmettre
s1=zeros(N,1);
s2=zeros(N,1);
Abscisses=zeros(1,N);
for i=1:N
    Abscisses(1,i)=(i-1)*Te + a;
    for n=1:4
        s1(i)=s1(i)+n*cos(2*pi*n*Abscisses(1,i));
        s2(i)=s2(i)+(5-n)*cos(2*pi*n*Abscisses(1,i));
    end
end

%Representation des signaux avant transmission
subplot(2,4,1),plot(f,tfour(s1'));
title('s1 avant modulation');
subplot(2,4,2),plot(f,tfour(s2'));
title('s2 avant modulation');

%Modulation et addition des signaux a transmettre
c=zeros(N,1);
for i=1:N
    c(i)=s1(i)*cos(2*pi*f1*Abscisses(1,i))+s2(i)*cos(2*pi*f2*Abscisses(1,i));
end

%Representation du signal apres modulation
subplot(2,4,3),plot(f,tfour(c'));
title('Le signal total apres modulation');


%Demodulation du signal s1
g1=zeros(N,1);
for i=1:N
    g1(i)=c(i)*cos(2*pi*f1*Abscisses(1,i));
end

%Representation du signal apres demodulation
subplot(2,4,4),plot(f,tfour(g1'));
title('s1 apres demodulation');


%Demodulation du signal s2
g2=zeros(N,1);
for i=1:N
    g2(i)=c(i)*cos(2*pi*f2*Abscisses(1,i));
end

%Representation du signal apres demodulation
subplot(2,4,5),plot(f,tfour(g2'));
title('s2 apres demodulation');

%Application d un filtre passe-bas pour ne garder que les basses frequences
h1=zeros(1,N);
h2=zeros(1,N);
g1=tfour(g1');
g2=tfour(g2');
for i=1:N
    if f(1,i)>-10 && f(1,i)<10
        h1(1,i)=g1(1,i)*2;
        h2(1,i)=g2(1,i)*2;
    end
end

%Representation du signal apres demodulation
subplot(2,4,6),plot(f,h1);
title('s1 apres demodulation et filtrage');
subplot(2,4,7),plot(f,h2);
title('s2 apres demodulation et filtrage');

end