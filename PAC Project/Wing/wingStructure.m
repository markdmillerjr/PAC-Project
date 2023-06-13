function wingStructure
% Written by Mark D. Miller Jr.
% 12/27/2019

wingStructureDrawing;
% Creates a 3D model of the inner wing structure
function wingStructureDrawing
global b cr ct Gam LamLE FH airfoil_array airfoil_coords_x airfoil_coords_y...
    airfoil_size XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 ZW1 ZW2 ZW3 ZW4 XWR YWR ZWR...
    XWR2 YWR2 ZWR2 XWRT YWRT ZWRT XWRL YWRL ZWRL XWR3 YWR3 ZWR3 XWRT3 YWRT3...
    ZWRT3 WR WR2 WR3 WRT WRT3 WRL tp i_w c wingStructPanel wingStructFig
 
delete(wingStructFig);
wingStructFig = axes('Parent',wingStructPanel','Position',[0.06 0.22 .92 .6]);

% Initial Data	 
cr      =	1;	%	Wing Chord (root)	,	in
ct      =	1;	%	Wing Chord (tip)	,	in
FL      =	1;	%	Fuselage Length	,	in
FH      =	1;	%	Fuselage Height	,	in
FW      =	1;	%	Fuselage Width	,	in


   % X-Coordinates
    XW1=cr;
    XW2=XW1+(b/c)*tand(LamLE);
    XW3=XW2+ct;
    XW4=XW1+cr;

    % Z-Coordinates
    ZW1=FH/2+cr*sind(i_w);
    ZW2=FH/2+(XW4-XW2)*sind(i_w)+(b/c)*tand(Gam);
    ZW3=FH/2+(XW4-XW3)*sind(i_w)+(b/c)*tand(Gam);
    ZW4=FH/2;

    % Right Wing Root
    XWR = ((airfoil_coords_x+XW1)*c)-c;
    YWR = (airfoil_array);
    ZWR = ((airfoil_coords_y+0)*c);
    
    % Right Wing Tip
    XWR2 = ((airfoil_coords_x.*tp+XW2)*c)-c;
    YWR2 = (airfoil_array + b/2);
    ZWR2 = ((airfoil_coords_y.*tp+0)*c);
    
    
%     % Right Wing Root
    XWR5 = ((airfoil_coords_x+XW1)*c)-c;
    YWR5 = (airfoil_array + 30);
    ZWR5 = ((airfoil_coords_y)*c);
%     
%     % Right Wing Tip
%     XWR2 = ((airfoil_coords_x.*tp+XW2)*c)-c;
%     YWR2 = (airfoil_array + b/2);
%     ZWR2 = ((airfoil_coords_y.*tp+ZW3)*c)-c;
    
%     %     Left Wing Root   
%     XWRL = ((airfoil_coords_x+XW1)*c)-c;
%     YWRL = (-airfoil_array);
%     ZWRL = ((airfoil_coords_y+ZW1)*c)-c;
% 
%     % Left Wing Tip
%     XWR3 = ((airfoil_coords_x.*tp+XW2)*c)-c;
%     YWR3 = (-(airfoil_array + b/2));
%     ZWR3 = ((airfoil_coords_y.*tp+ZW3)*c)-c;

        importfile3;
        hold off
        WR  = fill3(XWR,YWR,ZWR,[.9 .9 .9]);
        alpha(WR,.5);
        hold on
        WR2 = fill3(XWR2,YWR2,ZWR2,[.9 .9 .9]);
        alpha(WR2,.5);

        
        for rib = 1:5
            XWR5 = ((airfoil_coords_x+XW1)*c)-c;
            YWR5 = (airfoil_array + rib*12);
            ZWR5 = ((airfoil_coords_y)*c);
            hold on
            WR5 = fill3(XWR5,YWR5,ZWR5,[.9 .9 .9]);
            alpha(WR5,.5); 
        end
        
%         for rib = 1:5
%             XWR5 = ((airfoil_coords_x+XW1)*c)-c;
%             YWR5 = (airfoil_array + rib*12);
%             ZWR5 = ((airfoil_coords_y)*c);
%             hold on
%             WR5 = fill3(XWR5,YWR5,ZWR5,[.9 .9 .9]);
%             alpha(WR5,.5); 
%         end
        
        
        
        
        
        
%         hold on
%         WRL = fill3(XWRL,YWRL,ZWRL,[.5 .5 .5]);
%         hold on
%         WR3  = fill3(XWR3,YWR3,ZWR3,[.5 .5 .5]);
        
% Right Wing
%         for t = 1:airfoil_size(1)+1
%             if t <= airfoil_size(1)-1
%                 XWRT = [(((0+XW1)*c)-c),(((0.*tp+XW2)*c)-c),(((1.*tp+XW2)*c)-c)*.125,(((1+XW1)*c)-c)*.125];
%                 YWRT = [(0),(0 + b/2),(0 + b/2),(0)];
%                 ZWRT = [0,0,0,0];
%                 WRT  = fill3(XWRT,YWRT,ZWRT,[.7 .7 .7]);
%             end
%         end
% Airfoil coordinate for leading edge spar
    middleCoordinate = ceil(airfoil_size(1)/2);
    sparCoordinateBegY = middleCoordinate - 3;
    sparCoordinateEndY = middleCoordinate + 2;
            
% Leading Edge
hold on
%         for t = 15:20
        for t = sparCoordinateBegY:sparCoordinateEndY
            if t <= airfoil_size(1)-1
                XWRT = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
                YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
                ZWRT = [((airfoil_coords_y(t)+0)*c)-0,((airfoil_coords_y(t).*tp+0)*c)-0,((airfoil_coords_y(t+1).*tp+0)*c)-0,((airfoil_coords_y(t+1)+0)*c)-0];
                WRT  = fill3(XWRT,YWRT,ZWRT,[.9 .9 .9]);
                alpha(WRT,.25);
            end
        end
%          end
hold on
% Vertical Leading Edge Spar
        for t = 1:sparCoordinateEndY
%             if t <= airfoil_size(1)-1
                XWRT = [1,1,1,1];
                YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
                ZWRT = [((airfoil_coords_y(sparCoordinateEndY)+0)*c)-0,((airfoil_coords_y(sparCoordinateEndY).*tp+0)*c)-0,((airfoil_coords_y(sparCoordinateBegY).*tp+0)*c)-0,((airfoil_coords_y(sparCoordinateBegY)+0)*c)-0];
%                 ZWRT = [1.5,1.5,-.5,-.5];
                WRT  = fill3(XWRT,YWRT,ZWRT,[.9 .9 .9]);
                alpha(WRT,.25);
%             end
        end
% hold on
% Upper Trailing Edge
%         for t = 1:2
%             if t <= airfoil_size(1)-1
%                 XWRT = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
%                 YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
%                 ZWRT = [((airfoil_coords_y(t)+0)*c)-0,((airfoil_coords_y(t).*tp+0)*c)-0,((airfoil_coords_y(t+1).*tp+0)*c)-0,((airfoil_coords_y(t+1)+0)*c)-0];
%                 WRT  = fill3(XWRT,YWRT,ZWRT,[.9 .9 .9]);
%                 alpha(WR2,.25);
%             end
%         end
% hold on
% Lower Trailing Edge
%         for t = 33:35
%             if t <= airfoil_size(1)-1
%                 XWRT = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
%                 YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
%                 ZWRT = [((airfoil_coords_y(t)+0)*c)-0,((airfoil_coords_y(t).*tp+0)*c)-0,((airfoil_coords_y(t+1).*tp+0)*c)-0,((airfoil_coords_y(t+1)+0)*c)-0];
%                 WRT  = fill3(XWRT,YWRT,ZWRT,[.9 .9 .9]);
%                 alpha(WR2,.25);
%             end
%         end
% hold on
% Vertical Trailing Edge Spar
%         for t = 33:35
%             if t <= airfoil_size(1)-1
%                 XWRT = [18,18,18,18];
%                 YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
%                 ZWRT = [((airfoil_coords_y(33)+0)*c)-0,((airfoil_coords_y(33).*tp+0)*c)-0,((airfoil_coords_y(3).*tp+0)*c)-0,((airfoil_coords_y(3)+0)*c)-0];
%                 WRT  = fill3(XWRT,YWRT,ZWRT,[.9 .9 .9]);
%                 alpha(WR2,.25);
%             end
%         end
        
%         for t = 1:airfoil_size(1)+1
%             if t <= airfoil_size(1)-1
%                 XWRT = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
%                 YWRT = [(airfoil_array(1)),(airfoil_array(1) + b/2),(airfoil_array(1) + b/2),(airfoil_array(1))];
%                 ZWRT = [((airfoil_coords_y(t)+ZW1)*c)-c,((airfoil_coords_y(t).*tp+ZW2)*c)-c,((airfoil_coords_y(t+1).*tp+ZW3)*c)-c,((airfoil_coords_y(t+1)+ZW4)*c)-c];
%                 WRT  = fill3(XWRT,YWRT,ZWRT,[1 1 1]);
%             end
%         end
        
        
% Left Wing
% hold on
%      for t = 1:airfoil_size(1)+1
%             if t <= airfoil_size(1)-1
%                 XWRT3 = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
%                 YWRT3 = [(airfoil_array(1)),(-(airfoil_array(1) + b/2)),(-(airfoil_array(1) + b/2)),(airfoil_array(1))];
%                 ZWRT3 = [((airfoil_coords_y(t)+ZW1)*c)-c,((airfoil_coords_y(t).*tp+ZW2)*c)-c,((airfoil_coords_y(t+1).*tp+ZW3)*c)-c,((airfoil_coords_y(t+1)+ZW4)*c)-c];
%                 WRT3  = fill3(XWRT3,YWRT3,ZWRT3,[1 1 1]);
%             end
%      end  