function [C,Ceq]=constraint_7(u)
C=sum(u)-1.21;
for i=1:7
    c=u(i)+u(7+i)-0.5;
    C=[C;c];
end
Ceq=[];
return