{ ****************************************************************** }
{                                                                    }
{ $Id$         }
{                                                                    }
{                                                                    }
{   Copyright � 2009 by Malcolm Nealon                               }
{    based on work performed by Guru Kathiresan                      }
{                                                                    }
{License :                                                           }
{=========                                                           }
{The wx-devC++ Components, Form Designer, Utils classes              }
{are exclusive properties of Guru Kathiresan.                        }
{The code is available in dual Licenses:                             }
{                               1)GPL Compatible  License            }
{                               2)Commercial License                 }
{                                                                    }
{1)GPL License :                                                     }
{ Code can be used in any project as long as the project's sourcecode}
{ is published under GPL license.                                    }
{                                                                    }
{2)Commercial License:                                               }
{Use of code in this file or the one that bear this license text     }
{can be used in Non-GPL projects as long as you get the permission   }
{from the Author - Guru Kathiresan.                                  }
{Use of the Code in any non-gpl projects without the permission of   }
{the author is illegal.                                              }
{Contact gururamnath@yahoo.com for details                           }
{ ****************************************************************** }

unit wxAuiNotebook;

interface

uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls,
  Forms, Graphics, ExtCtrls, ComCtrls, WxUtils, WxAuiToolBar, WxAuiNotebookPage, WxSizerPanel;

type
  TWxAuiNotebook = class(TPageControl, IWxComponentInterface, IWxContainerInterface,
      IWxContainerAndSizerInterface, IWxWindowInterface)
  private
    FOrientation: TWxSizerOrientation;
    FWx_Caption: string;
    FWx_Class: string;
    FWx_ControlOrientation: TWxControlOrientation;
    FWx_EventList: TStringList;
    FWx_IDName: string;
    FWx_IDValue: integer;
    FWx_StretchFactor: integer;
    FWx_PropertyList: TStringList;
    FInvisibleBGColorString: string;
    FInvisibleFGColorString: string;
    FWx_ToolTip: string;
    FWx_Enabled: boolean;
    FWx_Hidden: boolean;
    FWx_HelpText: string;
    FWx_Border: integer;
    FWx_TabWidth: integer;
    FWx_TabHeight: integer;
    FWx_GeneralStyle: TWxStdStyleSet;
    FWx_Comments: TStrings;
    FWx_Alignment: TWxSizerAlignmentSet;
    FWx_BorderAlignment: TWxBorderAlignment;

    FWx_ProxyBGColorString: TWxColorString;
    FWx_ProxyFGColorString: TWxColorString;

    FWx_BookAlignment: TWxAuinbxAlignStyleItem;
    FWx_AuiNoteBookStyle: TWxAuinbxStyleSet;
    
    FEVT_UPDATE_UI: string;
    FEVT_AUINOTEBOOK_PAGE_CLOSE: string;
    FEVT_AUINOTEBOOK_PAGE_CLOSED: string;
    FEVT_AUINOTEBOOK_PAGE_CHANGED: string;
    FEVT_AUINOTEBOOK_PAGE_CHANGING: string;
    FEVT_AUINOTEBOOK_BUTTON: string;
    FEVT_AUINOTEBOOK_BEGIN_DRAG: string;
    FEVT_AUINOTEBOOK_END_DRAG: string;
    FEVT_AUINOTEBOOK_DRAG_MOTION: string;
    FEVT_AUINOTEBOOK_ALLOW_DND: string;
    FEVT_AUINOTEBOOK_DRAG_DONE: string;
    FEVT_AUINOTEBOOK_TAB_MIDDLE_DOWN: string;
    FEVT_AUINOTEBOOK_TAB_MIDDLE_UP: string;
    FEVT_AUINOTEBOOK_TAB_RIGHT_DOWN: string;
    FEVT_AUINOTEBOOK_TAB_RIGHT_UP: string;
    FEVT_AUINOTEBOOK_BG_DCLICK: string;

 //Aui Properties
    FWx_AuiManaged: Boolean;
    FWx_PaneCaption: string;
    FWx_PaneName: string;
    FWx_Aui_Dock_Direction: TwxAuiPaneDockDirectionItem;
    FWx_Aui_Dockable_Direction: TwxAuiPaneDockableDirectionSet;
    FWx_Aui_Pane_Style: TwxAuiPaneStyleSet;
    FWx_Aui_Pane_Buttons: TwxAuiPaneButtonSet;
    FWx_BestSize_Height: Integer;
    FWx_BestSize_Width: Integer;
    FWx_MinSize_Height: Integer;
    FWx_MinSize_Width: Integer;
    FWx_MaxSize_Height: Integer;
    FWx_MaxSize_Width: Integer;
    FWx_Floating_Height: Integer;
    FWx_Floating_Width: Integer;
    FWx_Floating_X_Pos: Integer;
    FWx_Floating_Y_Pos: Integer;
    FWx_Layer: Integer;
    FWx_Row: Integer;
    FWx_Position: Integer;

   { Private methods of TWxAuiNotebook }
    procedure AutoInitialize;
    procedure AutoDestroy;

  protected

    procedure Loaded; override;

  public
    defaultBGColor: TColor;
    defaultFGColor: TColor;
    { Public methods of TWxAuiNotebook }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GenerateControlIDs: string;
    function GenerateEnumControlIDs: string;
    function GenerateEventTableEntries(CurrClassName: string): string;
    function GenerateGUIControlCreation: string;
    function GenerateXRCControlCreation(IndentString: string): TStringList;
    function GenerateGUIControlDeclaration: string;
    function GenerateHeaderInclude: string;
    function GenerateImageInclude: string;
    function GetEventList: TStringList;
    function GetIDName: string;
    function GetIDValue: longint;
    function GetParameterFromEventName(EventName: string): string;
    function GetPropertyList: TStringList;
    function GetTypeFromEventName(EventName: string): string;
    function GetWxClassName: string;
    procedure SaveControlOrientation(ControlOrientation: TWxControlOrientation);
    procedure SetIDName(IDName: string);
    procedure SetIDValue(IDValue: longint);
    procedure SetWxClassName(wxClassName: string);
    function GetFGColor: string;
    procedure SetFGColor(strValue: string);
    function GetBGColor: string;
    procedure SetBGColor(strValue: string);
    procedure SetProxyFGColorString(Value: string);
    procedure SetProxyBGColorString(Value: string);

    function GetGenericColor(strVariableName: string): string;
    procedure SetGenericColor(strVariableName, strValue: string);

    function GenerateLastCreationCode: string;
    procedure SetAuiNotebookStyle(style: TWxAuinbxStyleSet);

    function GetBorderAlignment: TWxBorderAlignment;
    procedure SetBorderAlignment(border: TWxBorderAlignment);
    function GetBorderWidth: integer;
    procedure SetBorderWidth(width: integer);
    function GetStretchFactor: integer;
    procedure SetStretchFactor(intValue: integer);

    function GetTabHeight: integer;
    procedure SetTabHeight(height: integer);
    function GetTabWidth: integer;
    procedure SetTabWidth(width: integer);
    function GetBookAlignment(Value: TWxAuinbxAlignStyleItem): string;


  published
    property EVT_UPDATE_UI: string read FEVT_UPDATE_UI write FEVT_UPDATE_UI;
    property EVT_AUINOTEBOOK_PAGE_CLOSE: string read FEVT_AUINOTEBOOK_PAGE_CLOSE write FEVT_AUINOTEBOOK_PAGE_CLOSE;
    property EVT_AUINOTEBOOK_PAGE_CLOSED: string read FEVT_AUINOTEBOOK_PAGE_CLOSED write FEVT_AUINOTEBOOK_PAGE_CLOSED;
    property EVT_AUINOTEBOOK_PAGE_CHANGED: string read FEVT_AUINOTEBOOK_PAGE_CHANGED write FEVT_AUINOTEBOOK_PAGE_CHANGED;
    property EVT_AUINOTEBOOK_PAGE_CHANGING: string read FEVT_AUINOTEBOOK_PAGE_CHANGING write FEVT_AUINOTEBOOK_PAGE_CHANGING;
    property EVT_AUINOTEBOOK_BUTTON: string read FEVT_AUINOTEBOOK_BUTTON write FEVT_AUINOTEBOOK_BUTTON;
    property EVT_AUINOTEBOOK_BEGIN_DRAG: string read FEVT_AUINOTEBOOK_BEGIN_DRAG write FEVT_AUINOTEBOOK_BEGIN_DRAG;
    property EVT_AUINOTEBOOK_END_DRAG: string read FEVT_AUINOTEBOOK_END_DRAG write FEVT_AUINOTEBOOK_END_DRAG;
    property EVT_AUINOTEBOOK_DRAG_MOTION: string read FEVT_AUINOTEBOOK_DRAG_MOTION write FEVT_AUINOTEBOOK_DRAG_MOTION;
    property EVT_AUINOTEBOOK_ALLOW_DND: string read FEVT_AUINOTEBOOK_ALLOW_DND write FEVT_AUINOTEBOOK_ALLOW_DND;
    property EVT_AUINOTEBOOK_DRAG_DONE: string read FEVT_AUINOTEBOOK_DRAG_DONE write FEVT_AUINOTEBOOK_DRAG_DONE;
    property EVT_AUINOTEBOOK_TAB_MIDDLE_DOWN: string read FEVT_AUINOTEBOOK_TAB_MIDDLE_DOWN write FEVT_AUINOTEBOOK_TAB_MIDDLE_DOWN;
    property EVT_AUINOTEBOOK_TAB_MIDDLE_UP: string read FEVT_AUINOTEBOOK_TAB_MIDDLE_UP write FEVT_AUINOTEBOOK_TAB_MIDDLE_UP;
    property EVT_AUINOTEBOOK_TAB_RIGHT_DOWN: string read FEVT_AUINOTEBOOK_TAB_RIGHT_DOWN write FEVT_AUINOTEBOOK_TAB_RIGHT_DOWN;
    property EVT_AUINOTEBOOK_TAB_RIGHT_UP: string read FEVT_AUINOTEBOOK_TAB_RIGHT_UP write FEVT_AUINOTEBOOK_TAB_RIGHT_UP;
    property EVT_AUINOTEBOOK_BG_DCLICK: string read FEVT_AUINOTEBOOK_BG_DCLICK write FEVT_AUINOTEBOOK_BG_DCLICK;

    property Orientation: TWxSizerOrientation
      read FOrientation write FOrientation default wxHorizontal;
    property Wx_Caption: string read FWx_Caption write FWx_Caption;
    property Wx_Class: string read FWx_Class write FWx_Class;
    property Wx_ControlOrientation: TWxControlOrientation
      read FWx_ControlOrientation write FWx_ControlOrientation;
    property Wx_EventList: TStringList read FWx_EventList write FWx_EventList;
    property Wx_IDName: string read FWx_IDName write FWx_IDName;
    property Wx_IDValue: integer read FWx_IDValue write FWx_IDValue default -1;
    property Wx_Hidden: boolean read FWx_Hidden write FWx_Hidden;
    property Wx_ToolTip: string read FWx_ToolTip write FWx_ToolTip;
    property Wx_HelpText: string read FWx_HelpText write FWx_HelpText;
    property Wx_Enabled: boolean read FWx_Enabled write FWx_Enabled default True;
    property Wx_AuiNoteBookStyle: TWxAuinbxStyleSet read FWx_AuiNoteBookStyle write SetAuiNotebookStyle;
    property Wx_TabHeight: integer read GetTabHeight write SetTabHeight default 25;
    property Wx_TabWidth: integer read GetTabWidth write SetTabWidth default 75;
    property Wx_GeneralStyle: TWxStdStyleSet read FWx_GeneralStyle write FWx_GeneralStyle;

    property Wx_Border: integer read GetBorderWidth write SetBorderWidth default 5;
    property Wx_BorderAlignment: TWxBorderAlignment read GetBorderAlignment write SetBorderAlignment default [wxALL];
    property Wx_Alignment: TWxSizerAlignmentSet read FWx_Alignment write FWx_Alignment default [wxALIGN_CENTER];
    property Wx_StretchFactor: integer read GetStretchFactor write SetStretchFactor default 0;

    property Wx_ProxyBGColorString: TWxColorString read FWx_ProxyBGColorString write FWx_ProxyBGColorString;
    property Wx_ProxyFGColorString: TWxColorString read FWx_ProxyFGColorString write FWx_ProxyFGColorString;
    property InvisibleBGColorString: string read FInvisibleBGColorString write FInvisibleBGColorString;
    property InvisibleFGColorString: string read FInvisibleFGColorString write FInvisibleFGColorString;
    property Wx_BookAlignment: TWxAuinbxAlignStyleItem read FWx_BookAlignment write FWx_BookAlignment; //SetTabAlignment

    property Wx_Comments: TStrings read FWx_Comments write FWx_Comments;

//Aui Properties
    property Wx_AuiManaged: boolean read FWx_AuiManaged write FWx_AuiManaged default False;
    property Wx_PaneCaption: string read FWx_PaneCaption write FWx_PaneCaption;
    property Wx_PaneName: string read FWx_PaneName write FWx_PaneName;
    property Wx_Aui_Dock_Direction: TwxAuiPaneDockDirectionItem read FWx_Aui_Dock_Direction write FWx_Aui_Dock_Direction;
    property Wx_Aui_Dockable_Direction: TwxAuiPaneDockableDirectionSet read FWx_Aui_Dockable_Direction write FWx_Aui_Dockable_Direction;
    property Wx_Aui_Pane_Style: TwxAuiPaneStyleSet read FWx_Aui_Pane_Style write FWx_Aui_Pane_Style;
    property Wx_Aui_Pane_Buttons: TwxAuiPaneButtonSet read FWx_Aui_Pane_Buttons write FWx_Aui_Pane_Buttons;
    property Wx_BestSize_Height: integer read FWx_BestSize_Height write FWx_BestSize_Height default -1;
    property Wx_BestSize_Width: integer read FWx_BestSize_Width write FWx_BestSize_Width default -1;
    property Wx_MinSize_Height: integer read FWx_MinSize_Height write FWx_MinSize_Height default -1;
    property Wx_MinSize_Width: integer read FWx_MinSize_Width write FWx_MinSize_Width default -1;
    property Wx_MaxSize_Height: integer read FWx_MaxSize_Height write FWx_MaxSize_Height default -1;
    property Wx_MaxSize_Width: integer read FWx_MaxSize_Width write FWx_MaxSize_Width default -1;
    property Wx_Floating_Height: integer read FWx_Floating_Height write FWx_Floating_Height default -1;
    property Wx_Floating_Width: integer read FWx_Floating_Width write FWx_Floating_Width default -1;
    property Wx_Floating_X_Pos: integer read FWx_Floating_X_Pos write FWx_Floating_X_Pos default -1;
    property Wx_Floating_Y_Pos: integer read FWx_Floating_Y_Pos write FWx_Floating_Y_Pos default -1;
    property Wx_Layer: integer read FWx_Layer write FWx_Layer default 0;
    property Wx_Row: integer read FWx_Row write FWx_Row default 0;
    property Wx_Position: integer read FWx_Position write FWx_Position default 0;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('wxWidgets', [TWxAuiNotebook]);
end;

procedure TWxAuiNotebook.AutoInitialize;
begin
  FWx_PropertyList := TStringList.Create;
  FWx_EventList := TStringList.Create;
  FWx_Comments := TStringList.Create;
  FOrientation := wxHorizontal;
  FWx_Class := 'wxAuiNotebook';
  FWx_IDValue := -1;
  FWx_StretchFactor := 0;
  FWx_Border := 5;
  FWx_Enabled := True;
  FWx_BorderAlignment := [wxAll];
  FWx_Alignment := [wxALIGN_CENTER];
  FWx_ProxyBGColorString := TWxColorString.Create;
  FWx_ProxyFGColorString := TWxColorString.Create;
  defaultBGColor := self.color;
  defaultFGColor := self.font.color;
  FWx_AuiNoteBookStyle := [wxAUI_NB_TAB_SPLIT, wxAUI_NB_TAB_MOVE, wxAUI_NB_SCROLL_BUTTONS, wxAUI_NB_CLOSE_ON_ACTIVE_TAB];
  FWx_TabWidth := 75;
  FWx_TabHeight := 25;
  FWx_BookAlignment := wxAUI_NB_TOP;


end; { of AutoInitialize }

procedure TWxAuiNotebook.AutoDestroy;
begin
  FWx_PropertyList.Destroy;
  FWx_EventList.Destroy;
  FWx_Comments.Destroy;
end; { of AutoDestroy }

constructor TWxAuiNotebook.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  AutoInitialize;

  PopulateGenericProperties(FWx_PropertyList);
  PopulateAuiGenericProperties(FWx_PropertyList);

  FWx_PropertyList.add('Wx_AuiNoteBookStyle:Aui Notebook Styles');
  FWx_PropertyList.Add('wxAUI_NB_TAB_SPLIT:wxAUI_NB_TAB_SPLIT');
  FWx_PropertyList.Add('wxAUI_NB_TAB_MOVE:wxAUI_NB_TAB_MOVE');
  FWx_PropertyList.Add('wxAUI_NB_TAB_EXTERNAL_MOVE:wxAUI_NB_TAB_EXTERNAL_MOVE');
  FWx_PropertyList.Add('wxAUI_NB_TAB_FIXED_WIDTH:wxAUI_NB_TAB_FIXED_WIDTH');
  FWx_PropertyList.Add('wxAUI_NB_SCROLL_BUTTONS:wxAUI_NB_SCROLL_BUTTONS');
  FWx_PropertyList.Add('wxAUI_NB_WINDOWLIST_BUTTON:wxAUI_NB_WINDOWLIST_BUTTON');
  FWx_PropertyList.Add('wxAUI_NB_CLOSE_BUTTON:wxAUI_NB_CLOSE_BUTTON');
  FWx_PropertyList.Add('wxAUI_NB_CLOSE_ON_ACTIVE_TAB:wxAUI_NB_CLOSE_ON_ACTIVE_TAB');
  FWx_PropertyList.Add('wxAUI_NB_CLOSE_ON_ALL_TABS:wxAUI_NB_CLOSE_ON_ALL_TABS');

  FWx_PropertyList.Add('Wx_TabWidth:TabWidth');
  FWx_PropertyList.Add('Wx_TabHeight:TabHeight');
  FWx_PropertyList.Add('Wx_BookAlignment:Tab Position');


  FWx_EventList.add('EVT_UPDATE_UI:OnUpdateUI');
  FWx_EventList.add('EVT_AUINOTEBOOK_PAGE_CLOSE:OnNotebookPageClose');
  FWx_EventList.add('EVT_AUINOTEBOOK_PAGE_CLOSED:OnNotebookPageClosed');
  FWx_EventList.add('EVT_AUINOTEBOOK_PAGE_CHANGED:OnNotebookPageChanged');
  FWx_EventList.add('EVT_AUINOTEBOOK_PAGE_CHANGING:OnNotebookPageChanging');
  FWx_EventList.add('EVT_AUINOTEBOOK_BUTTON:OnNotebookButton');
  FWx_EventList.add('EVT_AUINOTEBOOK_BEGIN_DRAG:OnNotebookBeginDrag');
  FWx_EventList.add('EVT_AUINOTEBOOK_END_DRAG:OnNotebookEndDrag');
  FWx_EventList.add('EVT_AUINOTEBOOK_DRAG_MOTION:OnNotebookDragMotion');
  FWx_EventList.add('EVT_AUINOTEBOOK_ALLOW_DND:OnNotebookAllowDND');
  FWx_EventList.add('EVT_AUINOTEBOOK_DRAG_DONE:OnNotebookDragDone');
  FWx_EventList.add('EVT_AUINOTEBOOK_TAB_MIDDLE_DOWN:OnNotebookTabMDown');
  FWx_EventList.add('EVT_AUINOTEBOOK_TAB_MIDDLE_UP:OnNotebookTabMUp');
  FWx_EventList.add('EVT_AUINOTEBOOK_TAB_RIGHT_DOWN:OnNotebookTabRDown');
  FWx_EventList.add('EVT_AUINOTEBOOK_TAB_RIGHT_UP:OnNotebookTabRUp');
  FWx_EventList.add('EVT_AUINOTEBOOK_BG_DCLICK:OnNotebook');

  FWx_MinSize_Height := Self.Height;
  FWx_MinSize_Width := Self.Width;
end;

destructor TWxAuiNotebook.Destroy;
begin
  AutoDestroy;
  inherited Destroy;
end;

procedure TWxAuiNotebook.Loaded;
begin
  inherited Loaded;
end;

function TWxAuiNotebook.GenerateEnumControlIDs: string;
begin
  Result := GetWxEnum(self.Wx_IDValue, self.Wx_IDName);
end;

function TWxAuiNotebook.GenerateControlIDs: string;
begin
  Result := '';
  if (Wx_IDValue > 0) and (trim(Wx_IDName) <> '') then
    Result := Format('#define %s %d ', [Wx_IDName, Wx_IDValue]);
end;

function TWxAuiNotebook.GenerateEventTableEntries(CurrClassName: string): string;
begin
  Result := '';

  if (XRCGEN) then
  begin //generate xrc loading code  needs to be edited
    if trim(EVT_UPDATE_UI) <> '' then
      Result := Result + #13 + Format('EVT_UPDATE_UI(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_UPDATE_UI]) + '';

    if trim(EVT_AUINOTEBOOK_PAGE_CLOSE) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_PAGE_CLOSE(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_PAGE_CLOSE]) + '';

    if trim(EVT_AUINOTEBOOK_PAGE_CLOSED) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_PAGE_CLOSED(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_PAGE_CLOSED]) + '';

    if trim(EVT_AUINOTEBOOK_PAGE_CHANGED) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_PAGE_CHANGED(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_PAGE_CHANGED]) + '';

    if trim(EVT_AUINOTEBOOK_PAGE_CHANGING) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_PAGE_CHANGING(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_PAGE_CHANGING]) + '';

    if trim(EVT_AUINOTEBOOK_BUTTON) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_BUTTON(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_BUTTON]) + '';

    if trim(EVT_AUINOTEBOOK_BEGIN_DRAG) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_BEGIN_DRAG(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_BEGIN_DRAG]) + '';

    if trim(EVT_AUINOTEBOOK_END_DRAG) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_END_DRAG(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_END_DRAG]) + '';

    if trim(EVT_AUINOTEBOOK_DRAG_MOTION) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_DRAG_MOTION(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_DRAG_MOTION]) + '';

    if trim(EVT_AUINOTEBOOK_ALLOW_DND) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_ALLOW_DND(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_ALLOW_DND]) + '';

    if trim(EVT_AUINOTEBOOK_DRAG_DONE) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_DRAG_DONE(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_DRAG_DONE]) + '';

    if trim(EVT_AUINOTEBOOK_TAB_MIDDLE_DOWN) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_TAB_MIDDLE_DOWN(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_TAB_MIDDLE_DOWN]) + '';

    if trim(EVT_AUINOTEBOOK_TAB_MIDDLE_UP) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_TAB_MIDDLE_UP(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_TAB_MIDDLE_UP]) + '';

    if trim(EVT_AUINOTEBOOK_TAB_RIGHT_DOWN) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_TAB_RIGHT_DOWN(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_TAB_RIGHT_DOWN]) + '';

    if trim(EVT_AUINOTEBOOK_TAB_RIGHT_UP) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_TAB_RIGHT_UP(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_TAB_RIGHT_UP]) + '';

    if trim(EVT_AUINOTEBOOK_BG_DCLICK) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_BG_DCLICK(XRCID(%s("%s")),%s::%s)',
        [StringFormat, self.Name, CurrClassName, EVT_AUINOTEBOOK_BG_DCLICK]) + '';

  end
  else
  begin
    if trim(EVT_UPDATE_UI) <> '' then
      Result := Result + #13 + Format('EVT_UPDATE_UI(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_UPDATE_UI]) + '';

    if trim(EVT_AUINOTEBOOK_PAGE_CLOSE) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_PAGE_CLOSE(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_PAGE_CLOSE]) + '';

    if trim(EVT_AUINOTEBOOK_PAGE_CLOSED) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_PAGE_CLOSED(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_PAGE_CLOSED]) + '';

    if trim(EVT_AUINOTEBOOK_PAGE_CHANGED) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_PAGE_CHANGED(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_PAGE_CHANGED]) + '';

    if trim(EVT_AUINOTEBOOK_PAGE_CHANGING) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_PAGE_CHANGING(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_PAGE_CHANGING]) + '';

    if trim(EVT_AUINOTEBOOK_BUTTON) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_BUTTON(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_BUTTON]) + '';

    if trim(EVT_AUINOTEBOOK_BEGIN_DRAG) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_BEGIN_DRAG(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_BEGIN_DRAG]) + '';

    if trim(EVT_AUINOTEBOOK_END_DRAG) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_END_DRAG(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_END_DRAG]) + '';

    if trim(EVT_AUINOTEBOOK_DRAG_MOTION) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_DRAG_MOTION(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_DRAG_MOTION]) + '';

    if trim(EVT_AUINOTEBOOK_ALLOW_DND) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_ALLOW_DND(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_ALLOW_DND]) + '';

    if trim(EVT_AUINOTEBOOK_DRAG_DONE) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_DRAG_DONE(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_DRAG_DONE]) + '';

    if trim(EVT_AUINOTEBOOK_TAB_MIDDLE_DOWN) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_TAB_MIDDLE_DOWN(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_TAB_MIDDLE_DOWN]) + '';

    if trim(EVT_AUINOTEBOOK_TAB_MIDDLE_UP) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_TAB_MIDDLE_UP(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_TAB_MIDDLE_UP]) + '';

    if trim(EVT_AUINOTEBOOK_TAB_RIGHT_DOWN) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_TAB_RIGHT_DOWN(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_TAB_RIGHT_DOWN]) + '';

    if trim(EVT_AUINOTEBOOK_TAB_RIGHT_UP) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_TAB_RIGHT_UP(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_TAB_RIGHT_UP]) + '';

    if trim(EVT_AUINOTEBOOK_BG_DCLICK) <> '' then
      Result := Result + #13 + Format('EVT_AUINOTEBOOK_BG_DCLICK(%s,%s::%s)',
        [WX_IDName, CurrClassName, EVT_AUINOTEBOOK_BG_DCLICK]) + '';

  end;

end;

function TWxAuiNotebook.GenerateXRCControlCreation(IndentString: string): TStringList;
var
  i: integer;
  wxcompInterface: IWxComponentInterface;
  tempstring: TStringList;
  stylstr: string;
begin

  Result := TStringList.Create;

  try

    Result.Add(IndentString + Format('<object class="%s" name="%s">',
      [self.Wx_Class, self.Name]));
    Result.Add(IndentString + Format('  <IDident>%s</IDident>', [self.Wx_IDName]));
    Result.Add(IndentString + Format('  <ID>%d</ID>', [self.Wx_IDValue]));

    if not (UseDefaultSize) then
      Result.Add(IndentString + Format('  <size>%d,%d</size>', [self.Width, self.Height]));
    if not (UseDefaultPos) then
      Result.Add(IndentString + Format('  <pos>%d,%d</pos>', [self.Left, self.Top]));

    stylstr := GetAuiNotebookSpecificStyle(self.Wx_GeneralStyle, {self.Wx_BookAlignment,} Self.Wx_AuiNoteBookStyle);
    if stylstr <> '' then
      Result.Add(IndentString + Format('  <style>%s | %s</style>',
        [GetBookAlignment(self.Wx_BookAlignment), stylstr]))
    else
      Result.Add(IndentString + Format('  <style>%s</style>',
        [GetBookAlignment(self.Wx_BookAlignment)]));

    for i := 0 to self.ControlCount - 1 do // Iterate
      if self.Controls[i].GetInterface(IID_IWxComponentInterface, wxcompInterface) then
        // Only add the XRC control if it is a child of the top-most parent (the form)
        //  If it is a child of a sizer, panel, or other object, then it's XRC code
        //  is created in GenerateXRCControlCreation of that control.
        if (self.Controls[i].GetParentComponent.Name = self.Name) then
        begin
          tempstring := wxcompInterface.GenerateXRCControlCreation('    ' + IndentString);
          try
            Result.AddStrings(tempstring);
          finally
            tempstring.Free;
          end;
        end; // for

    Result.Add(IndentString + '</object>');

  except

    Result.Free;
    raise;

  end;

end;

function TWxAuiNotebook.GenerateGUIControlCreation: string;
var
  strColorStr: string;
  strStyle, parentName, strAlignment, strAlign: string;
  strParentLabel: string;

begin
  Result := '';

    if FWx_PaneCaption = '' then
    FWx_PaneCaption := Self.Name;
  if FWx_PaneName = '' then
    FWx_PaneName := Self.Name + '_Pane';

  parentName := GetWxWidgetParent(self, Wx_AuiManaged);
  strAlign := ', ' + GetBookAlignment(Self.Wx_BookAlignment);

  strStyle := GetAuiNotebookSpecificStyle(self.Wx_GeneralStyle, {Self.Wx_BookAlignment,} Self.Wx_AuiNoteBookStyle);

  if (trim(strStyle) <> '') then
    strStyle := strAlign + ' | ' + strStyle
  else
    strStyle := strAlign;

  if (XRCGEN) then
  begin
    Result := GetCommentString(self.FWx_Comments.Text) +
      Format('%s = XRCCTRL(*%s, %s("%s"), %s);',
      [self.Name, parentName, StringFormat, self.Name, self.wx_Class]);
  end
  else
  begin
    Result := GetCommentString(self.FWx_Comments.Text) +
      Format('%s = new %s(%s, %s, %s, %s%s);',
      [self.Name, self.wx_Class, parentName, GetWxIDString(self.Wx_IDName,
        self.Wx_IDValue),
      GetWxPosition(self.Left, self.Top), GetWxSize(self.Width, self.Height), strStyle]);
  end;

  if trim(self.Wx_ToolTip) <> '' then
    Result := Result + #13 + Format('%s->SetToolTip(%s);',
      [self.Name, GetCppString(self.Wx_ToolTip)]);

  if self.Wx_Hidden then
    Result := Result + #13 + Format('%s->Show(false);', [self.Name]);

  if not Wx_Enabled then
    Result := Result + #13 + Format('%s->Enable(false);', [self.Name]);

  if trim(self.Wx_HelpText) <> '' then
    Result := Result + #13 + Format('%s->SetHelpText(%s);',
      [self.Name, GetCppString(self.Wx_HelpText)]);

  strColorStr := trim(GetwxColorFromString(InvisibleFGColorString));
  if strColorStr <> '' then
    Result := Result + #13 + Format('%s->SetForegroundColour(%s);',
      [self.Name, strColorStr]);

  strColorStr := trim(GetwxColorFromString(InvisibleBGColorString));
  if strColorStr <> '' then
    Result := Result + #13 + Format('%s->SetBackgroundColour(%s);',
      [self.Name, strColorStr]);

  strColorStr := GetWxFontDeclaration(self.Font);
  if strColorStr <> '' then
    Result := Result + #13 + Format('%s->SetFont(%s);', [self.Name, strColorStr]);

  if (wxAUI_NB_TAB_FIXED_WIDTH in FWx_AuiNotebookStyle) then
    Result := Result + #13 + Format('%s->SetTabSize(%s);', [self.Name, GetTabWidth, GetTabHeight]);

  if not (XRCGEN) then //NUKLEAR ZELPH
  begin
    if (Wx_AuiManaged and FormHasAuiManager(self)) and not (self.Parent is TWxSizerPanel) then
    begin
      if HasToolbarPaneStyle(Self.Wx_Aui_Pane_Style) then
      begin
        Self.Wx_Aui_Pane_Style := Self.Wx_Aui_Pane_Style + [ToolbarPane]; //always make sure we are a toolbar
        Self.Wx_Layer := 10;
      end;

      if not HasToolbarPaneStyle(Self.Wx_Aui_Pane_Style) then
      begin
        if (self.Parent.ClassName = 'TWxPanel') then
          if not (self.Parent.Parent is TForm) then
            Result := Result + #13 + Format('%s->Reparent(this);', [parentName]);
      end;

      if (self.Parent is TWxAuiToolBar) then
        Result := Result + #13 + Format('%s->AddControl(%s);',
          [self.Parent.Name, self.Name])
      else
        Result := Result + #13 + Format('%s->AddPane(%s, wxAuiPaneInfo()%s%s%s%s%s%s%s%s%s%s%s%s);',
          [GetAuiManagerName(self), self.Name,
          GetAuiPaneName(Self.Wx_PaneName),
            GetAuiPaneCaption(Self.Wx_PaneCaption),
            GetAuiDockDirection(Self.Wx_Aui_Dock_Direction),
            GetAuiDockableDirections(self.Wx_Aui_Dockable_Direction),
            GetAui_Pane_Style(Self.Wx_Aui_Pane_Style),
            GetAui_Pane_Buttons(Self.Wx_Aui_Pane_Buttons),
            GetAuiRow(Self.Wx_Row),
            GetAuiPosition(Self.Wx_Position),
            GetAuiLayer(Self.Wx_Layer),
            GetAuiPaneBestSize(Self.Wx_BestSize_Width, Self.Wx_BestSize_Height),
            GetAuiPaneMinSize(Self.Wx_MinSize_Width, Self.Wx_MinSize_Height),
            GetAuiPaneMaxSize(Self.Wx_MaxSize_Width, Self.Wx_MaxSize_Height)]);

    end
    else
    begin
      if (self.Parent is TWxSizerPanel) then
      begin
        strAlignment := SizerAlignmentToStr(Wx_Alignment) + ' | ' + BorderAlignmentToStr(Wx_BorderAlignment);
        Result := Result + #13 + Format('%s->Add(%s,%d,%s,%d);',
          [self.Parent.Name, self.Name, self.Wx_StretchFactor, strAlignment,
          self.Wx_Border]);
      end;

      if (self.Parent is TWxAuiNotebookPage) then
      begin
        //        strParentLabel := TWxAuiNoteBookPage(Self.Parent).Caption;
        Result := Result + #13 + Format('%s->AddPage(%s, %s);',
          //          [self.Parent.Parent.Name, self.Name, GetCppString(strParentLabel)]);
          [self.Parent.Parent.Name, self.Name, GetCppString(TWxAuiNoteBookPage(Self.Parent).Caption)]);
      end;

      if (self.Parent is TWxAuiToolBar) then
        Result := Result + #13 + Format('%s->AddControl(%s);',
          [self.Parent.Name, self.Name]);
    end;
  end;
end;

function TWxAuiNotebook.GenerateGUIControlDeclaration: string;
begin
  Result := '';
  Result := Format('%s *%s;', [Self.wx_Class, Self.Name]);
end;

function TWxAuiNotebook.GenerateHeaderInclude: string;
begin
  Result := '';
  Result := '#include <wx/aui/auibook.h>';
end;

function TWxAuiNotebook.GenerateImageInclude: string;
begin

end;

function TWxAuiNotebook.GetEventList: TStringList;
begin
  Result := FWx_EventList;
end;

function TWxAuiNotebook.GetIDName: string;
begin
  Result := '';
  Result := wx_IDName;
end;

function TWxAuiNotebook.GetIDValue: longint;
begin
  Result := wx_IDValue;
end;

function TWxAuiNotebook.GetParameterFromEventName(EventName: string): string;
begin
  if EventName = 'EVT_UPDATE_UI' then
  begin
    Result := 'wxUpdateUIEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_PAGE_CLOSE' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_PAGE_CLOSED' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_PAGE_CHANGED' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_PAGE_CHANGING' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_BUTTON' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_BEGIN_DRAG' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_END_DRAG' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_DRAG_MOTION' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_ALLOW_DND' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_DRAG_DONE' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_TAB_MIDDLE_DOWN' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_TAB_MIDDLE_UP' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_TAB_RIGHT_DOWN' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_TAB_RIGHT_UP' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;
  if EventName = 'EVT_AUINOTEBOOK_BG_DCLICK' then
  begin
    Result := 'wxAuiNotebookEvent& event';
    exit;
  end;

end;

function TWxAuiNotebook.GetPropertyList: TStringList;
begin
  Result := FWx_PropertyList;
end;

function TWxAuiNotebook.GetStretchFactor: integer;
begin
  Result := FWx_StretchFactor;
end;

function TWxAuiNotebook.GetTypeFromEventName(EventName: string): string;
begin

end;

function TWxAuiNotebook.GetBorderAlignment: TWxBorderAlignment;
begin
  Result := FWx_BorderAlignment;
end;

procedure TWxAuiNotebook.SetBorderAlignment(border: TWxBorderAlignment);
begin
  FWx_BorderAlignment := border;
end;

function TWxAuiNotebook.GetBorderWidth: integer;
begin
  Result := FWx_Border;
end;

procedure TWxAuiNotebook.SetBorderWidth(width: integer);
begin
  FWx_Border := width;
end;

function TWxAuiNotebook.GetWxClassName: string;
begin
  if trim(wx_Class) = '' then
    wx_Class := 'wxAuiNoteBook';
  Result := wx_Class;
end;

function TWxAuiNotebook.GetTabHeight: integer;
begin
  Result := FWx_TabHeight;
end;

procedure TWxAuiNotebook.SetTabHeight(height: integer);
begin
  FWx_TabHeight := height;
end;

function TWxAuiNotebook.GetTabWidth: integer;
begin
  Result := FWx_TabWidth;
end;

procedure TWxAuiNotebook.SetTabWidth(width: integer);
begin
  FWx_TabWidth := width;
end;

procedure TWxAuiNotebook.SaveControlOrientation(ControlOrientation: TWxControlOrientation);
begin
  wx_ControlOrientation := ControlOrientation;
end;

procedure TWxAuiNotebook.SetAuiNotebookStyle(style: TWxAuinbxStyleSet);
begin
  Self.FWx_AuiNoteBookStyle := style;

{  if (Self.TabPosition = tpLeft) or (Self.TabPosition = tpRight) then
    Self.MultiLine := True
  else
    self.MultiLine := wxNB_MULTILINE in FWx_NotebookStyle;

  if (wxNB_FIXEDWIDTH in FWx_NotebookStyle) then
  begin
    self.TabWidth := self.Wx_TabWidth;
    Self.TabHeight := Self.Wx_TabHeight;
  end
  else
  begin
    self.TabWidth := 0;
    Self.TabHeight := 0;
  end;
 }
end;

procedure TWxAuiNotebook.SetIDName(IDName: string);
begin
  wx_IDName := IDName;
end;

procedure TWxAuiNotebook.SetIDValue(IDValue: longint);
begin
  Wx_IDValue := IDVAlue;
end;

procedure TWxAuiNotebook.SetStretchFactor(intValue: integer);
begin
  FWx_StretchFactor := intValue;
end;

procedure TWxAuiNotebook.SetWxClassName(wxClassName: string);
begin
  wx_Class := wxClassName;
end;

function TWxAuiNotebook.GetGenericColor(strVariableName: string): string;
begin

end;

procedure TWxAuiNotebook.SetGenericColor(strVariableName, strValue: string);
begin

end;

function TWxAuiNotebook.GetFGColor: string;
begin
  Result := FInvisibleFGColorString;
end;

procedure TWxAuiNotebook.SetFGColor(strValue: string);
begin
  FInvisibleFGColorString := strValue;
  if IsDefaultColorStr(strValue) then
    self.Font.Color := defaultFGColor
  else
    self.Font.Color := GetColorFromString(strValue);
end;

function TWxAuiNotebook.GetBGColor: string;
begin
  Result := FInvisibleBGColorString;
end;

procedure TWxAuiNotebook.SetBGColor(strValue: string);
begin
  FInvisibleBGColorString := strValue;
  if IsDefaultColorStr(strValue) then
    self.Color := defaultBGColor
  else
    self.Color := GetColorFromString(strValue);
end;

procedure TWxAuiNotebook.SetProxyFGColorString(Value: string);
begin
  FInvisibleFGColorString := Value;
  self.Color := GetColorFromString(Value);
end;

procedure TWxAuiNotebook.SetProxyBGColorString(Value: string);
begin
  FInvisibleBGColorString := Value;
  self.Font.Color := GetColorFromString(Value);
end;

function TWxAuiNotebook.GenerateLastCreationCode: string;
begin
  Result := '';
end;

function TWxAuiNotebook.GetBookAlignment(Value: TWxAuinbxAlignStyleItem): string;
begin
  if Value = wxAUI_NB_BOTTOM then
  begin
    Result := 'wxAUI_NB_BOTTOM';
//    Self.TabPosition := tpBottom;
    exit;
  end;
  {  if Value = wxAUI_NB_RIGHT then
    begin
      Result := 'wxAUI_NB_RIGHT';
      self.MultiLine := True;
      Self.TabPosition := tpRight;
      exit;
    end;
    if Value = wxAUI_NB_LEFT then
    begin
      Result := 'wxAUI_NB_LEFT';
      self.MultiLine := True;
      Self.TabPosition := tpLeft;
      exit;
    end;
    }if Value = wxAUI_NB_TOP then
  begin
    Result := 'wxAUI_NB_TOP';
//    Self.TabPosition := tpTop;
    exit;
  end;
end;

end.
