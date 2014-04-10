function [filtered_im] = im_median_filter(gray_n_foto,n)
%n de�eri penceremizin boyutu
%gray_n_foto g�r�lt�l� resim uint8 al�r
%filtered_im filtrelenmi� ��k�� resmi uint8 d�nd�r�r 
[row col]=size(gray_n_foto);

%penceremiz k��elerde de �al��abilsin diye uygun miktarda 0 ekliyorum
%resmin etraf�na ve gray_n_foto_zero de�i�kenine kaydediyorum
gray_n_foto_zero=zeros(row+n-1,col+n-1);
gray_n_foto_zero(ceil(n/2):row+floor(n/2),ceil(n/2):col+floor(n/2))=gray_n_foto;

filtered_im = zeros(row,col);%filtrelenmi� resim i�in bo� matris

%�nce sat�rlar sonra s�tunlar� tarayarak her piksel i�in medyan de�erini
%filtered_im e kaydeden d�ng�m�z
for x = ceil(n/2) : row+floor(n/2);
    for y = ceil(n/2) : col+floor(n/2);
        win = gray_n_foto_zero(x-floor(n/2):x+floor(n/2),y-floor(n/2):y+floor(n/2));
        win=win(:)';
        filtered_im(x,y) = median(win);
    end
end
filtered_im=uint8(filtered_im)
end

