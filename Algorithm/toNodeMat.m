function nodeMat = toNodeMat(nodeNum)
    for pos=8:-1:0
        node(9-pos) = floor(nodeNum ./ power(10,pos));
        nodeNum = mod(nodeNum , power(10,pos));
    end
    nodeMat = reshape(node,3,3);
end