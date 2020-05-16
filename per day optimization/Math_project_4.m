function [output] =Math_project_4(input)
%
t_span = 0:1;
vars_0 = [200000000,25,4,0,0,0,0.79];
%count =0;
v=079;
for i = 1:4
    
    params(1) = input(i);
    params(2) = input(4+i);
    save params params
    if i==1
        
        options = odeset('NonNegative',1);
        [t,vars]=ode15s(@Math_chemostat,t_span,vars_0,options);
        %plot(t,vars(:,1));
         %plot(t,vars(:,2));
         %plot(t,vars(:,3));
         %plot(t,vars(:,4));
         %plot(t,vars(:,5));
         %plot(t,vars(:,6));
         %plot(t,vars(:,7));
    else
        vars_0(1) = vars(end,1);
        vars_0(2) = vars(end,2);
        vars_0(3) = vars(end,3);
        vars_0(4) = vars(end,4);
        vars_0(5) = vars(end,5);
        vars_0(6) = vars(end,6);
        vars_0(7) = vars(end,7);
       
        options = odeset('NonNegative',1);
        [t,vars]=ode15s(@Math_chemostat,t_span,vars_0,options);
        %plot(t+count*1,vars(:,1));
         %plot(t+count*1,vars(:,2));
         %plot(t+count*1,vars(:,3));
         %plot(t+count*1,vars(:,4));
         %plot(t+count*1,vars(:,5));
         %plot(t+count*1,vars(:,6));
         %plot(t+count*1,vars(:,7));
    end
    %hold on
    %count = count + 1;
    v=v+params(1)+params(2);
end
%vars(end,6)
output=-v*vars(end,6);