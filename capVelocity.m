function a = capVelocity(a)
%capVelocity - Cap the max velocity
%
% Syntax: a = capVelocity(a)
%
% Cap the max velocity
    k = 2;
    a(1) = min(a(1), k);
    a(1) = max(-k, a(1));
    a(2) = min(a(2), k);
    a(2) = max(a(2), -k);
    a(3) = min(a(3), k);
    a(3) = max(-k, a(3));
end

