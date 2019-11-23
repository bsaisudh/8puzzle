function solution = PerformAction (parentInfo,goalNodeNum)
    global nodesMat;
    global nodesNum;
    global nodesInfo;
    global nodeQ;
    global infoQ;
    global actions
    parentNodeMat = nodesMat(:,:,parentInfo(1));
    newNodesMat = [];
    newNodesNum = [];
    % Perform actions
    index = 1;
    for i= 1:4
        [status, newNodeMat] = actions{i}(parentNodeMat);
        if status
            % Convert to number
            newNodeNum = toNodeNum(newNodeMat);
            % check for dead node and add
            if ( size(find(nodesNum == newNodeNum),2) == 0)
                newNodesMat(:,:,index) = newNodeMat;
                newNodesNum(index) = newNodeNum;
                index = index + 1;
            end
        end
    end
    % Add alive nodes to nodes family and update infoQ
    nodesAdded = size(nodesNum,2);
    for i = 1:size(newNodesNum,2)
        newNodeInfo = [nodesAdded+i parentInfo(1) parentInfo(2)+1];
        nodesMat(:,:,nodesAdded+i) = newNodesMat(:,:,i);
        nodesNum(nodesAdded+i) = newNodesNum(i);
        nodesInfo(nodesAdded+i,:) = newNodeInfo;
        insetInfoQ(newNodeInfo);
    end
    if(size(find(newNodesNum == goalNodeNum),2) ~= 0)
        solution = true;
    else
        solution = false;
    end
    disp(parentInfo)
end