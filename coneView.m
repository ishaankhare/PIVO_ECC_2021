function CC = coneView(pos,vel,nr,nv,counter,CC)
    R = 1;
    rx = pos(1,1);
    ry = pos(1,2);
    rz = pos(1,3);
    vx = vel(1,1);
    vy = vel(1,2);
    vz = vel(1,3);
    mivo = [];
    for i=1:1000
        c = ((rx+nr(i,1))*(vx+nv(i,1)) + (ry+nr(i,2))*(vy+nv(i,2)) + (rz+nr(i,3))*(vz+nv(i,3)))^2/( (vx+nv(i,1))^2 + (vy+nv(i,2))^2 + (vz+nv(i,3))^2 ) ... 
             - ( (rx+nr(i,1))^2 + (ry+nr(i,2))^2 + (rz+nr(i,3))^2 ) + R^2; 
        mivo = [mivo c];
    end  
    CC = [CC;mivo];
    
    if counter == 18
        [f0,x0]=ksdensity(CC(1,:));
        [f1,x1]=ksdensity(CC(2,:));
        a=pearsrnd(-0.7,0.5,0.3,1.5,1000,1);
        [f2,x2]=ksdensity(a);
        figure(1);
        plot(x0,f0,x1,f1,x2,f2,'LineWidth',2);
        legend('first instant','second instant','third instant');
        saveas(gcf, ['run5side/', num2str(counter,'%04.f'), '.png']);
    end
    %     x = [-100 0];
%     area(mivo,x);

end