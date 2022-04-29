hold on;

r = linspace(0,2*pi) ;
th = linspace(0,2*pi) ;
[R,T] = meshgrid(r,th) ;
X = R.*cos(T) ;
Y = R.*sin(T) ;
Z = R ;
h = surf(X,Y,Z);
c=1;
set(h,'FaceColor',[c 1 0], 'FaceAlpha',0,'EdgeAlpha', 1);

r = 1;
X2 = X * r;
Y2 = Y * r;
Z2 = Z * r;
surf(X2,Y2,Z2)

%axis([-5 5 -5 5 -5 5]);
