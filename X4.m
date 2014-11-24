function [ X4 ] =TransformeeFourierX4( N, a, b, Tau, dt )
X4=zeros(N,1);
Abscisses=zeros(1,N);

for i=1:N
    Abscisses(1,i)=(i-1)*(b-a)/N + a;
    X4(i)= Tau*(Abscisses(1,i)-dt);
end

subplot(2,4,5),plot(Abscisses,X4);
title('X4(t)=Tau*(t-dt)')

end



