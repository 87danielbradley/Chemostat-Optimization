for i=1:200
    y=randsample(10,10);
    v=1.21;
    for j=1:9;
        x=round(rand()*0.5,4);
        if x>v;
            x=round(rand()*v,4);
            matrix(j,:)=[y(j),x];
            v=round(v-x,4);
        else
            matrix(j,:)=[y(j),x];
           
            v=round(v-x,4);
        end
        
    end
    x=round(rand()*0.5,4);
    if x>v;
        x=v;
        matrix(10,:)=[y(10),x];
    else
        matrix(10,:)=[y(10),x];
    end
    b=sortrows(matrix,1);
    %for k=1:10
    pop(i,:)= b(:,2);
    %end
end
  