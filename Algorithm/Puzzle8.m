% Author : Bala Murali Manoghar Sai Sudhakar
% UID : 116150172
% Sample inputs :
% 1) Sample for solution exists case: [0 1 2 ; 4 5 3 ; 7 8 6] 
% 2) No solution case: [1 2 3 ; 4 6 5 ; 7 8 0]
%%
% Global Variables
global nodesMat;
global nodesNum;
global nodesInfo;
global nodeQ;
global infoQ;
global actions;

actions = { ...
            @ActionMoveDown, ...
            @ActionMoveLeft, ...
            @ActionMoveRight, ...
            @ActionMoveUp ...
            };
nodesMat = [];
nodesNum = [];
nodesInfo = [];
nodeQ = [];
infoQ = [];

%input form user
fprintf("\n Input Format Format (Matlab Array Type): \n [1 2 3 ; 4 5 0 ; 7 8 6]\n")
fprintf("\n which reperesents: \n 1 2 3 \n 4 5 0 \n 7 8 6 \n")
nodeInput = input("Enter Initial Configuration : \n");

% Start
initNodeMat = nodeInput;
initNodeNum = toNodeNum(initNodeMat);
initNodeInfo = [1 0 0];

nodesMat(:,:,1) = initNodeMat;
nodesNum(1) = initNodeNum;
nodesInfo(1,:) = initNodeInfo;
insetInfoQ(initNodeInfo);

% goal
goalNodeMat = [1 2 3 ; 4 5 6 ; 7 8 0];
goalNodeNum = toNodeNum(goalNodeMat);

%%
% Generate All Possible Nodes
solution = false;
while(size(infoQ,1)>0)
   solution = PerformAction(popInfoQ(), goalNodeNum);
   if solution
       break
   end
end
%%
goalPos = find(nodesNum == goalNodeNum);
if(size(goalPos,2) == 0)
    disp("There is no path from initial configuration to goal configuration");
else
    disp("Goal configuration reached");
    pathInfo = [];
    i = 1;
    pathInfo(i,:) = nodesInfo(goalPos,:);
    while(pathInfo(end,3)~=0)
       i = i+1;
       pathInfo(i,:) = nodesInfo(pathInfo(i-1,2),:);
    end 
end
%%
if solution
    pathInfo = flip(pathInfo);
    pathMat = nodesMat(:,:,pathInfo(:,1));
end
%%
n__ = [];
for i = 1: size(nodesMat,3)
    n_ = nodesMat(:,:,i);
    n__(i,:) = n_(:);
end
save('Nodes.txt','n__','-ascii')

n__ = [];
for i = 1: size(pathMat,3)
    n_ = nodesMat(:,:,i);
    n__(i,:) = n_(:);
end
save('nodePath.txt','n__','-ascii')

save('NodesInfo.txt','nodesInfo','-ascii')
%%
if solution
    plotOutput(pathMat);
end