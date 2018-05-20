
function H = HistogramDiagram(f)
height=size(f,1);
width=size(f,2);
H=zeros(1,256);    
    for i=1:height
      for j=1:width
        a=f(i,j)+1;       
        H(a)=H(a)+1;       
      end
    end
end