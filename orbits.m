options = odeset('RelTol',1e-7);
r = 6.6e6;
R = 6.378e6;
%X0 = [r 0 0 0 0 9000];   %orbit to show atmospheric effects
%X0 = [42164e3 0 0 0 3070 0];    %geostationary orbit
X0 = fromKepler(7000e3,0,0,0,0,0,0,0,0);   %input kepler
%elements instead

X1 = ode45(@gravity,[0,20000],X0,options);
figure(1)
plot3(X1.y(1,:),X1.y(2,:),X1.y(3,:));
hold on;
geoidglobe
hold off;
figure(3)
groundtrack(X1)