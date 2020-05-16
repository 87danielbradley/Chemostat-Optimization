function [C,Ceq]=constraint_3(u)
C=sum(u)-1.21;
for i=1:3
    c=u(i)+u(3+i)-0.5;
    C=[C;c];
end
Ceq=[];
return