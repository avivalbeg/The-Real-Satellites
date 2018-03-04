function geoidglobe()
    load geoid;
    erad = 6700e3;
    prad = 6700e3;
    npanels = 180;
    load coastlines;    
    [xtmp,ytmp,ztmp] = sph2cart(deg2rad(coastlon),deg2rad(coastlat),erad);
    plot3(-xtmp,-ytmp,ztmp,'k') 

    hold on;
    [x, y, z] = ellipsoid(0, 0, 0, erad, erad, prad, npanels);
    globe = surf(x,y,z,'FaceColor','none','EdgeColor',.5*[1 1 1]);
    set(globe,'FaceColor','texturemap','CData',geoid)
    set(globe,'FaceAlpha',.8,'EdgeColor','none');
    axis equal;
    set(gcf,'Color','k')
    axis off;
    grid off;
    axis equal;
    l = light('Position',[1,0,.4348]);
    l.Color = [1,1,.96];
%     l = camlight('left','local');
%     l.Color = [0,0,1];
end