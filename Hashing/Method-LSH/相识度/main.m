%----pengfei annotation---2017-5-27 09:26:33
%%�������ܣ�����ʵ�����㷨��ȡ���������Ƚ����ƶ�
clc; clear ; close all

%% just an example, ������Ҫ�Լ��޸�

%���� ���ݿ�ͼ�б� ����ͼ�б�
load databaseList.mat;
load testImgList.mat;


%���ݿ�ͼ/����ͼ  ����������·��
f_path ='database feature\'; 
path = 'testImg feature\' ;

%�������� ���ƶȾ��� �洢·��
save_path = 'score\' ;

%% ѭ���������ƶ�

    for i=1:length(testImgList)   
        f_result = cell(1, 2);
        
        %load ����ͼ������
        load([path, testImgList{i, 1}, '.mat']);
        test_feat = st_sigfeat;
        clear st_sigfeat

         for j = 1: length(databaseList )
             %load ���ݿ�ͼ������
             load([f_path, databaseList{j, 1}, '.mat']);
             
             %���� similarity score
             similarity = yq_cmpscore(test_feat, st_sigfeat);
             f_result(j, :) = {databaseList{j, 1}, similarity};
         end   
         
     save([save_path, testImgList{i, 1}, '.mat'], '')
    end
  


