% annotation by LSQ
clear;clc
tic
%% ��ȡ10096�ſ�ͼ��ǰ���ռ�ձ�

load('F:\database\10534Ьӡ���ݿ�\database10096.mat')
train_t_rate = zeros(length(database10096),1);
train_b_rate = zeros(length(database10096),1);
for i = 1:length(database10096)
    name = database10096{i,1};
    matpath = ['F:\database\10534Ьӡ���ݿ�\Fourier-Mellin feature\database feature\',name];
    load(matpath)
    train_t_rate(i,1) = st_sigfeat.t_rate;
    train_b_rate(i,1) = st_sigfeat.b_rate;
    i
end

%% ��ȡ72�Ų���ͼ��ǰ���ռ�ձ�

load('F:\database\10534Ьӡ���ݿ�\testImgLabel_72.mat')
test_t_rate = zeros(length(testImgLabel_72),1);
test_b_rate = zeros(length(testImgLabel_72),1);
for i = 1:length(testImgLabel_72)
    name = testImgLabel_72{i,1};
    matpath = ['F:\database\10534Ьӡ���ݿ�\Fourier-Mellin feature\database feature\',name];
    load(matpath)
    test_t_rate(i,1) = st_sigfeat.t_rate;
    test_b_rate(i,1) = st_sigfeat.b_rate;
    i
end
%% ������

rate.test_t_rate = test_t_rate;
rate.test_b_rate = test_b_rate;
rate.train_t_rate = train_t_rate;
rate.train_b_rate = train_b_rate;

save(['F:\��m-retrieve\��ϣЬӡ����\database_shoe\','rate.mat'],'rate')
toc
