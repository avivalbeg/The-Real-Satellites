options = odeset('RelTol',1e-7);

load('aeroegm96.mat')
%this below is ugly.
global C S Re GM   
%what do I do with it?
r = 6.6e6;
R = 6.378e6;
%X0 = [r 0 0 0 0 9000];   %orbit to show atmospheric effects
%X0 = [42164e3 0 0 0 3070 800];    %geostationary orbit
X0 = fromKepler(42164e3,0.01,20,0,0,0,0,0,0);   %input kepler
%X0 = [r 0 0 0 1000 8500];
%elements instead

X1 = ode45(@gravity,[0,100000],X0,options);
figure(1)
plot3(X1.y(1,:),X1.y(2,:),X1.y(3,:));
hold on;
geoidglobe
hold off;
%figure(3)  Just do this by yourself if you want
%groundtrack(X1)