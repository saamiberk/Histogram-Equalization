
function img_pix = HistogramEqualization(f)

height=size(f,1);
width=size(f,2);
color_occ = zeros(1,256);
cumlf_pix = zeros(1,256);
img_pix = zeros(height,width);

max_bin=0;

% Number of occurrences of color level
for i=1:height
    for j=1:width       
       value=f(i,j);
       % Find max bin
       if value>max_bin
           max_bin=value;
       end
       color_occ(value+1)=color_occ(value+1)+1;
    end
end
for i = 1:256
    % Probability of color
    % (256(grayscale img)default or we can use max_bin variable)
    p = round((color_occ(i)/(height*width))*254);
    % Cumulatif calculation
    if i==1
        cumlf_pix(i)= p;
    else
        cumlf_pix(i)= p + cumlf_pix(i-1);
    end
end

% New image
for i=1:height
    for j=1:width
        img_pix(i,j)=cumlf_pix(f(i,j)+1);
    end
end

end


