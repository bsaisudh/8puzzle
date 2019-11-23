function [x0, y0] = BlankTileLocation(CurrentNode)
    [x0, y0] = find(CurrentNode==0);
end