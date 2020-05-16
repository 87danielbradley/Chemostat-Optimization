function [C,Ceq]=constraint_1(u)
C=sum(u)-1.21;
for i=1
    c=u(i)+u(1+i)-0.5;
    C=[C;c];
end
Ceq=[];
return