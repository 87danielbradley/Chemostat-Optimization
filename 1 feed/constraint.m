function [C, Ceq] = constraint(u)

C=sum(u)-1.21;
for i = 1:10
    c =u(i)-0.5;
    C=[C;c];
end
Ceq = [];
return