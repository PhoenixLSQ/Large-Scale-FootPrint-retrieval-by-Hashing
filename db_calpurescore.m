function d_score = db_calpurescore(t_feat,...
    b_feat,...
    t_rate,...
    b_rate,...
    ct_feat,...
    cb_feat,...
    ct_rate,...
    cb_rate)
%----pengfei annotation----
t_feat = abs(t_feat);
b_feat = abs(b_feat);
ct_feat = abs(ct_feat);
cb_feat = abs(cb_feat);


num_bits = 8*length(t_feat);
d_coefa = 0.4;
d_coefb = 1-d_coefa;
dt_ratethres = 0.03;
db_ratethres = 0.005;
d_constscore = 0.63;


%关于后脚掌
if (b_rate>db_ratethres)&&(cb_rate>db_ratethres)
    %若test image and reference 的占空比都大于阈值
      d_scb=1-abs(double(hammingDist(b_feat,cb_feat)))/num_bits;     
elseif (b_rate>db_ratethres)&&(cb_rate<=db_ratethres)
    %若test image的占空比大于阈值, reference的占空比<=阈值
    d_scb = d_constscore;
else%若二者的占空比都小于阈值  
    d_scb = 0;
end


%前脚掌
if (t_rate>dt_ratethres)&&(ct_rate>dt_ratethres)
        d_sct=1-abs(double(hammingDist(t_feat,ct_feat)))/num_bits; 
elseif (t_rate>dt_ratethres)&&(ct_rate<=dt_ratethres)
    d_sct = d_constscore;
else
    d_sct = 0;
end

if (cb_rate<=db_ratethres)&&(ct_rate<=dt_ratethres)
    d_scb = 0;
    d_sct = 0;
end

d_score = d_coefa*d_scb+d_coefb*d_sct;

    