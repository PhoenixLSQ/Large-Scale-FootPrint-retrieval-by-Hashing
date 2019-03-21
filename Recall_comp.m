function recall = Recall_comp(rank)
% input:rank
load F:\·m-retrieve\哈希鞋印检索\database10096.mat
load F:\·m-retrieve\哈希鞋印检索\testImgLabel_72.mat

glylabel = zeros(length(database10096));
for m = 1:length(database10096)
glylabel(m) = database10096{m,2};
end
label = glylabel(rank);
pos = [0.005:0.005:0.02 0.05:0.05:1];
m = 0;
for j = 1:length(pos)
    for i = 1:size(rank,1)
        % recall = sum(label==test{i,2}) / sum(glylabel==test{i,2});
        tp(i,:) = sum(label(i,1:ceil(length(glylabel)*pos(j)))==testImgLabel_72{i,2})-1;   %除去自己本身，返回的tp样本数量    
    end
    % toc
    m = m+1;
    recall(m) = sum(tp)/504;
end
