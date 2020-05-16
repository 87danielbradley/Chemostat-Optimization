function [C,Ceq]=constraint_2(u)
C=sum(u)-1.21;
for i=1:2
    c=u(i)+u(2+i)-0.5;
    C=[C;c];
end
Ceq=[];
return