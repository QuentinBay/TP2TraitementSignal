function [ X1 ] =TransformeeFourierX1( N, a, b, f0 )
X1=zeros(N,1);
Abscisses=zeros(1,N);

for i=1:N
    Abscisses(1,i)=(i-1)*(b-a)/N + a;
    X1(i)=cos(2*pi*f0*Abscisses(1,i));
end

subplot(2,4,2),plot(Abscisses,X1);
title('X1(t)=cos(2*pi*fo*t)')

end
