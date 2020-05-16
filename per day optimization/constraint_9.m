function [C,Ceq]=constraint_9(u)
C=sum(u)-1.21;
for i=1:9
    c=u(i)+u(9+i)-0.5;
    C=[C;c];
end
Ceq=[];
return