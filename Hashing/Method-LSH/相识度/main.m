%----pengfei annotation---2017-5-27 09:26:33
%%函数功能：根据实验室算法提取的特征，比较相似度
clc; clear ; close all

%% just an example, 根据需要自己修改

%加载 数据库图列表 测试图列表
load databaseList.mat;
load testImgList.mat;


%数据库图/测试图  的特征所在路径
f_path ='database feature\'; 
path = 'testImg feature\' ;

%计算所得 相似度矩阵 存储路径
save_path = 'score\' ;

%% 循环计算相似度

    for i=1:length(testImgList)   
        f_result = cell(1, 2);
        
        %load 测试图的特征
        load([path, testImgList{i, 1}, '.mat']);
        test_feat = st_sigfeat;
        clear st_sigfeat

         for j = 1: length(databaseList )
             %load 数据库图的特征
             load([f_path, databaseList{j, 1}, '.mat']);
             
             %计算 similarity score
             similarity = yq_cmpscore(test_feat, st_sigfeat);
             f_result(j, :) = {databaseList{j, 1}, similarity};
         end   
         
     save([save_path, testImgList{i, 1}, '.mat'], '')
    end
  


