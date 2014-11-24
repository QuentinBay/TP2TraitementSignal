function [ X7 ] =TransformeeFourierX7( N, a, b )
X7=zeros(N,1);
Abscisses=zeros(1,N);

for i=1:N
    Abscisses(1,i)=(i-1)*(b-a)/N + a;
    X7(i)= exp(-pi*Abscisses(1,i)*Abscisses(1,i));
end

subplot(2,4,8),plot(Abscisses,X7);
title('X7(t)=exp(-pi*t²))')

end
