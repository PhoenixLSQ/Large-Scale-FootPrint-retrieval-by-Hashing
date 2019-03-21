% 根据文件名，去本地提取特征
clear;clc
tic
load('F:\database\10534鞋印数据库\database10096.mat')
gallery = cell(10096,3);
for i = 1:length(database10096)
    name = database10096{i,1};
    matpath = ['F:\database\10534鞋印数据库\Fourier-Mellin feature\database feature\',name];
    load(matpath)
    gallery{i,1} = name(1:end-4);
    gallery{i,2} = database10096{i,2};
    gallery{i,3} = st_sigfeat.t_mfeat(:);  %%%%%%%%%%%%%%%% {{{{{{需要改变的}}}}}}
    i
end

glylabel = zeros(length(database10096),1);
glyft = zeros(length(database10096),9801);
for j = 1:length(database10096)
    glylabel(j,1) = gallery{j,2};
    glyft(j,:) = gallery{j,3};
    j
end

save(['F:\·m-retrieve\哈希鞋印检索\database_shoe\','data10096_top_mirror.mat'],'glyft','gallery','glylabel') %%%%%%%%%%%%%%%% {{{{{{需要改变的}}}}}}
toc
