function [C,Ceq]=constraint_8(u)
C=sum(u)-1.21;
for i=1:8
    c=u(i)+u(8+i)-0.5;
    C=[C;c];
end
Ceq=[];
return