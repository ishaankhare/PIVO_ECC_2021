function [u] = getControls(bot_pos, bot_vel, obs_pos, obs_vel, rb, ro, goal, pos_noise, vel_noise)
%getControls - Solve for change in bot controls
%
% Syntax: [u] = getControls(bot_pos, bot_vel, obs_pos, obs_vel, rb, ro, goal, pos_noise, vel_noise)
%
% This functions optimizes for change in bot controls using IVO cone as constraints
    vmax = 1.5;
    in_collision = false;
    
    % Check if any obstacle is in collision course
    
    %CHANGE BEGIN
    for i = 1:size(obs_pos, 1)
        for j = 1:size(pos_noise, 1)
            dist = sum((obs_pos(i,:)+pos_noise(j,:)) ).^2;
            %disp(dist);
            if  (dist < 36) && ( ( sum((obs_pos(i,:)+pos_noise(j,:)).*(obs_vel(i,:)+vel_noise(j,:))) )<0 )    
                if (ivoConstraints(obs_pos(i,:)+pos_noise(j,:), obs_vel(i,:)+vel_noise(j,:), rb+ro(i)) > 0) 
                    in_collision = true;
                    break;
                end
            end
        end
    end
    %CHANGE END
    
    if in_collision
        % Optimize for least change in controls
        u = solveControls(obs_pos, obs_vel, rb, ro, pos_noise, vel_noise);
        disp('In collision');
    else
        % Get change in controls favoring goal
        disp('Not in collision');
        u = (goal'-bot_pos)*vmax / sqrt(sum((goal'-bot_pos).^2));
        u = (u + bot_vel)/2;
        u = u - bot_vel;
        % Check if any obstacle is in collision course
        
        %CHANGE BEGIN
        for i = 1:size(obs_pos, 1)
            tmp_vel = obs_vel(i,:) - u';
            tmp_pos = obs_pos(i,:) + tmp_vel*0.1;
            noise_samples = size(pos_noise,1);
            pos_noise = pearsrnd(0, 0.1, 0.3, 1.5, noise_samples, 3);
            %pos_noise = pearsrnd(0,0.1,0,3,noise_samples,3);
            vel_noise = pearsrnd(0,0.1,0,3,noise_samples,3);
            for j = 1:noise_samples
                dist = sum(( (obs_pos(i,:)+pos_noise(j,:)) ).^2);
                cond = ( sum((obs_pos(i,:)+pos_noise(j,:)).*(obs_vel(i,:)+vel_noise(j,:))) );
                if (dist < 36) && (cond<0)    
                    %disp(dist);
                    if (ivoConstraints(obs_pos(i,:)+pos_noise(j,:), obs_vel(i,:)+vel_noise(j,:), rb+ro(i)) > 0) 
                        in_collision = true;
                        break;
                    end
                end
            end
        end
        %CHANGE END
        if in_collision
            % Optimize for least change in controls
            u = solveControls(obs_pos, obs_vel, rb, ro, pos_noise, vel_noise);
            disp('In collision');
        end
    end
end
