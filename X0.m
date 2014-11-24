function [ X0 ] =TransformeeFourierX0( N, a, b, C )
X0=zeros(N,1);
Abscisses=zeros(1,N);

for i=1:N
    Abscisses(1,i)=(i-1)*(b-a)/N + a;
    X0(i)=C;    
end

subplot(2,4,1),plot(Abscisses,X0);
title('X0(t)=C')

end


