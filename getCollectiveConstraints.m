function [c, ceq] = getCollectiveConstraints(obs_pos, obs_vel, rb, ro, u, pos_noise, vel_noise)
%getCollectiveConstraints - Get collision avoidance constraints using IVO
%
% Syntax: [c, ceq] = getCollectiveConstraints(obs_pos, obs_vel, rb, ro, u, pos_noise, vel_noise)
%
% This function returns the value of collision cone formed using IVO
    c = [];
    ceq = [];
    cone = [];
    dt = 0.1;
    k = 0;
    
%     [m] = getMean(obs_pos, obs_vel, rb, ro, u);
%     [v] = getVar(obs_pos, obs_vel, rb, ro, u);
    for i = 1:size(obs_pos,1)
        noise_samples = size(pos_noise, 1);
        cones = zeros(noise_samples, 1);
        for j = 1:noise_samples
            new_vel = obs_vel(i,:) + vel_noise(j,:);% + u';
            new_pos = obs_pos(i,:) + pos_noise(j,:);% + new_vel*dt;
            cones(j) = ivoConstraints(new_pos, new_vel - u', rb+ro(i));
        end
        
        c = [c; m(i)+k*sqrt(var(cones))];
%         %disp((v(i)-(m(i)^2)));
%         cone = ivoConstraints(obs_pos(i,:), obs_vel(i,:) - u', rb+ro(i));
%         variance = (sqrt(v(i)-(m(i)^2)));
%         %variance = (sqrt(v(i)-(cone^2)));
%         disp("expected - ");
%         disp(m(i));
%         disp("real - ");
%         disp((mean(cones)));
%         %c = [c; cone+k*variance];
%         c = [c; m(i)+k*variance];
    end    
end
