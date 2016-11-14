function CK_VIS_DIS()
    demretyp = 'MDS';
    markertype = '.+doxs*^v><ph';
    siz = 100;
    dim = 3;
    dataName='ck_er_vis2l.mat';   
    visualize(dataName,demretyp,dim,markertype,siz);
    dataName='ck_id_vis2l.mat';    
    visualize(dataName,demretyp,dim,markertype,siz); 
end

function visualize(dataName,demretyp,dim,markertype,siz)
    load(dataName);
    
    c11=zeros(24,44*44*12);
    c21=zeros(24,19*19*24);
    c31=zeros(24,8*8*32);

    for i=1:24

        c11(i,:) = conv1(i,:);
        c21(i,:) = conv2(i,:);
        c31(i,:) = conv3(i,:);

    end

    [mappedX1, ~] = compute_mapping(c11, demretyp,dim);
    [mappedX2, ~] = compute_mapping(c21, demretyp,dim);
    [mappedX3, ~] = compute_mapping(c31, demretyp,dim);
    [mappedX4, ~] = compute_mapping(ip1, demretyp,dim);
    [mappedX5, ~] = compute_mapping(ip2, demretyp,dim);
    figure;
    subplot(231);
    scatterDif(mappedX1,siz,erlabels,idlabels,markertype,dim)    
    title('Convolution layer 1')
    subplot(232);
    scatterDif(mappedX2,siz,erlabels,idlabels,markertype,dim)    
    title('Convolution layer 2')
    subplot(233);
    scatterDif(mappedX3,siz,erlabels,idlabels,markertype,dim)    
    title('Convolution layer 3')
    subplot(234);
    scatterDif(mappedX4,siz,erlabels,idlabels,markertype,dim)    
    title('full connected layer 1')
    subplot(235);
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
