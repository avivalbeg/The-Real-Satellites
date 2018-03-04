function X = fromKepler(p,e,i,O,o,nu,truLon,argLat,lonPer)
    [r,v] = orb2rv(p,e,i,O,o,nu,truLon,argLat,lonPer);
    X = [r' v'];

end