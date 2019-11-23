function node = popNodeQ()
    global nodeQ;
    node = nodeQ(1);
    nodeQ(1) = [];
end