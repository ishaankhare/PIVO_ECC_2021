function [cone] = ivoConstraints(obs_pos, obs_vel, radius)
%ivoConstraints - Get collision avoidance constraints using IVO
%
% Syntax: [cone] = ivoConstraints(obs_pos, obs_vel, radius)
%
% This function returns the value of collision cone formed using IVO

    %CHANGE BEGIN
    cone = ((obs_pos * obs_vel').^2 / sum(obs_vel.^2)) - sum(obs_pos.^2) + radius^2;
    %disp(cone);
    %CHANGE END
end
