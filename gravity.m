function dX = gravity(t,X)
% 
    if norm(X(1:3))<6.55e6
        dX = [0 0 0 0 0 0]';
        return
    end
    [agrav(1),agrav(2),agrav(3)] = gravitysphericalharmonic2([X(1),X(2),X(3)], 'EGM96',10);
    
    [adrag(1),adrag(2),adrag(3)] = atmospheremodel(X);
    
    dX(1) = X(4);
    dX(2) = X(5);
    dX(3) = X(6);
%     dX(4) = agrav(1);
%     dX(5) = agrav(2);
%     dX(6) = agrav(3);
    
    dX(4) = agrav(1)+adrag(1);
    dX(5) = agrav(2)+adrag(2);
    dX(6) = agrav(3)+adrag(3);

    dX = transpose(dX);
end


