function [ X2 ] =TransformeeFourierX2( N, a, b, f0 )
X2=zeros(N,1);
Abscisses=zeros(1,N);

for i=1:N
    Abscisses(1,i)=(i-1)*(b-a)/N + a;
    X2(i)=sin(2*pi*f0*Abscisses(1,i));
end

subplot(2,4,3),plot(Abscisses,X2);
title('X2(t)=sin(2*pi*fo*t)')

end



