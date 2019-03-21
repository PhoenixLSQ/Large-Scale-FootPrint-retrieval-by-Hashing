function st_sigfeat = load_parfor(f_path, name)
%----pengfei annotation----
%是为了在parfor中使用load而写的子函数
    load([f_path, name, '.mat']);
end