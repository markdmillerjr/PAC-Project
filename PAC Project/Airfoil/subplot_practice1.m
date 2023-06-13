

% title('Second Subplot')
% view(3);
% 
% function my_slider()
% hfig = figure();
% guidata(hfig,struct('val',0,'diffMax',1));
% slider = uicontrol('Parent', hfig,'Style','slider',...
%          'Units','normalized',...
%          'Position',[0.3 0.5 0.4 0.1],...
%          'Tag','slider1',...
%          'Callback',@slider_callback);
%      
% button = uicontrol('Parent', hfig,'Style','pushbutton',...
%          'Units','normalized',...
%          'Position',[0.4 0.3 0.2 0.1],...
%          'String','Display Values',...
%          'Callback',@button_callback);
% end
% 
% function slider_callback(hObject,eventdata)
% 	data = guidata(hObject);
% 	data.val = hObject.Value;
% 	data.diffMax = hObject.Max - data.val;
% 	% For R2014a and earlier:
% 	% data.val = get(hObject,'Value');
% 	% maxval = get(hObject,'Max');
% 	% data.diffMax = maxval - data.val;
% 
% 	guidata(hObject,data);
% end
% 
% function button_callback(hObject,eventdata)
% 	data = guidata(hObject);
% 	display([data.val data.diffMax]);
% end

% 
% function my_slider()
% 	hfig = figure();
% 	data = struct('val',0,'diffMax',1);
% 	slider = uicontrol('Parent', hfig,'Style','slider',...
%          'Units','normalized',...
%          'Position',[0.3 0.5 0.4 0.1],...
%          'Tag','slider1',...
%          'Callback',@slider_callback);
%      
% 	button = uicontrol('Parent', hfig,'Style','pushbutton',...
%          'Units','normalized',...
%          'Position',[0.4 0.3 0.2 0.1],...
%          'String','Display Difference',...
%          'Callback',@button_callback);
% % 
% % 	function slider_callback(hObject,eventdata)
% % 		sval = hObject.Value;
% % 		diffMax = hObject.Max - sval;
% % 		% For R2014a and earlier:
% % 		% sval = get(hObject,'Value');
% % 		% maxval = get(hObject,'Max');
% % 		% diffMax = maxval - sval;
% % 
% % 		data.val = sval;
% % 		data.diffMax = diffMax;
% % 	end
% % 
% % 	function button_callback(hObject,eventdata)
% % 		display([data.val data.diffMax]);
% % 	end
% % end
% 
% function my_slider()
% hfig = figure();
% guidata(hfig,struct('val',0,'diffMax',1));
% slider = uicontrol('Parent', hfig,'Style','slider',...
%          'Units','normalized',...
%          'Position',[0.3 0.5 0.4 0.1],...
%          'Tag','slider1',...
%          'Callback',@slider_callback);
%      
% button = uicontrol('Parent', hfig,'Style','pushbutton',...
%          'Units','normalized',...
%          'Position',[0.4 0.3 0.2 0.1],...
%          'String','Display Values',...
%          'Callback',@button_callback);
% end
% 
% function slider_callback(hObject,eventdata)
% 	data = guidata(hObject);
% 	data.val = hObject.Value;
% 	data.diffMax = hObject.Max - data.val;
% 	% For R2014a and earlier:
% 	% data.val = get(hObject,'Value');
% 	% maxval = get(hObject,'Max');
% 	% data.diffMax = maxval - data.val;
% 
% 	guidata(hObject,data);
% end
% 
% 
% function button_callback(hObject,eventdata)
%     change_dialog('my_slider',handles.figure);
%     hfig2 = figure();
%     guidata(hfig2,struct('val',0,'diffmax',1));
%     data = guidata(hObject,handles);
%     subplot('Position',[0.1 0.1 0.5 0.2])
% 
% % 	display([data.val data.diffMax]);
% end
% function my_slider()
% 	hfig = figure();
% 	data = struct('val',0,'diffMax',1);
% 	slider = uicontrol('Parent', hfig,'Style','slider',...
%          'Units','normalized',...
%          'Position',[0.3 0.5 0.4 0.1],...
%          'Tag','slider1',...
%          'Callback',@slider_callback);
%      
% 	button = uicontrol('Parent', hfig,'Style','pushbutton',...
%          'Units','normalized',...
%          'Position',[0.4 0.3 0.2 0.1],...
%          'String','Display Difference',...
%          'Callback',@button_callback);
% 
% 	function slider_callback(hObject,eventdata)
% 		sval = hObject.Value;
% 		diffMax = hObject.Max - sval;
% 		% For R2014a and earlier:
% 		% sval = get(hObject,'Value');
% 		% maxval = get(hObject,'Max');
% 		% diffMax = maxval - sval;
% 
% 		data.val = sval;
% 		data.diffMax = diffMax;
% 	end
% 
% 	function button_callback(hObject,eventdata)
% 		display([data.val data.diffMax]);
% 	end
% end

% % Create figure
% % figure_handle = figure('Toolbar','none');
% figure_handle = figure('Visible','on','Position',[10,100,1050,785]);
% % create structure of handles
% myhandles = guihandles(figure_handle); 
% % Add some additional data as a new field called numberOfErrors
% % myhandles.numberOfErrors = 0; 
% % Save the structure
% guidata(figure_handle,myhandles) 
% 
% function My_Callback()
% % ...
% % Get the structure using guidata in the local function
% myhandles = guidata(gcbo);
% % Modify the value of your counter
% myhandles.numberOfErrors = myhandles.numberOfErrors + 1;
% % Save the change you made to the structure
% guidata(gcbo,myhandles) 
% end
% 
% f = figure;
% bg = uibuttongroup(f,'Title','My Button Group',...
%             'Position',[.1 .2 .8 .6]);
%         rb1 = uicontrol(bg,'Style','radiobutton','String','Red',...
%                 'Units','normalized',...
%                 'Position',[.1 .6 .3 .2]);
% rb2 = uicontrol(bg,'Style','radiobutton','String','Blue',...
%                 'Units','normalized',...
%                 'Position',[.1 .2 .3 .2]);

% str = input('Give an equation in x: ','s')  ;
%    % the user types in, for instance 2*x^2-3*x+4
% x = input('Type in a value of x: ') ; 
% yy = input('Type in a value of y: ');
% zz = input('Type in a value of z: ');
%    % the user types in, for instance, 2
% f = inline(str,'x','y','z') ;
% y = feval(f,x,yy,zz) ;
% disp(['"' str '", for x = ' num2str(x) ', equals ' num2str(y)]) ;
%       b_increment = 0;
%                     input = 1;
% %                     input_num = str2num(get(hObject,'String'));
%   while b_increment ~= input
%                      if input == 1
% %                          popupmenue_chordValue = uicontrol('Style','popupmenu','String','1','Position',[127 650 30 25],'Callback',@popupmenu_chordValue);
%                          b_increment = 1;
%                      else input > 1
%                          b_increment = 1;
%                          b_increment_string = '1';
% %                          popupmenue_chordValue = uicontrol('Style','popupmenu','String','b_increment_string','Position',[127 650 30 25],'Callback',@popupmenu_chordValue);
%                          b_increment = 1+b_increment;
%                      end
%                     end

% function demo_mbd
% % Allow a line to have its own 'ButtonDownFcn' callback
% hLine = plot(rand(1,10),'ButtonDownFcn','disp(''This executes'')');
% hLine.Tag = 'DoNotIgnore';
% h = rotate3d;
% h.ButtonDownFilter = @mycallback;
% h.Enable = 'on';
% % mouse-click on the line
% function [flag] = mycallback(obj,event_obj)
% % If the tag of the object is 'DoNotIgnore', then return true
% objTag = obj.Tag;
% if strcmpi(objTag,'DoNotIgnore')
%    flag = true;
% else
%    flag = false;
% end

% function demo_mbd2
% % Listen to rotate events
% surf(peaks);
% h = rotate3d;
% h.ActionPreCallback = @myprecallback;
% h.ActionPostCallback = @mypostcallback;
% h.Enable = 'on';
% 
% function myprecallback(obj,evd)
% disp('A rotation is about to occur.');
% 
% function mypostcallback(obj,evd)
% newView = round(evd.Axes.View);
% msgbox(sprintf('The new view is [%d %d].',newView));

% function slidervalue
% % Create UI figure window and components
% 
% fig = uifigure('Position',[100 100 350 275]);
% 
% cg = uigauge(fig,'Position',[100 100 120 120]);
% 
% sld = uislider(fig,...
%     'Position',[100 75 120 3],...
%     'ValueChangedFcn',@(sld,event) updateGauge(sld,cg));
% 
% end
% 
% % Create ValueChangedFcn callback
% function updateGauge(sld,cg)
% cg.Value = sld.Value;
% end

% function sliderchanging
% % Create UI figure window and components
% 
% fig = uifigure('Position',[100 100 350 275]);
% 
% cg = uigauge(fig,'Position',[100 100 120 120]);
% 
% sld = uislider(fig,...
%                'Position',[100 75 120 3],...
%                'ValueChangingFcn',@(sld,event) sliderMoving(event,cg));
% 
% end
% 
% % Create ValueChangingFcn callback
% function sliderMoving(event,cg)
% cg.Value = event.Value;
% end


%     % Single bar
%     progressbar % Init single bar
%     i = .001;
%     while i < 1.1
%       pause(0.01) % Do something important
%       progressbar(i) % Update progress bar
%       i = i+.01;
%     end

%     % Simple multi bar (update one bar at a time)
%     m = 4;
%     n = 3;
%     p = 100;
%     progressbar(0,0,0) % Init 3 bars
%     for i = 1:m
%         progressbar([],0) % Reset 2nd bar
%         for j = 1:n
%             progressbar([],[],0) % Reset 3rd bar
%             for k = 1:p
%                 pause(0.01) % Do something important
%                 progressbar([],[],k/p) % Update 3rd bar
%             end
%             progressbar([],j/n) % Update 2nd bar
%         end
%         progressbar(i/m) % Update 1st bar
%     end

%     % Fancy multi bar (use labels and update all bars at once)
%     m = 4;
%     n = 3;
%     p = 100;
%     progressbar('Monte Carlo Trials','Simulation','Component') % Init 3 bars
%     for i = 1:m
%         for j = 1:n
%             for k = 1:p
%                 pause(0.01) % Do something important
%                 % Update all bars
%                 frac3 = k/p;
%                 frac2 = ((j-1) + frac3) / n;
%                 frac1 = ((i-1) + frac2) / m;
%                 progressbar(frac1, frac2, frac3)
%             end
%         end
%     end


% Timer
% t = timer;
% start(t)
% length(t)
% stop(t)

% function mytimer()
%     t = timer;
% 
%     t.Period         = 1;
%     t.ExecutionMode  = 'fixedRate';
%     t.TimerFcn       = @mytimer_cb;
%     t.ErrorFcn       = @myerror;
%     t.BusyMode       = 'error';
%     t.TasksToExecute = 5;
%     t.UserData       = tic;
% 
%     start(t)
% end
% 
% 
% function mytimer_cb(h,~)
%     timeStart = toc(h.UserData)
%     pause(1.6);
%     timeEnd = toc(h.UserData)
% end
% 
% function myerror(h,~)
%     disp('Reached the error function')
% end

%         h = waitbar(0,'Please wait...');
%         for i=1:1000,
%             % computation here %
%             waitbar(i/1000,h)
%         end
% 
% 
% h = waitbar(0,'Please wait...');
% s = clock;
% for i = 1:50
%      %%% begin something process
%      pause(0.3)
%      %%% end process
%      %%% begin estimate remaining time
%      if i ==1
%       is = etime(clock,s);
%       esttime = is * 50;
%      end
%      h = waitbar(i/50,h,...
%          ['remaining time =',num2str(esttime-etime(clock,s),'%4.1f'),'sec' ]);
%      %%% end estimate remaining time
% end
% close(gcf)


%   
%   XW1 = 1;
%   b1 = 3;
%   b2 = 1;
%   n  = 4;
%   LamLE = 5;
%   polySweep = 3;
%   XW2 = XW1+(b1/2)*tand(LamLE);
% %   XW3 = XW1 + (b2/2)*tand(polySweep);
% 
%   XW = fzero(@objfun,1,[],XW1,n,b2,polySweep,XW2);   
%   function c = objfun(XW,c,n,b2,polySweep,XW2)
%     for N = 1:n
%       c = XW+(b2/2)*tand(polySweep);
%     end
%       c = c - XW2;
%   end


% function subplot_practice1
% spanwiseStation()
% global XW
% 
% 
% q = XW+1
%   
%   
  
%   M = magic(3);
%   dlmwrite('myFile.txt',M)
%   type('myFile.txt')
%   

% wingColor     = .5*[1 1 1];
% fusColor      = .5*[1 1 1];
% tailWingColor = .5*[1 1 1];
% finColor      = .5*[1 1 1];
% propColor     = .5*[1 1 1];
% edgeColor     = 'k';
% linestyle     = '-'; 
% scale         = 1; 
% zscale        = 1; 
% setroll       = false; 
% setpitch      = false; 
% setyaw        = false;
% fusRadius     = 5;
% fusLength     = 5;
% wingspan      = 40;
% wingWidth     = 5;
% tailLength    = 50;
% x             = 0;
% y             = 0;
% z             = 0; 
% 
% % Wings: 
% xw1 = -linspace(-wingspan/2,wingspan/2,10); 
% yw1 = 1.4*wingWidth + abs(xw1)/100; 
% yw2 = zeros(size(xw1))+1.4*wingWidth + wingWidth/3; 
% yw3 = yw1 + wingWidth-abs(xw1)/20; 
% zw1 = .85*fusRadius*ones(size(xw1)); 
% h(4) = surface(x+[.99*xw1;xw1;.97*xw1],y-[yw1;yw2;yw3],...
%     z+[zw1;zw1+.15*fusRadius;zw1]*zscale,'facecolor',wingColor,...
%     'linestyle',linestyle,'edgecolor',edgeColor);
% h(5) = surface(x+[.99*xw1;xw1;.97*xw1],y-[yw1;yw2;yw3],...
%     z+[zw1;zw1;zw1]*zscale,'facecolor',wingColor,...
%     'linestyle',linestyle,'edgecolor',edgeColor);
% axis equal
% Fuselage: 
% [xcf,zcf,ycf] = cylinder(fusRadius); 
% h(1) = surface(xcf+x,y-ycf*fusLength,z+zcf*zscale,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);
% axis equal
% 
% % % Nose: 
% L=10; 
% nL = 5;
% in = 1;
% iArray = (L:-in:nL)   
% [xcn,zcn,ycn] = cylinder(fusRadius.*(iArray.*.1).*(cos(linspace(0,pi/2,length(iArray))).^.2)); 
% zcn(6:end,:) = zcn(6:end,:)-fusRadius; 
% ycn = -ycn.*.7*wingWidth; 
% h(2) = surface(x+xcn,y-ycn*nL,z+zcn*zscale,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);

% % Fuselage: 
% [xcf,zcf,ycf] = cylinder(fusRadius); 
% h(1) = surface(xcf+x,y-ycf*fusLength,z+zcf*zscale,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);
% 
% % Nose: 
% [xcn,zcn,ycn] = cylinder(fusRadius.*([1 .95 .9 .8 .7 .6 .5 .4 .3]).*(cos(linspace(0,pi/2,9)).^.2)); 
% % zcn(6:end,:) = zcn(6:end,:)-fusRadius/100; 
% % ycn = -ycn.*.7*wingWidth; 
% % h(2) = surface(x+xcn,y-ycn,z+zcn*zscale,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);
% 
% % Tail
% x1 = xcf(1,:); 
% x2 = .8*x1;% zeros(size(x1)); 
% y1 = fusLength*ones(size(x1)); 
% y2 = y1+tailLength; 
% z1 = zcf(1,:); 
% z2 = fusRadius*ones(size(z1)); 
% h(3) = surface(x+[x1;x2],y-[y1;y2],z+[z1;z2]*zscale,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);
% axis equal

% xlabel('X (in)')
% ylabel('Y (in)')
% zlabel('Z (in)')
%     view([140 30]); 
%     axis tight equal
%     lighting gouraud
%     camlight
% f = figure;
% tabgp = uitabgroup(f,'Position',[.05 .05 .3 .8]);
% tab1 = uitab(tabgp,'Title','Type of Signal');
% tab2 = uitab(tabgp,'Title','Plot Options');
% 
%         statictxt_cla   = uicontrol('Parent',tab1,'Style','text','String','Hello','Position',[10 40 40 25],'FontSize',9);
%         statictxt_al0   = uicontrol('Parent',tab2,'Style','text','String','World','Position',[10 40 40 25],'FontSize',9);
% % 
% value = input('Enter Crap: ');
% 
% switch (value)
%     case {1,2,3,4}
%         disp('Crap');
%     case {2,5,7,8}
%         disp('Holy Crap');
%     otherwise 
%         disp('No crap');
% % end
% 
% global airfoilFile NACA VarName2
% 
% b = 3;
% c = 1;
% ss = 1.5;
% ct = 1;
% cr = 1;
% LamLE = 0;
% polySweep = 1;
% i_w = 0;
% Gam = 0;
% polyGam = 0;
% tp = .5;
% ptp = 1;
% FH = 1;
% iw = 0;
% in = 1;
% 
% incrementArray = [0,1,2,3,4];
% polySweepArray = [0,5,10,15,20];
% polyGamArray = [0,5,10,15,20];
% ptpArray = [1,1,1,1,1];
% 
%     % X-Coordinates
%     XW1=c;
%     XW2=XW1+(incrementArray(in+1)/2)*tand(polySweepArray(in));
%     XW3=XW2+ct;
%     XW4=XW1+cr;
%     
%     % X-Coordinates
%     XW1=c;
%     XW21=c+(incrementArray(in+1)/2)*tand(polySweepArray(in));
%     XW3=XW2+ct;
%     XW4=XW1+cr;
%     XWS=XW21+(incrementArray(in+1)/2)*tand(polySweepArray(in+1));
% 
%     % Y-Coordinates
%     YW1=0;
%     YW2=incrementArray(in+1)/2;
%     YW3=incrementArray(in+1)/2;
%     YW4=0;
%   
%     % Z-Coordinates
%     ZW1=FH/2+cr*sind(i_w);
%     ZW2=FH/2+(XW4-XW2)*sind(i_w)+(incrementArray(in+1)/2)*tand(polyGamArray(in));
%     ZW3=FH/2+(XW4-XW3)*sind(i_w)+(incrementArray(in+1)/2)*tand(polyGamArray(in));
%     ZWS3=FH/2+(XW4-XW3)*sind(i_w)+(incrementArray(in+1)/2)*tand(polyGamArray(in+1));
%     ZW4=FH/2;
%     
%     airfoilFile = 'naca2412.dat';
%     fileOpen = fopen(airfoilFile);
% 
%     importfile3;
%     airfoil_coords_x = NACA;
%     airfoil_coords_y = VarName2;
%     airfoil_size = size(airfoil_coords_x);
%     airfoil_array = zeros(airfoil_size);
%     
%         importfile3;        
%         hold on
%         
%         %% First Segment
% for in = 1:4
%              % Right Wing Tip
%     
%     XWSa=(incrementArray(1,[1:end])/2).*tand(polySweepArray(1,[1:end]));
%     ZWSa=FH/2+(XW4-XW3).*sind(0)+(incrementArray(1,[1:end])/2).*tand(polyGamArray(1,[1:end]));
% 
%     XWRS2 = [airfoil_coords_x.*ptpArray(in)+XWSa(in)];
%     YWR2 = [airfoil_array + incrementArray(in)];
%     ZWRS2 = [airfoil_coords_y.*ptpArray(in)+ZWSa(in)];
% 
%     XWRS3 = [airfoil_coords_x.*ptpArray(in)+XWSa(in)];
%     YWR3 = [-(airfoil_array + incrementArray(in))];
%     ZWRS3 = [(airfoil_coords_y.*ptpArray(in)+ZWSa(in))];
% 
%     WR2 = fill3(XWRS2,YWR2,ZWRS2,[.5 .5 .5]);
%     WR3  = fill3(XWRS3,YWR3,ZWRS3,[.5 .5 .5]);
%             
%  %% Second segment           
%            for t = 1:airfoil_size(1)
%                 if t <= airfoil_size(1)-1
%                     XWRT = [(airfoil_coords_x(t)*ptpArray(in)+XWSa(in)),(airfoil_coords_x(t)*ptpArray(in+1)+XWSa(in+1)),(airfoil_coords_x(t+1)*ptpArray(in+1)+XWSa(in+1)),(airfoil_coords_x(t+1)*ptpArray(in)+XWSa(in))];
%                     YWRT = [(airfoil_array(1)+incrementArray(in)),(airfoil_array(1)+incrementArray(in+1)),(airfoil_array(1)+incrementArray(in+1)),(airfoil_array(1)+incrementArray(in))];
%                     ZWRT = [(airfoil_coords_y(t)*ptpArray(in)+ZWSa(in)),(airfoil_coords_y(t)*ptpArray(in+1)+ZWSa(in+1)),(airfoil_coords_y(t+1)*ptpArray(in+1)+ZWSa(in+1)),(airfoil_coords_y(t+1)*ptpArray(in)+ZWSa(in))];
%                     WRT  = fill3(XWRT,YWRT,ZWRT,[0.5 0.5 0.5]);
%                     t = t + 1;
%                 end
%             end
%             hold on
%             for t = 1:airfoil_size(1)
%                     if t <= airfoil_size(1)-1
%                         XWRT3 = [(airfoil_coords_x(t)*ptpArray(in)+XWSa(in)),(airfoil_coords_x(t)*ptpArray(in+1)+XWSa(in+1)),(airfoil_coords_x(t+1)*ptpArray(in+1)+XWSa(in+1)),(airfoil_coords_x(t+1)*ptpArray(in)+XWSa(in))];
%                         YWRT3 = [-(airfoil_array(1)+incrementArray(in)),(-(airfoil_array(1)+incrementArray(in+1))),(-(airfoil_array(1)+incrementArray(in+1))),-(airfoil_array(1)+incrementArray(in))];
%                         ZWRT3 = [(airfoil_coords_y(t)*ptpArray(in)+ZWSa(in)),(airfoil_coords_y(t)*ptpArray(in+1)+ZWSa(in+1)),(airfoil_coords_y(t+1)*ptpArray(in+1)+ZWSa(in+1)),(airfoil_coords_y(t+1)*ptpArray(in)+ZWSa(in))];
%                         WRT3  = fill3(XWRT3,YWRT3,ZWRT3,[0.5 0.5 0.5]);
%                         t = t + 1;
%                     end
%             end
% 
% end
% 
%     XWRS2 = [airfoil_coords_x.*ptpArray(end)+XWSa(end)];
%     YWR2 = [airfoil_array + incrementArray(end)];
%     ZWRS2 = [airfoil_coords_y.*ptpArray(end)+ZWSa(end)];
% 
%     XWRS3 = [airfoil_coords_x.*ptpArray(end)+XWSa(end)];
%     YWR3 = [-(airfoil_array + incrementArray(end))];
%     ZWRS3 = [(airfoil_coords_y.*ptpArray(end)+ZWSa(end))];
% 
%     WR2 = fill3(XWRS2,YWR2,ZWRS2,[.5 .5 .5]);
%     WR3  = fill3(XWRS3,YWR3,ZWRS3,[.5 .5 .5]);
%     
% axis equal
% xlabel('X (in)')
% ylabel('Y (in)')
% zlabel('Z (in)')
% grid on
% view(3);
%             
% fig = uifigure;
% panel = uipanel(fig);
% bg = uibuttongroup(panel,...
%                   'Title','Language Options',...
%                   'Position', [50 50 123 106]);
%               
% % Create three radio buttons in the button group.
% r1 = uiradiobutton(bg,...
%                   'Text','English',...
%                   'Position',[10 60 70 15]);
%               
% r2 = uiradiobutton(bg,...
%                   'Text','French',...
%                   'Position',[10 38 70 15]);
% 
% r3 = uiradiobutton(bg,...
%                   'Text','German',...
%                   'Position',[10 15 70 15]);
% 
%               function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% % hObject    handle to the selected object in uibuttongroup1 
% % eventdata  structure with the following fields
% %	EventName: string 'SelectionChanged' (read only)
% %	OldValue: handle of the previously selected object or empty
% %	NewValue: handle of the currently selected object
% % handles    structure with handles and user data (see GUIDATA)
% switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
%     case 'radiobutton1'
%         display('Radio button 1');
%     case 'radiobutton2'
%         display('Radio button 2');
%     case 'togglebutton1'
%         display('Toggle button 1');
%     case 'togglebutton2'
%         display('Toggle button 2');
% end
%               end
% 
% function myfunc
% fig = uifigure;
% bg = uibuttongroup(fig,...
%                   'Title','Options',...
%                   'Position', [100 100 123 106],...
%                   'SelectionChangedFcn',@(bg,event) bselection(bg,event));
% 
%               
% % Create three radio buttons in the button group.
% r1 = uiradiobutton(bg,...
%                   'Text','Option 1',...
%                   'Position',[10 60 70 15]);
%               
% r2 = uiradiobutton(bg,...
%                   'Text','Option 2',...
%                   'Position',[10 38 70 15]);
% 
% r3 = uiradiobutton(bg,...
%                   'Text','Option 3',...
%                   'Position',[10 15 70 15]);
%               
%     function bselection(bg,event)
%        display(['Previous: ', event *.OldValue.Text]);
%        display(['Current: ', event.NewValue.Text]);
%        display('------------------');
% %     end
% end 
% 
% lambda = 1.512041288; %[muPa*s*K^(-1/2)]
% C = 120; %[K]
% T = 274.15;  %[K]
% % mu = (lambda*((T^(3/2))/(T+C)));
% T = 33.8; %[f]
% T0 = 518.7;  %[R]
% mu0 = 3.62E-7; %[lb*s/ft^2]
% mu = mu0*(T/T0)^(1.5)*((T0+198.72)/(T+198.72));

% f1 = figure;
% figure(f1);
% scatter((1:20),rand(1,20));

% wingColor     = .5*[1 1 1];
% fusColor      = .5*[1 1 1];
% tailWingColor = .5*[1 1 1];
% finColor      = .5*[1 1 1];
% propColor     = .5*[1 1 1];
% edgeColor     = 'k';
% linestyle     = '-'; 
% scale         = 1; 
% zscale        = 1; 
% setroll       = false; 
% setpitch      = false; 
% setyaw        = false; 
% 
% % Wings: 
% xw1 = -linspace(-wingspan/2,wingspan/2,10); 
% yw1 = 1.4*wingWidth + abs(xw1)/100; 
% yw2 = zeros(size(xw1))+1.4*wingWidth + wingWidth/3; 
% yw3 = yw1 + wingWidth-abs(xw1)/20; 
% zw1 = .85*fusRadius*ones(size(xw1)); 
% h(4) = surface(x+[.99*xw1;xw1;.97*xw1],y-[yw1;yw2;yw3],...
%     z+[zw1;zw1+.15*fusRadius;zw1]*zscale,'facecolor',wingColor,...
%     'linestyle',linestyle,'edgecolor',edgeColor);
% h(5) = surface(x+[.99*xw1;xw1;.97*xw1],y-[yw1;yw2;yw3],...
%     z+[zw1;zw1;zw1]*zscale,'facecolor',wingColor,...
%     'linestyle',linestyle,'edgecolor',edgeColor);

% c = 1;
% slopeDeg = 0.0022;
% j = 1;
% airfoil_array =[1;2;3;4;5;6;7;8;9;10];
%     XXX = zeros(size(airfoil_array));
%     for i = 1:(size(airfoil_array))
%         if i > 1
%         XXX(i) = XXX(j-1) + c/atand(slopeDeg);
%         i = i + 1;
%         j = j + 1;
%         else
%         XXX(i) = XXX(i) + c/atand(slopeDeg);
%      i = i + 1;
%      j = j + 1;
%         end
%     end
    
    %     for i = 1:18
% %         if i > 1
%         XXX(i) = XXX(j) + 1;
%         i = i + 1;
%         j = j + 1;
%         end
%         else
%     i = 18;
%     for i = 18:35
%         XXX(i) = XXX(i) + 2;
%      i = i + 1;
%      j = j + 1;
%         end
%     end
%     YWR2Horz = (0:1)/atand(slopeDeg);
% ax1 = subplot(2,2,1);
% plot(1:10);
% h = zoom;
% ax2 = subplot(2,2,2);
% plot(rand(3));
% % setAllowAxesZoom(h,ax2,true);
% setAxes3DPanAndZoomStyle(h,ax2,'camera');
% getAxes3DPanAndZoomStyle(h,ax2);

% zoom on
% ax3 = subplot(2,2,3);
% plot(peaks);
% setAxesZoomMotion(h,ax3,'horizontal');
% ax4 = subplot(2,2,4);
% contour(peaks);
% setAxesZoomMotion(h,ax4,'vertical');
% Zoom in on the plots.



% function mytemps
% f = figure;
% c = uicontrol(f,'Style','popupmenu');
% c.Position = [20 75 60 20];
% c.String = {'Celsius','Kelvin','Fahrenheit'};
% c.Callback = @selection;
% 
%     function selection(src,event)
%         val = c.Value;
%         str = c.String;
%         str{val};
%         disp(['Selection: ' str{val}]);


% 
% function mytemps
% f = figure;
% uicontrol('Parent',f,'Style','popupmenu','String',{'Propeller','Jet'},...
%     'Position',[20 75 60 20],'Callback',@popupmenu_typeOfEngine_Callback);
% 
% % Propeller Model
% function propellerParameters
%  global cr ct Gam FH airfoil_array airfoil_coords_x airfoil_coords_y...
% airfoil_size XW1 XW2 XW3 XW4 YW1 YW2 YW3 YW4 ZW1 ZW2 ZW3 ZW4 XWR YWR ZWR...
% XWR2 YWR2 ZWR2 XWRT YWRT ZWRT XWRL YWRL ZWRL XWR3 YWR3 ZWR3 XWRT3 YWRT3...
% ZWRT3 WR WR2 WR3 WRT WRT3 WRL i_w c 
% 
% b = 3;
% tp = 1;
% tpend1 = .8;
% tpend2 = .2;
% LamLE = 0;
% LamLEend1 = 0;
% LamLEend2 = 0;
% R = 1;
% blades = 4;
% 
%    % X-Coordinates
%     XW1=cr;
%     XW2=XW1+(b/2)*tand(LamLE);
%     XW2end1 = XW1+(b/2)*tand(LamLEend1);
%     XW2end2 = XW1+(b/2)*tand(LamLEend2);
%     XW3=XW2+ct;
%     XW4=XW1+cr;
% 
%     % Y-Coordinates
%     YW1=0;
%     YW2=b/2;
%     YW3=b/2;
%     YW4=0;
%   
%     % Z-Coordinates
%     ZW1=FH/2+cr*sind(i_w);
%     ZW2=FH/2+(XW4-XW2)*sind(i_w)+(b/2)*tand(Gam);
%     ZW3=FH/2+(XW4-XW3)*sind(i_w)+(b/2)*tand(Gam);
%     ZW4=FH/2;
% 
%     % Right Wing Root
%     XWR = ((airfoil_coords_x+XW1)*c)-c;
%     YWR = (airfoil_array);
%     ZWR = ((airfoil_coords_y+ZW1)*c)-c;
%     
%     % Right Wing Tip
%     XWR2 = ((airfoil_coords_x.*tp+XW2)*c)-c;
%     YWR2 = (airfoil_array + b);
%     ZWR2 = ((airfoil_coords_y.*tp+ZW3)*c)-c;
%     
%     % Left Wing Root   
%     XWRL = ((airfoil_coords_x+XW1)*c)-c;
%     YWRL = (-airfoil_array);
%     ZWRL = ((airfoil_coords_y+ZW1)*c)-c;
% 
%     % Left Wing Tip
%     XWR3 = ((airfoil_coords_x.*tp+XW2)*c)-c;
%     YWR3 = (-(airfoil_array + b));
%     ZWR3 = ((airfoil_coords_y.*tp+ZW3)*c)-c;
% 
%         importfile;
%         hold on
%         WR  = fill3(ZWR,YWR-R/2,-XWR+c/2,[.5 .5 .5]);
%         hold on
%         WR2 = fill3(ZWR2,YWR2+R/2,-XWR2+c/2,[.5 .5 .5]);
%         hold on
%         WRL = fill3(ZWRL,YWRL+R/2,-XWRL+c/2,[.5 .5 .5]);
%         hold on
%         WR3  = fill3(ZWR3,YWR3-R/2,-XWR3+c/2,[.5 .5 .5]);
% hold on
%      % Left Blade
%         for t = 1:airfoil_size(1)
%             if t <= airfoil_size(1)-1
%                 XWRT = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,...
%                     ((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
%                 YWRT = [(airfoil_array(1)),(airfoil_array(1) + b),(airfoil_array(1) + b),...
%                     (airfoil_array(1))];
%                 ZWRT = [((airfoil_coords_y(t)+ZW1)*c)-c,((airfoil_coords_y(t).*tp+ZW2)*c)-c,...
%                     ((airfoil_coords_y(t+1).*tp+ZW3)*c)-c,((airfoil_coords_y(t+1)+ZW4)*c)-c];
%                 WRT  = fill3(ZWRT,(YWRT+R/2),(XWRT-c/2),[0.5 0.5 0.5]);
%                 if blades == 4
%                     hold on
%                     WRT  = fill3(ZWRT,(XWRT-c/2),(YWRT+R/2),[0.5 0.5 0.5]);
%                 end
%                 t = t + 1;
%             end
%         end
%      % Left Tip of Blade Section 1
%         for t = 1:airfoil_size(1)
%             if t <= airfoil_size(1)-1
%                 XWRT = [((airfoil_coords_x(t).*tp+XW1)*c)-c,((airfoil_coords_x(t).*tpend1+XW2end1)*c)-c,...
%                     ((airfoil_coords_x(t+1).*tpend1+XW2end1)*c)-c,((airfoil_coords_x(t+1).*tp+XW1)*c)-c];
%                 YWRT = [(airfoil_array(1)+b),(airfoil_array(1) + b + .5),(airfoil_array(1) + b + .5),...
%                     (airfoil_array(1)+b)];
%                 ZWRT = [((airfoil_coords_y(t).*tp+ZW1)*c)-c,((airfoil_coords_y(t).*tpend1+ZW2)*c)-c,...
%                     ((airfoil_coords_y(t+1).*tpend1+ZW3)*c)-c,((airfoil_coords_y(t+1).*tp+ZW4)*c)-c];
%                 WRT  = fill3(ZWRT,YWRT+R/2,(XWRT-c/2),[0.5 0.5 0.5]);
%                 if blades == 4
%                     hold on
%                     WRT  = fill3(ZWRT,(XWRT-c/2),(YWRT+R/2),[0.5 0.5 0.5]);
%                 end
%                 t = t + 1;
%             end
%         end
%      % Left Tip of Blade Section 2
%         for t = 1:airfoil_size(1)
%             if t <= airfoil_size(1)-1
%                 XWRT = [((airfoil_coords_x(t).*tpend1+XW2end1)*c)-c,((airfoil_coords_x(t).*tpend2+XW2end2)*c)-c,...
%                     ((airfoil_coords_x(t+1).*tpend2+XW2end2)*c)-c,((airfoil_coords_x(t+1).*tpend1+XW2end1)*c)-c];
%                 YWRT = [(airfoil_array(1)+b+.5),(airfoil_array(1) + b + 1),(airfoil_array(1) + b + 1),...
%                     (airfoil_array(1)+b+.5)];
%                 ZWRT = [((airfoil_coords_y(t).*tpend1+ZW1)*c)-c,((airfoil_coords_y(t).*tpend2+ZW2)*c)-c,...
%                     ((airfoil_coords_y(t+1).*tpend2+ZW3)*c)-c,((airfoil_coords_y(t+1).*tpend1+ZW4)*c)-c];
%                 WRT  = fill3(ZWRT,YWRT+R/2,(XWRT-c/2),[0.5 0.5 0.5]);
%                 if blades == 4
%                     hold on
%                     WRT  = fill3(ZWRT,(XWRT-c/2),(YWRT+R/2),[0.5 0.5 0.5]);
%                 end
%                 t = t + 1;
%             end
%         end
%   hold on
%     % Right Blade
%      for t = 1:airfoil_size(1)
%             if t <= airfoil_size(1)-1
%                 XWRT3 = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,...
%                     ((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
%                 YWRT3 = [(airfoil_array(1)),(-(airfoil_array(1) + b)),(-(airfoil_array(1) + b)),...
%                     (airfoil_array(1))];
%                 ZWRT3 = [((airfoil_coords_y(t)+ZW1)*c)-c,((airfoil_coords_y(t).*tp+ZW2)*c)-c,...
%                     ((airfoil_coords_y(t+1).*tp+ZW3)*c)-c,((airfoil_coords_y(t+1)+ZW4)*c)-c];
%                 WRT3  = fill3(ZWRT3,YWRT3-R/2,-XWRT3+c/2,[0.5 0.5 0.5]);
%                 if blades == 4
%                     hold on
%                     WRT3 = fill3(ZWRT3,XWRT3-c/2,YWRT3-R/2,[0.5 0.5 0.5]);
%                 end
%                 t = t + 1;
%             end
%      end   
%       % Right Tip of Blade Section 1
%           for t = 1:airfoil_size(1)
%             if t <= airfoil_size(1)-1
%                 XWRT3 = [((airfoil_coords_x(t).*tp+XW1)*c)-c,((airfoil_coords_x(t).*tpend1+XW2end1)*c)-c,...
%                     ((airfoil_coords_x(t+1).*tpend1+XW2end1)*c)-c,((airfoil_coords_x(t+1).*tp+XW1)*c)-c];
%                 YWRT3 = [(airfoil_array(1)-b),(-(airfoil_array(1) + b + .5)),(-(airfoil_array(1) + b + .5)),...
%                     (airfoil_array(1)-b)];
%                 ZWRT3 = [((airfoil_coords_y(t).*tp+ZW1)*c)-c,((airfoil_coords_y(t).*tpend1+ZW2)*c)-c,...
%                     ((airfoil_coords_y(t+1).*tpend1+ZW3)*c)-c,((airfoil_coords_y(t+1).*tp+ZW4)*c)-c];
%                 WRT3  = fill3(ZWRT3,YWRT3-R/2,-XWRT3+c/2,[0.5 0.5 0.5]);
%                 if blades == 4
%                     hold on
%                     WRT3 = fill3(ZWRT3,XWRT3-c/2,YWRT3-R/2,[0.5 0.5 0.5]);
%                 end
%                 t = t + 1;
%             end
%           end    
%             % Right Tip of Blade Section 2
%           for t = 1:airfoil_size(1)
%             if t <= airfoil_size(1)-1
%                 XWRT3 = [((airfoil_coords_x(t).*tpend1+XW2end1)*c)-c,...
%                     ((airfoil_coords_x(t).*tpend2+XW2end2)*c)-c,...
%                     ((airfoil_coords_x(t+1).*tpend2+XW2end2)*c)-c,((airfoil_coords_x(t+1).*tpend1+XW2end1)*c)-c];
%                 YWRT3 = [(airfoil_array(1)-b-.5),(-(airfoil_array(1) + b + 1)),...
%                     (-(airfoil_array(1) + b + 1)),(airfoil_array(1)-b-.5)];
%                 ZWRT3 = [((airfoil_coords_y(t).*tpend1+ZW1)*c)-c,((airfoil_coords_y(t).*tpend2+ZW2)*c)-c,...
%                     ((airfoil_coords_y(t+1).*tpend2+ZW3)*c)-c,((airfoil_coords_y(t+1).*tpend1+ZW4)*c)-c];
%                 WRT3  = fill3(ZWRT3,YWRT3-R/2,-XWRT3+c/2,[0.5 0.5 0.5]);
%                 if blades == 4
%                     hold on
%                     WRT3 = fill3(ZWRT3,XWRT3-c/2,YWRT3-R/2,[0.5 0.5 0.5]);
%                 end
%                 t = t + 1;
%              end
%            end  
% 
% 
% 


% 
% 
% 
% % Jet Engine Model
% function jetParameters
% global engineLength engineOuterRadius engineFig...
%     enginePos_xDir enginePos_yDir enginePos_zDir
% 
% fusColor      = .5*[1 1 1];
% edgeColor     = 'k';
% linestyle     = '-'; 
% x = 0;
% y = 0;
% z = 0;
% 
% iArrayFront = [1 .95 .88 .78 .6];
% iArrayRear = [1 .95 .8 .7 .6];
% engineInnerRadius = engineOuterRadius*.7;
% 
% %% Engine
% % Engine Outer Casing 
% [xcf,zcf,ycf] = cylinder(engineOuterRadius); 
% surface((y-ycf*engineLength)-enginePos_xDir,(xcf+x)+enginePos_yDir,(z+zcf*1)+enginePos_zDir,...
%     'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);
% 
% % Engine Front
% [xcn,zcn,ycn] = cylinder(engineOuterRadius.*(iArrayFront)); 
% zcn(6:end,:) = zcn(6:end,:)-engineOuterRadius/100; 
% ycn = -ycn.*.7*engineOuterRadius; 
% surface((y-ycn)-enginePos_xDir,(xcn+x)+enginePos_yDir,(z+zcn*1)+enginePos_zDir,'facecolor'...
%     ,fusColor,'linestyle',linestyle,'edgecolor',edgeColor);
% 
% [xcf,zcf,ycf] = cylinder(engineOuterRadius*.6); 
% surface((y-ycf*engineLength+engineInnerRadius)-enginePos_xDir,(xcf+x)+enginePos_yDir,...
%     (z+zcf*1)+enginePos_zDir,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);
% 
% % Engine Rear
% [xcn,zcn,ycn] = cylinder(engineOuterRadius.*(iArrayRear)); 
% zcn(6:end,:) = zcn(6:end,:)-engineOuterRadius/100; 
% ycn = -ycn.*.7*engineOuterRadius; 
% surface((-(y-ycn)-engineLength)-enginePos_xDir,(-xcn+x)+enginePos_yDir,(z+zcn*1)+enginePos_zDir,...
%     'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);
% 
% [xcf,zcf,ycf] = cylinder(engineOuterRadius*.6); 
% surface(((y-ycf*engineLength-engineInnerRadius))-enginePos_xDir,(xcf+x)+enginePos_yDir,...
%     (z+zcf*1)+enginePos_zDir,'facecolor',fusColor,'linestyle',linestyle,'edgecolor',edgeColor);
% 
% function popupmenu_typeOfEngine_Callback(source,~)
% global fig
% 
%   % Determine the selected data set.
%   str = source.String;
%   val = source.Value;
%   % Set current data to the selected data set.
%   switch str{val}
%   case 'Propeller' % User selects Peaks.
%       
% gca;
% fig = subplot('Position',[0.11 0.22 .8 .6]);
% propellerParameters;
% axis tight equal
% view(3);
%       
%   case 'Jet'
%      gca;
% fig = subplot('Position',[0.11 0.22 .8 .6]);
% jetParameters;
% axis tight equal
% view(3);
%   end
% 
%   

  
  % hold on
%     % Right Blade
%      for t = 1:airfoil_size(1)
%             if t <= airfoil_size(1)-1
%                 XWRT3 = [((airfoil_coords_x(t)+XW1)*c)-c,((airfoil_coords_x(t).*tp+XW2)*c)-c,...
%                     ((airfoil_coords_x(t+1).*tp+XW2)*c)-c,((airfoil_coords_x(t+1)+XW1)*c)-c];
%                 YWRT3 = [(airfoil_array(1)),(-(airfoil_array(1) + b)),(-(airfoil_array(1) + b)),...
%                     (airfoil_array(1))];
%                 ZWRT3 = [((airfoil_coords_y(t)+ZW1)*c)-c,((airfoil_coords_y(t).*tp+ZW2)*c)-c,...
%                     ((airfoil_coords_y(t+1).*tp+ZW3)*c)-c,((airfoil_coords_y(t+1)+ZW4)*c)-c];
%                 WRT3  = fill3(ZWRT3,YWRT3-R/2,-XWRT3+c/2,[0.5 0.5 0.5]);
%                 if x == 2
%                     hold on
%                     WRT3 = fill3(ZWRT3,XWRT3-c/2,YWRT3-R/2,[0.5 0.5 0.5]);
%                 end
%                 t = t + 1;
%             end
%      end   
%       % Right Tip of Blade Section 1
%           for t = 1:airfoil_size(1)
%             if t <= airfoil_size(1)-1
%                 XWRT3 = [((airfoil_coords_x(t).*tp+XW1)*c)-c,((airfoil_coords_x(t).*tpend1+XW2end1)*c)-c,...
%                     ((airfoil_coords_x(t+1).*tpend1+XW2end1)*c)-c,((airfoil_coords_x(t+1).*tp+XW1)*c)-c];
%                 YWRT3 = [(airfoil_array(1)-b),(-(airfoil_array(1) + b + .5)),(-(airfoil_array(1) + b + .5)),...
%                     (airfoil_array(1)-b)];
%                 ZWRT3 = [((airfoil_coords_y(t).*tp+ZW1)*c)-c,((airfoil_coords_y(t).*tpend1+ZW2)*c)-c,...
%                     ((airfoil_coords_y(t+1).*tpend1+ZW3)*c)-c,((airfoil_coords_y(t+1).*tp+ZW4)*c)-c];
%                 WRT3  = fill3(ZWRT3,YWRT3-R/2,-XWRT3+c/2,[0.5 0.5 0.5]);
%                 if x == 2
%                     hold on
%                     WRT3 = fill3(ZWRT3,XWRT3-c/2,YWRT3-R/2,[0.5 0.5 0.5]);
%                 end
%                 t = t + 1;
%             end
%           end    
%             % Right Tip of Blade Section 2
%            for t = 1:airfoil_size(1)
%             if t <= airfoil_size(1)-1
%                 XWRT3 = [((airfoil_coords_x(t).*tpend1+XW2end1)*c)-c,...
%                     ((airfoil_coords_x(t).*tpend2+XW2end2)*c)-c,...
%                     ((airfoil_coords_x(t+1).*tpend2+XW2end2)*c)-c,((airfoil_coords_x(t+1).*tpend1+XW2end1)*c)-c];
%                 YWRT3 = [(airfoil_array(1)-b-.5),(-(airfoil_array(1) + b + 1)),...
%                     (-(airfoil_array(1) + b + 1)),(airfoil_array(1)-b-.5)];
%                 ZWRT3 = [((airfoil_coords_y(t).*tpend1+ZW1)*c)-c,((airfoil_coords_y(t).*tpend2+ZW2)*c)-c,...
%                     ((airfoil_coords_y(t+1).*tpend2+ZW3)*c)-c,((airfoil_coords_y(t+1).*tpend1+ZW4)*c)-c];
%                 WRT3  = fill3(ZWRT3,YWRT3-R/2,-XWRT3+c/2,[0.5 0.5 0.5]);
%                 if x == 2
%                     hold on
%                     WRT3 = fill3(ZWRT3,XWRT3-c/2,YWRT3-R/2,[0.5 0.5 0.5]);
%                 end
%                 t = t + 1;
%             end
%            end  
% 
% 

%% -------------------------------------------------------------------------
% global Cl alpha Clmax_airfoil aL_0_airfoil Cla_airfoil aClmax_airfoil
% Cla_plot = axes('Parent',tab2,'Position',[.4 .1 .55 .55]);
% practice = figure;
% Cla_plot   = axes('Parent',practice,'Position',[.1 .12 .75 .75]);
% % % plot(Cl,alpha);
% slope = Cla_airfoil;
% alphaMax = aClmax_airfoil;
% sizeCl = zeros(size(Cl));
% sizeAlpha = zeros(size(alpha));
% 
% for i = 1:length(Cl)
%     sizeCl(i) = Cl(i);
%     if max(Cl)~=Clmax_airfoil
%         sizeCl(ceil(alphaMax)-aL_0_airfoil)=Clmax_airfoil;
%     end
% end
% 
% if max(alpha)~=alphaMax
%     for i=1:length(alpha)
%         sizeAlpha(i) = alpha(i);
%         if max(alpha) ~= alphaMax
%             sizeAlpha(ceil(alphaMax)-aL_0_airfoil) = alphaMax;
%         end
%     end
% end
% 
% if sizeCl((max(alpha)-aL_0_airfoil)+1) == 0
%     for i=1:length(x)
%         x=(max(alpha)-aL_0_airfoil):ceil(alphaMax)+2;
%         y=linspace(max(Cl),Clmax_airfoil,10);
%         i=1:length(y);
%         sizeCl(x) = y(i);
%     end
% end
% 
% if sizeAlpha((max(alpha)-aL_0_airfoil)+1) == 0
%     for i=1:length(x)
%         x=(max(alpha)-aL_0_airfoil)+1:ceil(alphaMax)+1;
%         y=(max(alpha)+1):floor(alphaMax);
%         i=1:length(y);
%         sizeAlpha(x) = y(i);
%     end
% end
% 
% % stallSlope = ((max(sizeCl))-(max(sizeCl)-1))/(max(sizeAlpha)-(max(sizeAlpha)-1));
% stallSlope = -Cla_airfoil;
% alphaStall = (Clmax_airfoil/stallSlope)+Clmax_airfoil;
% alphaStall = 12;
% stallCl    = (alphaStall-max(alpha))*(stallSlope);
% stallCl    = (stallSlope*(max(alpha)-2))+Clmax_airfoil;
% % 
% % plot(sizeAlpha,sizeCl,'linewidth',1)
% % xlabel('AoA,(deg)');
% % ylabel('C_l');
% 
% if max(Cl)~=stallCl
%     sizeCl(ceil(alphaStall)-aL_0_airfoil) = stallCl;
% end
% 
% if max(alpha)~=alphaStall
%     if max(alpha) ~= alphaStall
%         sizeAlpha(ceil(alphaStall)-aL_0_airfoil) = alphaStall;
%     end
% end
% 
% if sizeCl((ceil(alphaMax)-aL_0_airfoil)+1) == 0
%     for i=1:length(x)
%         x=(ceil(alphaMax)-aL_0_airfoil):ceil(alphaStall)+2;
%         y=linspace(Clmax_airfoil,stallCl,6);
%         i=1:length(y);
%         sizeCl(x) = y(i);
%     end
% end
% 
% if sizeAlpha((ceil(alphaMax)-aL_0_airfoil)+1) == 0
%     for i=1:length(x)
%         x=(ceil(alphaMax)-aL_0_airfoil)+1:ceil(alphaStall)+1;
% %         y=(ceil(alphaMax)+1):floor(alphaStall);
%         y=linspace(alphaMax,alphaStall,4);
%         i=1:length(y);
%         sizeAlpha(x) = y(i);
%     end
% end
% sizeAlpha = [0;1;2;3;4;5;6;7;8;9;10;11;12;13];

% Test Airfoil
% % NACA 66-206
%         AirfoilSeries = 5;
%         t_c = 0.06;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = -1.6;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = -0.038;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.108;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.257;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 10.5;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 1.00;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 7.0;


% NACA 2418
%         AirfoilSeries = 1;
%         t_c = 0.18;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = -2.3;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = -0.05;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.103;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.241;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 14.0;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 1.47;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 10.0;
        
% NACA 63A010
%         AirfoilSeries = 2;
%         t_c = 0.10;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = 0;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = -0.005;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.105;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.254;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 13.0;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 1.20;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 10.0;
        
% NACA 63A210
% AirfoilSeries = 2;
%         t_c = 0.10;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = -1.5;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = -0.040;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.103;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.257;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 14.0;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 1.43;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 10.0;

% NACA 64A010
% AirfoilSeries = 3;
%         t_c = 0.10;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = 0;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = 0;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.110;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.253;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 12.0;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 1.23;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 10.0;
        
% NACA 65(4)-421a=.5
%         AirfoilSeries = 4;
%         t_c = 0.21;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = -2.8;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = -0.052;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.116;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.272;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 20.0;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 1.43;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 5.6;

% % NACA 63-206
%         AirfoilSeries = 2;
%         t_c = 0.06;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = -1.9;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = -0.037;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.112;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.254;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 10.5;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 1.06;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 6.0;
        
% % NACA 0006
% AirfoilSeries = 1;
%         t_c = 0.06;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = 0;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = 0;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.108;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.25;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 9.0;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 0.92;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 9.0;

% NACA 63(3)-218
%  AirfoilSeries = 2;
%         t_c = 0.18;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = -1.4;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = -0.033;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.118;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.271;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 14.5;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 1.5;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 8.0;

% NACA 64(2)-015
%   AirfoilSeries = 3;
%         t_c = 0.15;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = 0;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = 0;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.112;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.267;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 15.0;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 1.48;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 13.0;    

% NACA 66-006
%         AirfoilSeries = 5;
%         t_c = 0.06;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = 0;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = 0;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.100;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.252;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 9.0;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 0.80;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 6.5;
        
% NACA 2415
%         AirfoilSeries = 1;
%         t_c = 0.15;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = -2.0;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = -0.049;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.106;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.246;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 16.4;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 1.63;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 10.0;
       
        
% NACA 2412        
%         AirfoilSeries = 1;
%         t_c = 0.12;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = -2.0;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = -0.047;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.105;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.247;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 16.8;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 1.68;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 9.5;       
       
% NACA 0009
%         AirfoilSeries = 1;
%         t_c = 0.09;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = 0;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = 0;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.109;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.25;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 13.4;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 1.32;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 11.4;

% NACA 65-006
%         AirfoilSeries = 4;
%         t_c = 0.06;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = 0;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = 0;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.105;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.258;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 12.0;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 0.87;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 7.6;        
        

% NACA 63(3)-018
%         AirfoilSeries = 2;
%         t_c = 0.18;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = 0;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = 0;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.118;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.271;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 15.5;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 1.54;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 11.2;
        
% NACA 66-210
%         AirfoilSeries = 5;
%         t_c = 0.1;
%         % Alpha(L=0)[deg]
%         aL_0_airfoil = -1.3;
%         aL_0_airfoil_str = num2str(aL_0_airfoil);
%         % Cmo
%         cmo_airfoil = -0.035;
%         cmo_airfoil_str = num2str(cmo_airfoil);
%         % Cla[1/deg]
%         Cla_airfoil = 0.110;
%         Cla_airfoil_str = num2str(Cla_airfoil);
%         % A.C.
%         ac_airfoil = 0.261;
%         ac_airfoil_str = num2str(ac_airfoil);
%         % Alpha Clmax[1/deg]
%         aClmax_airfoil = 11.0;
%         aClmax_airfoil_str = num2str(aClmax_airfoil);
%         % Clmax
%         Clmax_airfoil = 1.27;
%         Clmax_airfoil_str = num2str(Clmax_airfoil);
%         % Alpha*a[deg] Angle of attack where curve is no longer linear
%         aStarA_airfoil = 10.0;

% S4083
       AirfoilSeries = [];
       t_c = .0778;
       % Alpha(L=0) [deg]
       aL_0_airfoil = -2.95;
       % Cla[1/deg]
       Cla_airfoil = .105;
       % Alpha Clmax[1/deg]
       aClmax_airfoil = 12.0;
       % Clmax
       Clmax_airfoil = 1.3;
       % Alpha*a[deg]
       aStarA_airfoil = 7;
       


% % NACA 66-206
%         alphaArray_airfoil   = [      -1.9;       0;        2;        4;         6;        8;         10;        12;       14;];
%         ClaArray_airfoil     = [         0;      .2;       .4;      .61;        .8;      .91;          1;       .95;      .82;];
%         ClCdArray_airfoil    = [          0;         .1;         .2;         .3;         .4;         .5;         .6;         .7;         .8;       .89;];
%         CdClArray_airfoil    = [      .0044;      .0041;      .0035;      .0042;      .0055;      .0059;      .0064;      .0071;      .0079;     .0091;];
%         CmacArray_airfoil    = [      -.038;      -.038;      -.038;      -.038;      -.038;      -.038;      -.038;      -.038;      -.038;     -.038;];

% NACA 2418
% alphaArray_airfoil   = [      -2.5;     -2;      0;      2;      4;     6;    8;     10;      12;     14;     16;     18;     20;];
%         ClaArray_airfoil     = [         0;    .04;    .23;    .42;    .62;   .81;    1;    1.2;    1.39;   1.48;   1.42;   1.41;    1.4;];
%         ClCdArray_airfoil    = [       0;      .1;        .2;       .3;       .4;      .5;      .6;      .7;      .8;      .9;        1;     1.1;     1.2;     1.3;    1.4;    1.48;];
%         CdClArray_airfoil    = [   .0069;   .0069;    .00695;     .007;    .0071;   .0073;   .0076;   .0079;   .0081;   .0085;   .00905;     .01;    .011;   .0122;   .014;   .0157;];
%         CmacArray_airfoil    = [    -.05;    -.05;      -.05;     -.05;     -.05;    -.05;    -.05;    -.05;    -.05;    -.05;     -.05;    -.05;    -.05;    -.05;   -.05;    -.05;];

% NACA 63A010        
% alphaArray_airfoil   = [       0;        2;        4;        6;        8;        10;        12;       13;       14;     14.1;];
%         ClaArray_airfoil     = [       0;       .2;      .42;      .63;      .83;      1.05;       1.2;      1.2;      1.1;      .75;];
%         ClCdArray_airfoil    = [          0;         .1;         .2;         .3;         .4;         .5;         .6;         .7;         .8;       .9;        1;      1.1;      1.19;];
%         CdClArray_airfoil    = [      .0047;      .0048;       .006;      .0064;      .0067;       .007;      .0075;      .0081;       .009;    .0099;    .0109;    .0123;     .0145;];
%         CmacArray_airfoil    = [          0;          0;          0;          0;          0;          0;          0;          0;          0;        0;        0;        0;         0;];
  
% NACA 63A210
% alphaArray_airfoil   = [     -1.5;       0;        2;        4;        6;        8;        10;        12;       14;       16;     16.1;];
%         ClaArray_airfoil     = [        0;     .16;      .37;      .58;      .79;        1;       1.2;      1.37;     1.42;     1.28;        1;];
%         ClCdArray_airfoil    = [          0;         .1;         .2;         .3;         .4;         .5;         .6;         .7;         .8;       .9;        1;      1.1;       1.2;       1.3;      1.38;];
%         CdClArray_airfoil    = [      .0049;      .0044;      .0042;      .0044;      .0049;       .006;      .0066;      .0069;      .0072;    .0078;    .0085;    .0095;     .0107;     .0124;     .0142;];
%         CmacArray_airfoil    = [     -.0375;     -.0375;     -.0375;     -.0375;     -.0375;     -.0375;     -.0375;     -.0375;     -.0375;   -.0375;   -.0375;   -.0375;    -.0375;    -.0375;    -.0375;];

% NACA 64A010
%  alphaArray_airfoil   = [         0;        2;        4;        6;        8;        10;        12;      12.4;      13;     13.6;     14;];
%         ClaArray_airfoil     = [         0;      .25;      .46;      .68;       .9;      1.08;      1.21;       1.1;     .96;       .9;    .88;];
%         ClCdArray_airfoil    = [          0;         .1;         .2;         .3;         .4;         .5;         .6;         .7;         .8;       .9;        1;      1.08;];
%         CdClArray_airfoil    = [      .0043;      .0043;      .0055;       .006;      .0061;      .0064;      .0069;      .0075;      .0082;    .0091;    .0102;     .0111;];
%         CmacArray_airfoil    = [          0;          0;          0;          0;          0;          0;          0;          0;          0;        0;        0;         0;];

% % NACA 65(4)-421a=.5
%  alphaArray_airfoil   = [    -2.8;       -2;       0;        2;        4;         6;         8;         10;        12;       14;       16;       18;       20;       22;       24;];
%         ClaArray_airfoil     = [       0;       .1;      .3;      .55;      .79;       .97;         1;       1.06;      1.16;     1.25;     1.32;      1.4;     1.43;     1.42;      1.4;];
%         ClCdArray_airfoil    = [          0;         .1;         .2;         .3;         .4;         .5;         .6;         .7;         .8;        .9;       .99;];
%         CdClArray_airfoil    = [      .0062;      .0048;      .0047;      .0047;      .0047;      .0048;      .0049;       .005;      .0053;      .006;      .031;];
%         CmacArray_airfoil    = [      -.051;      -.051;      -.051;      -.051;      -.051;      -.051;      -.051;      -.051;      -.051;     -.051;     -.051;];

% NACA 63-206
%          alphaArray_airfoil   = [  -2;     0;      2;      4;      6;      8;      10;      12;     13;];
%         ClaArray_airfoil     = [   0;   .19;     .4;    .62;    .83;    .97;    1.08;    1.06;    .92;];
%         ClCdArray_airfoil    = [       0;        .1;         .2;        .3;        .4;         .5;        .6;         .7;        .8;     .88;];
%         CdClArray_airfoil    = [   .0051;      .005;       .004;     .0041;      .005;      .0055;      .006;      .0066;     .0074;    .008;];
%         CmacArray_airfoil    = [   -.038;     -.038;      -.038;     -.038;     -.038;      -.038;     -.038;      -.038;     -.038;   -.038;];

% NACA 0006
% alphaArray_airfoil   = [     0;     2;     4;      6;     8;     9;    10;    12;   13;];
%         ClaArray_airfoil     = [     0;    .2;    .4;    .62;   .82;   .92;   .88;   .82;   .8;];
%         ClCdArray_airfoil    = [       0;      .1;      .2;      .3;      .4;      .5;      .6;      .7;    .8;     .82;];
%         CdClArray_airfoil    = [   .0051;   .0052;   .0054;   .0057;   .0059;    .006;   .0069;   .0079;  .009;   .0095;];
%         CmacArray_airfoil    = [       0;       0;       0;       0;       0;       0;       0;       0;     0;       0;];

% NACA 63(3)-218
% alphaArray_airfoil   = [    -1.7;       0;       2;       4;       6;       8;      10;        12;       14;         16;        18;      20;     22;     23.5;];
%         ClaArray_airfoil     = [       0;     .16;      .4;     .65;     .85;    1.05;    1.24;      1.38;     1.44;       1.47;      1.49;     1.5;    1.5;     1.42;];
%         ClCdArray_airfoil    = [         0;        .1;         .2;        .3;         .4;         .5;         .6;         .7;         .8;        .9;          1;       1.1;       1.2;       1.3;       1.38;];
%         CdClArray_airfoil    = [      .005;     .0049;      .0049;     .0049;       .005;      .0051;      .0058;       .007;       .008;     .0086;      .0094;     .0101;     .0111;     .0127;      .0152;];
%         CmacArray_airfoil    = [      -.03;      -.03;       -.03;      -.03;       -.03;       -.03;       -.03;       -.03;       -.03;      -.03;       -.03;      -.03;      -.03;      -.03;       -.03;];

% NACA 64(2)-015
%  alphaArray_airfoil   = [     0;        2;       4;         6;        8;        10;        12;         14;       15.2;       16;      18;];
%         ClaArray_airfoil     = [     0;      .21;     .43;       .67;      .89;       1.1;       1.3;       1.48;       1.59;     1.47;    1.35;];
%         ClCdArray_airfoil    = [          0;        .1;         .2;        .3;          .4;         .5;         .6;         .7;        .8;       .9;          1;       1.1;       1.2;       1.3;      1.4;      1.45;];
%         CdClArray_airfoil    = [      .0044;     .0045;      .0046;      .005;       .0064;      .0072;       .008;      .0083;      .009;    .0095;      .0103;     .0113;     .0127;      .014;     .016;      .017;];
%         CmacArray_airfoil    = [          0;         0;          0;         0;           0;          0;          0;          0;          0;       0;          0;         0;         0;         0;        0;         0;];

% NACA 66-006
% alphaArray_airfoil   = [       0;        2;        4;        6;        8;        10;        12;       14;];
%         ClaArray_airfoil     = [       0;       .2;       .4;       .6;      .78;        .8;       .75;       .7;];
%         ClCdArray_airfoil    = [          0;         .1;         .2;         .3;         .4;         .5;        .52;];
%         CdClArray_airfoil    = [       .003;       .005;      .0051;      .0055;      .0059;      .0064;      .0066;];
%         CmacArray_airfoil    = [          0;          0;          0;          0;          0;          0;          0;];
        
% NACA 2415
%         alphaArray_airfoil   = [      -2;     0;     2;     4;     6;       8;      10;      12;      14;     16;     18;     20;     22;      24;    24.2;];
%         ClaArray_airfoil     = [       0;    .2;   .42;   .64;   .85;    1.09;    1.29;    1.42;    1.56;   1.62;   1.57;   1.32;   1.25;    1.28;    1.31;];
%         ClCdArray_airfoil    = [        0;       .1;       .2;       .3;      .4;      .5;      .6;      .7;      .8;      .9;       1;     1.1;     1.2;     1.3;    1.4;    1.5;   1.58;];
%         CdClArray_airfoil    = [    .0065;    .0064;    .0063;    .0064;   .0066;   .0067;   .0069;   .0072;   .0077;   .0081;   .0089;   .0097;   .0105;   .0117;   .013;   .015;  .0165;];
%         CmacArray_airfoil    = [    -.049;    -.049;    -.049;    -.049;   -.049;   -.049;   -.049;   -.049;   -.049;   -.049;   -.049;   -.049;   -.049;   -.049;  -.049;  -.049;  -.049;];

% NACA 2412
%         alphaArray_airfoil   = [      -2;     0;     2;     4;     6;      8;     10;    12;     14;     16;     18;     20;    20.3;];
%         ClaArray_airfoil     = [       0;   .23;   .45;   .64;   .86;   1.05;   1.23;   1.4;   1.58;   1.69;   1.52;   1.37;    1.23;];
%         ClCdArray_airfoil    = [       0;       .1;      .2;       .3;      .4;      .5;      .6;      .7;      .8;      .9;       1;     1.1;     1.2;     1.3;     1.4;     1.5;    1.57;];
%         CdClArray_airfoil    = [    .006;   .00595;   .0059;   .00595;    .006;   .0063;    .007;   .0072;   .0074;    .008;   .0088;   .0098;    .011;   .0121;    .014;   .0163;   .0187;];
%         CmacArray_airfoil    = [    -.05;     -.05;    -.05;     -.05;    -.05;    -.05;    -.05;    -.05;    -.05;    -.05;    -.05;    -.05;    -.05;    -.05;    -.05;    -.05;    -.05;];

% NACA 0009
%         alphaArray_airfoil   = [     0;     2;     4;      6;      8;     10;      12;    13.4;     14;      16;     16.1;];
%         ClaArray_airfoil     = [     0;    .2;   .42;    .64;    .86;   1.08;    1.27;    1.31;    1.3;    1.15;      1.1;];
%         ClCdArray_airfoil    = [       0;      .1;      .2;       .3;      .4;      .5;     .6;     .7;    .8;    .9;      1;   1.1;     1.2;    1.29;];
%         CdClArray_airfoil    = [   .0056;   .0057;   .0058;   .00595;    .006;   .0061;  .0065;  .0069; .0072;  .008;  .0089;   .01;   .0111;   .0127;];
%         CmacArray_airfoil    = [       0;       0;       0;        0;       0;       0;      0;      0;     0;     0;      0;     0;       0;       0;];
        
% NACA 65-006
%         alphaArray_airfoil   = [     0;        2;       4;         6;        8;        10;        12;         14;];
%         ClaArray_airfoil     = [     0;       .2;     .42;       .64;       .8;       .87;       .82;        .78;];
%         ClCdArray_airfoil    = [          0;        .1;         .2;        .3;          .4;         .5;         .6;         .64;];
%         CdClArray_airfoil    = [      .0039;     .0049;      .0052;     .0054;       .0059;      .0065;      .0072;       .0078;];
%         CmacArray_airfoil    = [          0;         0;          0;         0;           0;          0;          0;           0;];        
        
% NACA 63(3)-018

%         alphaArray_airfoil   = [    0;        2;       4;      6;       8;       10;        12;       14;        16;       18;      20;];
%         ClaArray_airfoil     = [    0;      .24;     .47;    .67;      .9;     1.11;      1.31;     1.46;       1.5;     1.47;    1.39;];
%         ClCdArray_airfoil    = [        0;        .1;         .2;        .3;         .4;         .5;         .6;         .7;        .8;        .9;         1;       1.1;       1.2;       1.3;        1.35;];
%         CdClArray_airfoil    = [     .005;      .005;      .0051;     .0052;      .0057;      .0062;      .0077;      .0082;     .0089;     .0097;     .0105;     .0115;     .0126;      .014;       .0149;];
%         CmacArray_airfoil    = [        0;         0;          0;         0;          0;          0;          0;          0;         0;         0;         0;         0;         0;         0;           0;];
% NACA 66-210

%         alphaArray_airfoil   = [        -1.5;        0;        2;        4;        6;        8;         10;        11.2;        12;       13.2;];
%         ClaArray_airfoil     = [           0;      .16;      .38;      .59;       .8;        1;       1.19;      1.27;         1.1;          1;];
%         ClCdArray_airfoil    = [          0;         .1;         .2;         .3;         .4;         .5;         .6;         .7;         .8;         .9;         1;       1.1;      1.19;];
%         CdClArray_airfoil    = [       .005;      .0032;       .003;      .0046;      .0058;      .0061;      .0065;       .007;      .0078;      .0085;     .0095;    .01095;     .0123;];
%         CmacArray_airfoil    = [      -.037;      -.037;      -.037;      -.037;      -.037;      -.037;      -.037;      -.037;      -.037;      -.037;     -.037;     -.037;     -.037;];

% S4083
        alphaArray_airfoil     = [  -2.95;       -2;       0;        2;        4;       6;       8;       10;     12;       14;];
        ClaArray_airfoil       = [      0;     .099;     .31;      .54;      .75;     .94;     1.1;     1.26;    1.3;     1.28;];
        ClCdArray_airfoil      = [       0;       .08;      .15;      .25;       .28;       .41;       .61;         .74;        .85;       .93;        1.01;        1.1;         1.2;       1.25;        1.3;];
        CdClArray_airfoil      = [    .021;      .018;     .016;     .014;      .013;      .014;      .016;        .018;        .02;      .022;        .024;       .026;        .028;       .029;       .041;];

% need to find aClmax_airfoil and ClAstarA_wing

% Okay, major assumption is being made here. That the non-linear portion of
% the CL vs. alpha curve for the wing is the same as the airfoil. Don't
% know if that is accurate or not, but it's all I have to go off of right
% now

% Don't actually think I do that anymore, assume the non-linear portion is
% the same for the wing and airfoil, but you never know


% READ IN AIRFOIL COORDINATES
% S4083 (A)
% global wingAirfoilFile airfoil_coords_x airfoil_coords_y
% wingAirfoilFile = 's4083(A).dat';

% GEMINI
% wingAirfoilFile = 'GEMINI.dat';

% importfile3;


%--------------------------------------------------------------------------
c = .5;
b = 6;
tp = .35;
SrefWing = (b/2)*c*(1+tp);
ARWing = (b^2)/SrefWing;
% ARWing = 9;
% ARWing     = .375;
LamLE      = 3; %[deg]
machNumber = .2;

% Alpha(L=0)
aL_0_wing = aL_0_airfoil;

% Pitching Moment Coefficient at zero lift
% Cmo_wing = min(CmacArray_airfoil);

% Lift Curve Slope
Cla_wing = Cla_airfoil;

% Aerodynamic Center
% ac_wing = ac_airfoil;

% Alpha at Max Cl
aClmax_wing = aClmax_airfoil;

% Maximum Lift Coefficient
Clmax_wing = Clmax_airfoil;

% Alpha where Cla ceases to be linear
aStarA_wing = aStarA_airfoil;

% Minimum Drag Coefficient
Cdmin_wing = min(CdClArray_airfoil);

% Lift Coefficient at Minimum Drag Coefficient
Clmind_wing = min(ClCdArray_airfoil);

% Run the code 5 times to ensure a smooth curve...I know it's not the best
% way to work it but whateves
for step=1:5
    
% Aspect Ratio (tp = 0)
% Start here to calculate the deviation in AR
AR_6 = 6;
Tau_AR_6 = -.0011*AR_6^2+.0317*AR_6+.0148;
Delta_AR_6 = -.0003*AR_6^2+.013*AR_6-.0195;

Tau_AR = -.0011*ARWing^2+.0317*ARWing+.0148;
Delta_AR = -.0003*ARWing^2+.013*ARWing-.0195;

differenceInTau_AR   = Tau_AR - Tau_AR_6;
differenceInDelta_AR = Delta_AR - Delta_AR_6;

% Taper Ratio (AR = 6)
% Proceed to here to calculate the deviation in tp
tp_0 = 0;
Tau_tp_0 = 1.0417*tp_0^5 - 2.036*tp_0^4 + .5299*tp_0^3 + 1.2261*tp_0^2 - .7068*tp_0 + .1058;
Delta_tp_0 = -3.0769*tp_0^5 + 8.715*tp_0^4 - 9.4563*tp_0^3 + 5.0908*tp_0^2 - 1.3624*tp_0 + .1486;

Tau_tp = 1.0417*tp^5 - 2.036*tp^4 + .5299*tp^3 + 1.2261*tp^2 - .7068*tp + .1058;
Delta_tp = -3.0769*tp^5 + 8.715*tp^4 - 9.4563*tp^3 + 5.0908*tp^2 - 1.3624*tp + .1486;

differenceInTau_tp = Tau_tp - Tau_tp_0;
differenceInDelta_tp = Delta_tp - Delta_tp_0;

Tau = Tau_tp + differenceInTau_AR + differenceInTau_tp;
Delta = Delta_tp + differenceInDelta_AR + differenceInDelta_tp;

% Sweep at Maximum Thickness
if ARWing >= 6
    LamMaxThickness = atand(tand(LamLE)-((4*(t_c)*(1-tp))/(ARWing*(1+tp))));
elseif ARWing < 6
    LamMaxThickness = atand(tand(LamLE)-((4*(t_c)*(1-tp))/(ARWing*(1+tp))));
end

% Sweep at 50 percent chord (x=0 at leading edge, x=1 at trailing edge)
% Wing Sweep [rad]
LamLE_rad = (LamLE*pi)/180;
xChordStation = .5;
Lam50Percent = atan(tan(LamLE_rad)-((4*(xChordStation)*(1-tp))/(ARWing*(1+tp))));

% Oswald's Efficiency Factor
e0 = 4.61*(1-.045*ARWing^.68)*(cosd(LamLE))^.15-3.1;

% Wing Efficiency Factor
e_wing = 2/(2-ARWing+sqrt(4+ARWing^2*(1+tand(LamMaxThickness)^2)));

% Wing Lift Curve Slope
Cla_wing = Cla_airfoil/(sqrt(1-machNumber^2));
CLa_wing = Cla_airfoil/(1+((57.3*Cla_airfoil*(1+Tau))/(pi()*e_wing*ARWing)));

% Correction for wing sweep
CLa_wing = CLa_wing*sqrt(cosd(LamMaxThickness));
CLa_wing_str = num2str(CLa_wing,3);

% Coefficient of Lift(CL)
CL = CLa_wing*(alphaArray_airfoil-aL_0_wing);

% Determination of Taper Ratio Correction Factors
C1 = 28.141*tp^6 - 107.43*tp^5 + 145.5*tp^4 - 80.429*tp^3 + 10.533*tp^2 + 3.4809*tp - .0019;

if tp >= 0 && tp <= .3
    C2 = 4.1667 * tp^2 + 1.6667 * tp - 7E-15;
elseif tp > .3 && tp <= .6
    C2 = 46.165 * tp^3 - 69.348 * tp^2 + 33.712 * tp - 4.2439;
elseif tp > .6 && tp <= 1
    C2 = 1.25 * tp^2 - 2.325 * tp + 1.935;
end

% Determination of DeltaY
if isempty(AirfoilSeries) ~= 1
    switch AirfoilSeries
        case 1
        % NACA 4 & 5 Series
    deltaY = -15.737 * t_c^2 + 28.083 * t_c + .0075;
        case 2
        % NACA 63 Series
    deltaY = 22.321 * t_c - .0238;
        case 3
        % NACA 64 Series
    deltaY = 20.857 * t_c - .0224;
        case 4
        % NACA 65 Series
    deltaY = 18.993 * t_c + .009;
        case 5
        % NACA 66 Series
    deltaY = 18.175 * t_c + .0117;
    end
else
%     pointFifteenPercentC = airfoil_coords_x;
%     pointSixPercentC     = airfoil_coords_y;
    deltaY = 3.609;
end

% Determination of High-AR Wings
AR_highWing = 0;
AR_lowWing  = 0;

% Determination of  Low-AR Wings
if ARWing > 4/((C1+1)*cosd(LamLE))
    AR_highWing = 1;
elseif ARWing < 4/((C1+1)*cosd(LamLE))
     AR_lowWing = 1;
end
% AR_highWing = 0;
% AR_lowWing = 1;
%% High-AR Wings
if AR_highWing == 1
    % Determination of CLmax_Clmax
    if deltaY <= 1.4
        % DeltaY <= 1.4
    CLmax_Clmax = 8E-5 * LamLE^2 + .002 * LamLE + .9006;
    elseif deltaY > 1.4 && deltaY <= 1.6
        % DeltaY = 1.6
    CLmax_Clmax = 5E-5 * LamLE^2 + .0018 * LamLE + .9002;
    elseif deltaY > 1.6 && deltaY <= 1.8
        %  DeltaY = 1.8
    CLmax_Clmax = 2E-5 * LamLE^2 + .001 * LamLE + .8996;
    elseif deltaY > 1.8 && deltaY <= 2
        % DeltaY = 2
    CLmax_Clmax = -1E-5 * LamLE^2 + .0002 * LamLE + .8998;
    elseif deltaY > 2 && deltaY <= 2.2
        % DeltaY = 2.2
    CLmax_Clmax = -5E-5 * LamLE^2 + 2E-16 * LamLE + .9;
    elseif deltaY > 2.2 && deltaY <= 2.4
        % DeltaY = 2.4
    CLmax_Clmax = -4E-7 * LamLE^3 - 3E-5 * LamLE^2 - .0018 * LamLE + .9005;
    elseif deltaY > 2.4
        % DeltaY = 2.5
    CLmax_Clmax = -1E-6 * LamLE^3 + 5E-5 * LamLE^2 - .0039 * LamLE + .9;
    end

    % Maximum Coefficient of Lift
    CLmax_wing = CLmax_Clmax*Clmax_airfoil;
    CLmax_wing_str = num2str(CLmax_wing);

    % Determination of DeltaAlphaCLmax
    if deltaY <= 1.2
        deltaAlphaCLmax = .0027 * LamLE^2 + .0288 * LamLE + 1.8126;
    elseif deltaY > 1.2 && deltaY <= 2
        deltaAlphaCLmax = .001 * LamLE^2 + .1064 * LamLE - .0271;
    elseif deltaY > 2 && deltaY <= 3
        deltaAlphaCLmax = .0008 * LamLE^2 + .0475 * LamLE + 1.1224;
    elseif deltaY > 3 || deltaY >= 4
        deltaAlphaCLmax = .0005 * LamLE^2 - .0113 * LamLE + 2.0836;
    end

    % Alpha CLmax(aCLmax)
    alphaCLmax = (CLmax_wing/CLa_wing) + aL_0_wing + deltaAlphaCLmax;

    % Minimum Coefficient of Lift
    Clmin_airfoil = min(ClaArray_airfoil);

    % Check whether or not ClaArray_wing_nonlinear1 has any values larger
    % than CLmax_wing
    
if step > 1
    for k = 1:4
        for i = 1:5
            check = ClaArray_wing_nonlinear1(i) > CLmax_wing;
            if check == 1
                aStarA_wing = aStarA_wing - 1;
            end
        k     = 0;
        delta = 0;
        A   = aStarA_wing;
        B   = alphaCLmax;
        num   = 5;
        numer = 1;
        denom = num-1;
        check = denom-1;
        alphaArray_wing_nonlinear1 = zeros(1,num);
        ClaArray_wing_nonlinear1   = zeros(1,num);

            for i = 1:num
                if k == 1
                    i = num;
                end
                % Beginning of nonlinear curve
                if i == 1
                    h = A;
                    alphaArray_wing_nonlinear1(i) = h;
                    ClaArray_wing_nonlinear1(i)   = CLa_wing*(h-aL_0_wing);
                end
                % Maximum CL value, half of nonlinear curve
                if i == num
                    h = B;
                    h = alphaCLmax;
                    alphaArray_wing_nonlinear1(i) = h;
                    ClaArray_wing_nonlinear1(i)   = CLmax_wing;
                    break
                end
                % Between start and halfway point of nonlinear curve
                if i >= 2
                    for j = 2:num-1
                        % Halfway between start and maximum CL value
                        if j == ceil(num/2) || numer > 1
                            h = (((A+B))/2);
                            value = h;
                            delta = delta*(num/denom);
                        end
                        % Greater than start and less than halfway point between start and
                        % Maximum CL value
                        if j < ceil(num/2)
                            h = (((A+B))/2);
                            hh = (h-A)/(denom/2);
                            value  = hh + alphaArray_wing_nonlinear1(j-1);
                        % Greater than halfway point and less than maximum CL value
                        elseif j > ceil(num/2)
                            h = (((A+B))/2);
                            hh = (h-A)/(denom/2);
                            value  = hh + alphaArray_wing_nonlinear1(j-1);
                            delta  = delta/(num/denom)-.07;
                        end
                    alphaArray_wing_nonlinear1(j) = value;
                    ClaArray_wing_nonlinear1(j)   = CLa_wing*(value-aL_0_wing)+(delta);
                    end
                    k = 1;
                end
            end
        end
    end
end

if step == 1
        k     = 0;
        delta = 0;
        A   = aStarA_wing;
        B   = alphaCLmax;
        num   = 5;
        numer = 1;
        denom = num-1;
        check = denom-1;
        alphaArray_wing_nonlinear1 = zeros(1,num);
        ClaArray_wing_nonlinear1   = zeros(1,num);

        for i = 1:num
            if k == 1
                i = num;
            end
            % Beginning of nonlinear curve
            if i == 1
                h = A;
                alphaArray_wing_nonlinear1(i) = h;
                ClaArray_wing_nonlinear1(i)   = CLa_wing*(h-aL_0_wing);
            end
            % Maximum CL value, half of nonlinear curve
            if i == num
                h = B;
                h = alphaCLmax;
                alphaArray_wing_nonlinear1(i) = h;
                ClaArray_wing_nonlinear1(i)   = CLmax_wing;
                break
            end
            % Between start and halfway point of nonlinear curve
            if i >= 2
                for j = 2:num-1
                    % Halfway between start and maximum CL value
                    if j == ceil(num/2) || numer > 1
                        h = (((A+B))/2);
                        value = h;
                        delta = delta*(num/denom);
                    end
                    % Greater than start and less than halfway point between start and
                    % Maximum CL value
                    if j < ceil(num/2)
                        h = (((A+B))/2);
                        hh = (h-A)/(denom/2);
                        value  = hh + alphaArray_wing_nonlinear1(j-1);
                    % Greater than halfway point and less than maximum CL value
                    elseif j > ceil(num/2)
                        h = (((A+B))/2);
                        hh = (h-A)/(denom/2);
                        value  = hh + alphaArray_wing_nonlinear1(j-1);
                        delta  = delta/(num/denom)-.07;
                    end
                alphaArray_wing_nonlinear1(j) = value;
                ClaArray_wing_nonlinear1(j)   = CLa_wing*(value-aL_0_wing)+(delta);
                end
                k = 1;
            end
        end
end

    if step > 1
        % Smoothes out beginning of nonlinear portion of curve
        if (ClaArray_wing_nonlinear1(5) - ClaArray_wing_nonlinear1(4)) / (alphaArray_wing_nonlinear1(5) - alphaArray_wing_nonlinear1(4)) > .022
                arrayOfLinspace = linspace(array(3),array(5),50);
                for i = 1:30
                    ClaArray_wing_nonlinear1(4) = arrayOfLinspace(i);
                    if (ClaArray_wing_nonlinear1(5) - ClaArray_wing_nonlinear1(4)) / (alphaArray_wing_nonlinear1(5) - alphaArray_wing_nonlinear1(4)) < .022
                        break
                    else
                    end
                end
        end
    end

    % Begins calculation of trailing nonlinear portion of curve
    num = 5;
    alphaArray_wing_nonlinear2 = zeros(1,num);
    ClaArray_wing_nonlinear2   = zeros(1,num);
    for i = 1:num
        if i == 1
        alphaArray_wing_nonlinear2(i) = alphaCLmax;
        end
        if i ~= 1
        alphaArray_wing_nonlinear2(i) = ceil(alphaCLmax)+i-2;
        end
    end

    % Finds equation of nonlinear curve before stall
    equation = polyfit(alphaArray_wing_nonlinear2,ClaArray_wing_nonlinear1,2);

    % Calculates trailing nonlinear curve
    for i = 1:num
        if i == 1
        alphaArray_wing_nonlinear2(i) = alphaCLmax;
        ClaArray_wing_nonlinear2(i) = ClaArray_wing_nonlinear1(end);
        end
        if i ~= 1
        alphaArray_wing_nonlinear2(i) = ceil(alphaCLmax)+i-2;
        ClaArray_wing_nonlinear2(i) = equation(1) * alphaArray_wing_nonlinear2(i)^2 + equation(2) * alphaArray_wing_nonlinear2(i) + equation(3);
        end
    end

    % Reorganizes trailing nonlinear curve points to ensure smooth transition
    j = num;
    array = ClaArray_wing_nonlinear2;
    for i = 1:num
        if i == 1
        ClaArray_wing_nonlinear2(i) = array(i);
        end
        if i ~= 1
        ClaArray_wing_nonlinear2(i) = array(j);
        j = j - 1;
        end
    end
    
    % Separates alphas that are too close together
    if alphaArray_wing_nonlinear2(1) - alphaArray_wing_nonlinear2(2) < .5
        differenceInAlphas = alphaArray_wing_nonlinear1(5) - alphaArray_wing_nonlinear1(4);
        alphaArray_wing_nonlinear2(2) = alphaArray_wing_nonlinear2(1) + differenceInAlphas;
        alphaArray_wing_nonlinear2(3) = alphaArray_wing_nonlinear2(2) + differenceInAlphas;
        alphaArray_wing_nonlinear2(4) = alphaArray_wing_nonlinear2(3) + differenceInAlphas;
        alphaArray_wing_nonlinear2(5) = alphaArray_wing_nonlinear2(4) + differenceInAlphas;
    end
  
    % Code to fix the CL curve for a clean wing with a 66-206 airfoil I
    % think or maybe its the 65(4) blah blah blah one
    
    % for this compensation to work need to include some checks to make
    % sure we need it
    % we will check the slopes to ensure they are within the appropriate
    % limits to ensure a smooth curve
    
    % Okay going to try to break up the checks by airfoil type hope this
    % works...
    
if step > 1 && isempty(AirfoilSeries) ~= 1
    switch AirfoilSeries
        case 1
        % NACA 4 & 5 Series
        slopeCla1 = (ClaArray_wing_nonlinear1(5) - ClaArray_wing_nonlinear1(4))/(alphaArray_wing_nonlinear1(5) - alphaArray_wing_nonlinear1(4));
        slopeCla2 = (ClaArray_wing_nonlinear2(3) - ClaArray_wing_nonlinear2(2))/(alphaArray_wing_nonlinear2(3) - alphaArray_wing_nonlinear2(2));
       
        if slopeCla1 > .02
            differenceInCLnonlinear1 = ClaArray_wing_nonlinear1(5) - ClaArray_wing_nonlinear1(4);
            ClaArray_wing_nonlinear1(4) = ClaArray_wing_nonlinear1(3) + differenceInCLnonlinear1;
        end

        if slopeCla2 >= 0
            differenceInCLnonlinear2 = ClaArray_wing_nonlinear2(1) - ClaArray_wing_nonlinear2(2);
            ClaArray_wing_nonlinear2(2) = ClaArray_wing_nonlinear2(2) + differenceInCLnonlinear2/1;
            ClaArray_wing_nonlinear2(3) = ClaArray_wing_nonlinear2(3) - differenceInCLnonlinear2/1;
        end
            if length(ClaArray_airfoil) > 10
            alphaArray_wing_nonlinear2(end) = [];
            ClaArray_wing_nonlinear2(end) = [];
            end
        case 2
        % NACA 63 Series
       slopeCla1 = (ClaArray_wing_nonlinear1(5) - ClaArray_wing_nonlinear1(4))/(alphaArray_wing_nonlinear1(5) - alphaArray_wing_nonlinear1(4));
       slopeCla2 = (ClaArray_wing_nonlinear2(3) - ClaArray_wing_nonlinear2(2))/(alphaArray_wing_nonlinear2(3) - alphaArray_wing_nonlinear2(2));
       
        if slopeCla1 > .03
            differenceInCLnonlinear1 = ClaArray_wing_nonlinear1(5) - ClaArray_wing_nonlinear1(4);
            ClaArray_wing_nonlinear1(4) = ClaArray_wing_nonlinear1(3) + differenceInCLnonlinear1;
        end

        if slopeCla2 >= 0
            differenceInCLnonlinear2 = ClaArray_wing_nonlinear2(1) - ClaArray_wing_nonlinear2(2);
            ClaArray_wing_nonlinear2(2) = ClaArray_wing_nonlinear2(2) + differenceInCLnonlinear2/1;
            ClaArray_wing_nonlinear2(3) = ClaArray_wing_nonlinear2(3) - differenceInCLnonlinear2/1;
        end
        alphaArray_wing_nonlinear2(end) = [];
        ClaArray_wing_nonlinear2(end) = [];
        case 3
        % NACA 64 Series
       slopeCla1 = (ClaArray_wing_nonlinear1(5) - ClaArray_wing_nonlinear1(4))/(alphaArray_wing_nonlinear1(5) - alphaArray_wing_nonlinear1(4));
       slopeCla2 = (ClaArray_wing_nonlinear2(3) - ClaArray_wing_nonlinear2(2))/(alphaArray_wing_nonlinear2(3) - alphaArray_wing_nonlinear2(2));
       
        if slopeCla1 > .015
            differenceInCLnonlinear1 = ClaArray_wing_nonlinear1(5) - ClaArray_wing_nonlinear1(4);
            ClaArray_wing_nonlinear1(4) = ClaArray_wing_nonlinear1(3) + differenceInCLnonlinear1;
        end

        if slopeCla2 >= 0
            differenceInCLnonlinear2 = ClaArray_wing_nonlinear2(1) - ClaArray_wing_nonlinear2(2);
            ClaArray_wing_nonlinear2(2) = ClaArray_wing_nonlinear2(2) + differenceInCLnonlinear2/1;
            ClaArray_wing_nonlinear2(3) = ClaArray_wing_nonlinear2(3) - differenceInCLnonlinear2/1;
        end
        alphaArray_wing_nonlinear2(end) = [];
        ClaArray_wing_nonlinear2(end) = [];
        case 4
        % NACA 65 Series
        alphaArray_wing_nonlinear2(end) = [];
        ClaArray_wing_nonlinear2(end) = [];
        case 5
        % NACA 66 Series
       slopeCla1 = (ClaArray_wing_nonlinear1(5) - ClaArray_wing_nonlinear1(4))/(alphaArray_wing_nonlinear1(5) - alphaArray_wing_nonlinear1(4));
       slopeCla2 = (ClaArray_wing_nonlinear2(3) - ClaArray_wing_nonlinear2(2))/(alphaArray_wing_nonlinear2(3) - alphaArray_wing_nonlinear2(2));
       
        if slopeCla1 > .0095
            differenceInCLnonlinear1 = ClaArray_wing_nonlinear1(5) - ClaArray_wing_nonlinear1(4);
            ClaArray_wing_nonlinear1(4) = ClaArray_wing_nonlinear1(3) + differenceInCLnonlinear1;
        end

        if slopeCla2 >= 0
            differenceInCLnonlinear2 = ClaArray_wing_nonlinear2(1) - ClaArray_wing_nonlinear2(2);
            ClaArray_wing_nonlinear2(2) = ClaArray_wing_nonlinear2(2) + differenceInCLnonlinear2/1;
            ClaArray_wing_nonlinear2(3) = ClaArray_wing_nonlinear2(3) - differenceInCLnonlinear2/1;
        end
        alphaArray_wing_nonlinear2(end) = [];
        ClaArray_wing_nonlinear2(end) = [];
    end
end

    
   if step < 5
    figHandles = findobj('type', 'figure');
%     close(figHandles);
    elseif step == 5
    f = figure;
    ax = axes('Parent',f,'Position',[.15 .15 .75 .75]);
    
    % Airfoil Curve
    line(ax,alphaArray_airfoil,ClaArray_airfoil,'linewidth',2);
    
    % Wing Curve
    % 1st line-linear
    alphaArray_wing_linear = [aL_0_wing; aStarA_wing;];
    ClaArray_wing_linear   = [0; CLa_wing*(aStarA_wing-aL_0_wing);];
    line(ax,alphaArray_wing_linear,ClaArray_wing_linear,'linewidth',2,'color','b');
    line(ax,alphaArray_wing_nonlinear1,ClaArray_wing_nonlinear1,'linewidth',2,'color','b');

%     alphaArray_wing_nonlinear2(end) = [];
%     ClaArray_wing_nonlinear2(end) = [];
    line(ax,alphaArray_wing_nonlinear2,ClaArray_wing_nonlinear2,'linewidth',2,'color','b');

    xlabel('Alpha(deg)');
    ylabel('C_L');
    xlim([-5 50]);
    ylim([0 2]);
    grid on   
   end 
end

%--------------------------------------------------------------------------  
%--------------------------------------------------------------------------        
%% Low-AR Wings
    if AR_lowWing == 1
        % Beta for subsonic flight
        beta = sqrt(1-machNumber^2);
        
        % Calculation of (C1+1)*(AR/beta)*cos(LamLE)
        X = (C1+1)*(ARWing/beta)*cosd(LamLE);
        
        % Calculation of (C2+1)*(AR)tan(LamLE)
        Y = (C2 + 1)*(ARWing)*tand(LamLE);

        % Calculation of AR*cos(LamLE)*[1+4*Lam^2]
        Z = ARWing*cosd(LamLE)*(1+4*tp^2);

        % Determination of (CLmax)base
        if deltaY == 0
            CLmax_base = .7031 * X^3 - 2.5625 * X^2 + 2.4125 * X + .77;
        elseif deltaY > 0 && deltaY <= .25
            CLmax_base = .2839 * X^3 - 1.6129 * X^2 + 1.9033 * X + .75;
        elseif deltaY > .25 && deltaY <= .5
            CLmax_base = .0337 * X^5 - .3789 * X^4 + 1.6073 * X^3 - 3.1193 * X^2 + 2.4810 * X + .6209;
        elseif deltaY > .5 && deltaY <= .75
            CLmax_base = 1.0547 * X^3 - 2.9531 * X^2 + 2.5375 * X + .55;
        elseif deltaY > .75 && deltaY <= 1
            CLmax_base = .0261 * X^5 - .2992 * X^4 + 1.3195 * X^3 - 2.7213 * X^2 + 2.3632 * X + .5002;
        elseif deltaY >= 1
            CLmax_base = .0261 * X^5 - .2992 * X^4 + 1.3195 * X^3 - 2.7213 * X^2 + 2.3632 * X + .5002;
            if X >= 1.2 && deltaY >= 1.35
                CLmax_base = -.0221 * X^3 + .2375 * X^2 - .8709 * X + 1.8869;
            end
        end

        % Determination of DeltaCLmax
        if machNumber <= .2
            deltaCLmax = -4E-5 * Y^4 + .0005 * Y^3 + .0037 * Y^2 + .008 * Y -.1108;
        elseif machNumber > .2 && machNumber <= .4
            deltaCLmax = -5E-5 * Y^4 + .0006 * Y^3 + .0016 * Y^2 + .014 * Y - .1119;
        elseif machNumber >= .4
            deltaCLmax = -2E-5 * Y^4 + 9E-5 * Y^3 + .0034 * Y^2 + .0128 * Y - .1121;
        end

        % Determination of (aCLmax)base
        aCLmax_base = .6273 * X^6 - 7.0378 * X^5 + 29.108 * X^4 - 52.633 * X^3 + 36.167 * X^2 - 7.5202 * X + 35.984;

        % Determination of DeltaACLmax(deg)
        if Z == 0
            deltaACLmax = .3347 * Y^2 - 3.8167 * Y + 10.025;
        elseif Z > 0 && Z <= 2
            deltaACLmax = .4375 * Y^2 - 4.0294 * Y + 9.0206;
        elseif Z > 2 && Z <= 3
            deltaACLmax = .6901 * Y^2 - 4.7524 * Y + 7.6596;
        elseif Z > 3 && Z <= 4
            deltaACLmax = .9335 * Y^2 - 5.1663 * Y + 5.2757;
        elseif Z > 4 && Z <= 5
            deltaACLmax = -.0932 * Y^3 + 1.8052 * Y^2 - 6.5444 * Y + 2.8396;
        elseif Z > 5 && Z <= 6
            deltaACLmax = -.4195 * Y^3 + 3.7208 * Y^2 - 8.2242 * Y - .0025;
        elseif Z > 6 && Z <= 7
            deltaACLmax = .1498 * Y^4 - 1.7697 * Y^3 + 7.3501* Y^2 - 10.135 * Y - 2.5009;
        elseif Z > 7 && Z <= 8
            deltaACLmax = .1778 * Y^4 - 1.9718 * Y^3 + 7.6081 * Y^2 - 9.4219 * Y - 3.7593;
        elseif Z > 8 && Z <= 9
            deltaACLmax = .1362 * Y^4 - 1.5323 * Y^3 + 5.9786 * Y^2 - 6.9548 * Y - 5.0091;
        elseif Z > 9 && Z <= 30
            deltaACLmax = .1075 * Y^2 + 1.7122 * Y -8.8739;
        end

        if Y > 4.2
            if machNumber <= .2
                deltaACLmax = -.0078 * Y^3 + .2857 * Y^2 - 1.5402 * Y + 2.1;
            elseif machNumber > .2 && machNumber <= .4 
                deltaACLmax = -.0039 * Y^3 + .1879 * Y^2 - .9566 * Y + 1.0762;
            elseif machNumber > .4 
                deltaACLmax = -.0077 * Y^3 + .2844 * Y^2 - 2.1808 * Y + 4.6524;
            end
        end

        % Wing Sweep [rad]
        LamLE_rad = (LamLE*pi)/180;

        % Maximum Coefficient of Lift
        CLmax_wing = CLmax_base + deltaCLmax;

        % Alpha CLmax(aCLmax)
        alphaCLmax = aCLmax_base + deltaACLmax;
        
        % Wing Lift Curve Slope
%         CLa_wing_rad = (2*pi*ARWing)/(2+sqrt(4+(ARWing^2*beta^2)*(1+((tan(LamLE_rad)^2)/beta^2))));
%         CLa_wing     = (CLa_wing_rad*pi)/180;
        CLa_wing     = CLmax_wing/alphaCLmax;

        % Linear CLa End
        CL_wing_end = CLa_wing*(aClmax_wing-aL_0_wing);
        if CL_wing_end > CLmax_wing
            i = .01;
            for num = 1:100
            alphaIncrement = aStarA_wing + i;
            CL_wing_end = CLa_wing*alphaIncrement;
            i = i + 1;
                if CLmax_wing - CL_wing_end <= .01
                    break
                end
            end
        end
        
        % 2nd line-nonlinear
        alphaArray_wing_nonlinear1 = [aStarA_wing; aClmax_wing;];
        ClaArray_wing_nonlinear1   = [CLa_wing*(aStarA_wing-aL_0_wing); CL_wing_end;];
 
        A   = aStarA_wing;
        B   = alphaCLmax;
        k   = 0;
        num   = 5;
        delta = 0;
        numer = 1;
        denom = num-1;
        check = denom-1;
        alphaArray_wing_nonlinear1 = zeros(1,num);
        ClaArray_wing_nonlinear1   = zeros(1,num);

        for i = 1:num
            if k == 1
                i = num;
            end
            % Beginning of nonlinear curve
            if i == 1
                h = A;
                alphaArray_wing_nonlinear1(i) = h;
                ClaArray_wing_nonlinear1(i)   = CLa_wing*(h-aL_0_wing);
            end
            % Maximum CL value, half of nonlinear curve
            if i == num
                h = B;
                h = alphaCLmax;
                alphaArray_wing_nonlinear1(i) = h;
                ClaArray_wing_nonlinear1(i)   = CLmax_wing;
                break
            end
            % Between start and halfway point of nonlinear curve
            if i >= 2
                for j = 2:num-1
                    % Halfway between start and maximum CL value
                    if j == ceil(num/2) || numer > 1
                        h = (((A+B))/2);
                        value = h;
                        delta = delta*(num/denom);
                    end
                    % Greater than start and less than halfway point between start and
                    % Maximum CL value
                    if j < ceil(num/2)
                        h = (((A+B))/2);
                        hh = (h-A)/(denom/2);
                        value  = hh + alphaArray_wing_nonlinear1(j-1);
                    % Greater than halfway point and less than maximum CL value
                    elseif j > ceil(num/2)
                        h = (((A+B))/2);
                        hh = (h-A)/(denom/2);
                        value  = hh + alphaArray_wing_nonlinear1(j-1);
                        delta  = delta/(num/denom)-.07;
                    end
                alphaArray_wing_nonlinear1(j) = value;
                ClaArray_wing_nonlinear1(j)   = CLa_wing*(value-aL_0_wing)+(delta);
                end
                k = 1;
            end
        end

        if step > 1
            % Smoothes out beginning of nonlinear portion of curve
            if (ClaArray_wing_nonlinear1(5) - ClaArray_wing_nonlinear1(4)) / (alphaArray_wing_nonlinear1(5) - alphaArray_wing_nonlinear1(4)) > .022
                    arrayOfLinspace = linspace(array(3),array(5),50);
                    for i = 1:30
                        ClaArray_wing_nonlinear1(4) = arrayOfLinspace(i);
                        if (ClaArray_wing_nonlinear1(5) - ClaArray_wing_nonlinear1(4)) / (alphaArray_wing_nonlinear1(5) - alphaArray_wing_nonlinear1(4)) < .022
                            break
                        else
                        end
                    end
            end
        end
        
        % Begins calculation of trailing nonlinear portion of curve
        num = 5;
        alphaArray_wing_nonlinear2 = zeros(1,num);
        ClaArray_wing_nonlinear2   = zeros(1,num);
        for i =1:num
            if i == 1
            alphaArray_wing_nonlinear2(i) = alphaCLmax;
            end
            if i ~= 1
            alphaArray_wing_nonlinear2(i) = ceil(alphaCLmax)+i-2;
            end
        end

        % Finds equation of nonlinear curve before stall
        equation = polyfit(alphaArray_wing_nonlinear2,ClaArray_wing_nonlinear1,2);

        % Calculates trailing nonlinear curve
        for i = 1:num
            if i == 1
            alphaArray_wing_nonlinear2(i) = alphaCLmax;
            ClaArray_wing_nonlinear2(i) = ClaArray_wing_nonlinear1(end);
            end
            if i ~= 1
            alphaArray_wing_nonlinear2(i) = ceil(alphaCLmax)+i-2;
            ClaArray_wing_nonlinear2(i) = equation(1) * alphaArray_wing_nonlinear2(i)^2 + equation(2) * alphaArray_wing_nonlinear2(i) + equation(3);
            end
        end

        % Reorganizes trailing nonlinear curve points to ensure smooth transition
        j = num;
        array = ClaArray_wing_nonlinear2;
        for i = 1:num
            if i == 1
            ClaArray_wing_nonlinear2(i) = array(i);
            end
            if i ~= 1
            ClaArray_wing_nonlinear2(i) = array(j);
            j = j - 1;
            end
        end

       if step < 5
        figHandles = findobj('type', 'figure');
%         close(figHandles);
        elseif step == 5
        f = figure;
        ax = axes('Parent',f,'Position',[.15 .15 .75 .75]);
        % Airfoil Curve
        line(ax,alphaArray_airfoil,ClaArray_airfoil,'linewidth',2);

        % Wing Curve
        % 1st line-linear
        alphaArray_wing_linear = [aL_0_wing; aStarA_wing;];
%         alphaArray_wing_linear = [aL_0_wing; alphaCLmax;];
        ClaArray_wing_linear   = [0; CLa_wing*(aStarA_wing-aL_0_wing);];
%         ClaArray_wing_linear   = [0; CLa_wing*(alphaCLmax-aL_0_wing);];
        line(ax,alphaArray_wing_linear,ClaArray_wing_linear,'linewidth',2,'color','b');
        line(ax,alphaArray_wing_nonlinear1,ClaArray_wing_nonlinear1,'linewidth',2,'color','b');

%         alphaArray_wing_nonlinear2(end-1) = [];
        alphaArray_wing_nonlinear2(end) = [];
%         ClaArray_wing_nonlinear2(end-1) = [];
        ClaArray_wing_nonlinear2(end) = [];
        line(ax,alphaArray_wing_nonlinear2,ClaArray_wing_nonlinear2,'linewidth',2,'color','b');

        xlabel('Alpha(deg)');
        ylabel('C_l');
        xlim([-5 50]);
        ylim([0 2]);
        grid on      
       end 
    end
end

%% Flap Calcs
flapChord = .15;
c = .5;
flapAngleDeg = 20;
b = 6;
flapSpan = 2.5;
flapSpanSpace = .5;

% Elevator
% flapChord = 5;
% flapSpan = 35;
% flapSpanSpace = 15;
% flapAngleDeg = 10.;
% height = 15;
% tpVert = .8;
% cVert = 20;


%% Flap Calcs
% Leading Edge Slope
xLE = (b/2)*tand(LamLE);
slopeLE  = (b/2)/xLE;

% Trailing Edge Slope
xTE = c-(xLE+c*tp);
slopeTE = (b/2)/xTE;

% Difference in root chord due to leading edge sweep
deltaXLE = flapSpanSpace/slopeLE;

% Difference in root chord due to taper ratio
deltaXTE = flapSpanSpace/slopeTE;

% Area in front of leading edge
A1 = 1/2*(b/2)*xLE;

% Area behind of trailing edge
A2 = 1/2*(b/2)*xTE;

% Area of of root chord and rudder height
A3 = (c - deltaXLE - deltaXTE)*flapSpan;

% Flapped Wing Area
SWf = A3-(A1+A2);

% Wing Area
SrefWing = (b/2)*c*(1+tp);





% % Leading Edge Slope
% slopeLE = tand(LamLE);
% 
% % Trailing Edge Slope
% % slopeTE = (2*tp*c)/b;
% slopeTE = (2*((tp*c)-c))/b;
% % slopeTE = (2*((tpVert*cVert)-cVert))/height;
% 
% % Point 1
% Point_1_x = flapSpanSpace;
% Point_1_y = slopeTE * Point_1_x;
% 
% % Point 2
% Point_2_x = flapSpan;
% Point_2_y = slopeTE * Point_2_x;
% 
% % Point 3
% Point_3_x = flapSpan;
% Point_3_y = c + (slopeLE * Point_3_x);
% 
% % Point 4
% Point_4_x = flapSpanSpace;
% Point_4_y = c + (slopeLE * Point_4_x);
% 
% % Flapped Wing Area
% % SWf = (Point_2_x - Point_1_x) * (Point_4_y - Point_1_y) - ((.5)*(c)*(slopeLE*c)) - ((.5)*(c)*(slopeTE*c));
% SWf = (Point_2_x - Point_1_x) * (flapChord) - ((.5)*(c)*(slopeLE*c)) - ((.5)*(c)*(slopeTE*c));
% % SWf = 197.2918;
% 
% % Wing Area
% SrefWing = (b/2)*c*(1+tp);
% % Vertical Tail Area
% SrefVert = (height/2)*cVert*(1+tpVert);

Cf_C = flapChord/c;

ClaArray_airfoil_flaps = ClaArray_airfoil;

if flapChord/c <= .1
    Kprimef = -9E-6*flapAngleDeg^2 - .0149*flapAngleDeg + 1.1913;
    if flapAngleDeg > 32.5
        Kprimef = 1E-4*flapAngleDeg^2 - .0139*flapAngleDeg + 1.0461;
    end
elseif flapChord/c > .1 && flapChord/c <= .15
    Kprimef = -.0001*flapAngleDeg^2 - 7.0114*flapAngleDeg + 1.165;
    if flapAngleDeg > 30
        Kprimef = .0001*flapAngleDeg^2 - .0163*flapAngleDeg + 1.0773;
    end
elseif flapChord/c > .15 && flapChord/c <= .2
    Kprimef = -.0006*flapAngleDeg^2 + .0044*flapAngleDeg + 1.043;
    if flapAngleDeg > 27
        Kprimef = .0001*flapAngleDeg - .0152*flapAngleDeg + 1.0285;
    end
elseif flapChord/c > .2 && flapChord/c <= .25
    Kprimef = -.0008*flapAngleDeg^2 + .009*flapAngleDeg + 1.0097;
    if flapAngleDeg > 26
        Kprimef = -5E-6*flapAngleDeg^3 + .0008*flapAngleDeg^2 - .0432*flapAngleDeg + 1.3987;
    end
elseif flapChord/c > .25 && flapChord/c <= .3
    Kprimef = -.0015*flapAngleDeg^2 + .0278*flapAngleDeg + .8826;
    if flapAngleDeg > 20.5
        Kprimef = -4E-6*flapAngleDeg^3 + .0007*flapAngleDeg^2 - .0403*flapAngleDeg + 1.3184;
    end
elseif flapChord/c > .3 && flapChord/c <= .4
    Kprimef = -.0024*flapAngleDeg^2 + .0502*flapAngleDeg + .7351;
    if flapAngleDeg > 19.5
        Kprimef = -.0167*flapAngleDeg + 1.0667;
    elseif flapAngleDeg > 28
        Kprimef = 8E-5*flapAngleDeg^2 - .0119*flapAngleDeg + .8713;
    end
elseif flapChord/c > .4
    Kprimef = -.0021*flapAngleDeg^2 + .0308*flapAngleDeg + .9116;
    if flapAngleDeg > 20
        Kprimef = -.02*flapAngleDeg + 1.1;
    elseif flapAngleDeg > 25
        Kprimef = .0001*flapAngleDeg^2 - .015*flapAngleDeg + .9024;
    end
end

if t_c >= .15
    dCl_dDeltaF = -8.958*Cf_C^2 + 13.791*Cf_C + 1.2325;
elseif t_c < .15 && t_c >= .12
    dCl_dDeltaF = -9.5243*Cf_C^2 + 13.783*Cf_C + 1.2401;
elseif t_c < .12 && t_c >= .1
    dCl_dDeltaF = -10.092*Cf_C^2 + 13.807*Cf_C + 1.2379;
elseif t_c < .1 && t_c >= .08
    dCl_dDeltaF = -11.1*Cf_C^2 + 14.053*Cf_C + 1.2271;
elseif t_c < .08 && t_c >= .06
    dCl_dDeltaF = -10.547*Cf_C^2 + 13.441*Cf_C + 1.2785;
elseif t_c < .06 && t_c >= .04
    dCl_dDeltaF = -9.416*Cf_C^2 + 12.573*Cf_C + 1.3349;
elseif t_c < .04 && t_c >= .02
    dCl_dDeltaF = -9.8365*Cf_C^2 + 12.58*Cf_C + 1.3383;
elseif t_c < .02 && t_c >= 0
    dCl_dDeltaF = -9.9429*Cf_C^2 + 12.6*Cf_C + 1.2718;
end

Cla_airfoil_rad = 1/(((1/Cla_airfoil)*pi())/180);

% flapAngleRad = (flapAngleDeg*pi())/180;

% Nicolai
deltaAlphaZeroLift_deg = -dCl_dDeltaF*(1/Cla_airfoil_rad)*(flapAngleDeg)*Kprimef;

deltaAlphaStall = -.0012*flapAngleDeg^2 - .0239*flapAngleDeg - .019;

alphaArray_airfoil_flaps = zeros(size(alphaArray_airfoil(1)));

% Add deltaAlphaZeroLift to array of alpha values
for count = 1:length(alphaArray_airfoil)
    alphaArray_airfoil_flaps(count) = alphaArray_airfoil(count) + deltaAlphaZeroLift_deg;
%     alphaArray_airfoil_flaps(count) = alphaArray_airfoil(count) + -5;
end

% Find alpha at Clmax without flaps
Clmax_clean = max(ClaArray_airfoil);
for num1 = 1:length(alphaArray_airfoil) 
    if ClaArray_airfoil(num1) == Clmax_clean
        Clmax_clean_point = num1;
        break
    end
end

% Find alpha at Clmax with flaps
ClaArray_airfoil_flaps = Cla_airfoil*(alphaArray_airfoil_flaps-deltaAlphaZeroLift_deg);
Clmax_flaps = ClaArray_airfoil_flaps(num1);

for num2 = 1:length(alphaArray_airfoil_flaps)
    if ClaArray_airfoil_flaps(num2) == Clmax_flaps
        Clmax_flaps_point = num2;
        break
    end
end
alphaStallclean = Clmax_clean/Cla_airfoil;
alphaStallFlaps = Clmax_flaps/Cla_airfoil;

% Delta CLmax for Airfoil
if abs(alphaArray_airfoil(num1) - alphaArray_airfoil_flaps(num2)) ~= abs(deltaAlphaStall)
    for num3 = 1:10000
        if alphaStallFlaps < alphaStallclean
            Clmax_flaps = Clmax_flaps + .001;
        elseif alphaStallFlaps > alphaStallclean
            Clmax_flaps = Clmax_flaps - .001;
        end
    alphaStallFlaps = (Clmax_flaps/Cla_airfoil)+deltaAlphaZeroLift_deg;
        if abs(alphaStallclean - alphaStallFlaps) >= abs(deltaAlphaStall)-.005 &&...
                abs(alphaStallclean - alphaStallFlaps) <= abs(deltaAlphaStall)+.005
            break
        end
    end
end

clmaxFlapsdeduction = 0;
stop = 0;
for run = 1:15
% Delta Clmax for airfoil    
deltaClmax_Airfoil = Clmax_flaps - Clmax_clean;
    
% Before I finish the high lift calcs based on nicolai, need to compare
% data to similar calcs by Raymer.
% Raymer is dumb, not nearly as extensive as Nicolai, brandt as well.

% Sweep at Quarter Chord (x=0 at leading edge, x=1 at trailing edge)
xChordStationFlaps = .25;

LamQuarterChord_rad = atan(tan(LamLE_rad)-((4*(xChordStationFlaps)*(1-tp))/(ARWing*(1+tp))));

% Planform correction for TE flaps
LamQuarterChord_deg = (LamQuarterChord_rad*180)/pi();
Kdelta = (1-.08*cosd(LamQuarterChord_deg)^2)*(cosd(LamQuarterChord_deg)^(3/4));

% Delta CLmax for Wing
deltaCLmax_wing = deltaClmax_Airfoil*((SWf)/(SrefWing))*Kdelta;
aStarA_wing_Flaps = aStarA_wing;
    
    k     = 0;
    delta = 0;
    if AR_highWing == 1
        CLmax_wing = CLmax_Clmax*Clmax_airfoil;
    elseif AR_lowWing == 1
        CLmax_wing = CLmax_base + deltaCLmax;
    end
    aL_0_wing_Flaps = aL_0_wing + deltaAlphaZeroLift_deg;
    
    if run > 1
         if ClaArray_wing_nonlinear1_Flaps(2) - ClaArray_wing_nonlinear1_Flaps(1)/alphaArray_wing_nonlinear1_Flaps(2) - alphaArray_wing_nonlinear1_Flaps(1) < 0
             aStarA_wing_Flaps = aStarA_wing_Flaps - 1;
         end
    end

    alphaArray_wing_linear_Flaps = [aL_0_wing_Flaps; aStarA_wing_Flaps;];
    ClaArray_wing_linear_Flaps   = [0; CLa_wing*(aStarA_wing_Flaps-aL_0_wing_Flaps);];
    
    A   = aStarA_wing_Flaps;
    B   = alphaCLmax;
    CLmax_wing = CLmax_wing + deltaCLmax_wing;
    num   = 5;
    numer = 1;
    denom = num-1;
    check = denom-1;
    alphaArray_wing_nonlinear1_Flaps = zeros(1,num);
    ClaArray_wing_nonlinear1_Flaps   = zeros(1,num);

    for i = 1:num
        if k == 1
            i = num;
        end
        % Beginning of nonlinear curve
        if i == 1
            h = A;
            alphaArray_wing_nonlinear1_Flaps(i) = h;
            ClaArray_wing_nonlinear1_Flaps(i)   = CLa_wing*(h-aL_0_wing_Flaps);
        end
        % Maximum CL value, half of nonlinear curve
        if i == num
            h = alphaCLmax;
            alphaArray_wing_nonlinear1_Flaps(i) = h;
            ClaArray_wing_nonlinear1_Flaps(i)   = CLmax_wing;
            break
        end
        % Between start and halfway point of nonlinear curve
        if i >= 2
            for j = 2:num-1
                % Halfway between start and maximum CL value
                if j == ceil(num/2) || numer > 1
                    h = (((A+B))/2);
                    value = h;
                    delta = delta*(num/denom);
                end
                % Greater than start and less than halfway point between start and
                % Maximum CL value
                if j < ceil(num/2)
                    h = (((A+B))/2);
                    hh = (h-A)/(denom/2);
                    value  = hh + alphaArray_wing_nonlinear1_Flaps(j-1);
                % Greater than halfway point and less than maximum CL value
                elseif j > ceil(num/2)
                    h = (((A+B))/2);
                    hh = (h-A)/(denom/2);
                    value  = hh + alphaArray_wing_nonlinear1_Flaps(j-1);
                    delta  = delta/(num/denom)-.07;
                end
            alphaArray_wing_nonlinear1_Flaps(j) = value;
            ClaArray_wing_nonlinear1_Flaps(j)   = CLa_wing*(value-aL_0_wing_Flaps)+(delta);
            end
            k = 1;
        end
    end 

    % Fixes first part of nonlinear curve if needed
    if max(ClaArray_wing_nonlinear1_Flaps) > CLmax_wing
        if ClaArray_wing_nonlinear1_Flaps(4) > CLmax_wing
%             Point4 = ClaArray_wing_nonlinear1_Flaps(4);
            Point4A = ClaArray_wing_nonlinear1_Flaps(4) - CLmax_wing + .005;
            Point4 = ClaArray_wing_nonlinear1_Flaps(4) - Point4A;
        else
            Point4 = ClaArray_wing_nonlinear1_Flaps(4);
        end
        
        if ClaArray_wing_nonlinear1_Flaps(3) > CLmax_wing
%             Point3 = ClaArray_wing_nonlinear1_Flaps(3);
            Point3A = ClaArray_wing_nonlinear1_Flaps(3) - CLmax_wing + .01;
            Point3 = ClaArray_wing_nonlinear1_Flaps(3) - Point3A;
        else
            Point3 = ClaArray_wing_nonlinear1_Flaps(3);
        end
        
        if ClaArray_wing_nonlinear1_Flaps(2) > CLmax_wing
%             Point2 = ClaArray_wing_nonlinear1_Flaps(2);
            Point2A = ClaArray_wing_nonlinear1_Flaps(2) - CLmax_wing + .03;
            Point2 = ClaArray_wing_nonlinear1_Flaps(2) - Point2A;
        else
            Point2 = ClaArray_wing_nonlinear1_Flaps(2);
        end
        
        if ClaArray_wing_nonlinear1_Flaps(1) > CLmax_wing
%             Point1 = ClaArray_wing_nonlinear1_Flaps(1);
            Point1A = ClaArray_wing_nonlinear1_Flaps(1) - CLmax_wing + .05;
            Point1 =  ClaArray_wing_nonlinear1_Flaps(1) - Point1A;
        else 
            Point1 = CLa_wing*(aStarA_wing_Flaps-aL_0_wing_Flaps);
            
            % Smoothing out transition between linear-nonlinear points.
            aStarA_test = aStarA_wing_Flaps;
            slopePoint1 = CLa_wing*(aStarA_wing_Flaps-aL_0_wing_Flaps);
            slopePoint2 = Point2;
            slopePoint3 = aStarA_wing_Flaps;
            slopePoint4 = alphaArray_wing_nonlinear1_Flaps(2);
            slopeCheck = (slopePoint2-slopePoint1)/(slopePoint4-slopePoint3);
            
            if slopeCheck < 0
                for i = 1:50
                    aStarA_test = aStarA_test - .1;
                    Point1 = CLa_wing*(aStarA_test - aL_0_wing_Flaps);
                    slopePoint1 = Point1;
                    slopeCheck = (slopePoint2-slopePoint1)/(slopePoint4-slopePoint3);
                    if slopeCheck < .05 && slopeCheck > .03
                        break
                    end
                end
            end
        end
        
        ClaArray_wing_nonlinear1_Flaps = [Point1 Point2 Point3 Point4 CLmax_wing];
    end     

    array_Flaps = ClaArray_wing_nonlinear1_Flaps;
    if step > 1
        % Smoothes out beginning of nonlinear portion of curve
        if (ClaArray_wing_nonlinear1_Flaps(5) - ClaArray_wing_nonlinear1_Flaps(4)) /...
                (alphaArray_wing_nonlinear1_Flaps(5) - alphaArray_wing_nonlinear1_Flaps(4)) > .022
                beta = linspace(array_Flaps(3),array_Flaps(5),50);
            for i = 1:30
                ClaArray_wing_nonlinear1_Flaps(4) = beta(i);
                if (ClaArray_wing_nonlinear1_Flaps(5) - ClaArray_wing_nonlinear1_Flaps(4)) /...
                        (alphaArray_wing_nonlinear1_Flaps(5) - alphaArray_wing_nonlinear1_Flaps(4)) < .022
                    break
                else
                end
            end
        end
    end
    
    % Final check of high lift devices curve
    % Need to correct curve for low aspect ratio because the CLmax is
    % too high because it is based on a high aspect ratio assumption.
    differenceInCleanNFlapCL = ClaArray_wing_nonlinear1_Flaps(3)-ClaArray_wing_nonlinear1(3);
    if stop == 0
        if deltaCLmax_wing > differenceInCleanNFlapCL
            for i = 1:500
                % Delta Clmax for airfoil    
                deltaClmax_Airfoil = Clmax_flaps - Clmax_clean;

                % Delta CLmax for Wing
                deltaCLmax_wing = deltaClmax_Airfoil*((2*SWf)/(2*SrefWing))*Kdelta;

                clmaxFlapsdeduction = clmaxFlapsdeduction + .001;

                Clmax_flaps = Clmax_flaps - clmaxFlapsdeduction;
                if abs(differenceInCleanNFlapCL - deltaCLmax_wing) <= .015
                    stop = 1;
                    break
                end
            end
          elseif differenceInCleanNFlapCL > deltaCLmax_wing && deltaCLmax_wing > 0
            for i = 1:500
                % Delta Clmax for airfoil    
                deltaClmax_Airfoil = Clmax_flaps - Clmax_clean;

                % Delta CLmax for Vertical Tail
                deltaCLmax_wing = deltaClmax_Airfoil*((2*SWf)/(2*SrefWing))*Kdelta;

                clmaxFlapsdeduction = clmaxFlapsdeduction - .001;

                Clmax_flaps = Clmax_flaps - clmaxFlapsdeduction;
                if abs(differenceInCleanNFlapCL - deltaCLmax_wing) <= .015
                    stop = 1;
                    break
                end
            end
        end
    end
end   
    
    % Begins calculation of trailing nonlinear portion of curve
    num = 5;
    alphaArray_wing_nonlinear2_Flaps = zeros(1,num);
    ClaArray_wing_nonlinear2_Flaps   = zeros(1,num);
    for i = 1:num
        if i == 1
        alphaArray_wing_nonlinear2_Flaps(i) = alphaCLmax;
        end
        if i ~= 1
        alphaArray_wing_nonlinear2_Flaps(i) = ceil(alphaCLmax)+i-2;
        end
    end

    % Finds equation of nonlinear curve before stall
    equation = polyfit(alphaArray_wing_nonlinear2_Flaps,ClaArray_wing_nonlinear1_Flaps,2);

    % Calculates trailing nonlinear curve
    for i = 1:num
        if i == 1
        alphaArray_wing_nonlinear2_Flaps(i) = alphaCLmax;
        ClaArray_wing_nonlinear2_Flaps(i) = ClaArray_wing_nonlinear1_Flaps(end);
        end
        if i ~= 1
        alphaArray_wing_nonlinear2_Flaps(i) = ceil(alphaCLmax)+i-2;
        ClaArray_wing_nonlinear2_Flaps(i) = equation(1) * alphaArray_wing_nonlinear2_Flaps(i)^2 + equation(2) * alphaArray_wing_nonlinear2_Flaps(i) + equation(3);
            if ClaArray_wing_nonlinear2_Flaps(i) > CLmax_wing
                differenceInCLFlaps = abs(ClaArray_wing_nonlinear2_Flaps(4) - ClaArray_wing_nonlinear2_Flaps(5));
                ClaArray_wing_nonlinear2_Flaps(i) = CLmax_wing;
            end
        end
    end
    
    % Reorganizes trailing nonlinear curve points to ensure smooth transition
    ClaArray_wing_nonlinear2_Flaps = sort(ClaArray_wing_nonlinear2_Flaps,'descend');
    
    % Final fix for trailing edge of curve for high aspect ratio wings
    if AR_highWing == 1
    differenceInCLFlaps = ClaArray_wing_nonlinear2_Flaps(2) - ClaArray_wing_nonlinear2_Flaps(3);
    ClaArray_wing_nonlinear2_Flaps(4) = ClaArray_wing_nonlinear2_Flaps(4) - differenceInCLFlaps;
    end

    % code from MPAC mod
    %-----------------------------------------------------------------
    alphaArray_wing_linear_Flaps = [aL_0_wing_Flaps; aStarA_wing_Flaps;];
    ClaArray_wing_linear_Flaps   = [0; CLa_wing*(aStarA_wing_Flaps-aL_0_wing_Flaps);];

    % Need to ensure the slope of the linear curve is kept constant
    slopeLinearCurve = (ClaArray_wing_linear_Flaps(2)-ClaArray_wing_linear_Flaps(1))/(alphaArray_wing_linear_Flaps(2)-alphaArray_wing_linear_Flaps(1));
 
    % Check when ClaArray_wing_linear_Flaps(2) is less than
    % ClaArray_wing_nonlinear_Flaps(1) 
    if ClaArray_wing_linear_Flaps(2) > ClaArray_wing_nonlinear1_Flaps(1)
        for i = 1:500
            ClaArray_wing_linear_Flaps(2) = ClaArray_wing_linear_Flaps(2) - .5;
            if ClaArray_wing_linear_Flaps(2) < ClaArray_wing_nonlinear1_Flaps(1) + .05 
                break
            end
        end
    end
    
    alphaArray_wing_linear_Flaps(2) = (ClaArray_wing_linear_Flaps(2)-ClaArray_wing_linear_Flaps(1))/slopeLinearCurve+alphaArray_wing_linear_Flaps(1);
    
    % Combiines the linear, nonlinear1, and nonlinear2 alpha arrays into one
    % alpha array
    alphaArray_wing_nonlinear1_Flaps_end = alphaArray_wing_nonlinear1_Flaps;
    alphaArray_wing_nonlinear2_Flaps_end = alphaArray_wing_nonlinear2_Flaps;
    alphaArray_wing_nonlinear1_Flaps_end(1) = [];
    alphaArray_wing_nonlinear2_Flaps_end(1) = [];
    alphaArray_wing_Flaps_combined = zeros(1,9);
        for i = 1:2
            alphaArray_wing_Flaps_combined(i) = alphaArray_wing_linear_Flaps(i);
        end
        for j = 3:6
            alphaArray_wing_Flaps_combined(j) = alphaArray_wing_nonlinear1_Flaps_end(j-2);
        end
        for k = 7:9
            alphaArray_wing_Flaps_combined(k) = alphaArray_wing_nonlinear2_Flaps_end(k-6);
        end

    % Combined the  the linear, nonlinear1, and nonlinear2 Cl arrays into one
    % Cl array
    ClaArray_wing_nonlinear1_Flaps_end = ClaArray_wing_nonlinear1_Flaps;
    ClaArray_wing_nonlinear2_Flaps_end = ClaArray_wing_nonlinear2_Flaps;
    ClaArray_wing_nonlinear1_Flaps_end(1) = [];
    ClaArray_wing_nonlinear2_Flaps_end(1) = [];
    ClaArray_wing_Flaps_combined = zeros(1,9);
        for i = 1:2
            ClaArray_wing_Flaps_combined(i) = ClaArray_wing_linear_Flaps(i);
        end
        for j = 3:6
            ClaArray_wing_Flaps_combined(j) = ClaArray_wing_nonlinear1_Flaps_end(j-2);
        end
        for k = 7:9
            ClaArray_wing_Flaps_combined(k) = ClaArray_wing_nonlinear2_Flaps_end(k-6);
        end
        
        % Final check of high lift devices curve
        % Need to correct curve for low aspect ratio because the CLmax is
        % too high because it is based on a high aspect ratio assumption.
        
%         slopeLowARlinear = (ClaArray_wing_linear_Flaps(2)-ClaArray_wing_linear_Flaps(1))/(alphaArray_wing_linear_Flaps(2)-alphaArray_wing_linear_Flaps(1));
%         slopeLowARnonlinear = (ClaArray_wing_nonlinear1_Flaps(4)-ClaArray_wing_nonlinear1_Flaps(3))/(alphaArray_wing_nonlinear1_Flaps(4)-alphaArray_wing_nonlinear1_Flaps(3));
%         if slopeLowARnonlinear > slopeLowARlinear
%             for i = 1:500
%                 Clmax_flaps = Clmax-.1;
%                 if ClaArray_wing_linear_Flaps(2) < ClaArray_wing_nonlinear1_Flaps(1) + .05 
%                     break
%                 end
%             end
%         end
        
    %----------------------------------------------------------------------
    
   if step < 5
    figHandles = findobj('type', 'figure');
    close(figHandles);
    elseif step == 5
    f = figure;
    ax = axes('Parent',f,'Position',[.15 .15 .75 .75]);
    
    % Airfoil Curve
%     line(ax,alphaArray_airfoil,ClaArray_airfoil,'linewidth',2);
    
    % Wing Curve
    % 1st line-linear
    alphaArray_wing_linear = [aL_0_wing; aStarA_wing;];
    ClaArray_wing_linear   = [0; CLa_wing*(aStarA_wing-aL_0_wing);];
    line(ax,alphaArray_wing_linear,ClaArray_wing_linear,'linewidth',2,'color','b');
    line(ax,alphaArray_wing_nonlinear1,ClaArray_wing_nonlinear1,'linewidth',2,'color','b');

%     alphaArray_wing_nonlinear2(end) = [];
%     ClaArray_wing_nonlinear2(end) = [];
    line(ax,alphaArray_wing_nonlinear2,ClaArray_wing_nonlinear2,'linewidth',2,'color','b');

    % Wing Curve with Flaps
    % 1st line-linear
%     alphaArray_wing_linear_Flaps = [aL_0_wing_Flaps; aStarA_wing_Flaps;];
%     ClaArray_wing_linear_Flaps   = [0; CLa_wing*(aStarA_wing_Flaps-aL_0_wing_Flaps);];
% 
%     if ClaArray_wing_linear_Flaps(2) > ClaArray_wing_nonlinear1_Flaps(1)
%         ClaArray_wing_linear_Flaps(2) = ClaArray_wing_nonlinear1_Flaps(1);
%     end
%     
%     line(ax,alphaArray_wing_linear_Flaps,ClaArray_wing_linear_Flaps,'linewidth',2,'color','r');
%     line(ax,alphaArray_wing_nonlinear1_Flaps,ClaArray_wing_nonlinear1_Flaps,'linewidth',2,'color','r');
% 
%     alphaArray_wing_nonlinear2_Flaps(end) = [];
%     ClaArray_wing_nonlinear2_Flaps(end) = [];
%     line(ax,alphaArray_wing_nonlinear2_Flaps,ClaArray_wing_nonlinear2_Flaps,'linewidth',2,'color','r');

        
    % Wing Curve with Flaps
    line(ax,alphaArray_wing_Flaps_combined,ClaArray_wing_Flaps_combined,'linewidth',2,'color','r');
    
    xlabel('Alpha(deg)');
    ylabel('C_L');
    xlim([-15 50]);
    ylim([0 2.2]);
    grid on   
   end

%%
%--------------------------------------------------------------------------

% % CLAstarA_wing = CLa_wing*aStarA_airfoil;
% 
% % plot(alphaArray_airfoil,ClaArray_airfoil,'linewidth',2)
% f = figure;
% ax = axes('Parent',f,'Position',[.15 .15 .75 .75]);
% 
% % Airfoil Curve
% line(ax,alphaArray_airfoil,ClaArray_airfoil,'linewidth',2);
% 
%     % Conversion of Cl vs. alpha plot from 2D to 3D 
%     % Wing Curve
%     % 1st line-linear
%     alphaArray_wing_linear = [aL_0_wing; aStarA_wing;];
%     ClaArray_wing_linear   = [0; CLa_wing*(aStarA_wing-aL_0_wing);];
%     line(ax,alphaArray_wing_linear,ClaArray_wing_linear,'linewidth',2,'color','b');
%     
%     % OKAYYYYYYY!!!!!!!!!!!
%     % NEED TO ONLY DO ALL OF THIS WEIRD EXTRA CALC CRAP FOR LOW-AR WINGS
%     % NOT HIGH-AR WINGS!!!
%     
%     
%     % OKAY I HAVE FOUND THE PROBLEM OR AT LEAST PART OF IT!!!!!!!!!!!!!
%     % So I create the lines by determining the slope of the curve and then
%     % determine the nonlinear stalling portions after that. But this
%     % approach doesn't work for low aspect ratio because the slope is so
%     % different and what is happening is that the calculated Clmax from the
%     % Cla is higher than the actual Clmax from the empirical methods from
%     % the book.
%     
%     % Therefore I need to rewrite the nonlinear portions of the code to
%     % account for the difference between the high-AR and low-AR wings.
%     
% 
%     % Linear CLa End
%     CL_wing_end = CLa_wing*(aClmax_wing-aL_0_wing);
%     if CL_wing_end > CLmax_wing
%         i = .01;
%         for num = 1:100
%         alphaIncrement = aStarA_wing + i;
%         CL_wing_end = CLa_wing*alphaIncrement;
%         i = i + 1;
%             if CLmax_wing - CL_wing_end <= .01
%                 break
%             end
%         end
%     end
%     
%     % 2nd line-nonlinear
%     alphaArray_wing_nonlinear1 = [aStarA_wing; aClmax_wing;];
% %     ClaArray_wing_nonlinear1   = [CLa_wing*(aStarA_wing-aL_0_wing); CLa_wing*(aClmax_wing-aL_0_wing);];
%     ClaArray_wing_nonlinear1   = [CLa_wing*(aStarA_wing-aL_0_wing); CL_wing_end;];
% % 
%     num = 5;
% %     A   = aStarA_wing;
%     A   = 6;
% %     B   = alphaCLmax;
%     B   = 14;
% 
%     % Need to create a loop that determines the optimal distance between
%     % the second to last and last CL values.
%     
%     if ClaArray_wing_nonlinear1(end) - ClaArray_wing_nonlinear1(end-1) < .01 ||...
%             ClaArray_wing_nonlinear1(end) - ClaArray_wing_nonlinear1(end-1) > .02
%     if step >  1   
%     inc = 1;
%         for i = 1:10000
%             A = A + inc;
%             B = B + inc;
%             if ClaArray_wing_nonlinear1(end) - ClaArray_wing_nonlinear1(end-1) >= .01 ||...
%                     ClaArray_wing_nonlinear1(end) - ClaArray_wing_nonlinear1(end-1) <= .02
%                 break
%             end
%             inc = inc + 1;
%         end
%     end
%     end
%     
%     % If sweep is high need to use different analyses
% %     if LamLE >= 36
% %         A   = aStarA_wing;
% %         B   = alphaCLmax;
% %     end
% 
%     k   = 0;
%     % delta  = .095;
%     delta = 0;
%     numer = 1;
%     denom = num-1;
%     check = denom-1;
%     alphaArray_wing_nonlinear1 = zeros(1,num);
%     ClaArray_wing_nonlinear1   = zeros(1,num);
% 
%     for i = 1:num
%         if k == 1
%             i = num;
%         end
%         % Beginning of nonlinear curve
%         if i == 1
%             h = A;
%             alphaArray_wing_nonlinear1(i) = h;
%             ClaArray_wing_nonlinear1(i)   = CLa_wing*(h-aL_0_wing);
%         end
%         % Maximum CL value, half of nonlinear curve
%         if i == num
%             h = B;
%             h = alphaCLmax;
%             alphaArray_wing_nonlinear1(i) = h;
%             ClaArray_wing_nonlinear1(i)   = CLmax_wing;
%             break
%         end
%         % Between start and halfway point of nonlinear curve
%         if i >= 2
%             for j = 2:num-1
%                 % Halfway between start and maximum CL value
%                 if j == ceil(num/2) || numer > 1
%                     h = (((A+B))/2);
%                     value = h;
%                     delta = delta*(num/denom);
%                 end
%                 % Greater than start and less than halfway point between start and
%                 % Maximum CL value
%                 if j < ceil(num/2)
%                     h = (((A+B))/2);
%                     hh = (h-A)/(denom/2);
%                     value  = hh + alphaArray_wing_nonlinear1(j-1);
%                 % Greater than halfway point and less than maximum CL value
%                 elseif j > ceil(num/2)
%                     h = (((A+B))/2);
%                     hh = (h-A)/(denom/2);
%                     value  = hh + alphaArray_wing_nonlinear1(j-1);
%                     delta  = delta/(num/denom)-.07;
%                 end
%             alphaArray_wing_nonlinear1(j) = value;
%             ClaArray_wing_nonlinear1(j)   = CLa_wing*(value-aL_0_wing)+(delta);
%             end
%             k = 1;
%         end
%     end
% 
%     if step > 1
%         % Smoothes out beginning of nonlinear portion of curve
%         if (ClaArray_wing_nonlinear1(5) - ClaArray_wing_nonlinear1(4)) / (alphaArray_wing_nonlinear1(5) - alphaArray_wing_nonlinear1(4)) > .022
%                 beta = linspace(array(3),array(5),50);
%                 for i = 1:30
%                     ClaArray_wing_nonlinear1(4) = beta(i);
%                     if (ClaArray_wing_nonlinear1(5) - ClaArray_wing_nonlinear1(4)) / (alphaArray_wing_nonlinear1(5) - alphaArray_wing_nonlinear1(4)) < .022
%                         break
%                     else
%                     end
%                 end
%         end
%     end
% 
%     line(ax,alphaArray_wing_nonlinear1,ClaArray_wing_nonlinear1,'linewidth',2,'color','b');
% 
%     % Beegins calculation of trailing nonlinear portion of curve
%     alpha = 5;
%     num = 5;
%     alphaArray_wing_nonlinear2 = zeros(1,num);
%     ClaArray_wing_nonlinear2   = zeros(1,num);
%     for i =1:num
%         if i == 1
%         alphaArray_wing_nonlinear2(i) = alphaCLmax;
%         end
%         if i ~= 1
%         alphaArray_wing_nonlinear2(i) = ceil(alphaCLmax)+i-2;
%         end
%     end
% 
%     % Finds equation of nonlinear curve before stall
%     equation = polyfit(alphaArray_wing_nonlinear2,ClaArray_wing_nonlinear1,2);
% 
%     % Calculates trailing nonlinear curve
%     for i = 1:num
%         if i == 1
%         alphaArray_wing_nonlinear2(i) = alphaCLmax;
%         ClaArray_wing_nonlinear2(i) = ClaArray_wing_nonlinear1(end);
%         end
%         if i ~= 1
%         alphaArray_wing_nonlinear2(i) = ceil(alphaCLmax)+i-2;
%         ClaArray_wing_nonlinear2(i) = equation(1) * alphaArray_wing_nonlinear2(i)^2 + equation(2) * alphaArray_wing_nonlinear2(i) + equation(3);
%         end
%     end
% 
%     % Reorganizes trailing nonlinear curve points to ensure smooth transition
%     j = num;
%     array = ClaArray_wing_nonlinear2;
%     for i = 1:num
%         if i == 1
%         ClaArray_wing_nonlinear2(i) = array(i);
%         end
%         if i ~= 1
%         ClaArray_wing_nonlinear2(i) = array(j);
%         j = j - 1;
%         end
%     end
%     
% %    if step < 5
% %     figHandles = findobj('type', 'figure');
% %     close(figHandles);
% %     elseif step == 5
% %    end 
%     
% % end
% % % plot(alphaArray_airfoil,ClaArray_airfoil,'linewidth',2)
% % f = figure;
% % ax = axes('Parent',f,'Position',[.15 .15 .75 .75]);
% % 
% % % Airfoil Curve
% % line(ax,alphaArray_airfoil,ClaArray_airfoil,'linewidth',2);
% % 
% % line(ax,alphaArray_wing_nonlinear1,ClaArray_wing_nonlinear1,'linewidth',2,'color','b');
% 
% alphaArray_wing_nonlinear2(end) = [];
% ClaArray_wing_nonlinear2(end) = [];
% line(ax,alphaArray_wing_nonlinear2,ClaArray_wing_nonlinear2,'linewidth',2,'color','b');
% 
% xlabel('Alpha(deg)');
% ylabel('C_l');
% xlim([-5 50]);
% ylim([0 2]);
% grid on


