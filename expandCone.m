function [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S] = expandCone(obs_pos, obs_vel, rb, ro, pos_noise, vel_noise)
    A = [];
    B = [];
    C = [];
    D = [];
    E = [];
    F = [];
    G = [];
    H = [];
    I = [];
    J = [];
    K = [];
    L = [];
    M = [];
    N = [];
    O = [];
    P = [];
    Q = [];
    R = [];
    S = [];

    for i = 1:size(obs_pos,1)
        R = rb+ro(i);
        Rx = obs_pos(i,1);
        Ry = obs_pos(i,2);
        Rz = obs_pos(i,3);
        Vx = obs_vel(i,1);
        Vy = obs_vel(i,2);
        Vz = obs_vel(i,3);
        rnoise = pos_noise';
        vnoise = vel_noise';
        
        nrx = rnoise(1,:)';
        nry = rnoise(2,:)';
        nrz = rnoise(3,:)';
        nvx = vnoise(1,:)';
        nvy = vnoise(2,:)';
        nvz = vnoise(3,:)';
        
        a = R^2.*(-2*nvx - 2*Vx);
        A = [A;a'];
        b = R^2.*(-2*nvy - 2*Vy);
        B = [B;b'];
        c = R^2.*(-2*nvz - 2*Vz);
        C = [C;c'];
        d = R^2.*(nvx.^2 + nvy.^2 + nvz.^2 + 2*nvx*Vx + Vx^2 + 2*nvy*Vy + Vy^2 + 2*nvz*Vz + Vz^2);
        D = [D;d'];
        e = (-(nrx + Rx).^2 - (nry + Ry).^2 - (nrz + Rz).^2); 
        E = [E;e'];
        f = (-2*nvx - 2*Vx);
        F = [F;f'];
        g = (-2*nvy - 2*Vy);
        G = [G;g'];
        h = (-2*nvz - 2*Vz); 
        H = [H;h'];
        i = (nvx.^2 + nvy.^2 + nvz.^2 + 2*nvx*Vx + Vx^2 + 2*nvy*Vy + Vy^2 + 2*nvz*Vz + Vz^2); 
        I = [I;i'];
        j = nvx.^2.*(nrx + Rx).^2 + 2*nvx.*nvy.*(nrx + Rx).*(nry + Ry) + nvy.^2.*(nry + Ry).^2 + ...
            2*nvx.*nvz.*(nrx + Rx).*(nrz + Rz) + 2*nvy.*nvz.*(nry + Ry).*(nrz + Rz) + ...
            nvz.^2.*(nrz + Rz).^2 + 2*nvx.*(nrx + Rx).^2*Vx + 2*nvy.*(nrx + Rx).*(nry + Ry)*Vx + ...
            2*nvz.*(nrx + Rx).*(nrz + Rz)*Vx + (nrx + Rx).^2*Vx^2 + ...
            2*nvx.*(nrx + Rx).*(nry + Ry)*Vy + 2*nvy.*(nry + Ry).^2*Vy + ...
            2*nvz.*(nry + Ry).*(nrz + Rz)*Vy + 2*(nrx + Rx).*(nry + Ry)*Vx*Vy + ...
            (nry + Ry).^2*Vy^2 + 2*nvx.*(nrx + Rx).*(nrz + Rz)*Vz + ...
            2*nvy.*(nry + Ry).*(nrz + Rz)*Vz + 2*nvz.*(nrz + Rz).^2*Vz + ...  
            2*(nrx + Rx).*(nrz + Rz)*Vx*Vz + 2*(nry + Ry).*(nrz + Rz)*Vy*Vz +... 
            (nrz + Rz).^2*Vz^2;       
        J = [J;j'];
        k = (nrx + Rx).^2;
        K = [K;k'];
        l = (nry + Ry).^2;
        L = [L;l'];
        m = (nrz + Rz).^2;
        M = [M;m'];
        n = (-2*nvx.*(nrx + Rx).^2 - 2*nvy.*(nrx + Rx).*(nry + Ry) - ...
            2*nvz.*(nrx + Rx).*(nrz + Rz) - 2*(nrx + Rx).^2*Vx - ...
            2*(nrx + Rx).*(nry + Ry)*Vy - 2*(nrx + Rx).*(nrz + Rz)*Vz);
        N = [N;n'];
        o =  2*(nrx + Rx).*(nry + Ry);
        O = [O;o'];
        p = 2*(nrx + Rx).*(nrz + Rz);
        P = [P;p'];
        q = (-2*nvx.*(nrx + Rx).*(nry + Ry) - 2*nvy.*(nry + Ry).^2 - ...
            2*nvz.*(nry + Ry).*(nrz + Rz)  - ...
            2*(nrx + Rx).*(nry + Ry)*Vx - 2*(nry + Ry).^2*Vy - ...
            2*(nry + Ry).*(nrz + Rz)*Vz);
        Q = [Q;q'];
        r = 2*(nry + Ry).*(nrz + Rz);
        R = [R;r];
        s = (-2*nvx.*(nrx + Rx).*(nrz + Rz) - ...
            2*nvy.*(nry + Ry).*(nrz + Rz) - 2*nvz.*(nrz + Rz).^2 - ...
            2*(nrx + Rx).*(nrz + Rz)*Vx - 2*(nry + Ry).*(nrz + Rz)*Vy - ... 
            2*(nrz + Rz).^2*Vz);
        S = [S;s'];
        
%         a = R^2.*(-2*nx - 2*Vx);
%         A = [A;a'];
%         b = R^2.*(-2*ny - 2*Vy);
%         B = [B;b'];
%         c = R^2.*(-2*nz - 2*Vz);
%         C = [C;c'];
%         d = R^2.*(nx.^2 + ny.^2 + nz.^2 + 2*nx*Vx + Vx^2 + 2*ny*Vy + Vy^2 + 2*nz*Vz + Vz^2);
%         D = [D;d'];
%         e = (-(nx + Rx).^2 - (ny + Ry).^2 - (nz + Rz).^2); 
%         E = [E;e'];
%         f = (-2*nx - 2*Vx);
%         F = [F;f'];
%         g = (-2*ny - 2*Vy);
%         G = [G;g'];
%         h = (-2*nz - 2*Vz); 
%         H = [H;h'];
%         i = (nx.^2 + ny.^2 + nz.^2 + 2*nx*Vx + Vx^2 + 2*ny*Vy + Vy^2 + 2*nz*Vz + Vz^2); 
%         I = [I;i'];
%         j = nx.^2.*(nx + Rx).^2 + 2*nx.*ny.*(nx + Rx).*(ny + Ry) + ny.^2.*(ny + Ry).^2 + 2.*nx.*nz.*(nx + Rx).*(nz + Rz) + 2*ny.*nz.*(ny + Ry).*(nz + Rz)...
%             + nz.^2.*(nz + Rz).^2 +2*nx.*(nx + Rx).^2*Vx + 2*ny.*(nx + Rx).*(ny + Ry)*Vx + 2*nz.*(nx + Rx).*(nz + Rz)*Vx + (nx + Rx).^2*Vx^2 ... 
%             + 2*nx.*(nx + Rx).*(ny + Ry)*Vy + 2*ny.*(ny + Ry).^2*Vy + 2*nz.*(ny + Ry).*(nz + Rz)*Vy + 2*(nx + Rx).*(ny + Ry)*Vx*Vy + ...
%             (ny + Ry).^2*Vy^2 + 2*nx.*(nx + Rx).*(nz + Rz)*Vz + 2*ny.*(ny + Ry).*(nz + Rz)*Vz + 2*nz.*(nz + Rz).^2*Vz + 2*(nx + Rx).*(nz + Rz)*Vx*Vz ...
%             + 2*(ny + Ry).*(nz + Rz)*Vy*Vz + (nz + Rz).^2*Vz^2;
%         J = [J;j'];
%         k = (nx + Rx).^2;
%         K = [K;k'];
%         l = (ny + Ry).^2;
%         L = [L;l'];
%         m =  (nz + Rz).^2;
%         M = [M;m'];
%         n = -2*nx.*(nx + Rx).^2 - 2*ny.*(nx + Rx).*(ny + Ry) - 2*nz.*(nx + Rx).*(nz + Rz) - 2*(nx + Rx).^2*Vx - 2*(nx + Rx).*(ny + Ry)*Vy - 2*(nx + Rx).*(nz + Rz)*Vz;
%         N = [N;n'];
%         o =  2*(nx + Rx).*(ny + Ry);
%         O = [O;o'];
%         p = 2*(nx + Rx).*(nz + Rz);
%         P = [P;p'];
%         q = -2*nx.*(nx + Rx).*(ny + Ry) - 2*ny.*(ny + Ry).^2 - 2*nz.*(ny + Ry).*(nz + Rz) -2*(nx + Rx).*(ny + Ry)*Vx - 2*(ny + Ry).^2*Vy - 2*(ny + Ry).*(nz + Rz)*Vz;
%         Q = [Q;q'];
%         r = 2*(ny + Ry).*(nz + Rz);
%         R = [R;r];
%         s = -2*nx.*(nx + Rx).*(nz + Rz) - 2*ny.*(ny + Ry).*(nz + Rz) - 2*nz.*(nz + Rz).^2 - 2*(nx + Rx).*(nz + Rz)*Vx - 2*(ny + Ry).*(nz + Rz)*Vy - 2*(nz + Rz).^2*Vz;
%         S = [S;s'];
    end
         %disp(size(A));
%         disp(size(B));
%         disp(size(C));
%         disp(size(D));
%         disp(size(E));
%         disp(size(F));
%         disp(size(G));
%         disp(size(H));
%         disp(size(I));
%         disp(size(J));
%         disp(size(K));
%         disp(size(L));
%         disp(size(M));
%         disp(size(N));
%         disp(size(O));
%         disp(size(P));
%         disp(size(Q));
%         disp(size(R));
%         disp(size(S));
return