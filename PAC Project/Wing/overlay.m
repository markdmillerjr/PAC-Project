function overlay
% Written by Mark D. Miller Jr.
% 1/28/20
overlay1;
overlay2;
overlay3;

% Line overlays
function overlay1
global wingPointsArray1 YW2 XWRT c b LamLE L1 XWRTMainC YWRTMainC storageArrayP1...
      deletePointGo yLocationInc storageArray1Y wingOutline tp LP1...
      storageArray1X topViewAxes lineSelected storageArrayP2 storageArray2X storageArray2Y
  
% Erase the old overlay  
delete(L1);  
  
%% 1st Line
% X-Coordinates
% X-Coordinates
XW1 = 0;
XW2=XW1 + (b/2)*tand(LamLE);
XWRT = [(((XW1))),(((XW2)))];

% Y-Coordinates
YW2=b/2;


% XW2=1+(b/c)*tand(LamLE);
% XWRT = [(((1)*c)-c),(((XW2)*c)-c)];

% Y-Coordinates
% YW2=b/2;

% i = storageArrayP1(end)+1;
% j = storageArrayP1(end)+1;
% 
% X1 = zeros(100,i);
% Y1 = zeros(100,j);
% 
% wingPlanformPointsX = zeros(1,i*100);
% wingPlanformPointsY = zeros(1,i*100);


%% Leading edge selected---------------------------------------------------
    
        if isempty(storageArrayP1) ~= 1 && storageArrayP1(end) == 1 && isempty(storageArray1X) == 1 || deletePointGo == 1 && isempty(storageArray1X) == 1
            i = storageArrayP1(end)+1;
            j = storageArrayP1(end)+1;

            X1 = zeros(100,i);
            Y1 = zeros(100,j);

            wingPlanformPointsX = zeros(1,i*100);
            wingPlanformPointsY = zeros(1,i*100);

            if yLocationInc == b/2
                delete(wingOutline);
                delete(LP1);
                storageArrayP1(end) = [];
                XWRTMainC = [(((1)*c)-c),(((XW2)*c)-c),(((tp+XW2)*c)-c),(((2)*c)-c)];
                YWRTMainC = [0,(YW2),(YW2),0];
                wingOutline = line(XWRTMainC,YWRTMainC,'color','black','linewidth',3);

                wingPlanformPointsX = linspace(XWRT(1),XWRT(2),1000);
                wingPlanformPointsY = linspace(0,YW2,1000);
            else
                i = storageArrayP1(end)+1;
                j = storageArrayP1(end)+1;

                X1 = zeros(100,i);
                Y1 = zeros(100,j);

                wingPlanformPointsX = zeros(1,i*100);
                wingPlanformPointsY = zeros(1,i*100);    

                for i = 1:storageArrayP1(end)+1
                    X1(:,i) = (linspace(XWRTMainC(i),XWRTMainC(i+1),100))';
                    Y1(:,i) = (linspace(YWRTMainC(i),YWRTMainC(i+1),100))';
                    if i == 1
                        wingPlanformPointsX(1:100) = X1(:,i)';
                        wingPlanformPointsY(1:100) = Y1(:,i)';
                    else
                        wingPlanformPointsX(((i-1)*100)+1:(i)*100) = X1(:,i)';
                        wingPlanformPointsY(((i-1)*100)+1:(i)*100) = Y1(:,i)';
                    end
                end
            end
        elseif find(storageArray1Y == b/2)

            i = storageArrayP1(end);
            j = storageArrayP1(end);

            X1 = zeros(100,i);
            Y1 = zeros(100,j);

            wingPlanformPointsX = zeros(1,i*100);
            wingPlanformPointsY = zeros(1,i*100);

            for i = 1:storageArrayP1(end)
                X1(:,i) = (linspace(XWRTMainC(i),XWRTMainC(i+1),100))';
                Y1(:,i) = (linspace(YWRTMainC(i),YWRTMainC(i+1),100))';
                if i == 1
                    wingPlanformPointsX(1:100) = X1(:,i)';
                    wingPlanformPointsY(1:100) = Y1(:,i)';
                else
                    wingPlanformPointsX(((i-1)*100)+1:(i)*100) = X1(:,i)';
                    wingPlanformPointsY(((i-1)*100)+1:(i)*100) = Y1(:,i)';
                end
            end
        elseif isempty(storageArrayP1) ~= 1 && isempty(XWRTMainC) ~= 1

            i = storageArrayP1(end)+1;
            j = storageArrayP1(end)+1;

            X1 = zeros(100,i);
            Y1 = zeros(100,j);

            wingPlanformPointsX = zeros(1,i*100);
            wingPlanformPointsY = zeros(1,i*100);

            for i = 1:storageArrayP1(end)+1
                X1(:,i) = (linspace(XWRTMainC(i),XWRTMainC(i+1),100))';
                Y1(:,i) = (linspace(YWRTMainC(i),YWRTMainC(i+1),100))';
                if i == 1
                    wingPlanformPointsX(1:100) = X1(:,i)';
                    wingPlanformPointsY(1:100) = Y1(:,i)';
                else
                    wingPlanformPointsX(((i-1)*100)+1:(i)*100) = X1(:,i)';
                    wingPlanformPointsY(((i-1)*100)+1:(i)*100) = Y1(:,i)';
                end
            end
            
        else            
            wingPlanformPointsX = linspace(XWRT(1),XWRT(2),1000);
            wingPlanformPointsY = linspace(0,YW2,1000);   
        end
        
%% Trailing edge selected--------------------------------------------------

%     if storageArrayP2(end) == 1 && isempty(storageArray2X) == 1 || deletePointGo == 1 && isempty(storageArray2X) == 1
%         i = storageArrayP2(end)+1;
%         j = storageArrayP2(end)+1;
% 
%         X1 = zeros(100,i);
%         Y1 = zeros(100,j);
% 
%         wingPlanformPointsX = zeros(1,i*100);
%         wingPlanformPointsY = zeros(1,i*100);
% 
%         if yLocationInc == b/2
%             delete(wingOutline);
%             delete(LP1);
%             storageArrayP2(end) = [];
%             XWRTMainC = [(((1)*c)-c),(((XW2)*c)-c),(((tp+XW2)*c)-c),(((2)*c)-c)];
%             YWRTMainC = [0,(YW2),(YW2),0];
%             wingOutline = line(XWRTMainC,YWRTMainC,'color','black','linewidth',3);
% 
%             wingPlanformPointsX = linspace(XWRT(1),XWRT(2),1000);
%             wingPlanformPointsY = linspace(0,YW2,1000);
% 
%         else
%             i = storageArrayP2(end)+1;
%             j = storageArrayP2(end)+1;
% 
%             X1 = zeros(100,i);
%             Y1 = zeros(100,j);
% 
%             wingPlanformPointsX = zeros(1,i*100);
%             wingPlanformPointsY = zeros(1,i*100);    
% 
%             for i = 1:storageArrayP2(end)+1
%                 X1(:,i) = (linspace(XWRTMainC(i),XWRTMainC(i+1),100))';
%                 Y1(:,i) = (linspace(YWRTMainC(i),YWRTMainC(i+1),100))';
%                 if i == 1
%                     wingPlanformPointsX(1:100) = X1(:,i)';
%                     wingPlanformPointsY(1:100) = Y1(:,i)';
%                 else
%                     wingPlanformPointsX(((i-1)*100)+1:(i)*100) = X1(:,i)';
%                     wingPlanformPointsY(((i-1)*100)+1:(i)*100) = Y1(:,i)';
%                 end
%             end
%         end
% 
%     elseif find(storageArray2Y == b/2)
% 
%         i = storageArrayP2(end);
%         j = storageArrayP2(end);
% 
%         X1 = zeros(100,i);
%         Y1 = zeros(100,j);
% 
%         wingPlanformPointsX = zeros(1,i*100);
%         wingPlanformPointsY = zeros(1,i*100);
% 
%         for i = 1:storageArrayP2(end)
%             X1(:,i) = (linspace(XWRTMainC(i),XWRTMainC(i+1),100))';
%             Y1(:,i) = (linspace(YWRTMainC(i),YWRTMainC(i+1),100))';
%             if i == 1
%                 wingPlanformPointsX(1:100) = X1(:,i)';
%                 wingPlanformPointsY(1:100) = Y1(:,i)';
%             else
%                 wingPlanformPointsX(((i-1)*100)+1:(i)*100) = X1(:,i)';
%                 wingPlanformPointsY(((i-1)*100)+1:(i)*100) = Y1(:,i)';
%             end
%         end
%     else
%         i = storageArrayP2(end)+1;
%         j = storageArrayP2(end)+1;
% 
%         X1 = zeros(100,i);
%         Y1 = zeros(100,j);
% 
%         wingPlanformPointsX = zeros(1,i*100);
%         wingPlanformPointsY = zeros(1,i*100);
% 
%         for i = 1:storageArrayP2(end)+1
%             X1(:,i) = (linspace(XWRTMainC(i),XWRTMainC(i+1),100))';
%             Y1(:,i) = (linspace(YWRTMainC(i),YWRTMainC(i+1),100))';
%             if i == 1
%                 wingPlanformPointsX(1:100) = X1(:,i)';
%                 wingPlanformPointsY(1:100) = Y1(:,i)';
%             else
%                 wingPlanformPointsX(((i-1)*100)+1:(i)*100) = X1(:,i)';
%                 wingPlanformPointsY(((i-1)*100)+1:(i)*100) = Y1(:,i)';
%             end
%         end
%     end


% Conversion from number array to cell array
wingPlanformPointsXCell1 = num2cell(wingPlanformPointsX);
wingPlanformPointsYCell1 = num2cell(wingPlanformPointsY);

% Arrange it in a column
wingPlanformPointsXCell1 = wingPlanformPointsXCell1(:);
wingPlanformPointsYCell1 = wingPlanformPointsYCell1(:);

% Conversion from cell array to logical array
% sizePlanformPointsX = size(wingPlanformPointsX1);
% sizePlanformPointsY = size(wingPlanformPointsY1);

% wingPlanformPointsXLogic = false(sizePlanformPointsX(2),1);
% wingPlanformPointsYLogic = false(sizePlanformPointsY(2),1);

% animals1 = [wingPlanformPointsXCell,wingPlanformPointsYCell];
wingPointsArray1 = [wingPlanformPointsXCell1,wingPlanformPointsYCell1];

% 1st Line
L1 = line(topViewAxes,cell2mat(wingPointsArray1(:,1)),cell2mat(wingPointsArray1(:,2)),'marker','none','markersize',10,'color',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','-','linewidth',5);
set(L1, 'ButtonDownFcn', {@selectedLine1, L1})

function overlay2
global wingPointsArray2 YW2 XWRT c tp b LamLE L2 XWRTMainC YWRTMainC...
    storageArrayP1 deletePointGo yLocationInc storageArray1Y wingOutline...
    LP1 storageArray1X lineSelected storageArrayP2 storageArray2X storageArray2Y...
    XWRTMain YWRTMain tempStorageArrayXSort2 tempStorageArrayYSort2 topViewAxes...
    rootChord tipChord

% Erase the old overlay
delete(L2);

%% 2nd Line
% X-Coordinates
XW1 = 0;
XW2=XW1 + (b/2)*tand(LamLE);
XW3=XW2+tipChord;
XW4=XW1+rootChord;
XWRT = [(((XW4))),(((XW3)))];

% Y-Coordinates
YW2=b/2;



% XWRT = XWRTMain;
% X-Coordinates
% XW2=1+(b/c)*tand(LamLE);

% Y-Coordinates
% YW2=b/2;
%% 2nd Line
% XWRT = [(((2)*c)-c),(((tp+XW2)*c)-c)];


%% Leading edge selected---------------------------------------------------

%         if storageArrayP1(end) == 1 && isempty(storageArray1X) == 1 || deletePointGo == 1 && isempty(storageArray1X) == 1
%             i = storageArrayP1(end)+1;
%             j = storageArrayP1(end)+1;
% 
%             X1 = zeros(100,i);
%             Y1 = zeros(100,j);
% 
%             wingPlanformPointsX2 = zeros(1,i*100);
%             wingPlanformPointsY2 = zeros(1,i*100);
% 
%             if yLocationInc == b/2
% 
%             delete(wingOutline);
%             delete(LP1);
%             storageArrayP1(end) = [];
%             XWRTMainC = [(((1)*c)-c),(((XW2)*c)-c),(((tp+XW2)*c)-c),(((2)*c)-c)];
%             YWRTMainC = [0,(YW2),(YW2),0];
%             wingOutline = line(XWRTMainC,YWRTMainC,'color','black','linewidth',3);
% 
%             wingPlanformPointsX2 = linspace(XWRT(1),XWRT(2),1000);
%             wingPlanformPointsY2 = linspace(0,YW2,1000);
% 
%             else
%             i = storageArrayP1(end)+1;
%             j = storageArrayP1(end)+1;
% 
%             X1 = zeros(100,i);
%             Y1 = zeros(100,j);
% 
%             wingPlanformPointsX2 = zeros(1,i*100);
%             wingPlanformPointsY2 = zeros(1,i*100);    
% 
%                 for i = 1:storageArrayP1(end)+1
%                     X1(:,i) = (linspace(XWRTMainC(i),XWRTMainC(i+1),100))';
%                     Y1(:,i) = (linspace(YWRTMainC(i),YWRTMainC(i+1),100))';
%                     if i == 1
%                         wingPlanformPointsX2(1:100) = X1(:,i)';
%                         wingPlanformPointsY2(1:100) = Y1(:,i)';
%                     else
%                         wingPlanformPointsX2(((i-1)*100)+1:(i)*100) = X1(:,i)';
%                         wingPlanformPointsY2(((i-1)*100)+1:(i)*100) = Y1(:,i)';
%                     end
%                 end
%             end
% 
%         elseif find(storageArray1Y == b/2)
% 
%             i = storageArrayP1(end);
%             j = storageArrayP1(end);
% 
%             X1 = zeros(100,i);
%             Y1 = zeros(100,j);
% 
%             wingPlanformPointsX2 = zeros(1,i*100);
%             wingPlanformPointsY2 = zeros(1,i*100);
% 
%             for i = 1:storageArrayP1(end)
%                 X1(:,i) = (linspace(XWRTMainC(i),XWRTMainC(i+1),100))';
%                 Y1(:,i) = (linspace(YWRTMainC(i),YWRTMainC(i+1),100))';
%                 if i == 1
%                     wingPlanformPointsX2(1:100) = X1(:,i)';
%                     wingPlanformPointsY2(1:100) = Y1(:,i)';
%                 else
%                     wingPlanformPointsX2(((i-1)*100)+1:(i)*100) = X1(:,i)';
%                     wingPlanformPointsY2(((i-1)*100)+1:(i)*100) = Y1(:,i)';
%                 end
%             end
%         else
% 
% %             i = storageArrayP1(end)+1;
% %             j = storageArrayP1(end)+1;
% % 
% %             X1 = zeros(100,i);
% %             Y1 = zeros(100,j);
% % 
% %             wingPlanformPointsX2 = zeros(1,i*100);
% %             wingPlanformPointsY2 = zeros(1,i*100);
% % 
% %             for i = 1:storageArrayP1(end)+1
% %                 X1(:,i) = (linspace(XWRTMainC(i),XWRTMainC(i+1),100))';
% %                 Y1(:,i) = (linspace(YWRTMainC(i),YWRTMainC(i+1),100))';
% %                 if i == 1
% %                     wingPlanformPointsX2(1:100) = X1(:,i)';
% %                     wingPlanformPointsY2(1:100) = Y1(:,i)';
% %                 else
% %                     wingPlanformPointsX2(((i-1)*100)+1:(i)*100) = X1(:,i)';
% %                     wingPlanformPointsY2(((i-1)*100)+1:(i)*100) = Y1(:,i)';
% %                 end
% %             end
%             
%             
%             
%         i = storageArrayP1(end)+1;
%         j = storageArrayP1(end)+1;
% 
%         X1 = zeros(100,i);
%         Y1 = zeros(100,i);
% 
%         wingPlanformPointsX2 = zeros(1,i*100);
%         wingPlanformPointsY2 = zeros(1,i*100);
% 
%         for i = 1:storageArrayP1(end)+1
%             X1(:,i) = (linspace(XWRTMainC(j),XWRTMainC(j+1),100))';
%             Y1(:,i) = (linspace(YWRTMainC(j),YWRTMainC(j+1),100))';
%             if i == 3
%                 wingPlanformPointsX2(1:100) = X1(:,i)';
%                 wingPlanformPointsY2(1:100) = Y1(:,i)';
%             else
%                 wingPlanformPointsX2(((i-1)*100)+1:(i)*100) = X1(:,i)';
%                 wingPlanformPointsY2(((i-1)*100)+1:(i)*100) = Y1(:,i)';
%             end
%         end
%             
%             
%             
%             
%         end
%         
%         
        
        
%% Trailing edge selected--------------------------------------------------
%% ------------------------------------------------------------------------
% Attempted adjustment on (3/1/22)



%     if  isempty(storageArrayP2) ~= 1 && storageArrayP2(end) == 1 && isempty(storageArray2X) == 1 || deletePointGo == 1 && isempty(storageArray2X) == 1
%     if isempty(storageArrayP2) ~= 1 && storageArrayP2(end) == 1 && isempty(storageArray2X) == 1
%         i = storageArrayP2(end)+1;
%         j = storageArrayP2(end)+1;
% 
%         X1 = zeros(100,i);
%         Y1 = zeros(100,j);
% 
%         wingPlanformPointsX2 = zeros(1,i*100);
%         wingPlanformPointsY2 = zeros(1,i*100);
% 
%         if yLocationInc == b/2
%             
%             delete(wingOutline);
%             delete(LP1);
%             storageArrayP2(end) = [];
%             XWRTMainC = [(((1)*c)-c),(((XW2)*c)-c),(((tp+XW2)*c)-c),(((2)*c)-c)];
%             YWRTMainC = [0,(YW2),(YW2),0];
%             wingOutline = line(XWRTMainC,YWRTMainC,'color','black','linewidth',3);
% 
%             wingPlanformPointsX2 = linspace(XWRT(1),XWRT(2),1000);
%             wingPlanformPointsY2 = linspace(0,YW2,1000);
% 
%         else
%             i = storageArrayP2(end)+1;
%             j = storageArrayP2(end)+1;
% 
%             X1 = zeros(100,i);
%             Y1 = zeros(100,j);
% 
%             wingPlanformPointsX2 = zeros(1,i*100);
%             wingPlanformPointsY2 = zeros(1,i*100);    
% 
%             for i = 1:storageArrayP2(end)+1
%                 X1(:,i) = (linspace(XWRTMainC(i),XWRTMainC(i+1),100))';
%                 Y1(:,i) = (linspace(YWRTMainC(i),YWRTMainC(i+1),100))';
%                 if i == 1
%                     wingPlanformPointsX2(1:100) = X1(:,i)';
%                     wingPlanformPointsY2(1:100) = Y1(:,i)';
%                 else
%                     wingPlanformPointsX2(((i-1)*100)+1:(i)*100) = X1(:,i)';
%                     wingPlanformPointsY2(((i-1)*100)+1:(i)*100) = Y1(:,i)';
%                 end
%             end
%         end
% 
%     elseif find(storageArray2Y == b/2)
% 
%         i = storageArrayP2(end);
%         j = storageArrayP2(end);
% 
%         X1 = zeros(100,i);
%         Y1 = zeros(100,j);
% 
%         wingPlanformPointsX2 = zeros(1,i*100);
%         wingPlanformPointsY2 = zeros(1,i*100);
% 
%         for i = 1:storageArrayP2(end)
%             X1(:,i) = (linspace(XWRTMainC(i),XWRTMainC(i+1),100))';
%             Y1(:,i) = (linspace(YWRTMainC(i),YWRTMainC(i+1),100))';
%             if i == 1
%                 wingPlanformPointsX2(1:100) = X1(:,i)';
%                 wingPlanformPointsY2(1:100) = Y1(:,i)';
%             else
%                 wingPlanformPointsX2(((i-1)*100)+1:(i)*100) = X1(:,i)';
%                 wingPlanformPointsY2(((i-1)*100)+1:(i)*100) = Y1(:,i)';
%             end
%         end
        
%% ------------------------------------------------------------------------
% Going to try an adjustment, hopefully it won't screw everything up.
% (3/1/22)
%     elseif isempty(storageArrayP2) ~= 1
    if isempty(storageArrayP2) ~= 1    
        
        % Need to find where trailing edge begins
        [~,last] = find(YWRTMainC == b/2);
        last = last(end);
        
        j = last;
        
        if storageArrayP2(end) + 4 == length(XWRTMainC)
            i = storageArrayP2(end)+1;
            k = storageArrayP2(end)+1;
        elseif isempty(storageArrayP1) ~= 1
            i = storageArrayP2(end) + storageArrayP1(1);
            k = storageArrayP2(end) + storageArrayP1(1);
        else
            i = storageArrayP2(end);
            k = storageArrayP2(end);
        end
        
        X1 = zeros(100,i);
        Y1 = zeros(100,i);

        wingPlanformPointsX2 = zeros(1,i*100);
        wingPlanformPointsY2 = zeros(1,i*100);
        
        for i = 1:k
            X1(:,i) = (linspace(XWRTMainC(j),XWRTMainC(j+1),100))';
            Y1(:,i) = (linspace(YWRTMainC(j),YWRTMainC(j+1),100))';
            if i == 1
                wingPlanformPointsX2(1:100) = X1(:,i)';
                wingPlanformPointsY2(1:100) = Y1(:,i)';
            else
                wingPlanformPointsX2(((i-1)*100)+1:(i)*100) = X1(:,i)';
                wingPlanformPointsY2(((i-1)*100)+1:(i)*100) = Y1(:,i)';
            end
            j = j+1;
        end
    else
        wingPlanformPointsX2 = linspace(XWRT(1),XWRT(2),1000);
        wingPlanformPointsY2 = linspace(0,YW2,1000);     
    end
%% ------------------------------------------------------------------------


    
% XWRTMainC = [XWRTMain(:,1:1) XWRTMain(:,2:3) tempStorageArrayXSort2 XWRTMain(:,end)];
% YWRTMainC = [YWRTMain(:,1:1) YWRTMain(:,2:3) tempStorageArrayYSort2 YWRTMain(:,end)];

% Wing Planform Points
% wingPlanformPointsX2 = linspace(-XWRT(2),-XWRT(3),1000);
% wingPlanformPointsY2 = linspace(YW2,YW2,1000);

% wingPlanformPointsX2 = linspace(XWRT(1),XWRT(2),1000);
% 
% wingPlanformPointsY2 = linspace(0,YW2,1000);

% Conversion from number array to cell array
wingPlanformPointsXCell2 = num2cell(wingPlanformPointsX2);
wingPlanformPointsYCell2 = num2cell(wingPlanformPointsY2);

% Arrange it in a column
wingPlanformPointsXCell2 = wingPlanformPointsXCell2(:);
wingPlanformPointsYCell2 = wingPlanformPointsYCell2(:);

wingPointsArray2 = [wingPlanformPointsXCell2,wingPlanformPointsYCell2];
L2 = line(topViewAxes,cell2mat(wingPointsArray2(:,1)),cell2mat(wingPointsArray2(:,2)),'marker','none','markersize',10,'color',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','-','linewidth',5);
set(L2, 'ButtonDownFcn', {@selectedLine2, L2})

function overlay3
global wingPointsArray3 YW2 ZWRT c tp b LamLE L3 XWRTMainC YWRTMainC...
    storageArrayP1 deletePointGo yLocationInc wingOutline LP3 storageArrayP3...
    storageArray2X storageArray2Y frontViewAxes rootChord tipChord t_c...
    Gam i_w

% Erase the old overlay
delete(L3);

% X-Coordinates
XW1 = 0;
XW2=XW1 + (b/2)*tand(LamLE);
% XW3=XW2+tipChord;
XW4=XW1+rootChord;
% ZWRT = [(((XW4))),(((XW3)))];
ZW1=rootChord*sind(i_w);
ZW2=(XW4-XW2)*sind(i_w)+(b/2)*tand(Gam);

ZWRT = [-(ZW1+t_c*rootChord),-(ZW2+t_c*tipChord),0,0];


% Y-Coordinates
YW2=b/2;


%% Upper Surface selected--------------------------------------------------

    if isempty(storageArrayP3) ~= 1 && storageArrayP3(end) == 1 && isempty(storageArray2X) == 1 || deletePointGo == 1 && isempty(storageArray2X) == 1
        i = storageArrayP3(end)+1;
        j = storageArrayP3(end)+1;

        X1 = zeros(100,i);
        Y1 = zeros(100,j);

        wingPlanformPointsX3 = zeros(1,i*100);
        wingPlanformPointsY3 = zeros(1,i*100);

        if yLocationInc == b/2
            
            delete(wingOutline);
            delete(LP3);
            storageArrayP3(end) = [];
            XWRTMainC = [(((1)*c)-c),(((XW2)*c)-c),(((tp+XW2)*c)-c),(((2)*c)-c)];
            YWRTMainC = [0,(YW2),(YW2),0];
            wingOutline = line(XWRTMainC,YWRTMainC,'color','black','linewidth',3);

            wingPlanformPointsX3 = linspace(ZWRT(1),ZWRT(2),1000);
            wingPlanformPointsY3 = linspace(0,-YW2,1000);

        else
            i = storageArrayP3(end)+1;
            j = storageArrayP3(end)+1;

            X1 = zeros(100,i);
            Y1 = zeros(100,j);

            wingPlanformPointsX3 = zeros(1,i*100);
            wingPlanformPointsY3 = zeros(1,i*100);    

            for i = 1:storageArrayP3(end)+1
                X1(:,i) = (linspace(XWRTMainC(i),XWRTMainC(i+1),100))';
                Y1(:,i) = (linspace(YWRTMainC(i),YWRTMainC(i+1),100))';
                if i == 1
                    wingPlanformPointsX3(1:100) = X1(:,i)';
                    wingPlanformPointsY3(1:100) = Y1(:,i)';
                else
                    wingPlanformPointsX3(((i-1)*100)+1:(i)*100) = X1(:,i)';
                    wingPlanformPointsY3(((i-1)*100)+1:(i)*100) = Y1(:,i)';
                end
            end
        end

    elseif find(storageArray2Y == b/2)

        i = storageArrayP3(end);
        j = storageArrayP3(end);

        X1 = zeros(100,i);
        Y1 = zeros(100,j);

        wingPlanformPointsX3 = zeros(1,i*100);
        wingPlanformPointsY3 = zeros(1,i*100);

        for i = 1:storageArrayP3(end)
            X1(:,i) = (linspace(XWRTMainC(i),XWRTMainC(i+1),100))';
            Y1(:,i) = (linspace(YWRTMainC(i),YWRTMainC(i+1),100))';
            if i == 1
                wingPlanformPointsX3(1:100) = X1(:,i)';
                wingPlanformPointsY3(1:100) = Y1(:,i)';
            else
                wingPlanformPointsX3(((i-1)*100)+1:(i)*100) = X1(:,i)';
                wingPlanformPointsY3(((i-1)*100)+1:(i)*100) = Y1(:,i)';
            end
        end
    elseif isempty(storageArrayP3) ~= 1
        
        % Need to find where trailing edge begins
        [~,last] = find(YWRTMainC == b/2);
        last = last(end);
        
        j = last;
        
        if storageArrayP3(end) + 4 == length(XWRTMainC)
            i = storageArrayP3(end)+1;
            k = storageArrayP3(end)+1;
        elseif isempty(storageArrayP1) ~= 1
            i = storageArrayP3(end) + storageArrayP1(1);
            k = storageArrayP3(end) + storageArrayP1(1);
        else
            i = storageArrayP3(end);
            k = storageArrayP3(end);
        end
        
        X1 = zeros(100,i);
        Y1 = zeros(100,i);

        wingPlanformPointsX3 = zeros(1,i*100);
        wingPlanformPointsY3 = zeros(1,i*100);
        
        for i = 1:k
            X1(:,i) = (linspace(XWRTMainC(j),XWRTMainC(j+1),100))';
            Y1(:,i) = (linspace(YWRTMainC(j),YWRTMainC(j+1),100))';
            if i == 1
                wingPlanformPointsX3(1:100) = X1(:,i)';
                wingPlanformPointsY3(1:100) = Y1(:,i)';
            else
                wingPlanformPointsX3(((i-1)*100)+1:(i)*100) = X1(:,i)';
                wingPlanformPointsY3(((i-1)*100)+1:(i)*100) = Y1(:,i)';
            end
            j = j+1;
        end
    else
        
        wingPlanformPointsX3 = linspace(ZWRT(1),ZWRT(2),1000);
        wingPlanformPointsY3 = linspace(0,-YW2,1000);
        
    end

% Conversion from number array to cell array
wingPlanformPointsXCell3 = num2cell(wingPlanformPointsX3);
wingPlanformPointsYCell3 = num2cell(wingPlanformPointsY3);

% Arrange it in a column
wingPlanformPointsXCell3 = wingPlanformPointsXCell3(:);
wingPlanformPointsYCell3 = wingPlanformPointsYCell3(:);

wingPointsArray3 = [wingPlanformPointsXCell3,wingPlanformPointsYCell3];
L3 = line(frontViewAxes,cell2mat(wingPointsArray3(:,1)),cell2mat(wingPointsArray3(:,2)),'marker','none','markersize',10,'color',[0 0 0],'markeredgecolor',[0 0 0],'linestyle','-','linewidth',5);
set(L3, 'ButtonDownFcn', {@selectedLine3, L3});

% Selected line callbacks
function selectedLine1(~,~,~)
global wingPointsArray1 H1 H2 H3 combinedWindowsFig lineSelected lineSelectedOff...
     saveButton TEP1 pointCoordFig xCoordinateLabel USP1

delete(H1);
delete(H2);
delete(H3);
delete(TEP1);
delete(USP1);

H1 = patchline(cell2mat(wingPointsArray1(:,1)),cell2mat(wingPointsArray1(:,2)),...
            'linestyle','-','edgecolor','#9ffb8f','linewidth',10,'edgealpha',0.45);

set(combinedWindowsFig,'windowbuttonmotionfcn',{@hover1,H1});
lineSelected = 1;
lineSelectedOff = 0;
saveButton.Enable = 'off';

% X Coordinate
xCoordinateLabel = uicontrol('Parent',pointCoordFig,'Style','text','String','X-Coordinate','Position',[5 80 85 25],'Enable','on');

function selectedLine2(~,~,~)
global wingPointsArray2 H1 H2 H3 combinedWindowsFig lineSelectedOff lineSelected...
     saveButton LEP1 pointCoordFig xCoordinateLabel USP1
delete(H1);
delete(H2);
delete(H3);
delete(LEP1);
delete(USP1);

H2 = patchline(cell2mat(wingPointsArray2(:,1)),cell2mat(wingPointsArray2(:,2)),...
            'linestyle','-','edgecolor','#9ffb8f','linewidth',10,'edgealpha',0.45);
set(combinedWindowsFig,'windowbuttonmotionfcn',{@hover2,H2});
lineSelected = 2;
lineSelectedOff = 0;
saveButton.Enable = 'off';

% X Coordinate
xCoordinateLabel = uicontrol('Parent',pointCoordFig,'Style','text','String','X-Coordinate','Position',[5 80 85 25],'Enable','on');

function selectedLine3(~,~,~)
global wingPointsArray3 H1 H2 H3 combinedWindowsFig lineSelectedOff lineSelected...
    editPanel saveButton pointCoordFig zCoordinateLabel
delete(H1);
delete(H2);
delete(H3);
H3 = patchline(cell2mat(wingPointsArray3(:,1)),cell2mat(wingPointsArray3(:,2)),...
            'linestyle','-','edgecolor','#9ffb8f','linewidth',10,'edgealpha',0.45);
set(combinedWindowsFig,'windowbuttonmotionfcn',{@hover3,H3});
lineSelected = 3;
lineSelectedOff = 0;
saveButton.Enable = 'off';

% Z Coordinate
zCoordinateLabel = uicontrol('Parent',pointCoordFig,'Style','text','String','Z-Coordinate','Position',[5 90 85 15],'Enable','on');

% Moving the mouse over the selected line moves a dot under the mouse
function hover1(src1,~,L1)
global LL1 LL2 wingPointsArray1 idx1 line1Selected lineSelectedOff xclick yclick

delete(LL2);

%since this is a figure callback, the first input is the figure handle:
f=src1;
%like all callbacks, the second input, ev, isn't used. 
%  delete(pointsFigure);
%determine which object is below the cursor:
obj=hittest(f); %<-- the important line in this demo
 
% if pointCoordinatesSelected == 0
if obj==L1 %if over the plot...
        %get cursor coordinates in its axes:
        a=get(L1,'parent');
        point=get(a,'currentpoint');
        xclick=point(1,1,1);
        yclick=point(1,2,1);

        %determine which point we're over:
        idx1=findclosestpoint2D(xclick,yclick,L1);
        
        if length(idx1) > length(wingPointsArray1)
            idx1(end) = [];
        end

        if lineSelectedOff == 0
            delete(findobj(LL1));

                LL1=line(wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
                set(LL1, 'ButtonDownFcn', {@selectedPoint1, LL1});
        end
end
line1Selected = 1;
            
function hover2(src2,~,L2)
global LL1 LL2 wingPointsArray2 idx2 xclick yclick

delete(LL1);

%since this is a figure callback, the first input is the figure handle:
f=src2;
 
%like all callbacks, the second input, ev, isn't used. 
 
%determine which object is below the cursor:
obj=hittest(f); %<-- the important line in this demo

% if pointCoordinatesSelected == 0
    if obj==L2 %if over the plot...
        %get cursor coordinates in its axes:
        a=get(L2,'parent');
        point=get(a,'currentpoint');
        xclick=point(1,1,1);
        yclick=point(1,2,1);

        %determine which point we're over:
        idx2=findclosestpoint2D(xclick,yclick,L2);
%         idx3=findclosestpoint2D(xclick,yclick,L2);

        if length(idx2) > length(wingPointsArray2)
            idx2(end) = [];
        end
            delete(findobj(LL2));
            % For line 2
    %         LL2=line(animals2{idx,2},animals2{idx,1},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
            LL2=line(wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
            set(LL2, 'ButtonDownFcn', {@selectedPoint2, LL2})
    end
    
function hover3(src3,~,L3)
global LL3 wingPointsArray3 idx3 xclick yclick

% delete(LL3);

%since this is a figure callback, the first input is the figure handle:
f=src3;

%like all callbacks, the second input, ev, isn't used. 
 
%determine which object is below the cursor:
obj=hittest(f); %<-- the important line in this demo

% if pointCoordinatesSelected == 0
    if obj==L3 %if over the plot...
        %get cursor coordinates in its axes:
        a=get(L3,'parent');
        point=get(a,'currentpoint');
        xclick=point(1,1,1);
        yclick=point(1,2,1);

        %determine which point we're over:
        idx3=findclosestpoint2D(xclick,yclick,L3);

        if length(idx3) > length(wingPointsArray3)
            idx3(end) = [];
        end
            delete(findobj(LL3));
            LL3=line(wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none');
            set(LL3, 'ButtonDownFcn', {@selectedPoint3, LL3})
    end

%% Callback to each point--------------------------------------------------
function selectedPoint1(~,~,~)
global LL1 LEP1 wingPointsArray1 idx1 lineSelectedOff storageArrayP1 LEP2 LEP3...
    LEP4 LEP5 LEP6 LEP7 LEP8 LEP9 LEP10 H1 tempStorageArrayX1 deletePointGo leftButton...
    rightButton upButton downButton deleteSecondPoint saveButton

delete(LL1);
delete(LEP1);
delete(H1);
deletePointGo = 0;
lineSelectedOff = 1;

if isempty(storageArrayP1) ~= 1
    % Check previous values of xLocation and yLocation
    storageArrayP1(end+1) = length(storageArrayP1)+1;
    % Don't need to delete repetitive points
    deleteSecondPoint = 0;
else
    % If no previous values xLocation and yLocation
    storageArrayP1(1) = 1;
end

if storageArrayP1(end) > (length(tempStorageArrayX1)+1)
    % Erase old values for same point
    storageArrayP1(end) = [];  
     % Do need to delete repetitive points
    deleteSecondPoint = 1;
end

% Plot leading edge point
selectedLEPoint;

% Enable X-Y Coordinate Pushbuttons
leftButton.Enable  = 'on';
rightButton.Enable = 'on';
upButton.Enable    = 'on';
downButton.Enable  = 'on';
saveButton.Enable  = 'on';

% Open Point Coordinate Panel
pointCoordinatesMod;

function selectedPoint2(~,~,~)
global LL2 wingPointsArray2 idx2 LP2 pointCoordinatesSelected enablePointCoords...
    storageArrayP2 tempStorageArrayX2 deleteSecondPoint leftButton rightButton...
    upButton downButton H2 saveButton deletePointGo lineSelectedOff TEP1

delete(LL2);
delete(TEP1);
delete(H2);
deletePointGo = 0;
lineSelectedOff = 1;

if isempty(storageArrayP2) ~= 1
    % Check previous values of xLocation and yLocation
    storageArrayP2(end+1) = length(storageArrayP2)+1;
    % Don't need to delete repetitive points
    deleteSecondPoint = 0;
else
    % If no previous values xLocation and yLocation
    storageArrayP2(1) = 1;
end

if storageArrayP2(end) > (length(tempStorageArrayX2)+1)
    % Erase old values for same point
    storageArrayP2(end) = [];  
     % Do need to delete repetitive points
    deleteSecondPoint = 1;
end

% Plot trailing edge point
selectedTEPoint

% Enable X-Y Coordinate Pushbuttons
leftButton.Enable  = 'on';
rightButton.Enable = 'on';
upButton.Enable    = 'on';
downButton.Enable  = 'on';
saveButton.Enable  = 'on';

function selectedPoint3(~,~,~)
global LL3 storageArrayP3 tempStorageArrayX3 deleteSecondPoint leftButton rightButton...
    upButton downButton saveButton deletePointGo lineSelectedOff H3 USP1...
    wingDimensionsModPanel polyGam polyhedralOn

delete(LL3);
delete(USP1);
delete(H3);
deletePointGo = 0;
lineSelectedOff = 1;

if isempty(storageArrayP3) ~= 1
    % Check previous values of xLocation and yLocation
    storageArrayP3(end+1) = length(storageArrayP3)+1;
    % Don't need to delete repetitive points
    deleteSecondPoint = 0;
else
    % If no previous values xLocation and yLocation
    storageArrayP3(1) = 1;
end

if storageArrayP3(end) > (length(tempStorageArrayX3)+1)
    % Erase old values for same point
    storageArrayP3(end) = [];  
     % Do need to delete repetitive points
    deleteSecondPoint = 1;
end

% Plot upper surface wing point
selectedUSPoint;

% Enable Dihedral box
% Wing Dihedral
uicontrol('Parent',wingDimensionsModPanel','Style','text','String','Polyhdedral','Position',[120 45 80 20],'Fontsize',9);
% Units
uicontrol('Parent',wingDimensionsModPanel','Style','text','String','deg','Position',[180 15 35 25]);
polyhedralOn = 1;
% Wing Dihedral
% uicontrol('Parent',wingDimensionsModPanel','Style','edit','Enable','Off','String',polyGam,'Position',[135 20 45 25],'Callback',@txtbox_dihedral_Callback);

% Enable X-Y Coordinate Pushbuttons
leftButton.Enable  = 'on';
rightButton.Enable = 'on';
upButton.Enable    = 'on';
downButton.Enable  = 'on';
saveButton.Enable  = 'on';

function selectedLEPoint
global LEP1 wingPointsArray1 idx1 storageArrayP1 LEP2 LEP3 LEP4 LEP5 LEP6...
    LEP7 LEP8 LEP9 LEP10 deleteSecondPoint

if deleteSecondPoint == 1
    delete(LEP1);
end

if storageArrayP1(end) == 1
    LEP1 = line(wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'linestyle','none','Visible','off');
    LEP1.Visible = 'on';
    LEP1.MarkerEdgeColor = 'green';
    set(LEP1, 'ButtonDownFcn', {@currentPoint1, LEP1});
    
elseif storageArrayP1(end) == 2
    if deleteSecondPoint == 1
        delete(LEP2);
    end
    LEP2 = line(wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    LEP2.Visible = 'on';
    LEP2.MarkerEdgeColor = 'green';
    set(LEP2, 'ButtonDownFcn', {@currentPoint2, LEP2});
    
elseif storageArrayP1(end) == 3
    if deleteSecondPoint == 1
        delete(LEP3);
    end
    LEP3 = line(wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    LEP3.Visible = 'on';
    LEP3.MarkerEdgeColor = 'green';
    set(LEP3, 'ButtonDownFcn', {@currentPoint3, LEP3});
    
elseif storageArrayP1(end) == 4
    if deleteSecondPoint == 1
        delete(LEP4);
    end
    LEP4 = line(wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    LEP4.Visible = 'on';
    LEP4.MarkerEdgeColor = 'green';
    set(LEP4, 'ButtonDownFcn', {@currentPoint4, LEP4});
    
elseif storageArrayP1(end) == 5
    if deleteSecondPoint == 1
        delete(LEP5);
    end
    LEP5 = line(wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    LEP5.Visible = 'on';
    LEP5.MarkerEdgeColor = 'green';
    set(LEP5, 'ButtonDownFcn', {@currentPoint5, LEP5});
    
elseif storageArrayP1(end) == 6
    if deleteSecondPoint == 1
        delete(LEP6);
    end
    LEP6 = line(wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    LEP6.Visible = 'on';
    LEP6.MarkerEdgeColor = 'green';
    set(LEP6, 'ButtonDownFcn', {@currentPoint6, LEP6});
    
elseif storageArrayP1(end) == 7
    if deleteSecondPoint == 1
        delete(LEP7);
    end
    LEP7 = line(wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    LEP7.Visible = 'on';
    LEP7.MarkerEdgeColor = 'green';
    set(LEP7, 'ButtonDownFcn', {@currentPoint7, LEP7});
    
elseif storageArrayP1(end) == 8
    if deleteSecondPoint == 1
        delete(LEP8);
    end
    LEP8 = line(wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    LEP8.Visible = 'on';
    LEP8.MarkerEdgeColor = 'green';
    set(LEP8, 'ButtonDownFcn', {@currentPoint8, LEP8});
    
elseif storageArrayP1(end) == 9
    if deleteSecondPoint == 1
        delete(LEP9);
    end
    LEP9 = line(wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    LEP9.Visible = 'on';
    LEP9.MarkerEdgeColor = 'green';
    set(LEP9, 'ButtonDownFcn', {@currentPoint9, LEP9});
    
elseif storageArrayP1(end) == 10
    if deleteSecondPoint == 1
        delete(LEP10);
    end
    LEP10 = line(wingPointsArray1{idx1,1},wingPointsArray1{idx1,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    LEP10.Visible = 'on';
    LEP10.MarkerEdgeColor = 'green';
    set(LEP10, 'ButtonDownFcn', {@currentPoint10, LEP10});
end

function selectedTEPoint
global  TEP1 wingPointsArray2 idx2  storageArrayP2 TEP2 TEP3 TEP4 TEP5 TEP6...
    TEP7 TEP8 TEP9 TEP10 deleteSecondPoint

if deleteSecondPoint == 1
    delete(TEP1);
end

if storageArrayP2(end) == 1
    TEP1 = line(wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'linestyle','none','Visible','off');
    TEP1.Visible = 'on';
    TEP1.MarkerEdgeColor = 'green';
    set(TEP1, 'ButtonDownFcn', {@currentPoint1, TEP1});
    
elseif storageArrayP2(end) == 2
    if deleteSecondPoint == 1
        delete(TEP2);
    end
    TEP2 = line(wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    TEP2.Visible = 'on';
    TEP2.MarkerEdgeColor = 'green';
    set(TEP2, 'ButtonDownFcn', {@currentPoint2, TEP2});
    
elseif storageArrayP2(end) == 3
    if deleteSecondPoint == 1
        delete(TEP3);
    end
    TEP3 = line(wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    TEP3.Visible = 'on';
    TEP3.MarkerEdgeColor = 'green';
    set(TEP3, 'ButtonDownFcn', {@currentPoint3, TEP3});
    
elseif storageArrayP2(end) == 4
    if deleteSecondPoint == 1
        delete(TEP4);
    end
    TEP4 = line(wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    TEP4.Visible = 'on';
    TEP4.MarkerEdgeColor = 'green';
    set(TEP4, 'ButtonDownFcn', {@currentPoint4, TEP4});
    
elseif storageArrayP2(end) == 5
    if deleteSecondPoint == 1
        delete(TEP5);
    end
    TEP5 = line(wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    TEP5.Visible = 'on';
    TEP5.MarkerEdgeColor = 'green';
    set(TEP5, 'ButtonDownFcn', {@currentPoint5, TEP5});
    
elseif storageArrayP2(end) == 6
    if deleteSecondPoint == 1
        delete(TEP6);
    end
    TEP6 = line(wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    TEP6.Visible = 'on';
    TEP6.MarkerEdgeColor = 'green';
    set(TEP6, 'ButtonDownFcn', {@currentPoint6, TEP6});
    
elseif storageArrayP2(end) == 7
    if deleteSecondPoint == 1
        delete(TEP7);
    end
    TEP7 = line(wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    TEP7.Visible = 'on';
    TEP7.MarkerEdgeColor = 'green';
    set(TEP7, 'ButtonDownFcn', {@currentPoint7, TEP7});
    
elseif storageArrayP2(end) == 8
    if deleteSecondPoint == 1
        delete(TEP8);
    end
    TEP8 = line(wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    TEP8.Visible = 'on';
    TEP8.MarkerEdgeColor = 'green';
    set(TEP8, 'ButtonDownFcn', {@currentPoint8, TEP8});
    
elseif storageArrayP2(end) == 9
    if deleteSecondPoint == 1
        delete(TEP9);
    end
    TEP9 = line(wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    TEP9.Visible = 'on';
    TEP9.MarkerEdgeColor = 'green';
    set(TEP9, 'ButtonDownFcn', {@currentPoint9, TEP9});
    
elseif storageArrayP2(end) == 10
    if deleteSecondPoint == 1
        delete(TEP10);
    end
    TEP10 = line(wingPointsArray2{idx2,1},wingPointsArray2{idx2,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    TEP10.Visible = 'on';
    TEP10.MarkerEdgeColor = 'green';
    set(TEP10, 'ButtonDownFcn', {@currentPoint10, TEP10});
end

function selectedUSPoint
global  USP1 wingPointsArray3 idx3 storageArrayP3 USP2 USP3 USP4 USP5 USP6...
    USP7 USP8 USP9 USP10 deleteSecondPoint

if storageArrayP3(end) == 1
    USP1 = line(wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'linestyle','none','Visible','off');
    USP1.Visible = 'on';
    USP1.MarkerEdgeColor = 'green';
    set(USP1, 'ButtonDownFcn', {@currentPoint1, USP1});
    
elseif storageArrayP3(end) == 2
    if deleteSecondPoint == 1
        delete(USP2);
    end
    USP2 = line(wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    USP2.Visible = 'on';
    USP2.MarkerEdgeColor = 'green';
    set(USP2, 'ButtonDownFcn', {@currentPoint2, USP2});
    
elseif storageArrayP3(end) == 3
    if deleteSecondPoint == 1
        delete(USP3);
    end
    USP3 = line(wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    USP3.Visible = 'on';
    USP3.MarkerEdgeColor = 'green';
    set(USP3, 'ButtonDownFcn', {@currentPoint3, USP3});
    
elseif storageArrayP3(end) == 4
    if deleteSecondPoint == 1
        delete(USP4);
    end
    USP4 = line(wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    USP4.Visible = 'on';
    USP4.MarkerEdgeColor = 'green';
    set(USP4, 'ButtonDownFcn', {@currentPoint4, USP4});
    
elseif storageArrayP3(end) == 5
    if deleteSecondPoint == 1
        delete(USP5);
    end
    USP5 = line(wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    USP5.Visible = 'on';
    USP5.MarkerEdgeColor = 'green';
    set(USP5, 'ButtonDownFcn', {@currentPoint5, USP5});
    
elseif storageArrayP3(end) == 6
    if deleteSecondPoint == 1
        delete(USP6);
    end
    USP6 = line(wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    USP6.Visible = 'on';
    USP6.MarkerEdgeColor = 'green';
    set(USP6, 'ButtonDownFcn', {@currentPoint6, USP6});
    
elseif storageArrayP3(end) == 7
    if deleteSecondPoint == 1
        delete(USP7);
    end
    USP7 = line(wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    USP7.Visible = 'on';
    USP7.MarkerEdgeColor = 'green';
    set(USP7, 'ButtonDownFcn', {@currentPoint7, USP7});
    
elseif storageArrayP3(end) == 8
    if deleteSecondPoint == 1
        delete(USP8);
    end
    USP8 = line(wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    USP8.Visible = 'on';
    USP8.MarkerEdgeColor = 'green';
    set(USP8, 'ButtonDownFcn', {@currentPoint8, USP8});
    
elseif storageArrayP3(end) == 9
    if deleteSecondPoint == 1
        delete(USP9);
    end
    USP9 = line(wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    USP9.Visible = 'on';
    USP9.MarkerEdgeColor = 'green';
    set(USP9, 'ButtonDownFcn', {@currentPoint9, USP9});
    
elseif storageArrayP3(end) == 10
    if deleteSecondPoint == 1
        delete(USP10);
    end
    USP10 = line(wingPointsArray3{idx3,1},wingPointsArray3{idx3,2},'marker','o','markersize',10,'markerfacecolor',[.2 .3 .4],'markeredgecolor',[0 0 0],'linestyle','none','Visible','off');
    USP10.Visible = 'on';
    USP10.MarkerEdgeColor = 'green';
    set(USP10, 'ButtonDownFcn', {@currentPoint10, USP10});
end

%% Callback specifying which point is most current-------------------------
function currentPoint1(~, ~, ~)
global pointSelected
pointSelected = 1;
pointCoordinatesMod;
editBox;

function currentPoint2(~, ~, ~)
global pointSelected
pointSelected = 2;
pointCoordinatesMod;
editBox;

function currentPoint3(~, ~, ~)
global pointSelected
pointSelected = 3;
pointCoordinatesMod;
editBox;

function currentPoint4(~, ~, ~)
global pointSelected
pointSelected = 4;
pointCoordinatesMod;
editBox;

function currentPoint5(~, ~, ~)
global pointSelected
pointSelected = 5;
pointCoordinatesMod;
editBox;

function currentPoint6(~, ~, ~)
global pointSelected
pointSelected = 6;
pointCoordinatesMod;
editBox;

function currentPoint7(~, ~, ~)
global pointSelected
pointSelected = 7;
pointCoordinatesMod;
editBox;

function currentPoint8(~, ~, ~)
global pointSelected
pointSelected = 8;
pointCoordinatesMod;
editBox;

function currentPoint9(~, ~, ~)
global pointSelected
pointSelected = 9;
pointCoordinatesMod;
editBox;

function currentPoint10(~, ~, ~)
global pointSelected
pointSelected = 10;
pointCoordinatesMod;
editBox;

% Edit box specifying what type of modification is to be performed
function editBox
global editBoxSelected editPanel
% Figure
% editPanel = figure('Visible','on','Position',[500 600 130 70],...
%     'units','normalized','Toolbar','none','Menubar','none','NumberTitle','off',...
%     'Name','','Resize','off','Dockcontrols','off');

editBoxSelected = 1;

%Radiobuttons
uicontrol('Parent',editPanel,'Style','radiobutton','String','Edit','Fontsize',10,'Position',[10 40 50 25],'Callback',@radiobutton_edit_Callback,'Enable','on');
uicontrol('Parent',editPanel,'Style','radiobutton','String','Delete','Fontsize',10,'Position',[10 15 60 25],'Callback',@radiobutton_delete_Callback,'Enable','on');

% Callbacks to the edit box------------------------------------------------
function radiobutton_edit_Callback(~,~)
global editFigure pointSelected lineSelected
switch(pointSelected)
    case 1
        lineSelected = 1;
    case 2
        lineSelected = 2;
end
% delete(editFigure);
% pointCoordinates;

function radiobutton_delete_Callback(~,~)
global LP1 LP2 LP3 LP4 LP5 LP6 pointSelected editFigure
switch(pointSelected)
    case 1
        delete(LP1);
    case 2
        delete(LP2);
end
delete(editFigure);
% Calculates the position of the mouse and is used by the hover callbacks
% to displaying the moving point over the selected line

% Calculates the position of the mouse and is used by the hover callbacks
% to displaying the moving point over the selected line
function index = findclosestpoint2D(xclick,yclick,datasource)
%this function checks which point in the plotted line "datasource"
%is closest to the point specified by xclick/yclick. It's kind of 
%complicated, but this isn't really what this demo is about...
 
xdata=get(datasource,'xdata');
ydata=get(datasource,'ydata');
 
activegraph=get(datasource,'parent');
 
pos=getpixelposition(activegraph);
xlim=get(activegraph,'xlim');
ylim=get(activegraph,'ylim');
 
%make conversion factors, units to pixels:
xconvert=(xlim(2)-xlim(1))/pos(3);
yconvert=(ylim(2)-ylim(1))/pos(4);
 
Xclick=(xclick-xlim(1))/xconvert;
Yclick=(yclick-ylim(1))/yconvert;
 
Xdata=(xdata-xlim(1))/xconvert;
Ydata=(ydata-ylim(1))/yconvert;

Xdiff=(Xdata-Xclick);
Ydiff=(Ydata-Yclick);
 
distnce=sqrt(Xdiff.^2+Ydiff.^2);
 
index=distnce==min(distnce);

index=index(:); %make sure it's a column.
 
if sum(index)>1
    thispoint=find(distnce==min(distnce),1);
    index=false(size(distnce));
    index(thispoint)=true;
end