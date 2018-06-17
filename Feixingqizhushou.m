function varargout = Feixingqizhushou(varargin)
% FEIXINGQIZHUSHOU MATLAB code for Feixingqizhushou.fig
%      FEIXINGQIZHUSHOU, by itself, creates a new FEIXINGQIZHUSHOU or raises the existing
%      singleton*.
%
%      H = FEIXINGQIZHUSHOU returns the handle to a new FEIXINGQIZHUSHOU or the handle to
%      the existing singleton*.
%
%      FEIXINGQIZHUSHOU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FEIXINGQIZHUSHOU.M with the given input arguments.
%
%      FEIXINGQIZHUSHOU('Property','Value',...) creates a new FEIXINGQIZHUSHOU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Feixingqizhushou_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Feixingqizhushou_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Feixingqizhushou

% Last Modified by GUIDE v2.5 14-Apr-2016 14:35:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Feixingqizhushou_OpeningFcn, ...
    'gui_OutputFcn',  @Feixingqizhushou_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Feixingqizhushou is made visible.
function Feixingqizhushou_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Feixingqizhushou (see VARARGIN)

% Choose default command line output for Feixingqizhushou
handles.output = hObject;
%handles.a = 123;


%��ʼ���ӽ�
handles.az = 280;
handles.ei = 25;
%��ʼ��slider
set(handles.slider1,'value',handles.az);
set(handles.slider2,'value',handles.ei);
%��ʼ���߽�
handles.qifei = 0;
handles.xmin = 0;
handles.xmax = 0;
handles.ymin = 0;
handles.ymax = 0;
handles.midu = 1.1;
set(handles.edit_qifei,'string',num2str(handles.qifei));
set(handles.edit_midu,'string',num2str(handles.midu));
handles.chonghui_enable = 0;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Feixingqizhushou wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Feixingqizhushou_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes(handles.axes_figure);
[FileName,PathName,FilterIndex] = uigetfile({'*.txt','TXT';...
    '*.dat','DAT';...
    '*.*','All Files' },'�����ļ�',...
    ...% 'F:\', ...%Ĭ��·��
    'MultiSelect','on');
if (FilterIndex)
    fin_id = fopen(char(fullfile(PathName,FileName)),'r');
    fseek(fin_id,0,-1);                   % ���ļ�ָ���ƶ����ļ���ͷ
    nc = 0;
    count = 0;                                %���ַ���
    nLF = 0;                                   %'\r'������
    %
    warning off
    %%%������%%%
    h=waitbar(0,'','Name','���ڼ��� ����');
    %%%������%%%
    
    strShuju = zeros(1,2500);
    strC = zeros(1,1000);
    value = uint32(100000);
    val_weizhi = zeros(1,10);
    
    while ~feof(fin_id)                   % �ж��Ƿ�Ϊ�ļ�ĩβ
        [strA,len] = fread(fin_id,'uchar');
    end
    fclose('all');
    if exist('temp','dir')==7
        rmdir('temp', 's') %�ļ���ɾ��
    end
    mkdir('temp');%�����ļ���
    filepaths = what;
    handles.path = filepaths.path;
    file=fullfile(filepaths.path,'temp', 'data.txt');
%     guidata(hObject,handles);
    fout_id=fopen(file,'w');   % ����data.txt�ļ�
    i = 1;
    m =0;
    flag = 0;
    flag_change = 0;
    
    %%%������%%%
    waitbar(0.05,h);
    %%%������%%%
    
    while i <= len
        %�ⲿ���Ƕ�ȡλ����Ϣ
        if flag == 1 && m < 18
            strLat(m) = strA(i);
            i = i+1;%����
            m = m+1;%����
            if  m == 18
                flag = 2;
            end
            continue;
        end
        %%%%�ж��Ƿ�Ϊ��ͷ
        if flag == 0 && i+2<len
            if  strA(i) == 'a' && strA(i+1) == 'l' && strA(i+2) == 't'
                m = 1;
                flag = 1;
                i = i + 3;
                continue;
            end
        end
        %         %%%%�ж��Ƿ�
        if (flag == 2 )
            flag = 0;
            m    = 0;
            if strA(i ) ~= 10
                flag_change = 0;
                continue;
            end
            i = i +1;
            if i+25<len
                if strA(i) == 'M' && strA(i+1) == 'D'  && strA(i +25) == 10
                    i = i +26;
                    flag_change = 1;
                    %alt / lon / lat / ret
                    kk = 1;
                    for k = 1:4:16
                        value1 = bitshift(uint32(strLat(k+3)),8);
                        value1 = bitor(value1, uint32(strLat(k+2)));
                        value1 = bitshift(value1,8);
                        value1 = bitor(value1, uint32(strLat(k+1)));
                        value1 = bitshift(value1,8);
                        value1 = bitor(value1, uint32(strLat(k)));
                        value1 = int64(value1);
%                         value1 = bitshift(uint32(strLat(k)),8);
%                         value1 = bitor(value1, uint32(strLat(k+1)));
%                         value1 = bitshift(value1,8);
%                         value1 = bitor(value1, uint32(strLat(k+2)));
%                         value1 = bitshift(value1,8);
%                         value1 = bitor(value1, uint32(strLat(k+3)));
%                         value1 = int64(value1);
                        if value1>2147483647
                            val_weizhi(kk) = value1-4294967296;
                        else
                            val_weizhi(kk) = value1;
                        end
                        kk = kk+1;
                    end
                    %seq
                    k = 17;
                    val_weizhi(kk) = uint32(strLat(k));
                    
                    %strPos = sprintf('%d %d %d ',val_weizhi(1),val_weizhi(2),val_weizhi(3));
                    strPos = sprintf('%d %d %d',val_weizhi(2),val_weizhi(3),val_weizhi(4));
                    zero_flag = 0;
%                     if val_weizhi() == 0 && val_weizhi(3) == 0
%                         zero_flag = 1;
%                     end
                    strHead = sprintf('%d ',val_weizhi(5));
                end
            end
            continue;
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        if  flag_change ==1
            if i+1<len
                if  strA(i) == 10 && strA(i+1) ~= 10 %%�жϻ��з�
                    nLF = nLF+1;
                    i = i +1;
                    count = count - 1;
                    continue;
                end
            end
            if i+1<len
                if  strA(i) == 10 && strA(i+1) == 10 %%�жϽ�����
                    count = count - 1;
                    if nLF == 35 && count == 2283
                        j = 1;
                        fseek(fout_id,0,'eof') ;% ���ļ�ָ���ƶ����ļ�mowei
                        nc = 0;
                        if zero_flag == 1
                            continue;
                        end
                        while j <= count
                            value1 = bitshift(uint32(strShuju(j) - 48),12);
                            value2 = bitshift(uint32(strShuju(j+1) - 48),6);
                            value3 = bitor(value1, value2);
                            value =bitor(value3, uint32(strShuju(j+2) - 48));
                            
                            str = num2str(value);
                            str1 = num2str(nc);
                            nc = nc+1;
                            strC = sprintf('%s %s %s %s%c%c',strPos,str,str1,strHead,13,10);
                            fwrite(fout_id,strC,'uchar');      %д���ļ�
                            j = j+3;
                        end
                        %fclose(fout_id);
                    end
                    nLF = 0;
                    i = i +2;
                    count = 0;
                    flag_change = 0;
                    continue;
                end
            end
            
            count = count+1;
            strShuju(count) = strA(i);
        end
        
        i = i+1; %%ѭ���Լ�
    end
    
    %%%������%%%
    waitbar(0.40,h);
    %%%������%%%
    
    clear strA;
    clear strC;
    clear strShuju;
    clear i;
    clear j;
    clear len;
    clear str;
    clear strLat;
    clear strPos;
    clear val_weizhi;
    fclose('all');
    
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    data = load(file);
    len = size(data);%����
    count = len(1);
    
    %�����������ȥ��һ����γ��
    data1 = zeros(count,len(2));
    %     data1(1:count,1) = data(1,1) - 1000;
    %data1(1:count,1) = data(1,1);
    data1(1:count,2) = data(1,2) ;
    data1(1:count,3) = data(1,3) ;
    data2 = data-data1;
    data = data2;
    clear data1;
    clear data2;
    
    data(:,2) = data(:,2)/10000000;
    data(:,3) = data(:,3)/10000000;
    for i=count:-761:1
        if i-760>0
            if abs(data(i-760,2) )>1.5 || abs(data(i-760,3) )>1.5 || data(i-760,6) <0 || data(i-760,6) >7||data(i-760,1)>100000||data(i-760,1)<-30000
                data(i-760:i,:)= [];
            end
        end
    end
    
    %ƽ��γ��
    lon_ave = mean(data(:,3));
    %���1���ȳ�
    len_lat = 111133333.3;%��λmm
    %��Ӧ��γ�ȵľ��ȳ�
    len_lat_ave = len_lat*cos(lon_ave*pi/180);%��λmm
    %һγ�ȳ�
    len_lon_ave = 111133333.3;%��λmm
    
    data(:,2) = data(:,2)*len_lat_ave;
    data(:,3) = data(:,3)*len_lon_ave;
    
    %%%������%%%
    waitbar(0.45,h);
    %%%������%%%
    
    %data(:,1) = 26000;%��������
    
    len = size(data);%����
    count = len(1);
    data_tmp2 = [data(:,2:3),data(:,6)];
    for i=count:-761:1
        if i-760>0
            data_tmp2(i-760+1:i,:)= [];
        end
    end
    %ɾ��û�õ���
    alf = 60; %ȡ45�ȽǶȷ�Χ�ļ�����
    nRaser = floor(760*alf/190);
    nRa0 = 380-nRaser;
    nRa1 = 380+nRaser+1;
    for i=count:-761:1
        if i-760>0
            data(i-760+nRa1:i,:)=[];
            data(i-760:i-760+nRa0,:)=[];
        end
    end
    len = size(data);
    count = len(1);
    
    %%%������%%%
    waitbar(0.50,h);
    %%%������%%%
    
    %%%%%%%%%%%%%%%�Һ���ת����
    [c1,c2] = size(data_tmp2);
    seq = zeros(10,2);
    for i = 1:c1
        if i+4<= c1
            if data_tmp2(i,3) == 2 && data_tmp2(i+1,3) == 2 && data_tmp2(i+2,3) == 3 && data_tmp2(i+3,3) == 3
                seq(1,1) = i+2;
                seq(1,2) = 3;
                continue;
            end
            if data_tmp2(i,3) == 3 && data_tmp2(i+1,3) == 3 && data_tmp2(i+2,3) == 4 && data_tmp2(i+3,3) == 4
                seq(2,1) = i+2;
                seq(2,2) = 4;
                continue;
            end
            if data_tmp2(i,3) == 4 && data_tmp2(i+1,3) == 4 && data_tmp2(i+2,3) == 5 && data_tmp2(i+3,3) == 5
                seq(3,1) = i+2;
                seq(3,2) = 5;
                continue;
            end
            if data_tmp2(i,3) == 5 && data_tmp2(i+1,3) == 5 && data_tmp2(i+2,3) == 6 && data_tmp2(i+3,3) == 6
                seq(4,1) = i+2;
                seq(4,2) = 5;
                continue;
            end
        end
    end
    
    [c1,c2] = size(data_tmp2);
    slope = zeros(3,3);
    %2-->3
    slope(1,1:2) = polyfit(data_tmp2((seq(1,1)+1):(seq(2,1)-1),1),data_tmp2((seq(1,1)+1):(seq(2,1)-1),2),1);
    slope(1,3) = atand(slope(1,1));  %%%%��С���˷���б�ʽ�
    %4-->5
    slope(2,1:2) = polyfit(data_tmp2((seq(3,1)+1):(seq(4,1)-1),1),data_tmp2((seq(3,1)+1):(seq(4,1)-1),2),1);
    slope(2,3) = atand(slope(1,1));  %%%%��С���˷���б�ʽ�
    
    vector = zeros(4,2);%����
    vector(1,1) = data_tmp2(seq(2,1),1)-data_tmp2(seq(1,1),1);
    vector(1,2) = data_tmp2(seq(2,1),2)-data_tmp2(seq(1,1),2);
    vector(2,1) = data_tmp2(seq(3,1),1)-data_tmp2(seq(2,1),1);
    vector(2,2) = data_tmp2(seq(3,1),2)-data_tmp2(seq(2,1),2);
    vector(3,1) = data_tmp2(seq(4,1),1)-data_tmp2(seq(3,1),1);
    vector(3,2) = data_tmp2(seq(4,1),2)-data_tmp2(seq(3,1),2);
    
    %ȡ��γ�Ƚ�������ת��
    if vector(1,1)>0   %&& vector(1,2)>0%��һ���ޡ���������
        theta = -slope(1,3);
    end
    if vector(1,1)<0 %&& vector(1,2)>0%�ڶ����ޡ���������
        theta = -(180+slope(1,3));
    end
    %%%������%%%
    waitbar(0.75,h,'�������');
    %%%������%%%
    
    %%%%%%%%%%��һ��%%%%%%%%%%
    
    
    q = 1;
    a1 = 1+2*nRaser*(seq(q,1)+2);%��ͷ
    a2 = 2*nRaser*(seq(q+1,1)-2);%ȥβ
    data1 = zeros(a2-a1+1,3);
    error = zeros(1,a2-a1+1);
    %%%%%%%%%%%%%%��ת����%%%%%%%%%%%%
    move_x = data(a1,2);
    move_y = slope(1,1)*data(a1,2)+slope(1,2);%y = kx +b
    data(:,2) = data(:,2) - move_x;
    data(:,3) = data(:,3) - move_y;
    matrix = [cosd(theta),sind(theta);-sind(theta),cosd(theta)];
    data(:,2:3) = data(:,2:3)*matrix;
    %axes(handles.axes_figure);
    %         hold on
    %         plot(handles.axes_figure,data(a1,2),data(a1,3),'or');
    %         plot(handles.axes_figure,data(:,2),data(:,3));
    %         xlabel(handles.axes_figure,'x','fontsize',20);
    %         ylabel(handles.axes_figure,'y','fontsize',20);
    k = 0;
    kk = 0;
    %%%%%������
    for i =a1:2*nRaser+1:a2
        for j = 0:1:2*nRaser-1
            k = k+1;
            if data(i+j,4) >80000
                kk = kk+1;
                error(kk) = k;
            end
            %beta = 190/760*(380-data(i+j,5));
            beta = -190/760*(380-data(i+j,5));
            data1(k,1)  = data(i+j,2);
            data1(k,2) = data(i+j,3)+data(i+j,4)*sind(beta);
            data1(k,3) = data(i+j,1)-data(i+j,4)*cosd(beta);
        end
    end
    
    while kk>=1
        data1(error(kk),:) = [];
        kk = kk - 1;
    end
    
    %%%%%%%%%%������%%%%%%%%%%
    q = 2;
    
    a1 = 1+2*nRaser*(seq(q,1)+2);%��ͷ
    a2 = 2*nRaser*(seq(q+1,1)-2);%ȥβ
    data3 = zeros(a2-a1+1,3);
    k = 0;
    kk =0;
    %%%%%������
    for i =a1:2*nRaser+1:a2
        for j = 0:1:2*nRaser-1
            k = k+1;
            if data(i+j,4) >80000
                kk = kk+1;
                error(kk) = k;
            end
            %beta = -190/760*(380-data(i+j,5));
            beta = 190/760*(380-data(i+j,5));
            data3(k,1) = data(i+j,2);
            data3(k,2) = data(i+j,3)+data(i+j,4)*sind(beta);
            data3(k,3) = data(i+j,1)-data(i+j,4)*cosd(beta);
        end
    end
    while kk>=1
        data3(error(kk),:) = [];
        kk = kk - 1;
    end
    
    clear data;
    data = [data1;data3];
    %data = data1;
    
    len = size(data);
    count = len(1);
    clear data1;
    %clear data2;
    clear data3;
    clear error;
    
    %     for i = count:-1:1
    %         if data(i,3)>14000
    %             data(i,:) = [];
    %         end
    %     end
    %%%%%%%����mat�ļ�
    handles.file = fullfile(handles.path,'temp', 'datamat.mat');
    save(handles.file,'data');
    guidata(hObject,handles);
    
    x = data(:,1)/1000;
    y = data(:,2)/1000;
    z = data(:,3)/1000;
    
    x = x';
    y = y';
    z = z';
    
    [X,Y]=meshgrid(min(x):max(x),min(y):max(y));
    Z=griddata(x,y,z,X,Y);%'cubic'
    save( 'Z.mat' ,'Z')
    %%%������%%%
    waitbar(1,h);
    close(h);
    %%%������%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%
    
    cla
    axes(handles.axes_figure);
    set(gcf,'doublebuffer','on'); %����˫����
    set(gcf,'backingstore','off');
    set(gcf,'render','opengl'); %��Ⱦ
    surf(handles.axes_figure,X,Y,Z)
    axis equal
    xlabel(handles.axes_figure,'x','fontsize',16);
    ylabel(handles.axes_figure,'y','fontsize',16);
    handles.az = 120;
    handles.ei = 35;
    set(handles.slider1,'value',handles.az);
    set(handles.slider2,'value',handles.ei);
    view(handles.az,handles.ei);
    handles.chonghui_enable = 1;%�ػ�ʹ��
    guidata(hObject, handles);
    
    
end

%
% function edit1_Callback(hObject, eventdata, handles)
% % hObject    handle to edit1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
%
% % Hints: get(hObject,'String') returns contents of edit1 as text
% %        str2double(get(hObject,'String')) returns contents of edit1 as a double
%
%
% % --- Executes during object creation, after setting all properties.
% function edit1_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to edit1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
%
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

axes(handles.axes_figure);
handles.az = get(handles.slider1,'value');
% str = sprintf('%g',a);
% set(handles.text_test,'string',str);
view([handles.az,handles.ei]);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
axes(handles.axes_figure);
handles.ei = get(handles.slider2,'value');
% str = sprintf('%g',a);
% set(handles.text_test,'string',str);
view([handles.az,handles.ei]);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton_reset.
function pushbutton_reset_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% axes(handles.axes_figure);
% handles.az = 280;
% handles.ei = 25;
% set(handles.slider1,'value',handles.az);
% set(handles.slider2,'value',handles.ei);
% view([handles.az,handles.ei]);
% guidata(hObject,handles);
axes(handles.axes_figure);
rotate3d on;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%set(handles.edit_qifei,'string',num2str(handles.qifei));
% handles.xmin = str2num(get(handles.edit_xmin,'string'));
% set(handles.edit_xmax,'string',num2str(handles.xmin));

if handles.chonghui_enable ~= 1
    %����Ի���
    h=errordlg('���Ȱ��򿪰�ť��','����');
    ha=get(h,'children');
    hu=findall(allchild(h),'style','pushbutton');
    set(hu,'string','ȷ��');
    set(hu,'fontsize',16,'fontname','������');
    ht=findall(ha,'type','text');
    set(ht,'fontsize',16,'fontname','������');
    return;
end
handles.qifei  = str2double(get(handles.edit_qifei,'string'));
handles.xmin  = str2double(get(handles.edit_xmin,'string'));
handles.xmax = str2double(get(handles.edit_xmax,'string'));
handles.ymin  = str2double(get(handles.edit_ymin,'string'));
handles.ymax  = str2double(get(handles.edit_ymax,'string'));
handles.midu  = str2double(get(handles.edit_midu,'string'));
guidata(hObject,handles);
if isnan(handles.qifei) || isnan(handles.xmin) || isnan(handles.xmax) || isnan(handles.ymin) || isnan(handles.ymax) || isnan(handles.midu)
    %����Ի���
    h=errordlg('�߽�����������ֵ��','����');
    ha=get(h,'children');
    hu=findall(allchild(h),'style','pushbutton');
    set(hu,'string','ȷ��');
    set(hu,'fontsize',16,'fontname','������');
    ht=findall(ha,'type','text');
    set(ht,'fontsize',16,'fontname','������');
    return;
end

if handles.xmin>handles.xmax || handles.ymin>handles.ymax
    %����Ի���
    h=errordlg('��Сֵ�������ֵ��','����');
    ha=get(h,'children');
    hu=findall(allchild(h),'style','pushbutton');
    set(hu,'string','ȷ��');
    set(hu,'fontsize',16,'fontname','������');
    ht=findall(ha,'type','text');
    set(ht,'fontsize',16,'fontname','������');
    return;
end

dta = load(handles.file);
data = dta.data;
clear dta;


if handles.xmin ==0 &&handles.xmax==0
    
else
    data(:,3) = data(:,3) +handles.qifei*1000;
    
    len = size(data);
    count = len(1);
    for i = count:-1:1
        if data(i,1)<handles.xmin*1000
            %data(i,3) = 0;
            data(i,:) = [];
        end
    end
    
    len = size(data);
    count = len(1);
    for i = count:-1:1
        if data(i,1)>handles.xmax*1000
            %data(i,3) = 0;
            data(i,:) = [];
        end
    end
    
    len = size(data);
    count = len(1);
    for i = count:-1:1
        if data(i,2)<handles.ymin*1000
            %data(i,3) = 0;
            data(i,:) = [];
        end
    end
    
    len = size(data);
    count = len(1);
    for i = count:-1:1
        if data(i,2)>handles.ymax*1000
            %data(i,3) = 0;
            data(i,:) = [];
        end
    end
    
    len = size(data);
    count = len(1);
    for i = count:-1:1
        if isnan(data(i,3))
            data(i,3) = 0;
            continue;
        end
        if data(i,3)<-1500
            data(i,3) = 0;
        end
    end
    
end

x = data(:,1)/1000;
y = data(:,2)/1000;
z = data(:,3)/1000;

x = x';
y = y';
z = z';

[X,Y]=meshgrid(min(x):max(x),min(y):max(y));
Z=griddata(x,y,z,X,Y);%'cubic'

cla

axes(handles.axes_figure);
set(gcf,'doublebuffer','on'); %����˫����
set(gcf,'backingstore','off');
set(gcf,'render','opengl'); %��Ⱦ
surf(X,Y,Z)
axis equal
%shading interp;
%colormap gray;

handles.az = 120;
handles.ei = 35;
set(handles.slider1,'value',handles.az);
set(handles.slider2,'value',handles.ei);
view(handles.az,handles.ei);
%hold off




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%�����ߵ��x,y����
max_z = max(Z(:));
max_x = X(Z == max_z);
max_y = Y(Z == max_z);
hold on
plot3(handles.axes_figure,max_x,max_y,max_z,'or')  %ԭʼ�����á�O�����
hold off
view([handles.az,handles.ei]);

%�ҳ�ú�ѳ����
Lx = max(X(:))-min(X(:));
Ly = max(Y(:))-min(Y(:));
Lz = max(Z(:))-0;%min(zii(:));

%�������
stepa = size(X);
s = Lx/stepa(2)*(Ly/stepa(1));
sum = 0;
for i = 1:1:stepa(1)
    for j = 1:1:stepa(2)
        w = Z(i,j);
        if isnan(w)
            continue;
        end
        sum =sum + s*w;
    end
end

format long g
%��ʾ���
strV = sprintf('%.2f\n',sum);
set(handles.text_V,'string',strV);
%��ʾ����
m = sum*handles.midu;
strM = sprintf('%.2f\n',m);
set(handles.text_M,'string',strM);
%��ʾ��ߵ�x,y,z
strMax_x = sprintf('%.2f\n',max_x);
set(handles.text_X,'string',strMax_x );
strMax_y = sprintf('%.2f\n',max_y);
set(handles.text_Y,'string',strMax_y );
strMax_z = sprintf('%.2f\n',max_z);
set(handles.text_Zmax,'string',strMax_z );

%�ҳ�ú�ѳ����
strLx = sprintf('%.2f\n',Lx);
set(handles.text_Xlen,'string',strLx );
strLy = sprintf('%.2f\n',Ly);
set(handles.text_Ylen,'string',strLy );
strLz = sprintf('%.2f\n',Lz);
set(handles.text_Zlen,'string',strLz );

% Update handles structure
guidata(hObject, handles);



function edit_midu_Callback(hObject, eventdata, handles)
% hObject    handle to edit_midu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_midu as text
%        str2double(get(hObject,'String')) returns contents of edit_midu as a double


% --- Executes during object creation, after setting all properties.
function edit_midu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_midu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
