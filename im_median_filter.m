function [filtered_im] = im_median_filter(gray_n_foto,n)
%n deðeri penceremizin boyutu
%gray_n_foto gürültülü resim uint8 alýr
%filtered_im filtrelenmiþ çýkýþ resmi uint8 döndürür 
[row col]=size(gray_n_foto);

%penceremiz köþelerde de çalýþabilsin diye uygun miktarda 0 ekliyorum
%resmin etrafýna ve gray_n_foto_zero deðiþkenine kaydediyorum
gray_n_foto_zero=zeros(row+n-1,col+n-1);
gray_n_foto_zero(ceil(n/2):row+floor(n/2),ceil(n/2):col+floor(n/2))=gray_n_foto;

filtered_im = zeros(row,col);%filtrelenmiþ resim için boþ matris

%önce satýrlar sonra sütunlarý tarayarak her piksel için medyan deðerini
%filtered_im e kaydeden döngümüz
for x = ceil(n/2) : row+floor(n/2);
    for y = ceil(n/2) : col+floor(n/2);
        win = gray_n_foto_zero(x-floor(n/2):x+floor(n/2),y-floor(n/2):y+floor(n/2));
        win=win(:)';
        filtered_im(x,y) = median(win);
    end
end
filtered_im=uint8(filtered_im)
end

