function [ X6 ] =X6( N, a, b, tau )
X6=zeros(N,1);
Abscisses=zeros(1,N);
Te=(b-a)/N;
for i=1:N
    Abscisses(1,i)=(i-1)*Te + a;
    if Abscisses(1,i)>-tau/2 && Abscisses(1,i)<tau/2
        X6(i)= 1;
    end
end

subplot(2,4,7),plot(Abscisses,X6);
title('X6(t)=rect(t)')

end
