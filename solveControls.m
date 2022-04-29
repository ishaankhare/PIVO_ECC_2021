function u = solveControls(obs_pos, obs_vel, rb, ro, pos_noise, vel_noise)
%solveControls - Optimize for least change in controls
%
% Syntax: u = solveControls(obs_pos, obs_vel, rb, ro, pos_noise, vel_noise)
%
    dt = 0.1;
    constraints = [];
    % Get collision cone for every obstacle
    
    %constraints = @(x) getCollectiveConstraints(obs_pos, obs_vel, rb, ro, x, pos_noise, vel_noise);
    [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S] = expandCone(obs_pos, obs_vel, rb, ro, pos_noise, vel_noise);
    [constraints] = @(x) getContraints(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,x,obs_pos);

    cost = @(x) sum(x.^2);
    lb = [-2; -2; -2];
    ub = [2; 2; 2];
    init_point = [1; 1; 1];
    options = optimoptions('fmincon','Display','final-detailed','Algorithm','sqp');
    u = fmincon(cost, init_point, [], [], [], [], lb, ub, constraints,options);
    %disp(u);
end

