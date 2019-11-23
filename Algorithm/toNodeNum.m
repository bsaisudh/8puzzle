function nodeNum = toNodeNum(node)
    n = node(:);
    nodeNum = 0;
    for i=n,pos=8:-1:0;
        nodeNum = power(10,pos)*i;
    end
end