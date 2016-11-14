function JAFFE_VIS_DIS()
    demretyp = 'MDS';
    markertype = 'o+x.ds*^v><ph';
    siz = 100;
    dim = 3;
    dataName='jaffe_er_vis2l.mat';   
    visualize(dataName,demretyp,dim,markertype,siz);
    dataName='jaffe_id_vis2l.mat';     
    visualize(dataName,demretyp,dim,markertype,siz);   
end

function visualize(dataName,demretyp,dim,markertype,siz)
    load(dataName);   
    c11=zeros(16,60*60*20);
    c21=zeros(16,26*26*50);
    for i=1:16
        c11(i,:) = conv1(i,:);
        c21(i,:) = conv2(i,:);
    end
    [mappedX1, ~] = compute_mapping(c11, demretyp,dim);
    [mappedX2, ~] = compute_mapping(c21, demretyp,dim);
    [mappedX4, ~] = compute_mapping(ip1, demretyp,dim);
    [mappedX5, ~] = compute_mapping(ip2, demretyp,dim);
    figure;
    subplot(221);
    scatterDif(mappedX1,siz,erlabels,idlabels,markertype,dim)   
    title('Convolution layer 1')
    subplot(222);
    scatterDif(mappedX2,siz,erlabels,idlabels,markertype,dim)
    title('Convolution layer 2')
    subplot(223);
    scatterDif(mappedX4,siz,erlabels,idlabels,markertype,dim)
    title('full connected layer 1')
    subplot(224);
    scatterDif(mappedX5,siz,erlabels,idlabels,markertype,dim)
    title('full connected layer 2')    
    hold off;
end
function scatterDif(mappedX,siz,erlabels,idlabels,markertype,dim)

    if(dim == 2)
        l1 = mappedX(:,1);
        l2 = mappedX(:,2);
        [~,n]=size(erlabels);
        for i = 1:n
            scatter(l1(i), l2(i),siz, erlabels(i),markertype(idlabels(i)),'filled');
            hold on;
        end
    end
    
    if(dim == 3)
        l1 = mappedX(:,1);
        l2 = mappedX(:,2);
        l3 = mappedX(:,3);
        [~,n]=size(erlabels);
        for i = 1:n
            scatter3(l1(i), l2(i),l3(i),siz, erlabels(i),markertype(idlabels(i)),'filled');
            hold on;
        end
    end

end