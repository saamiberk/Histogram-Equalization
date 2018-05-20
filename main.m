%paths
path1='images//washedPolen.tif';
path2='images//2.jpg';
path3='images//colorful.jpg';
path4='images//washed.tif';

f=imread(path4);

height=size(f,1);
width=size(f,2);
c=size(f,3);


% Image is gray
if c == 1
    img_pix = HistogramEqualization(f);
    img_pix = uint8(img_pix);
    
    
    % Plotting
    subplot(1,2,1),imshow(f);title('Before Gray H.E');
    subplot(1,2,2),imshow(img_pix);title('After Gray H.E');
    
    h = HistogramDiagram(f);
    z = HistogramDiagram(img_pix);   
    
    x=1:256;    
    figure;
    subplot(1,2,1),bar(x,h,'black');title('Before Gray H.E');
    subplot(1,2,2),bar(x,z,'black');title('After Gray H.E');

      
% Image is not gray
else    
    hsv = rgb2hsv(f);
    insty = hsv(:,:,3);
    
    % Scale to intensity 0,1 to 0,255
    for i=1:height
        for j=1:width
          insty(i,j)= insty(i,j)*255;
        end
    end
    
    img_pix = HistogramEqualization(insty);
    
    for i=1:height
      for j=1:width        
        img_pix(i,j) = img_pix(i,j)/255;      
      end
    end
    
    hsv_mod = hsv;
    hsv_mod(:,:,3) = img_pix;
    rgb = hsv2rgb(hsv_mod);
    
     % Plotting
    figure,subplot(1,2,1),imshow(f);title('Before Rgb H.E');
    subplot(1,2,2),imshow(rgb);title('After Rgb H.E');
   
    f_rgb=zeros(256,3);    
    f_rgb(:,1)=HistogramDiagram(f(:,:,1)); %Red  
    f_rgb(:,2)=HistogramDiagram(f(:,:,2)); %Green  
    f_rgb(:,3)=HistogramDiagram(f(:,:,3)); %Blue
    
    img_pix_rgb=zeros(256,3);    
    img_pix_rgb(:,1)=HistogramDiagram(round(rgb(:,:,1)*255)); %Red  
    img_pix_rgb(:,2)=HistogramDiagram(round(rgb(:,:,2)*255)); %Green  
    img_pix_rgb(:,3)=HistogramDiagram(round(rgb(:,:,3)*255)); %Blue
   
 
    mymap=[1 0 0; 0.2 1 0; 0 0.2 1];
     figure,subplot(1,2,1),bar(f_rgb);colormap(mymap);legend('RED CHANNEL','GREEN CHANNEL','BLUE CHANNEL');title('Before Rgb H.E');
       subplot(1,2,2),bar(img_pix_rgb);colormap(mymap);legend('RED CHANNEL','GREEN CHANNEL','BLUE CHANNEL');title('After Rgb H.E');
    
end




    





   
