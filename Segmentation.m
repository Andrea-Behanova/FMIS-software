function varargout = Segmentation(varargin)
% SEGMENTATION MATLAB code for Segmentation.fig
%      SEGMENTATION, by itself, creates a new SEGMENTATION or raises the existing
%      singleton*.
%
%      H = SEGMENTATION returns the handle to a new SEGMENTATION or the handle to
%      the existing singleton*.
%
%      SEGMENTATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SEGMENTATION.M with the given input arguments.
%
%      SEGMENTATION('Property','Value',...) creates a new SEGMENTATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Segmentation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Segmentation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Segmentation

% Last Modified by GUIDE v2.5 02-Sep-2019 10:55:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Segmentation_OpeningFcn, ...
                   'gui_OutputFcn',  @Segmentation_OutputFcn, ...
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


% --- Executes just before Segmentation is made visible.
function Segmentation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Segmentation (see VARARGIN)

currentFolder = pwd;
addpath([currentFolder '\bfmatlab'])
addpath([currentFolder '\export_fig-master'])

handles.data = [];
handles.indx = [];
handles.lbl = [];
handles.file = [];
handles.res = [];
handles.undo = [];

% Choose default command line output for Segmentation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Segmentation wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%%positions
set(handles.table_info,'Units', 'normalized');
set(handles.table_info,'Position', [0.01 0.02 0.26 0.4]);
set(handles.button_segm,'Units', 'normalized');
set(handles.button_segm,'Position', [0.01 0.43 0.08 0.05]);
set(handles.remove,'Units', 'normalized');
set(handles.remove,'Position', [0.1 0.43 0.08 0.05]);
set(handles.save_excel,'Units', 'normalized');
set(handles.save_excel,'Position', [0.19 0.43 0.08 0.05]);
set(handles.file_popUp,'Units', 'normalized');
set(handles.file_popUp,'Position', [0.01 0.505 0.26 0.01]);
set(handles.file_list,'Units', 'normalized');
set(handles.file_list,'Position', [0.01 0.525 0.26 0.45]);
set(handles.figure,'Units', 'normalized');
set(handles.figure,'Position', [0.27 0.1 0.7 0.85]);
set(handles.save_image,'Units', 'normalized');
set(handles.save_image,'Position', [0.93 0.02 0.05 0.05]);

%division cells
set(handles.panel_division,'Units', 'normalized');
set(handles.panel_division,'Position', [0.3 0.02 0.1 0.06]);
set(handles.Division_line,'Units', 'normalized');
set(handles.Division_line,'Position', [0.05 0.1 0.4 0.7]);
set(handles.Division_curve,'Units', 'normalized');
set(handles.Division_curve,'Position', [0.55 0.1 0.4 0.7]);

%manual corrections
set(handles.manual_cor,'Units', 'normalized');
set(handles.manual_cor,'Position', [0.41 0.02 0.1 0.06]);
set(handles.fill,'Units', 'normalized');
set(handles.fill,'Position', [0.05 0.1 0.4 0.7]);
set(handles.delete,'Units', 'normalized');
set(handles.delete,'Position', [0.55 0.1 0.4 0.7]);

%mask
set(handles.mask,'Units', 'normalized');
set(handles.mask,'Position', [0.88 0.02 0.03 0.05]);

%Displayed channel
set(handles.channels_panel,'Units', 'normalized');
set(handles.channels_panel,'Position', [0.52 0.005 0.07 0.075]);
set(handles.channel1,'Units', 'normalized');
set(handles.channel1,'Position', [0.05 0.65 0.4 0.4]);
set(handles.channel2,'Units', 'normalized');
set(handles.channel2,'Position', [0.46 0.65 0.4 0.4]);
set(handles.channel3,'Units', 'normalized');
set(handles.channel3,'Position', [0.05 0.3 0.4 0.4]);
set(handles.channel4,'Units', 'normalized');
set(handles.channel4,'Position', [0.46 0.3 0.4 0.4]);
set(handles.channelAll,'Units', 'normalized');
set(handles.channelAll,'Position', [0.3 0 0.4 0.35]);





% --- Outputs from this function are returned to the command line.
function varargout = Segmentation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in file_list.
function file_list_Callback(hObject, eventdata, handles)
% hObject    handle to file_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns file_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from file_list


% --- Executes during object creation, after setting all properties.
function file_list_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_segm.
function button_segm_Callback(hObject, eventdata, handles)
% hObject    handle to button_segm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.indx)
    warndlg('File is not selected.','Warning');
    return
end
f = waitbar(0.1,'Segmentation process');
data = handles.data{handles.indx};
%whole
im = data{3,1};



iter = 10;
fim = im;
for j = 1:iter
   fim = medfilt2(fim,[7 7]);
end
areas = double(im).*(double(fim) > 0); %before6
areas(areas~=0)=255;
areas = imdilate(areas,true(3));
areas = ~bwareaopen(~areas, 3000);
areas = bwareaopen(areas, 20000);

waitbar(0.2)
%nuclei
im2 = data{4,1};
fim2 = im2;
for j = 1:iter
   fim2 = medfilt2(fim2,[7 7]);
end
areas2 = double(im2).*(double(fim2) > 20); %before 20
areas2(areas2~=0)=255;
areas2 = imdilate(areas2,true(3));
areas2 = ~bwareaopen(~areas2, 5000);
areas3 = immultiply(areas,areas2);
areas3 = ~bwareaopen(~areas3, 6000);
areas3 = bwareaopen(areas3, 5000);

% nuclei = imerode(areas3,true(20));
% bw = activecontour(im2*15,nuclei,'Chan-Vese','SmoothFactor',0.4, 'ContractionBias', -0.3);
% areas3 = ~bwareaopen(~bw, 3000);



waitbar(0.3)
%watershed
D = -bwdist(~areas);

%mask
Dm = -bwdist(~areas3);
mask = imextendedmin(Dm,5);
Dm2 = imimposemin(Dm,mask);
Ld2 = watershed(Dm2);
mask = areas3;
mask(Ld2 == 0) = 0;

% mask = imerode(areas3, true(30));
% mask = ~bwareaopen(~mask, 1000);

waitbar(0.4)
D2 = imimposemin(D,mask);
Ld = watershed(D2);
areas(Ld == 0) = 0;
areas3(Ld == 0) = 0; %new
areas = ~bwareaopen(~areas, 6000);
areas = bwareaopen(areas, 20000);
lbl = bwlabel(areas);
waitbar(0.6)

%new part for filling the dark part of cytosol
sel_areas = double(im).*(double(fim) > 6); 
sel_areas(sel_areas~=0)=255;
sel_areas = ~bwareaopen(~sel_areas, 3000);
sel_areas = bwareaopen(sel_areas, 20000);
sel_areas(Ld == 0) = 0;
sel_areas = ~bwareaopen(~sel_areas, 6000);
sel_areas = bwareaopen(sel_areas, 20000);

for k = 1:max(lbl(:))
    idx = find(lbl==k);
    if sum(sel_areas(idx))<20000
        lbl(idx)=0;
    end
end
areas = logical(lbl);
lbl = bwlabel(areas);
%
waitbar(0.7)

for i = 1:max(lbl(:))
    cell = lbl == i;
    val = fim(cell);
    outl = isoutlier(double(val));
    if mean(val(outl))>mean(val)
        outliers = sum(outl);
        if outliers>100 && outliers<2000
            lbl(lbl == i)=0;
        end
    end
end
waitbar(0.9)

areas = logical(lbl);
areas3 = immultiply(areas,areas3);
del_lbl = areas3 - bwareaopen(areas3, 5000);
areas3(find(del_lbl))=0;
areas(find(del_lbl))=0;
areas = bwareaopen(areas, 10000);

lbl = bwlabel(areas);

%taking the whole cytosol areas
% all_areas = double(im).*(double(fim) > 0);
% all_areas(all_areas~=0)=255;
% all_areas = ~bwareaopen(~all_areas, 5000);
% all_areas = bwareaopen(all_areas, 10000);
% all_areas = bwlabel(all_areas);
% 
% for j = 1:max(lbl(:))
%     idx = median(all_areas(lbl==j));
%     lbl(all_areas==idx)=j;
% end
% 
% lbl = logical(areas);
%

lbl2 = immultiply(lbl,areas3);

handles.lbl = lbl;
handles.lbl2 = lbl2;
waitbar(1)
close(f)
set(handles.mask,'Value',1);

handles.undo=[];
handles.undo(1).whole = uint8(lbl);
handles.undo(1).nuclei = uint8(lbl2);

guidata(hObject, handles);
Disp(hObject, eventdata, handles)





function Disp(hObject, eventdata, handles)
data = handles.data{handles.indx};
resolution = handles.res(handles.indx,:);
resolution = resolution(1,1);

lbl = handles.lbl;
lbl2 = handles.lbl2;

if handles.channel1.Value == 1
    chan1 = data{1,1};
    red = zeros([size(chan1),3],'uint8');
    red(:,:,1)= chan1;
    imshow(red,[])
elseif handles.channel2.Value == 1
    chan2 = data{2,1};
    orange = zeros([size(chan2),3],'uint8');
    orange(:,:,1)= 2*chan2;
    orange(:,:,2)= chan2;
    imshow(orange,[])
elseif handles.channel3.Value == 1
    chan3 = data{3,1};
    green = zeros([size(chan3),3],'uint8');
    green(:,:,2)= chan3;
    imshow(green,[])
elseif handles.channel4.Value == 1
    chan4 = data{4,1};
    blue = zeros([size(chan4),3],'uint8');
    blue(:,:,3)= chan4;
    imshow(blue,[])
elseif handles.channelAll.Value == 1
    imshow(cat(3, data{1,1}, data{3,1}, data{4,1}))
end



mask = get(handles.mask,'Value');
if mask == 1
    hold on
    Lrgb = label2rgb(round(lbl),'jet', 'k', 'shuffle');
    himage = imshow(Lrgb); himage.AlphaData = 0.3;
    himage = imshow(logical(lbl2)); himage.AlphaData = 0.3;
end

stats = regionprops(logical(lbl),'Area','centroid');
stats2 = regionprops(lbl2,'Area');

red = data{1,1};
table = zeros(length(stats),4);
for i = 1:length(stats)
    stats(i).Centroid = round(stats(i).Centroid);
    centroids = cat(1,stats(i).Centroid);
    if mask == 1
        text(centroids(:,1),centroids(:,2),num2str(i),'Color','y','FontSize',20)
    end
    table(i,1) = stats(i).Area*resolution;
    int = sum(sum(red(lbl==i)));
    table(i,3) = int;
    
    %nuclei
    table(i,2) = stats2(i).Area*resolution;
    int = sum(sum(red(lbl2==i)));
    table(i,4) = int;
end
set(handles.table_info, 'data', table);

[~,index] = max(handles.indx);
handles.file{index,2} = table;


if size(handles.undo,2)<2
    set(handles.Undo,'Enable','off')
else
    set(handles.Undo,'Enable','on')
end
    
    

guidata(hObject, handles);





% --------------------------------------------------------------------
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function open_Callback(hObject, eventdata, handles)
% [filename, pathname] = uigetfile('*.czi*');
[Files, pathname]=uigetfile('*.czi', 'Select files to load:','MultiSelect','on');

if size(Files,2) == 1
    return
end

prompt = {'Resolution of file in \mum (Example: 0.004225)'};
dlgtitle = 'Resolution';
dims = [1 50];
definput = {'0.004225'};
opts.Interpreter = 'tex';
answer = inputdlg(prompt,dlgtitle,dims,definput,opts);
if isempty(answer)
    return
end

res = answer{1,1};
res = regexprep(res,',','.');
res = str2double(res);

while isnan(res)
    dlgtitle = 'Not a number. Input number:';
    dims = [1 70];
    answer = inputdlg(prompt,dlgtitle,dims,definput,opts);
    if isempty(answer)
        %res = 0;
        return
    end

    res = answer{1,1};
    res = regexprep(res,',','.');
    res = str2double(res);
end
    

if iscell(Files)
    L = size(Files,2);
    f = waitbar(1/L,'Loading files');
else
    L = 1;
    filename = Files;
end

for i = 1:L
    if iscell(Files)
        filename = Files{1,i};
    end
    data = bfopen([pathname filename]);
    s1 = data{1,1};
    s1 = s1(:,1);
    %save to the memory
    handles.data = [handles.data;{s1}];
    handles.res = [handles.res; res];

    %pop up
    txt = get(handles.file_popUp,'String');
    txt = [txt; {filename}];
    set(handles.file_popUp,'String',txt);


    % Adding file to file list
    txt = get(handles.file_list,'String');
    txt = [txt; {filename}];
    set(handles.file_list,'String',txt);

    files = get(handles.file_list,'String');
    handles.file = files(2:end,1);
    
    if iscell(Files)
        waitbar(i/L,f)
    end
    
end

if iscell(Files)
    close(f)
end


guidata(hObject, handles);


% --- Executes on selection change in file_popUp.
function file_popUp_Callback(hObject, eventdata, handles)
% hObject    handle to file_popUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns file_popUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from file_popUp
contents = cellstr(get(hObject,'String'));
display_choice = contents(get(hObject, 'Value'));
handles.dispChoice = display_choice;
handles.lbl = [];
handles.lbl2 = [];

if strcmp(handles.dispChoice, 'Select file...')
    set(get(gca,'children'),'Visible','off')
    handles.dispChoice = [];
elseif isempty(handles.dispChoice)
    return
else
    indx = strcmp(handles.file_list.String, handles.dispChoice);
    indx = indx(2:end);
    handles.indx = indx;
    data = handles.data{indx};
    
    imshow(cat(3, data{1,1}, data{3,1}, data{4,1}))
    set(handles.channelAll,'Value',1)
end

table = zeros(1,4);
set(handles.table_info, 'data', table);

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function file_popUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_popUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in remove.
function remove_Callback(hObject, eventdata, handles)
% hObject    handle to remove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.lbl)
    return
end

lbl = handles.lbl;
nuclei = logical(handles.lbl2);
[r,c] = size(lbl);

[y,x] = ginput(1); y = round(y(:,1)); x = round(x(:,1));
if (x>0) && (x<r) && (y>0) && (y<c)
    lbl_idx = lbl(x,y);
    lbl(lbl==lbl_idx) = 0;
    lbl = bwlabel(lbl);
    nuclei = immultiply(nuclei,lbl);
    
    handles.lbl2 = nuclei;
    handles.lbl = lbl;
end

inx = size(handles.undo,2);
handles.undo(inx+1).whole = uint8(lbl);
handles.undo(inx+1).nuclei = uint8(nuclei);

guidata(hObject, handles);
Disp(hObject, eventdata, handles);




% --- Executes on button press in save_excel.
function save_excel_Callback(hObject, eventdata, handles)
% hObject    handle to save_excel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.file)
    return
end

file = handles.file;
File = [];

for i = 1:size(file,1)
    Ncell = size(file{i,2},1);
    Name = cell(Ncell,1);
    Name{1,1} = file{i,1};
    tab = file{i,2};
    if Ncell>0
        Cell = 1:Ncell;
        Cell = Cell';
        Area_whole = tab(:,1);
        Area_nuclei = tab(:,2);
        SUM_intensity_whole = tab(:,3);
        SUM_intensity_nuclei = tab(:,4);
        tabl = table(Name, Cell, Area_whole, Area_nuclei, SUM_intensity_whole, SUM_intensity_nuclei);
        File = [File; tabl];
    end
end

File.Properties.VariableNames = {'File_name' 'Cell_number' 'Area_whole_um2' 'Area_nuclei_um2' 'SUM_intensity_whole' 'SUM_intensity_nuclei'};
        
[filename, filepath] = uiputfile('*.xlsx', 'Save the project file:','Cells_results');
FileName = fullfile(filepath, filename);
writetable(File,FileName);



% --- Executes on button press in save_image.
function save_image_Callback(hObject, eventdata, handles)
% hObject    handle to save_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.indx)
    return
end

f = waitbar(0.4,'Saving image');
filename =  handles.dispChoice{1,1};
filename = [filename(1:end-4) '_segmentation'];
labels.whole = handles.lbl;
labels.nuclei = handles.lbl2;
save(filename, 'labels', '-v7.3');
export_fig(handles.figure, filename);
close(f)


% --- Executes on button press in Division_line.
function Division_line_Callback(hObject, eventdata, handles)
% hObject    handle to Division_line (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.lbl)
    return
end

lbl = handles.lbl;
nuclei = logical(handles.lbl2);
[r,c] = size(lbl);

h = imline;
pos = round(getPosition(h));

if abs(pos(1,1)-pos(2,1))>abs(pos(1,2)-pos(2,2))
    if min(pos(1,1),pos(2,1))==pos(1,1)
        linex = pos(1,1):pos(2,1);
    else
        linex = pos(1,1):-1:pos(2,1);
    end

    if min(pos(1,2),pos(2,2))==pos(1,2)
        liney = round(linspace(pos(1,2),pos(2,2),length(linex)));
    else
        liney = round(linspace(pos(1,2),pos(2,2),length(linex)));
        %liney = fliplr(liney);
    end
    linex = [linex, linex+1, linex-1];
    liney = [liney, liney, liney];
else
    if min(pos(1,2),pos(2,2))==pos(1,2)
        liney = pos(1,2):pos(2,2);
    else
        liney = pos(1,2):-1:pos(2,2);
    end
    
    if min(pos(1,1),pos(2,1))==pos(1,1)
        linex = round(linspace(pos(1,1),pos(2,1),length(liney)));
    else
        linex = round(linspace(pos(1,1),pos(2,1),length(liney)));
        %linex = fliplr(linex);
    end

    linex = [linex, linex, linex];
    liney = [liney, liney+1, liney-1];
end

linearInd = sub2ind(size(lbl),liney,linex);

lbl(linearInd) = 0;
lbl = bwlabel(lbl);
nuclei = immultiply(nuclei,lbl);

handles.lbl2 = nuclei;
handles.lbl = lbl;

delete(h)

inx = size(handles.undo,2);
handles.undo(inx+1).whole = uint8(lbl);
handles.undo(inx+1).nuclei = uint8(nuclei);



guidata(hObject, handles);
Disp(hObject, eventdata, handles);


% --- Executes on button press in Division_curve.
function Division_curve_Callback(hObject, eventdata, handles)
% hObject    handle to Division_curve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.lbl)
    return20
end

lbl = handles.lbl;
nuclei = logical(handles.lbl2);
[r,c] = size(lbl);

h = drawfreehand('LineWidth',2,'Closed',0,'HandleVisibility','off', 'FaceAlpha', 0,'Deletable',false, 'InteractionsAllowed', 'none');
h.Waypoints(h.Waypoints==1)=0;
mask = createMask(h,lbl);
mask = imdilate(mask,true(2));
pos = find(mask==1);
    
    
lbl(pos) = 0;
lbl = bwlabel(lbl);
nuclei = immultiply(nuclei,lbl);

handles.lbl2 = nuclei;
handles.lbl = lbl;

delete(h)

inx = size(handles.undo,2);
handles.undo(inx+1).whole = uint8(lbl);
handles.undo(inx+1).nuclei = uint8(nuclei);

guidata(hObject, handles);
Disp(hObject, eventdata, handles);


% --- Executes on button press in fill.
function fill_Callback(hObject, eventdata, handles)
% hObject    handle to fill (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.lbl)
    return
end

lbl = handles.lbl;
nuclei = handles.lbl2;
[r,c] = size(lbl);

[y,x] = ginput(1); y = round(y(:,1)); x = round(x(:,1));
if (x>0) && (x<r) && (y>0) && (y<c)
        linearInd = sub2ind([r,c], x, y);
        index = nonzeros(lbl(linearInd));
else
    return
end

h = drawfreehand('LineWidth',2,'Closed',0,'HandleVisibility','off', 'FaceAlpha', 0,'Deletable',false, 'InteractionsAllowed', 'none');
%h.Waypoints(h.Waypoints==1)=0;
mask = createMask(h,lbl);
mask = imdilate(mask,true(3));
pos2 = find(mask==1);
delete(h)

if nuclei(linearInd)==0
    lbl(pos2) = index;
    lbl = ~bwareaopen(~lbl, 6000);
    lbl = bwlabel(lbl);
    nuclei = immultiply(nuclei,lbl);
else
    nuclei(pos2) = index;
    nuclei = ~bwareaopen(~nuclei, 6000);
    nuclei = immultiply(nuclei,lbl);
end


handles.lbl2 = nuclei;
handles.lbl = lbl;

inx = size(handles.undo,2);
handles.undo(inx+1).whole = uint8(lbl);
handles.undo(inx+1).nuclei = uint8(nuclei);

guidata(hObject, handles);
Disp(hObject, eventdata, handles);






% --- Executes on button press in delete.
function delete_Callback(hObject, eventdata, handles)
% hObject    handle to delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.lbl)
    return
end

lbl = handles.lbl;
nuclei = handles.lbl2;
[r,c] = size(lbl);

[y,x] = ginput(1); y = round(y(:,1)); x = round(x(:,1));
if (x>0) && (x<r) && (y>0) && (y<c)
        linearInd = sub2ind([r,c], x, y);
        index = nonzeros(lbl(linearInd));
else
    return
end

h = drawfreehand('LineWidth',2,'Closed',0,'HandleVisibility','off', 'FaceAlpha', 0,'Deletable',false, 'InteractionsAllowed', 'none');
%h.Waypoints(h.Waypoints==1)=0;
mask = createMask(h,lbl);
mask = imdilate(mask,true(3));
pos2 = find(mask==1);
delete(h)

if nuclei(linearInd)==0
    lbl(pos2) = 0;
    lbl = bwareaopen(lbl, 6000);
    lbl = bwlabel(lbl);
    nuclei = immultiply(nuclei,lbl);

else
    nuclei(pos2) = 0;
    nuclei = bwareaopen(nuclei, 6000);
    nuclei = immultiply(nuclei,lbl);
end


handles.lbl2 = nuclei;
handles.lbl = lbl;

inx = size(handles.undo,2);
handles.undo(inx+1).whole = uint8(lbl);
handles.undo(inx+1).nuclei = uint8(nuclei);

guidata(hObject, handles);
Disp(hObject, eventdata, handles);


% --- Executes on button press in mask.
function mask_Callback(hObject, eventdata, handles)
% hObject    handle to mask (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mask
if isempty(handles.lbl)
    return
end

guidata(hObject, handles);
Disp(hObject, eventdata, handles)


% --- Executes when selected object is changed in channels_panel.
function channels_panel_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in channels_panel 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

guidata(hObject, handles);
Disp(hObject, eventdata, handles)


% --------------------------------------------------------------------
function open_segmentation_Callback(hObject, eventdata, handles)
% hObject    handle to open_segmentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(handles.dispChoice)
    f = warndlg('Select file in the pop-up menu','Warning');
    return
end


[filename pathname]=uigetfile('*.mat', 'Chose segmnetation to load:');

if filename == 0
    return
end



data = importdata(fullfile(pathname, filename));

handles.lbl2 = data.nuclei;
handles.lbl = data.whole;
set(handles.mask,'Value',1);

handles.undo=[];
handles.undo(1).whole = uint8(handles.lbl);
handles.undo(1).nuclei = uint8(handles.lbl2);

guidata(hObject, handles);
Disp(hObject, eventdata, handles);


% --------------------------------------------------------------------
function Undo_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to Undo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

inx = size(handles.undo,2);
lbl = handles.undo(inx-1).whole;
nuclei = handles.undo(inx-1).nuclei;
handles.undo(inx) = [];

handles.lbl2 = nuclei;
handles.lbl = lbl;

guidata(hObject, handles);
Disp(hObject, eventdata, handles);


