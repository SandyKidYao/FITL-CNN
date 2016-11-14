function jaffe_vis_out()
        erdata = load('jaffe_er_vis.mat');
        iddata = load('jaffe_id_vis.mat');
        aim = iddata;
        figure;
        hs = tight_subplot(8,3,[.0 .0],[.0 .02],[.0 .0]);
        j=1;
        for i = 1:16
                label = iddata.labels(i);
                if(label == 5)
                        continue;
                end
                axes(hs(3*(j-1)+1));
                showMeanImage(aim.imgdata,i);
                if(i==1)
                        title('input');
                end
                axes(hs(3*(j-1)+2));
                showMeanImage(aim.conv1,i);
                if(i==1)
                        title('conv1');
                end
                axes(hs(3*(j-1)+3));
                showMeanImage(aim.conv2,i);
                if(i==1)
                        title('conv2');
                end
                j = j+1;
        end
        
        figure;
        hs = tight_subplot(8,3,[.0 .0],[.0 .02],[.0 .0]);
        j=1;
        for i = 1:16
                label = iddata.labels(i);
                if(label == 1)
                        continue;
                end
                axes(hs(3*(j-1)+1));
                showMeanImage(aim.imgdata,i);
                if(j==1)
                        title('input');
                end
                axes(hs(3*(j-1)+2));
                showMeanImage(aim.conv1,i);
                if(j==1)
                        title('conv1');
                end
                axes(hs(3*(j-1)+3));
                showMeanImage(aim.conv2,i);
                if(j==1)
                        title('conv2');
                end
                j = j+1;
        end
end
function res = normalize(aim)
	res = (aim - min( aim(:) ) )/( max( aim(:) ) - min( aim(:) ));
end
function showMeanImage(aim,i)
        len = size(aim,3);
        dim = size(aim,2);
        feat = zeros(len,len);
        for j = 1:dim
                feat = feat + reshape(aim(i,j,:,:),[len len]);
        end
        imshow(normalize(feat));
end
function ha = tight_subplot(Nh, Nw, gap, marg_h, marg_w)

% tight_subplot creates "subplot" axes with adjustable gaps and margins
%
% ha = tight_subplot(Nh, Nw, gap, marg_h, marg_w)
%
%   in:  Nh      number of axes in hight (vertical direction)
%        Nw      number of axes in width (horizontaldirection)
%        gap     gaps between the axes in normalized units (0...1)
%                   or [gap_h gap_w] for different gaps in height and width 
%        marg_h  margins in height in normalized units (0...1)
%                   or [lower upper] for different lower and upper margins 
%        marg_w  margins in width in normalized units (0...1)
%                   or [left right] for different left and right margins 
%
%  out:  ha     array of handles of the axes objects
%                   starting from upper left corner, going row-wise as in
%                   going row-wise as in
%
%  Example: ha = tight_subplot(3,2,[.01 .03],[.1 .01],[.01 .01])
%           for ii = 1:6; axes(ha(ii)); plot(randn(10,ii)); end
%           set(ha(1:4),'XTickLabel',''); set(ha,'YTickLabel','')

% Pekka Kumpulainen 20.6.2010   @tut.fi
% Tampere University of Technology / Automation Science and Engineering


if nargin<3; gap = .02; end
if nargin<4 || isempty(marg_h); marg_h = .05; end
if nargin<5; marg_w = .05; end

if numel(gap)==1; 
    gap = [gap gap];
end
if numel(marg_w)==1; 
    marg_w = [marg_w marg_w];
end
if numel(marg_h)==1; 
    marg_h = [marg_h marg_h];
end

axh = (1-sum(marg_h)-(Nh-1)*gap(1))/Nh; 
axw = (1-sum(marg_w)-(Nw-1)*gap(2))/Nw;

py = 1-marg_h(2)-axh; 

ha = zeros(Nh*Nw,1);
ii = 0;
for ih = 1:Nh
    px = marg_w(1);

    for ix = 1:Nw
        ii = ii+1;
        ha(ii) = axes('Units','normalized', ...
            'Position',[px py axw axh], ...
            'XTickLabel','', ...
            'YTickLabel','');
        px = px+axw+gap(2);
    end
    py = py-axh-gap(1);
end
end