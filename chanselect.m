% chanindex->useful(interested�� channel index
% mycnt eloc both delete the useless channel
function [chanindex,mycnt,eloc] = chanselect(mycnt, eloc, chandelete, chanuseful)
ndelete = length(chandelete);
nuseful = length(chanuseful);
chanindex = zeros(nuseful,1);
chandeleteindex = zeros(ndelete,1);

% �ҳ�Ҫɾ����������Ӧ�ľ���ͨ��
channum = length(mycnt.electloc);
for i=1:channum
   
    for j=1:ndelete
        if strcmp(mycnt.electloc(i).lab, chandelete{j})
             chandeleteindex(j) = i;
        end
    end
    
end

I = [1:channum];
I(chandeleteindex) = 0;
Inew=find(I ~= 0);
mycnt.data = mycnt.data(Inew,:,:);
mycnt.electloc = mycnt.electloc(Inew);
channum = length(mycnt.electloc);
eloc = eloc(Inew);

% �ҳ����õĵ�������Ӧ�ľ���ͨ��
for i=1:channum
    for j=1:nuseful
      
        if strcmp(mycnt.electloc(i).lab, chanuseful{j})
             chanindex(j) = i;
        end
    end
end



