%%  Function 1 edgedetector for chair1.jpg
%   %% Function
%   function []= edgedetector(I,se,se1)
%   %% Read image 
%   %I=imread('chairs1.jpg');
%   [m,n,o]=size(I); 
%   g=imresize(I,[m/4,n/4]); %resize image for faster processing
%   m0=m/4; n0=n/4; 
%   figure,imshow(g); title('before processing');
%   g1=g;   % g1 is the colored image 
%   g=rgb2gray(g); 
%   figure,imshow(g); title('gray image');
% 
%   %% Gaussian Lowpass Filter
%   f=glFilter(g,40); f=uint8(f);       % The filter resembles that from PS 2
%   figure,imshow(f); title('lowpass filtered image');
% 
%   %% Edge
%   threshold=[0.01,0.17]; sigma=2;       % Define gaussian parameters 
%   e1=edge(double(f),'canny',threshold,sigma)*255;  
%   %e2=edge(double(f),'log');
%   %figure,imshow(e2); title('edge extraction (log)');
% 
%   for i=1:m0
%       for j=n0-6:n0
%           e1(i,j)=0;
%       end
%       for j=1:6
%           e1(i,j)=0;
%       end
%   end
%   figure,imshow(e1,[]); title('edge extraction (canny)');
% 
%   %% Region of interest
%   %[x,y]=ginput(2); % x is y, y is x
% 
%   %% Dilate
%   %se = ones(7,7);     % Define the SE
%   de = imdilate(e1,se);
%   %se2 = ones(5,5);
%   %de1 = imclose(de,se);
%   figure,imshow(de); title('edge after dilate');
% 
%   %% Fillin the edge
%   fe=imfill(de,'holes'); 
%   figure,imshow(fe);title('fill');
%   %se1=ones(9);
%   fer=imerode(fe,se1);
%   figure,imshow(fer);title('erode after fill');
% 
%   %% Finding the largest area
%   fer=logical(fer);
%   final=bwareafilt(fer,1);
%   figure,imshow(final);title('largest area of fill');
%   % edge
%   final=edge(final,'canny');
%   figure,imshow(final);title('final edge');
% 
%   %% Showing edge in original image
%   h=g1;
%   for i=1:m/4
%       for j=6:n/4-6
%           if final(i,j)==1
%               h(i,j,1)=225; h(i,j,2)=0;h(i,j,3)=0;
%               h(i-1,j,1)=225; h(i-1,j,2)=0;h(i-1,j,3)=0;
%               h(i,j-1,1)=225; h(i,j-1,2)=0;h(i,j-1,3)=0;
%               h(i+1,j,1)=225; h(i+1,j,2)=0;h(i+1,j,3)=0;
%               h(i,j+1,1)=225; h(i,j+1,2)=0;h(i,j+1,3)=0;
%           end
%       end
%   end
%   figure,imshow(h);title('image with edge');


%% Function 3 Low pass Gaussian filter
%   function [O] = glFilter(g,d0)
% 
%   [M,N]=size(g); m=(M+1)/2; n=(N+1)/2; 
%                        % threshold
%   F=fftshift(fft2(g));         % FFT
%   H=zeros(M,N); G=zeros(M,N);
%   for i=1:M
%       for j=1:N
%           d=(i-m)^2+(j-n)^2;
%           H(i,j)=exp(-d/(2*d0^2));
%           G(i,j)=H(i,j)*F(i,j);
%       end
%   end
%   O=ifft2(ifftshift(G));                
%   O=real(O);                        
%   end

%% For image 1: chair1.jpg
I1=imread('chairs1.jpg');
se=ones(7);
se1=ones(9);
edgedetector(I1,se,se1);
