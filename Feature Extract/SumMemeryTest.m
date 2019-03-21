clear;clc
tic
load('F:\database\10534鞋印数据库\database10096.mat')
gallery = cell(10096,4);
for i = 1:length(database10096)
    name = database10096{i,1};
    matpath = ['F:\database\10534鞋印数据库\Fourier-Mellin feature\database feature\',name];
    load(matpath)
    gallery{i,1} = st_sigfeat.t_feat(:);
    gallery{i,2} = st_sigfeat.t_mfeat(:);
    gallery{i,3} = st_sigfeat.b_feat(:);
    gallery{i,4} = st_sigfeat.b_mfeat(:);
    i
end

% save(['F:\·m-retrieve\哈希鞋印检索\database_shoe\','data10096_top_mirror.mat'],'glyft','gallery','glylabel') %%%%%%%%%%%%%%%% {{{{{{需要改变的}}}}}}
toc
