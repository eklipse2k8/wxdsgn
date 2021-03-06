{ ****************************************************************** }
{                                                                    }
{ $Id$                                                            }
{                                                                    }
{                                                                    }
{   Copyright � 2008 by Malcolm Nealon                   }
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

Unit wxFilePickerCtrl;

Interface

Uses WinTypes, WinProcs, Messages, SysUtils, Classes, Controls, Dialogs,
    Forms, Graphics, ComCtrls, ExtCtrls, StdCtrls, WxUtils, WxAuiToolBar, WxAuiNotebookPage, WxSizerPanel, Buttons, janButtonEdit {SsButtonEd} {ColourPickerControl};

Type

    TWxFilePickerCtrl = Class(TjanButtonEdit, IWxComponentInterface, IWxValidatorInterface)
    Private
        FEVT_FILEPICKER_CHANGED: String;
        FEVT_UPDATE_UI: String;
        FWx_BKColor: TColor;
        FWx_Border: Integer;
        FWx_FilePickStyles: TWxFilePickCtrlStyleSet;
        FWx_Class: String;
        FWx_ControlOrientation: TWxControlOrientation;
        FWx_Default: Boolean;
        FWx_Enabled: Boolean;
        FWx_EventList: TStringList;
        FWx_FGColor: TColor;
        FWx_GeneralStyle: TWxStdStyleSet;
        FWx_HelpText: String;
        FWx_Hidden: Boolean;
        FWx_IDName: String;
        FWx_IDValue: Integer;
        FWx_Validator: String;
        FWx_ProxyBGColorString: TWxColorString;
        FWx_ProxyFGColorString: TWxColorString;
        FWx_StretchFactor: Integer;
        FWx_ToolTip: String;
        FWx_PropertyList: TStringList;
        FInvisibleBGColorString: String;
        FInvisibleFGColorString: String;
        FWx_Comments: TStrings;
        FWx_Alignment: TWxSizerAlignmentSet;
        FWx_BorderAlignment: TWxBorderAlignment;
        FWx_ProxyValidatorString: TWxValidatorString;
FInvisibleColorString: String;

FWx_Path: String;
        FWx_Message: String;
        FWx_Wildcard: String;

//Aui Properties
        FWx_AuiManaged: Boolean;
        FWx_PaneCaption: String;
        FWx_PaneName: String;
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

    { Private methods of TWxFilePickerCtrl }
        Procedure AutoInitialize;
        Procedure AutoDestroy;

      Function GetPropertyName(Idx: Integer): String;
    Protected

    Public
        defaultBGColor: TColor;
        defaultFGColor: TColor;
    { Public methods of TWxFilePickerCtrl }
        Constructor Create(AOwner: TComponent); Override;
        Destructor Destroy; Override;
        Function GenerateControlIDs: String;
        Function GenerateEnumControlIDs: String;
        Function GenerateEventTableEntries(CurrClassName: String): String;
        Function GenerateGUIControlCreation: String;
        Function GenerateXRCControlCreation(IndentString: String): TStringList;
        Function GenerateGUIControlDeclaration: String;
        Function GenerateHeaderInclude: String;
        Function GenerateImageInclude: String;
        Function GetEventList: TStringList;
        Function GetIDName: String;
        Function GetIDValue: Integer;
        Function GetParameterFromEventName(EventName: String): String;
        Function GetPropertyList: TStringList;
        Function GetTypeFromEventName(EventName: String): String;
        Function GetWxClassName: String;
        Procedure SaveControlOrientation(ControlOrientation: TWxControlOrientation);
        Procedure SetIDName(IDName: String);
        Procedure SetIDValue(IDValue: Integer);
        Procedure SetWxClassName(wxClassName: String);

        Function GetBorderAlignment: TWxBorderAlignment;
        Procedure SetBorderAlignment(border: TWxBorderAlignment);
        Function GetBorderWidth: Integer;
        Procedure SetBorderWidth(width: Integer);
        Function GetStretchFactor: Integer;
        Procedure SetStretchFactor(intValue: Integer);

        Function GetValidator: String;
        Procedure SetValidator(value: String);
        Function GetValidatorString: TWxValidatorString;
        Procedure SetValidatorString(Value: TWxValidatorString);

        Function GetFGColor: String;
        Procedure SetFGColor(strValue: String);
        Function GetBGColor: String;
        Procedure SetBGColor(strValue: String);

        Function GetGenericColor(strVariableName: String): String;
        Procedure SetGenericColor(strVariableName, strValue: String);

        Procedure SetProxyFGColorString(Value: String);
        Procedure SetProxyBGColorString(Value: String);

        Function GetFilePickerCtrlStyleString(stdStyle: TWxFilePickCtrlStyleSet): String;
        Function GetFilePickerCtrlSpecificStyle(stdstyle: TWxStdStyleSet; dlgstyle: TWxFilePickCtrlStyleSet): String;
//function GetWXColorFromString(strColorValue: string): string;

    Published
        Property Color;
        Property OnClick;
        Property OnDblClick;
        Property OnDragDrop;
        Property OnMouseDown;
        Property OnMouseMove;
        Property OnMouseUp;
        Property EVT_FILEPICKER_CHANGED: String Read FEVT_FILEPICKER_CHANGED Write FEVT_FILEPICKER_CHANGED;
        Property EVT_UPDATE_UI: String Read FEVT_UPDATE_UI Write FEVT_UPDATE_UI;
        Property Wx_BKColor: TColor Read FWx_BKColor Write FWx_BKColor;
        Property Wx_FilePickStyles: TWxFilePickCtrlStyleSet Read FWx_FilePickStyles Write FWx_FilePickStyles;
        Property Wx_Class: String Read FWx_Class Write FWx_Class;
        Property Wx_ControlOrientation: TWxControlOrientation
            Read FWx_ControlOrientation Write FWx_ControlOrientation;
        Property Wx_Default: Boolean Read FWx_Default Write FWx_Default;
        Property Wx_Enabled: Boolean Read FWx_Enabled Write FWx_Enabled Default True;
        Property Wx_EventList: TStringList Read FWx_EventList Write FWx_EventList;
        Property Wx_FGColor: TColor Read FWx_FGColor Write FWx_FGColor;
        Property Wx_GeneralStyle: TWxStdStyleSet
            Read FWx_GeneralStyle Write FWx_GeneralStyle;
        Property Wx_HelpText: String Read FWx_HelpText Write FWx_HelpText;
        Property Wx_Hidden: Boolean Read FWx_Hidden Write FWx_Hidden;
        Property Wx_IDName: String Read FWx_IDName Write FWx_IDName;
        Property Wx_IDValue: Integer Read FWx_IDValue Write FWx_IDValue Default -1;
        Property Wx_Validator: String Read FWx_Validator Write FWx_Validator;
        Property Wx_ProxyValidatorString: TWxValidatorString Read GetValidatorString Write SetValidatorString;
        Property Wx_ToolTip: String Read FWx_ToolTip Write FWx_ToolTip;
        Property Wx_Comments: TStrings Read FWx_Comments Write FWx_Comments;

        Property Wx_Border: Integer Read GetBorderWidth Write SetBorderWidth Default 5;
        Property Wx_BorderAlignment: TWxBorderAlignment Read GetBorderAlignment Write SetBorderAlignment Default [wxALL];
        Property Wx_Alignment: TWxSizerAlignmentSet Read FWx_Alignment Write FWx_Alignment Default [wxALIGN_CENTER];
        Property Wx_StretchFactor: Integer Read GetStretchFactor Write SetStretchFactor Default 0;

        Property InvisibleBGColorString: String Read FInvisibleBGColorString Write FInvisibleBGColorString;
        Property InvisibleFGColorString: String Read FInvisibleFGColorString Write FInvisibleFGColorString;
        Property Wx_ProxyBGColorString: TWxColorString Read FWx_ProxyBGColorString Write FWx_ProxyBGColorString;
        Property Wx_ProxyFGColorString: TWxColorString Read FWx_ProxyFGColorString Write FWx_ProxyFGColorString;
        Property InvisibleColorString: String Read FInvisibleColorString Write FInvisibleColorString;

        Property Wx_Path: String Read FWx_Path Write FWx_Path;
        Property Wx_Message: String Read FWx_Message Write FWx_Message;
        Property Wx_Wildcard: String Read FWx_Wildcard Write FWx_Wildcard;



//Aui Properties
        Property Wx_AuiManaged: Boolean Read FWx_AuiManaged Write FWx_AuiManaged Default False;
        Property Wx_PaneCaption: String Read FWx_PaneCaption Write FWx_PaneCaption;
        Property Wx_PaneName: String Read FWx_PaneName Write FWx_PaneName;
        Property Wx_Aui_Dock_Direction: TwxAuiPaneDockDirectionItem Read FWx_Aui_Dock_Direction Write FWx_Aui_Dock_Direction;
        Property Wx_Aui_Dockable_Direction: TwxAuiPaneDockableDirectionSet Read FWx_Aui_Dockable_Direction Write FWx_Aui_Dockable_Direction;
        Property Wx_Aui_Pane_Style: TwxAuiPaneStyleSet Read FWx_Aui_Pane_Style Write FWx_Aui_Pane_Style;
        Property Wx_Aui_Pane_Buttons: TwxAuiPaneButtonSet Read FWx_Aui_Pane_Buttons Write FWx_Aui_Pane_Buttons;
        Property Wx_BestSize_Height: Integer Read FWx_BestSize_Height Write FWx_BestSize_Height Default -1;
        Property Wx_BestSize_Width: Integer Read FWx_BestSize_Width Write FWx_BestSize_Width Default -1;
        Property Wx_MinSize_Height: Integer Read FWx_MinSize_Height Write FWx_MinSize_Height Default -1;
        Property Wx_MinSize_Width: Integer Read FWx_MinSize_Width Write FWx_MinSize_Width Default -1;
        Property Wx_MaxSize_Height: Integer Read FWx_MaxSize_Height Write FWx_MaxSize_Height Default -1;
        Property Wx_MaxSize_Width: Integer Read FWx_MaxSize_Width Write FWx_MaxSize_Width Default -1;
        Property Wx_Floating_Height: Integer Read FWx_Floating_Height Write FWx_Floating_Height Default -1;
        Property Wx_Floating_Width: Integer Read FWx_Floating_Width Write FWx_Floating_Width Default -1;
        Property Wx_Floating_X_Pos: Integer Read FWx_Floating_X_Pos Write FWx_Floating_X_Pos Default -1;
        Property Wx_Floating_Y_Pos: Integer Read FWx_Floating_Y_Pos Write FWx_Floating_Y_Pos Default -1;
        Property Wx_Layer: Integer Read FWx_Layer Write FWx_Layer Default 0;
        Property Wx_Row: Integer Read FWx_Row Write FWx_Row Default 0;
        Property Wx_Position: Integer Read FWx_Position Write FWx_Position Default 0;


    End;

Procedure Register;

Implementation

Procedure Register;
Begin
    RegisterComponents('wxWidgets', [TWxFilePickerCtrl]);
End;

Procedure TWxFilePickerCtrl.AutoInitialize;
Begin
    FWx_PropertyList := TStringList.Create;
    FWx_Border := 5;
    FWx_Class := 'wxFilePickerCtrl';
    FWx_Enabled := True;
    FWx_EventList := TStringList.Create;
    FWx_BorderAlignment := [wxAll];
    FWx_Alignment := [wxALIGN_CENTER];
    FWx_IDValue := -1;
    FWx_StretchFactor := 0;
    FWx_Comments := TStringList.Create;
    FWx_ProxyBGColorString := TWxColorString.Create;
    FWx_ProxyFGColorString := TWxColorString.Create;
    FWx_ProxyValidatorString := TwxValidatorString.Create(self);
    defaultBGColor := self.color;
    defaultFGColor := self.font.color;
    FWx_FilePickStyles := [wxFLP_DEFAULT_STYLE];
    Self.ShowEdit := True;
    FWx_Path := '';
    FWx_Message := 'Select a file';
    FWx_Wildcard := '*.*';
    Self.Width := 185;


End; { of AutoInitialize }

Procedure TWxFilePickerCtrl.AutoDestroy;
Begin
    FWx_PropertyList.Destroy;
    FWx_EventList.Destroy;
    FWx_ProxyBGColorString.Destroy;
    FWx_ProxyFGColorString.Destroy;
    FWx_Comments.Destroy;
    FWx_ProxyValidatorString.Destroy;
End; { of AutoDestroy }


Constructor TWxFilePickerCtrl.Create(AOwner: TComponent);
Begin
    Inherited Create(AOwner);
    AutoInitialize;

    PopulateGenericProperties(FWx_PropertyList);
    PopulateAuiGenericProperties(FWx_PropertyList);

    FWx_PropertyList.add('Wx_Path:Path');
    FWx_PropertyList.add('Wx_Message:Message');
    FWx_PropertyList.add('Wx_Wildcard:Wildcard');
    FWx_PropertyList.add('Wx_FilePickStyles:FilePickerStyles');
    FWx_PropertyList.add('wxFLP_DEFAULT_STYLE:wxFLP_DEFAULT_STYLE');
    FWx_PropertyList.add('wxFLP_USE_TEXTCTRL:wxFLP_USE_TEXTCTRL');
    FWx_PropertyList.add('wxFLP_OPEN:wxFLP_OPEN');
FWx_PropertyList.add('wxFLP_SAVE:wxFLP_SAVE');
FWx_PropertyList.add('wxFLP_OVERWRITE_PROMPT:wxFLP_OVERWRITE_PROMPT');
FWx_PropertyList.add('wxFLP_FILE_MUST_EXIST:wxFLP_FILE_MUST_EXIST');
FWx_PropertyList.add('wxFLP_CHANGE_DIR:wxFLP_CHANGE_DIR');

FWx_EventList.add('EVT_FILEPICKER_CHANGED:OnFileChanged');
FWx_EventList.add('EVT_UPDATE_UI:OnUpdateUI');

End;

Destructor TWxFilePickerCtrl.Destroy;
Begin
    AutoDestroy;
    Inherited Destroy;
End;

Function TWxFilePickerCtrl.GenerateEnumControlIDs: String;
Begin
    Result := GetWxEnum(self.Wx_IDValue, self.Wx_IDName);
End;

Function TWxFilePickerCtrl.GenerateControlIDs: String;
Begin
    Result := '';
    If (Wx_IDValue > 0) And (trim(Wx_IDName) <> '') Then
        Result := Format('#define %s %d', [Wx_IDName, Wx_IDValue]);
End;

Function TWxFilePickerCtrl.GenerateEventTableEntries(CurrClassName: String): String;
Begin
    Result := '';

    If (XRCGEN) Then
    Begin
        If trim(EVT_FILEPICKER_CHANGED) <> '' Then
            Result := Format('EVT_FILEPICKER_CHANGED(XRCID(%s("%s")),%s::%s)',
                [StringFormat, self.Name, CurrClassName, EVT_FILEPICKER_CHANGED]) + '';

        If trim(EVT_UPDATE_UI) <> '' Then
            Result := Result + #13 + Format('EVT_UPDATE_UI(XRCID(%s("%s")),%s::%s)',
                [StringFormat, self.Name, CurrClassName, EVT_UPDATE_UI]) + '';
    End
    Else
    Begin
        If trim(EVT_FILEPICKER_CHANGED) <> '' Then
            Result := Format('EVT_FILEPICKER_CHANGED(%s,%s::%s)',
                [WX_IDName, CurrClassName, EVT_FILEPICKER_CHANGED]) + '';

        If trim(EVT_UPDATE_UI) <> '' Then
            Result := Result + #13 + Format('EVT_UPDATE_UI(%s,%s::%s)',
                [WX_IDName, CurrClassName, EVT_UPDATE_UI]) + '';
    End;

End;

Function TWxFilePickerCtrl.GenerateXRCControlCreation(IndentString: String): TStringList;
//Var
   // i: Integer;
   // wxcompInterface: IWxComponentInterface;
   // tempstring: TStringList;
   // stylstr: String;
Begin

    Result := TStringList.Create;

    Try

        Result.Add(IndentString + Format('<object class="%s" name="%s">',
            [self.Wx_Class, self.Name]));
        Result.Add(IndentString + Format('  <IDident>%s</IDident>', [self.Wx_IDName]));
        Result.Add(IndentString + Format('  <ID>%d</ID>', [self.Wx_IDValue]));

        If Not (UseDefaultSize) Then
            Result.Add(IndentString + Format('  <size>%d,%d</size>', [self.Width, self.Height]));
        If Not (UseDefaultPos) Then
            Result.Add(IndentString + Format('  <pos>%d,%d</pos>', [self.Left, self.Top]));

        Result.Add(IndentString + Format('  <style>%s</style>',
            [GetFilePickerCtrlSpecificStyle(self.Wx_GeneralStyle, Wx_FilePickStyles)]));
        Result.Add(IndentString + '</object>');

    Except

        Result.Free;
        Raise;

    End;

End;

Function TWxFilePickerCtrl.GenerateGUIControlCreation: String;
Var
    strColorStr: String;
    strStyle, parentName, strAlignment: String;
Begin
    Result := '';

    strStyle := GetFilePickerCtrlSpecificStyle(self.Wx_GeneralStyle, Wx_FilePickStyles);
    If FWx_PaneCaption = '' Then
        FWx_PaneCaption := Self.Name;
    If FWx_PaneName = '' Then
        FWx_PaneName := Self.Name + '_Pane';

    parentName := GetWxWidgetParent(self, Wx_AuiManaged);

    If trim(Wx_ProxyValidatorString.strValidatorValue) <> '' Then
    Begin
        If trim(strStyle) <> '' Then
            strStyle := ', ' + strStyle + ', ' + Wx_ProxyValidatorString.strValidatorValue
        Else
            strStyle := ', 0, ' + Wx_ProxyValidatorString.strValidatorValue;

        strStyle := strStyle + ', ' + GetCppString(Name);

    End
    Else
    If trim(strStyle) <> '' Then
        strStyle := ', ' + strStyle + ', wxDefaultValidator, ' + GetCppString(Name)
    Else
        strStyle := ', 0, wxDefaultValidator, ' + GetCppString(Name);

    If (XRCGEN) Then
    Begin//generate xrc loading code
        Result := GetCommentString(self.FWx_Comments.Text) +
            Format('%s = XRCCTRL(*%s, %s("%s"), %s);',
            [self.Name, parentName, StringFormat, self.Name, self.wx_Class]);
    End
    Else
    Begin
        Result := GetCommentString(self.FWx_Comments.Text) +
            Format('%s = new %s(%s, %s, %s, %s, %s, %s, %s%s);',
            [self.Name, self.wx_Class, parentName, GetWxIDString(self.Wx_IDName,
            self.Wx_IDValue), GetCppString(self.Wx_Path), GetCppString(self.Wx_Message), GetCppString(self.Wx_Wildcard), GetWxPosition(self.Left, self.Top), GetWxSize(self.Width, self.Height),
            strStyle]);
    End;

    If trim(self.Wx_ToolTip) <> '' Then
        Result := Result + #13 + Format('%s->SetToolTip(%s);',
            [self.Name, GetCppString(self.Wx_ToolTip)]);

    If self.Wx_Hidden Then
        Result := Result + #13 + Format('%s->Show(false);', [self.Name]);

    If Not Wx_Enabled Then
        Result := Result + #13 + Format('%s->Enable(false);', [self.Name]);

    If trim(self.Wx_HelpText) <> '' Then
        Result := Result + #13 + Format('%s->SetHelpText(%s);',
            [self.Name, GetCppString(self.Wx_HelpText)]);

    strColorStr := trim(GetwxColorFromString(InvisibleFGColorString));
    If strColorStr <> '' Then
        Result := Result + #13 + Format('%s->SetForegroundColour(%s);',
            [self.Name, strColorStr]);

    strColorStr := trim(GetwxColorFromString(InvisibleBGColorString));
    If strColorStr <> '' Then
        Result := Result + #13 + Format('%s->SetBackgroundColour(%s);',
            [self.Name, strColorStr]);

    strColorStr := GetWxFontDeclaration(self.Font);
    If strColorStr <> '' Then
        Result := Result + #13 + Format('%s->SetFont(%s);', [self.Name, strColorStr]);

    If Not (XRCGEN) Then //NUKLEAR ZELPH
    Begin
        If (Wx_AuiManaged And FormHasAuiManager(self)) And Not (self.Parent Is TWxSizerPanel) Then
        Begin
            If HasToolbarPaneStyle(Self.Wx_Aui_Pane_Style) Then
            Begin
                Self.Wx_Aui_Pane_Style := Self.Wx_Aui_Pane_Style + [ToolbarPane]; //always make sure we are a toolbar
                Self.Wx_Layer := 10;
            End;

            If Not HasToolbarPaneStyle(Self.Wx_Aui_Pane_Style) Then
            Begin
                If (self.Parent.ClassName = 'TWxPanel') Then
                    If Not (self.Parent.Parent Is TForm) Then
                        Result := Result + #13 + Format('%s->Reparent(this);', [parentName]);
            End;

            If (self.Parent Is TWxAuiToolBar) Then
                Result := Result + #13 + Format('%s->AddControl(%s);',
                    [self.Parent.Name, self.Name])
            Else
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

        End
        Else
        Begin
            If (self.Parent Is TWxSizerPanel) Then
            Begin
                strAlignment := SizerAlignmentToStr(Wx_Alignment) + ' | ' + BorderAlignmentToStr(Wx_BorderAlignment);
                Result := Result + #13 + Format('%s->Add(%s, %d, %s, %d);',
                    [self.Parent.Name, self.Name, self.Wx_StretchFactor, strAlignment,
                    self.Wx_Border]);
            End;

            If (self.Parent Is TWxAuiNotebookPage) Then
            Begin
        //        strParentLabel := TWxAuiNoteBookPage(Self.Parent).Caption;
                Result := Result + #13 + Format('%s->AddPage(%s, %s);',
          //          [self.Parent.Parent.Name, self.Name, GetCppString(strParentLabel)]);
                    [self.Parent.Parent.Name, self.Name, GetCppString(TWxAuiNoteBookPage(Self.Parent).Caption)]);
            End;

            If (self.Parent Is TWxAuiToolBar) Then
                Result := Result + #13 + Format('%s->AddControl(%s);',
                    [self.Parent.Name, self.Name]);
        End;
    End;

End;

Function TWxFilePickerCtrl.GenerateGUIControlDeclaration: String;
Begin
    Result := '';
    Result := Format('%s *%s;', [Self.wx_Class, Self.Name]);
End;

Function TWxFilePickerCtrl.GenerateHeaderInclude: String;
Begin
    Result := '';
    Result := '#include <wx/filepicker.h>';
End;

Function TWxFilePickerCtrl.GenerateImageInclude: String;
Begin

End;

Function TWxFilePickerCtrl.GetEventList: TStringList;
Begin
    Result := FWx_EventList;
End;

Function TWxFilePickerCtrl.GetIDName: String;
Begin
    Result := '';
    Result := wx_IDName;
End;

Function TWxFilePickerCtrl.GetIDValue: Integer;
Begin
    Result := wx_IDValue;
End;

Function TWxFilePickerCtrl.GetParameterFromEventName(EventName: String): String;
Begin
    If EventName = 'EVT_FILEPICKER_CHANGED' Then
    Begin
        Result := 'wxFileDirPickerEvent& event';
        exit;
    End;
    If EventName = 'EVT_UPDATE_UI' Then
    Begin
        Result := 'wxUpdateUIEvent& event';
        exit;
    End;
End;

Function TWxFilePickerCtrl.GetPropertyList: TStringList;
Begin
    Result := FWx_PropertyList;
End;

Function TWxFilePickerCtrl.GetStretchFactor: Integer;
Begin
    Result := FWx_StretchFactor;
End;

Function TWxFilePickerCtrl.GetTypeFromEventName(EventName: String): String;
Begin

End;

Function TWxFilePickerCtrl.GetBorderAlignment: TWxBorderAlignment;
Begin
    Result := FWx_BorderAlignment;
End;

Procedure TWxFilePickerCtrl.SetBorderAlignment(border: TWxBorderAlignment);
Begin
    FWx_BorderAlignment := border;
End;

Function TWxFilePickerCtrl.GetBorderWidth: Integer;
Begin
    Result := FWx_Border;
End;

Procedure TWxFilePickerCtrl.SetBorderWidth(width: Integer);
Begin
    FWx_Border := width;
End;

Function TWxFilePickerCtrl.GetWxClassName: String;
Begin
    If trim(wx_Class) = '' Then
        wx_Class := 'wxFilePickerCtrl';
    Result := wx_Class;
End;

Procedure TWxFilePickerCtrl.SaveControlOrientation(ControlOrientation: TWxControlOrientation);
Begin
    wx_ControlOrientation := ControlOrientation;
End;

Procedure TWxFilePickerCtrl.SetIDName(IDName: String);
Begin
    wx_IDName := IDName;
End;

Procedure TWxFilePickerCtrl.SetIDValue(IDValue: Integer);
Begin
    Wx_IDValue := IDValue;
End;

Procedure TWxFilePickerCtrl.SetStretchFactor(intValue: Integer);
Begin
    FWx_StretchFactor := intValue;
End;

Procedure TWxFilePickerCtrl.SetWxClassName(wxClassName: String);
Begin
    wx_Class := wxClassName;
End;

Function TWxFilePickerCtrl.GetGenericColor(strVariableName: String): String;
Begin

    Result := FInvisibleColorString;

End;

Procedure TWxFilePickerCtrl.SetGenericColor(strVariableName, strValue: String);
Begin
    FInvisibleColorString := strValue;
End;

Function TWxFilePickerCtrl.GetFGColor: String;
Begin
    Result := FInvisibleFGColorString;
End;

Procedure TWxFilePickerCtrl.SetFGColor(strValue: String);
Begin
    FInvisibleFGColorString := strValue;
    If IsDefaultColorStr(strValue) Then
        self.Font.Color := defaultFGColor
    Else
        self.Font.Color := GetColorFromString(strValue);
End;

Function TWxFilePickerCtrl.GetBGColor: String;
Begin
    Result := FInvisibleBGColorString;
End;

Procedure TWxFilePickerCtrl.SetBGColor(strValue: String);
Begin
    FInvisibleBGColorString := strValue;
    If IsDefaultColorStr(strValue) Then
        self.Color := defaultBGColor
    Else
        self.Color := GetColorFromString(strValue);
End;

Procedure TWxFilePickerCtrl.SetProxyFGColorString(Value: String);
Begin
    FInvisibleFGColorString := Value;
    self.Color := GetColorFromString(Value);
End;

Procedure TWxFilePickerCtrl.SetProxyBGColorString(Value: String);
Begin
    FInvisibleBGColorString := Value;
    self.Font.Color := GetColorFromString(Value);
End;

Function TWxFilePickerCtrl.GetValidatorString: TWxValidatorString;
Begin
    Result := FWx_ProxyValidatorString;
    Result.FstrValidatorValue := Wx_Validator;
End;

Procedure TWxFilePickerCtrl.SetValidatorString(Value: TWxValidatorString);
Begin
    FWx_ProxyValidatorString.FstrValidatorValue := Value.FstrValidatorValue;
    Wx_Validator := Value.FstrValidatorValue;
End;

Function TWxFilePickerCtrl.GetValidator: String;
Begin
    Result := Wx_Validator;
End;

Procedure TWxFilePickerCtrl.SetValidator(value: String);
Begin
    Wx_Validator := value;
End;

Function TWxFilePickerCtrl.GetPropertyName(Idx: Integer): String;
Begin
    Result := Name;
End;


Function TWxFilePickerCtrl.GetFilePickerCtrlStyleString(stdStyle: TWxFilePickCtrlStyleSet): String;
Var
    I: Integer;
    strLst: TStringList;
Begin

    strLst := TStringList.Create;

    Try
        If wxFLP_DEFAULT_STYLE In stdStyle Then
            strLst.add('wxFLP_DEFAULT_STYLE');

        If wxFLP_USE_TEXTCTRL In stdStyle Then
        Begin
            strLst.add('wxFLP_USE_TEXTCTRL');
            Self.ShowEdit := True;
        End
        Else
        Begin
            Self.ShowEdit := False;
        End;

        If wxFLP_OPEN In stdStyle Then
            strLst.add('wxFLP_OPEN');

        If wxFLP_SAVE In stdStyle Then
            strLst.add('wxFLP_SAVE');

        If wxFLP_OVERWRITE_PROMPT In stdStyle Then
            strLst.add('wxFLP_OVERWRITE_PROMPT');

        If wxFLP_FILE_MUST_EXIST In stdStyle Then
            strLst.add('wxFLP_FILE_MUST_EXIST');

        If wxFLP_CHANGE_DIR In stdStyle Then
            strLst.add('wxFLP_CHANGE_DIR');



        If strLst.Count = 0 Then
            Result := ''
        Else
            For I := 0 To strLst.Count - 1 Do // Iterate
                If i <> strLst.Count - 1 Then
                    Result := Result + strLst[i] + ' | '
                Else
                    Result := Result + strLst[i] // for
        ;
    //sendDebug(Result);

    Finally
        strLst.Destroy;
    End;
End;

Function TWxFilePickerCtrl.GetFilePickerCtrlSpecificStyle(stdstyle: TWxStdStyleSet; dlgstyle: TWxFilePickCtrlStyleSet): String;
Var
    strA: String;
Begin
    Result := GetStdStyleString(stdstyle);
    strA := trim(GetFilePickerCtrlStyleString(dlgstyle));
    If strA <> '' Then
        If trim(Result) = '' Then
            Result := strA
        Else
            Result := Result + ' | ' + strA;

End;


End.
