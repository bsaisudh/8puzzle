function [Status, NewNode] = ActionMoveDown(CurrentNode)
    [x0, y0] = BlankTileLocation(CurrentNode);
    x = [x0 y0];
    x_ = x + [1 0];
    % Node is assumed to be square matrix always
    if(sum(or(x_>size(CurrentNode,1) , x_<1))>0)
        Status = false;
        NewNode = CurrentNode;
    else
        n = sub2ind(size(CurrentNode), x(1), x(2));
        n_ = sub2ind(size(CurrentNode), x_(1), x_(2));
        NewNode = CurrentNode;
        NewNode([n n_]) = CurrentNode([n_ n]);
        Status = true;
    end 
end