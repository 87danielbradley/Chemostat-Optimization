function [C,Ceq]=constraint_5(u)
C=sum(u)-1.21;
for i=1:5
    c=u(i)+u(5+i)-0.5;
    C=[C;c];
end
Ceq=[];
return