close all; clear all; clc;
addpath('./utils/');

db_name = 'database_shoe';
query_ID = [];
param.choice = 'evaluation_PR_MAP';

%% hash methods choosing
hashmethods = 'SpH';
loopnbits = 64;

%hashmethods = {'Our Method', 'SELVE', 'CBE-opt', 'LSH', 'PCAH', 'SH', 'SKLSH', 'DSH', 'SpH'};
%hashmethods = {'CBE-rand', 'CBE-opt', 'ITQ', 'LSH', 'PCAH', 'SH', 'SKLSH', 'PCA-RR', 'DSH', 'SpH'};
nhmethods = length(hashmethods);
% loopnbits = [8 16 32 64 128];
runtimes = 1; % change 8 times to make the rusult more smooth
param.pos = [1:10:40 50:50:1000]; % The number of retrieved samples: Recall-The number of retrieved samples curve

%% 数据库路径
datapath = 'database_shoe\';   % 本路径中为保密数据，且都为原始数据，数据量过大，暂不上传（LSQ annotation）

%% LSH function lsq add
LSHparam = [];
switch(hashmethods)
    case 'LSH'
        addpath('./Method-LSH/');
        fprintf('......%s start ......\n\n', 'LSH');
        LSHparam.nbits = loopnbits;
        LSHparam.dim = 9801;
        LSHparam = trainLSH(LSHparam);
end
%% Run

% 读取数据集
rg = {'top','bottom','top_mirror','bottom_mirror'};
tic
for n = 1:4
    n
    load([datapath,'data10096_',rg{n},'.mat']);
    db_datalabel = glylabel;
    db_data = glyft;
    
    for k = 1:runtimes
        fprintf('The %d run time, start constructing data\n\n', k);
        exp_data = construct_data(db_name, double(db_data), param, runtimes,rg{n}); %构建数据
        fprintf('Constructing data finished\n\n');
        for i =1:length(loopnbits)
            fprintf('======start %d bits encoding======\n\n', loopnbits(i));
            param.nbits = loopnbits(i);
            param.query_ID = query_ID;
            for j = 1:nhmethods
%                 [recall(j),Orderhamm,rank,B_trn,B_tst] = demo_lsq(exp_data, param, hashmethods,LSHparam);
                  [B_trn,B_tst] = demo_coding(exp_data, param, hashmethods,LSHparam);
            end
        end
        clear exp_data;
    end
    tr = ['B.train_',rg{n}];
    ts = ['B.test_',rg{n}];
    eval([tr,'=B_trn']);
    eval([ts,'=B_tst']);
end
toc
save(['F:\·m-retrieve\哈希鞋印检索\HashCode\B_',hashmethods,'_',num2str(loopnbits)],'B')