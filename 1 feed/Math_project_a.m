function Math_project_a(input)
%[output] = 
t_span = 0:1;
vars_0 = [200000000,25,4,0,0,0,0.79];
count =0;
v=0.79;
%load('pop.mat')

%vari=round(rand()*200,0)
%for i=1:200
    for i = 1:10
        
        
        %params(1)=pop(vari,Day)
        params(1)=input(i);
        save params params
%     if v<2
%         randnum=rand()*0.5
%         if randnum+v<=2
%             params(1) = randnum;
%             save params params
%         elseif randnum+v>2
%             params(1) = 0;
%             save params params
%         end
%     end
        if i==1

            options = odeset('NonNegative',1);
            [t,vars]=ode15s(@Math_chemostat_a,t_span,vars_0,options);
            %plot(t,vars(:,1));
            %plot(t,vars(:,2));
            %plot(t,vars(:,3));
            %plot(t,vars(:,4));
            %plot(t,vars(:,5));
            plot(t,vars(:,6));
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
            [t,vars]=ode15s(@Math_chemostat_a,t_span,vars_0,options);
            %plot(t+count*1,vars(:,1));
            %plot(t+count*1,vars(:,2));
            %plot(t+count*1,vars(:,3));
            %plot(t+count*1,vars(:,4));
            %plot(t+count*1,vars(:,5));
            plot(t+count*1,vars(:,6));
            %plot(t+count*1,vars(:,7));

        end
        hold on
        count = count + 1;
        v=v+params(1);
        
    
    end
    
%end
%output = -v*vars(end,6);
vars(end,6)
v