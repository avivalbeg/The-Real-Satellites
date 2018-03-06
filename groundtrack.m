function groundtrack(X)
    if ~libisloaded('geoid')
        load geoid
    end
    if ~libisloaded('coastlines')
        load coastlines
    end
    
    geoshow(geoid,geoidlegend,'DisplayType','texturemap')
    hold on;
    geoshow(coastlat,coastlon)
    
    lla = [];
    S = size(X.y);
    utc0 =datetime([1994 1 17 10 10 10]);
    for i= 1:S(2)
        utc = utc0+seconds(X.x(i));
        lla = [lla; eci2lla(X.y(1:3,i)',datevec(utc))];
    end
    %lla = ecef2lla(X.y(1:3,:)');
    geoshow(lla(:,1),lla(:,2),'Color','red');
    hold off;
    %Doesn't work the way I want...
    for i= 1:S(2)
        if rem(i,1) == 0
                geoshow(lla(i,1),lla(i,2), 'DisplayType', 'Point', 'Marker', '+', 'Color', 'blue');
        end
    end
    hold off;
    
    

end