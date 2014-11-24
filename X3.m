function [ X3 ] =TransformeeFourierX3( N, a, b, B )
X3=zeros(N,1);
Abscisses=zeros(1,N);

for i=1:N
    Abscisses(1,i)=(i-1)*(b-a)/N + a;
    if (Abscisses(1,i)>=0)
        X3(i)=exp(-B*Abscisses(1,i));
    end
    
end


subplot(2,4,4),plot(Abscisses,X3);
title('X3(t)=exp(-Bêta*t)*U(t)')
end