function [C,Ceq]=constraint_edit(u)
C=u(1)+u(2)+u(3)+u(4)+u(5)+u(6)+u(7)+u(8)+u(9)+u(10)+u(11)+u(12)+u(13)+u(14)+u(15)+u(16)+u(17)+u(18)+u(19)+u(20)-1.21;
for i=1:10
    c=u(i)+u(10+i)-0.5;
    C=[C;c];
end
Ceq=[];
return