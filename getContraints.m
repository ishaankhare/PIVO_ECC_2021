function [c,ceq]=getContraints(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,x,obs_pos)
    c = [];
    ceq = [];
    k = 0;
    for i = 1:size(obs_pos,1)
        ux = x(1);
        uy = x(2);
        uz = x(3);
        Ra=1;
        exp1 = Ra^2*(ux^2 +uy^2 +uz^2) +A(i,:)*ux + B(i,:)*uy + C(i,:)*uz + D(i,:);
        exp2 = E(i,:)*(ux^2 +uy^2+uz^2 ) + E(i,:).*ux.*F(i,:) + E(i,:).*uy.*G(i,:) + E(i,:).*uz.*H(i,:)+ E(i,:).*I(i,:);
        exp3 =  J(i,:) + K(i,:)*ux^2 + L(i,:)*uy^2 +M(i,:)*uz^2 + ux.*(N(i,:) + O(i,:)*uy + P(i,:)*uz ) + uy.*(Q(i,:) + R(i,:)*uz) +uz*(S(i,:));
        exp = exp1+exp2+exp3;
         
%       KDE 
%       pd = fitdist(exp','Kernel','Kernel','epanechnikov');
%       c = [c;mean(pd)+k*sqrt(var(pd))];
        
        pd = fitdist(exp','Kernel','Kernel','normal');
        k = 0;
        p=cdf(pd,k);
        %disp(p);
        c = [c;0.68-p];
               
    end    
return