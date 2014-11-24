function [ X5 ] =TransformeeFourierX5( N, a, b, f0 )
X5=zeros(N,1);
Abscisses=zeros(1,N);

for i=1:N
    Abscisses(1,i)=(i-1)*(b-a)/N + a;
    X5(i)= exp(i*2*pi*f0*Abscisses(1,i));
end

subplot(2,4,6),plot(Abscisses,real(X5));
hold on
subplot(2,4,6),plot(Abscisses,imag(X5));
title('X5(t)=exp(i*2*pi*f0*t')

end



