function [output,state] = sensorRange(bot_pos, bot_vel, obs_pos, obs_vel)
%sensorRange - Check if obstacle is in sensor range
%
% Syntax: output = sensorRange(bot_pos, bot_vel, obs_pos, obs_vel)
%
% % % Return true if the obstacle is withing the sensor range
    %CHANGE BEGIN
    dist = sum((bot_pos'-obs_pos).^2);
    output = (dist < 25)&&( ( sum((bot_pos'-obs_pos).*(bot_vel' - obs_vel)) )<0 );  
    %CHANGE END
end
