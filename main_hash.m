%----Lushengqing annotation---2018-12-17 10：30
%%函数功能：根据提前映射好的哈希码，计算相似度
clc; clear ; close all

%% 加载 数据库图列表 测试图列表

codename='LSH_480'; %需要自己更改的名字

load(['.\HashCode\B_',codename,'.mat']);
load database10096.mat;
load testImgLabel_72.mat;
load .\database_shoe\rate.mat;

%计算所得 相似度矩阵 存储路径
save_path = 'score\' ;

% Top pos
pos = [0.005:0.005:0.02 0.05:0.05:1];

%% 循环计算相似度
tic
s = zeros(length(testImgLabel_72),length(database10096));

    for i=1:length(testImgLabel_72)   
        f_result = cell(1, 2);
        
        %load 测试图的特征
        test_feat.t_feat = B.test_top(i,:);
        test_feat.b_feat = B.test_bottom(i,:);
        test_feat.t_mfeat = B.test_top_mirror(i,:);
        test_feat.b_mfeat = B.test_bottom_mirror(i,:);
        test_feat.t_rate = rate.test_t_rate(i);
        test_feat.b_rate = rate.test_b_rate(i);

         for j = 1: length(database10096)
        %load 数据库图的特征
        train_feat.t_feat = B.train_top(j,:);
        train_feat.b_feat = B.train_bottom(j,:);
        train_feat.t_mfeat = B.train_top_mirror(j,:);
        train_feat.b_mfeat = B.train_bottom_mirror(j,:);
        train_feat.t_rate = rate.train_t_rate(j);
        train_feat.b_rate = rate.train_b_rate(j);
             
             %计算 similarity score
             similarity = yq_cmpscore(test_feat, train_feat);
             s(i,j)=similarity;
             fprintf('The %d test image----',i)
             fprintf('The %d base image\n\n',j)
%              Result(i).f_result(j, :) = {database10096{j, 1}, similarity};
         end   
    end
[Sim, rank] = sort(s, 2, 'descend');
st = toc;
t=st/72;
fprintf('Per image:%d s',t)

recall = Recall_comp(rank);
eval([codename,'= recall;'])
save([save_path,'\',codename,'.mat'],'s','t','recall')