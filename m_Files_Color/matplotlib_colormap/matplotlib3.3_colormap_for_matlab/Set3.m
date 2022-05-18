function map = Set3(N)
% MatPlotLib 3.3 配色方案
% 输入:
% N   -  定义colormap长度的整数（N>=0）；若为空，则为当前图窗colormap长度
%
% 输出:
% map -  Nx3的RGB颜色矩阵
%
% Copyright  2020   Akun
% https://zhuanlan.zhihu.com/c_1074615528869531648

if nargin<1
	N = size(get(gcf,'colormap'),1);
else
	assert(isscalar(N)&&isreal(N),'First argument must be a real numeric scalar.')
	assert(fix(N)==N&&N>=0,'First argument must be a positive integer.')
end

C = [0.552941176470588,0.819607843137255,0.780392156862745;0.976470588235294,0.968627450980392,0.705882352941177;0.749019607843137,0.733333333333333,0.850980392156863;0.956862745098039,0.494117647058824,0.447058823529412;0.501960784313726,0.694117647058824,0.831372549019608;0.984313725490196,0.705882352941177,0.384313725490196;0.701960784313725,0.835294117647059,0.415686274509804;0.968627450980392,0.803921568627451,0.878431372549020;0.854901960784314,0.850980392156863,0.850980392156863;0.725490196078431,0.501960784313726,0.717647058823529;0.803921568627451,0.901960784313726,0.764705882352941;0.980392156862745,0.933333333333333,0.435294117647059];

map = C(1+mod(0:N-1,size(C,1)),:);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
% 制作：阿昆            %%%
% 公众号：阿昆的科研日常 %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%