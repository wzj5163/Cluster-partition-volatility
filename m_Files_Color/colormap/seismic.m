function map = seismic(N)
% MatPlotLib 3.3 ��ɫ����
% ����:
% N   -  ����colormap���ȵ�������N>=0������Ϊ�գ���Ϊ��ǰͼ��colormap����
%
% ���:
% map -  Nx3��RGB��ɫ����
%
% Copyright  2020   Akun
% https://zhuanlan.zhihu.com/c_1074615528869531648

if nargin<1 || isempty(N)
	N = size(get(gcf,'colormap'),1);
else
	assert(isscalar(N)&&isreal(N),'First argument must be a real numeric scalar.')
end

C = [0,0,0.298039215686275;0,0,0.309803921568627;0,0,0.321568627450980;0,0,0.329411764705882;0,0,0.345098039215686;0,0,0.352941176470588;0,0,0.376470588235294;0,0,0.384313725490196;0,0,0.396078431372549;0,0,0.407843137254902;0,0,0.419607843137255;0,0,0.431372549019608;0,0,0.447058823529412;0,0,0.454901960784314;0,0,0.474509803921569;0,0,0.486274509803922;0,0,0.494117647058824;0,0,0.505882352941176;0,0,0.517647058823530;0,0,0.529411764705882;0,0,0.549019607843137;0,0,0.556862745098039;0,0,0.572549019607843;0,0,0.584313725490196;0,0,0.596078431372549;0,0,0.603921568627451;0,0,0.619607843137255;0,0,0.627450980392157;0,0,0.650980392156863;0,0,0.658823529411765;0,0,0.670588235294118;0,0,0.682352941176471;0,0,0.694117647058824;0,0,0.705882352941177;0,0,0.721568627450980;0,0,0.729411764705882;0,0,0.749019607843137;0,0,0.760784313725490;0,0,0.768627450980392;0,0,0.780392156862745;0,0,0.792156862745098;0,0,0.803921568627451;0,0,0.823529411764706;0,0,0.831372549019608;0,0,0.847058823529412;0,0,0.858823529411765;0,0,0.870588235294118;0,0,0.878431372549020;0,0,0.894117647058824;0,0,0.901960784313726;0,0,0.925490196078431;0,0,0.933333333333333;0,0,0.945098039215686;0,0,0.956862745098039;0,0,0.968627450980392;0,0,0.980392156862745;0.00392156862745098,0.00392156862745098,1;0.0117647058823529,0.0117647058823529,1;0.0313725490196078,0.0313725490196078,1;0.0509803921568627,0.0509803921568627,1;0.0666666666666667,0.0666666666666667,1;0.0823529411764706,0.0823529411764706,1;0.0980392156862745,0.0980392156862745,1;0.113725490196078,0.113725490196078,1;0.145098039215686,0.145098039215686,1;0.156862745098039,0.156862745098039,1;0.176470588235294,0.176470588235294,1;0.192156862745098,0.192156862745098,1;0.207843137254902,0.207843137254902,1;0.223529411764706,0.223529411764706,1;0.247058823529412,0.247058823529412,1;0.254901960784314,0.254901960784314,1;0.282352941176471,0.282352941176471,1;0.301960784313725,0.301960784313725,1;0.317647058823529,0.317647058823529,1;0.333333333333333,0.333333333333333,1;0.349019607843137,0.349019607843137,1;0.364705882352941,0.364705882352941,1;0.396078431372549,0.396078431372549,1;0.400000000000000,0.400000000000000,1;0.427450980392157,0.427450980392157,1;0.443137254901961,0.443137254901961,1;0.458823529411765,0.458823529411765,1;0.474509803921569,0.474509803921569,1;0.494117647058824,0.494117647058824,1;0.505882352941176,0.505882352941176,1;0.533333333333333,0.533333333333333,1;0.552941176470588,0.552941176470588,1;0.568627450980392,0.568627450980392,1;0.584313725490196,0.584313725490196,1;0.600000000000000,0.600000000000000,1;0.615686274509804,0.615686274509804,1;0.643137254901961,0.643137254901961,1;0.647058823529412,0.647058823529412,1;0.678431372549020,0.678431372549020,1;0.694117647058824,0.694117647058824,1;0.709803921568628,0.709803921568628,1;0.729411764705882,0.729411764705882,1;0.741176470588235,0.741176470588235,1;0.756862745098039,0.756862745098039,1;0.784313725490196,0.784313725490196,1;0.796078431372549,0.796078431372549,1;0.819607843137255,0.819607843137255,1;0.835294117647059,0.835294117647059,1;0.850980392156863,0.850980392156863,1;0.866666666666667,0.866666666666667,1;0.886274509803922,0.886274509803922,1;0.898039215686275,0.898039215686275,1;0.929411764705882,0.929411764705882,1;0.945098039215686,0.945098039215686,1;0.960784313725490,0.960784313725490,1;0.976470588235294,0.976470588235294,1;0.992156862745098,0.992156862745098,1;1,0.992156862745098,0.992156862745098;1,0.964705882352941,0.964705882352941;1,0.956862745098039,0.956862745098039;1,0.929411764705882,0.929411764705882;1,0.913725490196078,0.913725490196078;1,0.898039215686275,0.898039215686275;1,0.874509803921569,0.874509803921569;1,0.866666666666667,0.866666666666667;1,0.850980392156863,0.850980392156863;1,0.819607843137255,0.819607843137255;1,0.807843137254902,0.807843137254902;1,0.788235294117647,0.788235294117647;1,0.772549019607843,0.772549019607843;1,0.756862745098039,0.756862745098039;1,0.725490196078431,0.725490196078431;1,0.717647058823529,0.717647058823529;1,0.705882352941177,0.705882352941177;1,0.678431372549020,0.678431372549020;1,0.662745098039216,0.662745098039216;1,0.643137254901961,0.643137254901961;1,0.631372549019608,0.631372549019608;1,0.615686274509804,0.615686274509804;1,0.600000000000000,0.600000000000000;1,0.568627450980392,0.568627450980392;1,0.564705882352941,0.564705882352941;1,0.537254901960784,0.537254901960784;1,0.517647058823530,0.517647058823530;1,0.505882352941176,0.505882352941176;1,0.482352941176471,0.482352941176471;1,0.474509803921569,0.474509803921569;1,0.458823529411765,0.458823529411765;1,0.427450980392157,0.427450980392157;1,0.415686274509804,0.415686274509804;1,0.396078431372549,0.396078431372549;1,0.380392156862745,0.380392156862745;1,0.364705882352941,0.364705882352941;1,0.333333333333333,0.333333333333333;1,0.325490196078431,0.325490196078431;1,0.317647058823529,0.317647058823529;1,0.286274509803922,0.286274509803922;1,0.270588235294118,0.270588235294118;1,0.254901960784314,0.254901960784314;1,0.235294117647059,0.235294117647059;1,0.219607843137255,0.219607843137255;1,0.207843137254902,0.207843137254902;1,0.176470588235294,0.176470588235294;1,0.168627450980392,0.168627450980392;1,0.145098039215686,0.145098039215686;1,0.125490196078431,0.125490196078431;1,0.113725490196078,0.113725490196078;1,0.0862745098039216,0.0862745098039216;1,0.0784313725490196,0.0784313725490196;1,0.0627450980392157,0.0627450980392157;1,0.0313725490196078,0.0313725490196078;1,0.0196078431372549,0.0196078431372549;1,0,0;0.992156862745098,0,0;0.984313725490196,0,0;0.968627450980392,0,0;0.964705882352941,0,0;0.960784313725490,0,0;0.945098039215686,0,0;0.937254901960784,0,0;0.929411764705882,0,0;0.917647058823529,0,0;0.913725490196078,0,0;0.898039215686275,0,0;0.890196078431373,0,0;0.886274509803922,0,0;0.874509803921569,0,0;0.866666666666667,0,0;0.858823529411765,0,0;0.847058823529412,0,0;0.843137254901961,0,0;0.835294117647059,0,0;0.819607843137255,0,0;0.811764705882353,0,0;0.803921568627451,0,0;0.796078431372549,0,0;0.788235294117647,0,0;0.772549019607843,0,0;0.768627450980392,0,0;0.764705882352941,0,0;0.749019607843137,0,0;0.741176470588235,0,0;0.733333333333333,0,0;0.721568627450980,0,0;0.717647058823529,0,0;0.701960784313725,0,0;0.694117647058824,0,0;0.690196078431373,0,0;0.678431372549020,0,0;0.670588235294118,0,0;0.662745098039216,0,0;0.647058823529412,0,0;0.643137254901961,0,0;0.639215686274510,0,0;0.623529411764706,0,0;0.615686274509804,0,0;0.607843137254902,0,0;0.600000000000000,0,0;0.592156862745098,0,0;0.576470588235294,0,0;0.568627450980392,0,0;0.568627450980392,0,0];

num = size(C,1);
vec = linspace(0,num+1,N+2);
map = interp1(1:num,C,vec(2:end-1),'linear','extrap'); %...��ֵ
map = max(0,min(1,map));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
% ����������            %%%
% ���ںţ������Ŀ����ճ� %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%