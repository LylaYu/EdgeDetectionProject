function [O] = glFilter(g,d0)

[M,N]=size(g); m=(M+1)/2; n=(N+1)/2; 
                       % threshold
F=fftshift(fft2(g));         % FFT
H=zeros(M,N); G=zeros(M,N);
for i=1:M
   for j=1:N
       d=(i-m)^2+(j-n)^2;
       H(i,j)=exp(-d/(2*d0^2));
       G(i,j)=H(i,j)*F(i,j);
    end
end
O=ifft2(ifftshift(G));                
O=real(O);                        
end

