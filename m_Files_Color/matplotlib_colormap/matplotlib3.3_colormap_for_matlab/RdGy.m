function map = RdGy(N)
% MatPlotLib 3.3 配色方案
% 输入:
% N   -  定义colormap长度的整数（N>=0）；若为空，则为当前图窗colormap长度
%
% 输出:
% map -  Nx3的RGB颜色矩阵
%
% Copyright  2020   Akun
% https://zhuanlan.zhihu.com/c_1074615528869531648

if nargin<1 || isempty(N)
	N = size(get(gcf,'colormap'),1);
else
	assert(isscalar(N)&&isreal(N),'First argument must be a real numeric scalar.')
end

C = [0.403921568627451,0,0.121568627450980;0.411764705882353,0,0.121568627450980;0.415686274509804,0,0.121568627450980;0.435294117647059,0.00784313725490196,0.125490196078431;0.447058823529412,0.0117647058823529,0.125490196078431;0.458823529411765,0.0156862745098039,0.129411764705882;0.478431372549020,0.0235294117647059,0.133333333333333;0.482352941176471,0.0235294117647059,0.133333333333333;0.505882352941176,0.0313725490196078,0.137254901960784;0.517647058823530,0.0352941176470588,0.137254901960784;0.525490196078431,0.0392156862745098,0.141176470588235;0.541176470588235,0.0431372549019608,0.141176470588235;0.552941176470588,0.0470588235294118,0.145098039215686;0.564705882352941,0.0509803921568627,0.145098039215686;0.588235294117647,0.0588235294117647,0.149019607843137;0.592156862745098,0.0588235294117647,0.149019607843137;0.607843137254902,0.0627450980392157,0.152941176470588;0.619607843137255,0.0666666666666667,0.152941176470588;0.631372549019608,0.0705882352941177,0.156862745098039;0.643137254901961,0.0745098039215686,0.156862745098039;0.658823529411765,0.0784313725490196,0.160784313725490;0.666666666666667,0.0823529411764706,0.160784313725490;0.690196078431373,0.0901960784313726,0.164705882352941;0.698039215686275,0.0980392156862745,0.168627450980392;0.701960784313725,0.101960784313725,0.172549019607843;0.709803921568628,0.121568627450980,0.180392156862745;0.713725490196078,0.129411764705882,0.184313725490196;0.721568627450980,0.141176470588235,0.192156862745098;0.729411764705882,0.160784313725490,0.200000000000000;0.733333333333333,0.164705882352941,0.200000000000000;0.745098039215686,0.188235294117647,0.211764705882353;0.749019607843137,0.196078431372549,0.215686274509804;0.752941176470588,0.207843137254902,0.219607843137255;0.760784313725490,0.219607843137255,0.227450980392157;0.764705882352941,0.231372549019608,0.231372549019608;0.772549019607843,0.243137254901961,0.235294117647059;0.780392156862745,0.262745098039216,0.247058823529412;0.784313725490196,0.270588235294118,0.250980392156863;0.792156862745098,0.286274509803922,0.258823529411765;0.800000000000000,0.298039215686275,0.262745098039216;0.803921568627451,0.309803921568627,0.266666666666667;0.807843137254902,0.317647058823529,0.274509803921569;0.815686274509804,0.333333333333333,0.282352941176471;0.819607843137255,0.341176470588235,0.286274509803922;0.831372549019608,0.364705882352941,0.294117647058824;0.839215686274510,0.376470588235294,0.301960784313725;0.839215686274510,0.380392156862745,0.305882352941177;0.847058823529412,0.396078431372549,0.317647058823529;0.850980392156863,0.407843137254902,0.325490196078431;0.854901960784314,0.415686274509804,0.333333333333333;0.862745098039216,0.435294117647059,0.345098039215686;0.866666666666667,0.439215686274510,0.349019607843137;0.874509803921569,0.458823529411765,0.364705882352941;0.878431372549020,0.470588235294118,0.372549019607843;0.882352941176471,0.482352941176471,0.380392156862745;0.886274509803922,0.490196078431373,0.388235294117647;0.894117647058824,0.501960784313726,0.396078431372549;0.898039215686275,0.513725490196078,0.407843137254902;0.905882352941177,0.533333333333333,0.423529411764706;0.909803921568627,0.541176470588235,0.427450980392157;0.917647058823529,0.552941176470588,0.439215686274510;0.921568627450980,0.564705882352941,0.447058823529412;0.925490196078431,0.576470588235294,0.454901960784314;0.929411764705882,0.588235294117647,0.462745098039216;0.933333333333333,0.600000000000000,0.474509803921569;0.937254901960784,0.607843137254902,0.478431372549020;0.949019607843137,0.627450980392157,0.494117647058824;0.952941176470588,0.639215686274510,0.501960784313726;0.956862745098039,0.650980392156863,0.513725490196078;0.956862745098039,0.658823529411765,0.525490196078431;0.956862745098039,0.666666666666667,0.533333333333333;0.960784313725490,0.674509803921569,0.545098039215686;0.960784313725490,0.690196078431373,0.564705882352941;0.960784313725490,0.694117647058824,0.568627450980392;0.964705882352941,0.705882352941177,0.588235294117647;0.968627450980392,0.713725490196078,0.596078431372549;0.968627450980392,0.725490196078431,0.607843137254902;0.968627450980392,0.733333333333333,0.619607843137255;0.972549019607843,0.741176470588235,0.631372549019608;0.972549019607843,0.749019607843137,0.639215686274510;0.976470588235294,0.764705882352941,0.662745098039216;0.976470588235294,0.768627450980392,0.666666666666667;0.976470588235294,0.780392156862745,0.682352941176471;0.980392156862745,0.792156862745098,0.694117647058824;0.980392156862745,0.800000000000000,0.705882352941177;0.980392156862745,0.807843137254902,0.713725490196078;0.984313725490196,0.819607843137255,0.729411764705882;0.984313725490196,0.823529411764706,0.737254901960784;0.988235294117647,0.839215686274510,0.756862745098039;0.988235294117647,0.847058823529412,0.768627450980392;0.992156862745098,0.858823529411765,0.780392156862745;0.992156862745098,0.862745098039216,0.788235294117647;0.992156862745098,0.866666666666667,0.796078431372549;0.992156862745098,0.874509803921569,0.803921568627451;0.992156862745098,0.886274509803922,0.819607843137255;0.992156862745098,0.886274509803922,0.823529411764706;0.992156862745098,0.894117647058824,0.839215686274510;0.992156862745098,0.901960784313726,0.847058823529412;0.992156862745098,0.905882352941177,0.854901960784314;0.992156862745098,0.913725490196078,0.862745098039216;0.992156862745098,0.917647058823529,0.874509803921569;0.992156862745098,0.921568627450980,0.882352941176471;0.996078431372549,0.933333333333333,0.898039215686275;0.996078431372549,0.941176470588235,0.905882352941177;0.996078431372549,0.945098039215686,0.917647058823529;0.996078431372549,0.952941176470588,0.925490196078431;0.996078431372549,0.956862745098039,0.933333333333333;0.996078431372549,0.960784313725490,0.941176470588235;0.996078431372549,0.972549019607843,0.956862745098039;0.996078431372549,0.972549019607843,0.960784313725490;0.996078431372549,0.984313725490196,0.976470588235294;0.996078431372549,0.988235294117647,0.984313725490196;0.996078431372549,0.996078431372549,0.992156862745098;0.996078431372549,0.996078431372549,0.996078431372549;0.992156862745098,0.992156862745098,0.992156862745098;0.984313725490196,0.984313725490196,0.984313725490196;0.976470588235294,0.976470588235294,0.976470588235294;0.976470588235294,0.976470588235294,0.976470588235294;0.968627450980392,0.968627450980392,0.968627450980392;0.960784313725490,0.960784313725490,0.960784313725490;0.956862745098039,0.956862745098039,0.956862745098039;0.952941176470588,0.952941176470588,0.952941176470588;0.949019607843137,0.949019607843137,0.949019607843137;0.945098039215686,0.945098039215686,0.945098039215686;0.933333333333333,0.933333333333333,0.933333333333333;0.929411764705882,0.929411764705882,0.929411764705882;0.925490196078431,0.925490196078431,0.925490196078431;0.917647058823529,0.917647058823529,0.917647058823529;0.913725490196078,0.913725490196078,0.913725490196078;0.909803921568627,0.909803921568627,0.909803921568627;0.901960784313726,0.901960784313726,0.901960784313726;0.901960784313726,0.901960784313726,0.901960784313726;0.890196078431373,0.890196078431373,0.890196078431373;0.886274509803922,0.886274509803922,0.886274509803922;0.882352941176471,0.882352941176471,0.882352941176471;0.878431372549020,0.878431372549020,0.878431372549020;0.870588235294118,0.870588235294118,0.870588235294118;0.866666666666667,0.866666666666667,0.866666666666667;0.854901960784314,0.854901960784314,0.854901960784314;0.850980392156863,0.850980392156863,0.850980392156863;0.843137254901961,0.843137254901961,0.843137254901961;0.835294117647059,0.835294117647059,0.835294117647059;0.831372549019608,0.831372549019608,0.831372549019608;0.823529411764706,0.823529411764706,0.823529411764706;0.815686274509804,0.815686274509804,0.815686274509804;0.811764705882353,0.811764705882353,0.811764705882353;0.800000000000000,0.800000000000000,0.800000000000000;0.796078431372549,0.796078431372549,0.796078431372549;0.788235294117647,0.788235294117647,0.788235294117647;0.784313725490196,0.784313725490196,0.784313725490196;0.776470588235294,0.776470588235294,0.776470588235294;0.772549019607843,0.772549019607843,0.772549019607843;0.760784313725490,0.760784313725490,0.760784313725490;0.760784313725490,0.760784313725490,0.760784313725490;0.749019607843137,0.749019607843137,0.749019607843137;0.741176470588235,0.741176470588235,0.741176470588235;0.737254901960784,0.737254901960784,0.737254901960784;0.729411764705882,0.729411764705882,0.729411764705882;0.725490196078431,0.725490196078431,0.725490196078431;0.717647058823529,0.717647058823529,0.717647058823529;0.701960784313725,0.701960784313725,0.701960784313725;0.698039215686275,0.698039215686275,0.698039215686275;0.686274509803922,0.686274509803922,0.686274509803922;0.678431372549020,0.678431372549020,0.678431372549020;0.670588235294118,0.670588235294118,0.670588235294118;0.662745098039216,0.662745098039216,0.662745098039216;0.650980392156863,0.650980392156863,0.650980392156863;0.647058823529412,0.647058823529412,0.647058823529412;0.631372549019608,0.631372549019608,0.631372549019608;0.623529411764706,0.623529411764706,0.623529411764706;0.615686274509804,0.615686274509804,0.615686274509804;0.607843137254902,0.607843137254902,0.607843137254902;0.600000000000000,0.600000000000000,0.600000000000000;0.592156862745098,0.592156862745098,0.592156862745098;0.576470588235294,0.576470588235294,0.576470588235294;0.572549019607843,0.572549019607843,0.572549019607843;0.560784313725490,0.560784313725490,0.560784313725490;0.552941176470588,0.552941176470588,0.552941176470588;0.545098039215686,0.545098039215686,0.545098039215686;0.533333333333333,0.533333333333333,0.533333333333333;0.529411764705882,0.529411764705882,0.529411764705882;0.517647058823530,0.517647058823530,0.517647058823530;0.501960784313726,0.501960784313726,0.501960784313726;0.494117647058824,0.494117647058824,0.494117647058824;0.482352941176471,0.482352941176471,0.482352941176471;0.474509803921569,0.474509803921569,0.474509803921569;0.466666666666667,0.466666666666667,0.466666666666667;0.454901960784314,0.454901960784314,0.454901960784314;0.443137254901961,0.443137254901961,0.443137254901961;0.439215686274510,0.439215686274510,0.439215686274510;0.419607843137255,0.419607843137255,0.419607843137255;0.411764705882353,0.411764705882353,0.411764705882353;0.403921568627451,0.403921568627451,0.403921568627451;0.392156862745098,0.392156862745098,0.392156862745098;0.384313725490196,0.384313725490196,0.384313725490196;0.376470588235294,0.376470588235294,0.376470588235294;0.356862745098039,0.356862745098039,0.356862745098039;0.352941176470588,0.352941176470588,0.352941176470588;0.341176470588235,0.341176470588235,0.341176470588235;0.329411764705882,0.329411764705882,0.329411764705882;0.321568627450980,0.321568627450980,0.321568627450980;0.309803921568627,0.309803921568627,0.309803921568627;0.305882352941177,0.305882352941177,0.305882352941177;0.298039215686275,0.298039215686275,0.298039215686275;0.282352941176471,0.282352941176471,0.282352941176471;0.270588235294118,0.270588235294118,0.270588235294118;0.266666666666667,0.266666666666667,0.266666666666667;0.254901960784314,0.254901960784314,0.254901960784314;0.250980392156863,0.250980392156863,0.250980392156863;0.239215686274510,0.239215686274510,0.239215686274510;0.227450980392157,0.227450980392157,0.227450980392157;0.223529411764706,0.223529411764706,0.223529411764706;0.207843137254902,0.207843137254902,0.207843137254902;0.203921568627451,0.203921568627451,0.203921568627451;0.192156862745098,0.192156862745098,0.192156862745098;0.184313725490196,0.184313725490196,0.184313725490196;0.180392156862745,0.180392156862745,0.180392156862745;0.172549019607843,0.172549019607843,0.172549019607843];

num = size(C,1);
vec = linspace(0,num+1,N+2);
map = interp1(1:num,C,vec(2:end-1),'linear','extrap'); %...插值
map = max(0,min(1,map));
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
% 制作：阿昆            %%%
% 公众号：阿昆的科研日常 %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%