clear;clc
tic
load('F:\database\10534Ьӡ���ݿ�\testImgLabel_72.mat')
test = cell(72,3);
for i = 1:length(testImgLabel_72)
    name = testImgLabel_72{i,1};
    matpath = ['F:\database\10534Ьӡ���ݿ�\Fourier-Mellin feature\database feature\',name];
    load(matpath)
    test{i,1} = name(1:end-4);
    test{i,2} = testImgLabel_72{i,2};
    test{i,3} = st_sigfeat.t_feat(:);  %%%%%%%%%%%%%%%% {{{{{{��Ҫ�ı��}}}}}}
    i
end

save(['F:\��m-retrieve\��ϣЬӡ����\database_shoe\','test72_top.mat'],'test') %%%%%%%%%%%%%%%% {{{{{{��Ҫ�ı��}}}}}}
toc
