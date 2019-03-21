clear;clc
tic
load('F:\database\10534鞋印数据库\testImgLabel_72.mat')
test = cell(72,3);
for i = 1:length(testImgLabel_72)
    name = testImgLabel_72{i,1};
    matpath = ['F:\database\10534鞋印数据库\Fourier-Mellin feature\database feature\',name];
    load(matpath)
    test{i,1} = name(1:end-4);
    test{i,2} = testImgLabel_72{i,2};
    test{i,3} = st_sigfeat.t_feat(:);  %%%%%%%%%%%%%%%% {{{{{{需要改变的}}}}}}
    i
end

save(['F:\·m-retrieve\哈希鞋印检索\database_shoe\','test72_top.mat'],'test') %%%%%%%%%%%%%%%% {{{{{{需要改变的}}}}}}
toc
