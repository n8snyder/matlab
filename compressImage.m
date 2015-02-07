function [Xlr] = compressImage(name,p,seePlot)
X=imread(name);
Red=double(X(:,:,1));
Green=double(X(:,:,2));
Blue=double(X(:,:,3));
[Ur,Sr,Vr]=svd(Red);
Sr=diag(Sr);
RedLr=Ur(:,1:p)*diag(Sr(1:p))*Vr(:,1:p)';
[Ug,Sg,Vg]=svd(Green);
Sg=diag(Sg);
GreenLr=Ug(:,1:p)*diag(Sg(1:p))*Vg(:,1:p)';
[Ub,Sb,Vb]=svd(Blue);
Sb=diag(Sb);
BlueLr=Ub(:,1:p)*diag(Sb(1:p))*Vb(:,1:p)';
Xlr(:,:,1)=RedLr;
Xlr(:,:,2)=GreenLr;
Xlr(:,:,3)=BlueLr;
Xlr=uint8(Xlr);
if seePlot
    plot(Sb)
    hold on, plot(Sr)
    hold on, plot(Sg)
else
    imagesc(Xlr)
end
end

