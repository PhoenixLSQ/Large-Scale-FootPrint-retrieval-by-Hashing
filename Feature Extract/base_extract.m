% �����ļ�����ȥ������ȡ����
clear;clc
tic
load('F:\database\10534Ьӡ���ݿ�\database10096.mat')
gallery = cell(10096,3);
for i = 1:length(database10096)
    name = database10096{i,1};
    matpath = ['F:\database\10534Ьӡ���ݿ�\Fourier-Mellin feature\database feature\',name];
    load(matpath)
    gallery{i,1} = name(1:end-4);
    gallery{i,2} = database10096{i,2};
    gallery{i,3} = st_sigfeat.t_mfeat(:);  %%%%%%%%%%%%%%%% {{{{{{��Ҫ�ı��}}}}}}
    i
end

glylabel = zeros(length(database10096),1);
glyft = zeros(length(database10096),9801);
for j = 1:length(database10096)
    glylabel(j,1) = gallery{j,2};
    glyft(j,:) = gallery{j,3};
    j
end

save(['F:\��m-retrieve\��ϣЬӡ����\database_shoe\','data10096_top_mirror.mat'],'glyft','gallery','glylabel') %%%%%%%%%%%%%%%% {{{{{{��Ҫ�ı��}}}}}}
toc
