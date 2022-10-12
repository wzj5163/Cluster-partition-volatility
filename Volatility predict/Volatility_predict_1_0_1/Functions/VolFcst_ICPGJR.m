% Forecast volatility by GJR, CPGJR, RCPGJR
%
% Input:
%
%        Read_Name               Input excel name of raw index, like 'DAX_0608.xlsx'
%
%        Time_Outsample          Time for out-of-sample, like
%                                [2021,05,18;2022,05,18], the first row is
%                                the starting date, the second row is the
%                                end date. If only one row, like
%                                [2021,05,18], then the default end date is
%                                the last date of input data.
% Output:
%
%    results_ICPGJR              Volatility forecast by ICPGJR
%

function results_ICPGJR = VolFcst_ICPGJR(Read_Name,Time_Outsample,varargin)
parseObj = inputParser;
functionName='VolFcst_ICPGJR';
addParameter(parseObj,'Window_Size',750,@(x)validateattributes(x,{'numeric'},{'scalar','integer','positive'},functionName));
addParameter(parseObj,'Cluster_Min_Length',50,@(x)validateattributes(x,{'numeric'},{'scalar','integer','positive'},functionName));
addParameter(parseObj,'Innovation_Distribution','NORMAL',@(x)validateattributes(x,{'string','char'},{''},functionName));
parse(parseObj,varargin{:});
window_size=parseObj.Results.Window_Size;
innovation_distribution=parseObj.Results.Innovation_Distribution;
min_length=parseObj.Results.Cluster_Min_Length;

% TIME
datatable=readtable(Read_Name);
if size(Time_Outsample,1)>1
    Start_Outsample=Time_Outsample(1,:);
    End_Outsample=Time_Outsample(2,:);
    oos_index=and(datatable.Date>=datetime(Start_Outsample(1),Start_Outsample(2),Start_Outsample(3)),...
                  datatable.Date<=datetime(End_Outsample(1),End_Outsample(2),End_Outsample(3)));
else
    Start_Outsample=Time_Outsample(1,:);
    oos_index=datatable.Date>=datetime(Start_Outsample(1),Start_Outsample(2),Start_Outsample(3));
end

n=sum(oos_index);
% volatility forecast
vf_ICPGJR=zeros(n,1);
% in-sample fitness
ismae_ICPGJR=zeros(n,1);
isrmse_ICPGJR=zeros(n,1);
% initial setting
i1=0;I=find(oos_index==1);
% GJR-GARCH Model
if strcmp(innovation_distribution,'NORMAL')
    Mdl=gjr('GARCHLags',1,'ARCHLags',1,'LeverageLags',1,'Offset',NaN,'Distribution','Gaussian');
else
    Mdl=gjr('GARCHLags',1,'ARCHLags',1,'LeverageLags',1,'Offset',NaN,'Distribution','t');
end

for i=I(1):I(end)

    i1=i1+1;
    fprintf('ICPGJR: i=%d\n',i1)
    index=i-window_size:i-1;
    ret=datatable.Return(index);

    
    EstMdl = estimate(Mdl,ret,"Display","off");
    v_GJR = infer(EstMdl,ret);
    %% CP-GJR
    [LB,J,~]=Fisher_div_sqr(v_GJR,min_length);
    K = OptimalClusterNumber(v_GJR,LB);
    [~,Nodes]=Vol_ClusterPartition(v_GJR,K,J);
    %% ICP-GJR
    [v_ICPGJR,Nodes] = Vol_ClusterPartitionIterationGarchorGjr(Nodes,ret,v_GJR,Mdl,min_length);
    EstMdl = estimate(Mdl,ret(Nodes(end):end),"Display","off");
    vf_ICPGJR(i1)=forecast(EstMdl,1,ret(Nodes(end):end));
    ismae_ICPGJR(i1)=mean(abs(v_ICPGJR-ret.^2));
    isrmse_ICPGJR(i1)=sqrt(mean((v_ICPGJR-ret.^2).^2));

end

results_ICPGJR.vf_ICPGJR=vf_ICPGJR;
results_ICPGJR.ismae_ICPGJR=ismae_ICPGJR;
results_ICPGJR.isrmse_ICPGJR=isrmse_ICPGJR;

end

