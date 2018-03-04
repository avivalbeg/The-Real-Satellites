function [adragX,adragY,adragZ] = atmospheremodel(X)
    r = norm(X(1:3));
    R = 6.378e6;
    CD = .1;
    Area = .1;
    wgs84 = wgs84Ellipsoid('meters');
    [lat,lon,h] = ecef2geodetic(wgs84,X(1),X(2),X(3));
    %h = r-R;
    rho = 101.325e3*exp(-h/8000);
    omega =[0 0 2*pi/(24*60*60)];
    Vrel = X(4:6)-cross(omega,X(1:3));
    adrag = -CD*rho*norm(Vrel)^2*Area*X(4:6)/(2*norm(X(4:6)));
    adragX = adrag(1);
    adragY = adrag(2);
    adragZ = adrag(3);
end