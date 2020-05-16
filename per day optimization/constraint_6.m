function [C,Ceq]=constraint_6(u)
C=sum(u)-1.21;
for i=1:6
    c=u(i)+u(6+i)-0.5;
    C=[C;c];
end
Ceq=[];
return