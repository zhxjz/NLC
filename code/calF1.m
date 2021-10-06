function [x_cal, y_cal, tot_cal] = calF1( std_ls, ans_ls, totlen)

xmap = zeros(totlen,1);
ymap = zeros(totlen,1);
len = size(std_ls,1);

for i = 1 : len
    xmap(std_ls(i,1) : std_ls(i,2)) = ones(std_ls(i,2)-std_ls(i,1)+1,1);
    ymap(std_ls(i,1) + std_ls(i,3) : std_ls(i,2) + std_ls(i,3) ) = ones(std_ls(i,2)-std_ls(i,1)+1,1);
end

xmap2 = zeros(totlen,1);
ymap2 = zeros(totlen,1);
len = size(ans_ls,1);
for i = 1 : len
    xmap2(ans_ls(i,1):ans_ls(i,1)+ans_ls(i,2)-1) = ones(ans_ls(i,2),1);
    ymap2(ans_ls(i,1)+ans_ls(i,3) : ans_ls(i,1)+ans_ls(i,2)-1+ans_ls(i,3)) = ones(ans_ls(i,2),1);
end

tp=0;
fp=0;
fn=0;
tn=0;
tpy=0;
fpy=0;
fny=0;
tny=0;
for i=1:totlen
    if(xmap(i)==xmap2(i))
        if(xmap(i)==1)
            tp = tp+1;
        else
            tn = tn+1;
        end
    else
        if(xmap(i)==1)
            fn = fn+1;
        else
            fp = fp+1;
        end
    end
    if(ymap(i)==ymap2(i))
        if(xmap(i)==1)
            tpy = tpy+1;
        else
            tny = tny+1;
        end
    else
        if(xmap(i)==1)
            fny = fny+1;
        else
            fpy = fpy+1;
        end
    end
    
end
prex = tp/(tp+fp);
rex = tp/(tp+fn);
f1x = 2 * prex * rex /( prex + rex );
x_cal = [prex rex f1x];
prey = tpy/(tpy+fpy);
rey = tpy/(tpy+fny);
f1y = 2 * prey * rey /( prey + rey);
y_cal = [prey rey f1y];

tp = tp+tpy;
fp = fp+fpy;
fn = fn+fny;
pret = tp/(tp+fp);
ret = tp/(tp+fn);
f1t = 2 * pret * ret /( pret + ret );
tot_cal = [pret ret f1t];