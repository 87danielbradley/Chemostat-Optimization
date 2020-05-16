function [C,Ceq]=constraint_4(u)
C=sum(u)-1.21;
for i=1:4
    c=u(i)+u(4+i)-0.5;
    C=[C;c];
end
Ceq=[];
return