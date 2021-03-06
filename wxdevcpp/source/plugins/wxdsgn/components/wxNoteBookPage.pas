// $Id: wxNoteBookPage.pas 936 2007-05-15 03:47:39Z gururamnath $
{                                                                    }
{   Copyright � 2003-2007 by Guru Kathiresan                         }
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


Unit wxNoteBookPage;

Interface

Uses
    Windows, Messages, SysUtils, Graphics, Classes, Controls, ComCtrls,
    WxUtils, Forms, WxSizerPanel;

Type
    TWxNoteBookPage = Class(TTabSheet, IWxComponentInterface, IWxContainerInterface)
    Private
    { Private declarations }
        FEVT_UPDATE_UI: String;
        FWx_BKColor: TColor;
        FWx_Border: Integer;
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

    Protected
    { Protected declarations }
    Public
        defaultBGColor: TColor;
        defaultFGColor: TColor;
        Procedure AutoInitialize;
        Procedure AutoDestroy;

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
        Function GetFGColor: String;
        Procedure SetFGColor(strValue: String);
        Function GetBGColor: String;
        Procedure SetBGColor(strValue: String);

        Function GetGenericColor(strVariableName: String): String;
        Procedure SetGenericColor(strVariableName, strValue: String);

        Procedure SetProxyFGColorString(Value: String);
        Procedure SetProxyBGColorString(Value: String);

        Function GetBorderAlignment: TWxBorderAlignment;
        Procedure SetBorderAlignment(border: TWxBorderAlignment);
        Function GetBorderWidth: Integer;
        Procedure SetBorderWidth(width: Integer);
        Function GetStretchFactor: Integer;
        Procedure SetStretchFactor(intValue: Integer);

    Published
    { Published declarations }
        Property EVT_UPDATE_UI: String Read FEVT_UPDATE_UI Write FEVT_UPDATE_UI;
        Property Wx_BKColor: TColor Read FWx_BKColor Write FWx_BKColor;
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
        Property Wx_ToolTip: String Read FWx_ToolTip Write FWx_ToolTip;

        Property Wx_ProxyBGColorString: TWxColorString Read FWx_ProxyBGColorString Write FWx_ProxyBGColorString;
        Property Wx_ProxyFGColorString: TWxColorString Read FWx_ProxyFGColorString Write FWx_ProxyFGColorString;
        Property InvisibleBGColorString: String Read FInvisibleBGColorString Write FInvisibleBGColorString;
        Property InvisibleFGColorString: String Read FInvisibleFGColorString Write FInvisibleFGColorString;

        Property Wx_Border: Integer Read GetBorderWidth Write SetBorderWidth Default 5;
        Property Wx_BorderAlignment: TWxBorderAlignment Read GetBorderAlignment Write SetBorderAlignment Default [wxALL];
        Property Wx_Alignment: TWxSizerAlignmentSet Read FWx_Alignment Write FWx_Alignment Default [wxALIGN_CENTER];
        Property Wx_StretchFactor: Integer Read GetStretchFactor Write SetStretchFactor Default 0;

        Property Wx_Comments: TStrings Read FWx_Comments Write FWx_Comments;

    End;

Procedure Register;

Implementation

Constructor TWxNoteBookPage.Create(AOwner: TComponent);
Begin
    Inherited Create(AOwner);

    AutoInitialize;

  { Code to perform other tasks when the component is created }
    PopulateGenericProperties(FWx_PropertyList);
    FWx_PropertyList.add('Caption:Label');

    FWx_EventList.add('EVT_UPDATE_UI:OnUpdateUI');

End;

Destructor TWxNoteBookPage.Destroy;
Begin
    AutoDestroy;
    Inherited Destroy;
End;


{ Method to set variable and property values and create objects }
Procedure TWxNoteBookPage.AutoInitialize;
Begin
    FWx_PropertyList := TStringList.Create;
    FWx_EventList := TStringList.Create;
    FWx_Border := 5;
    FWx_Class := 'wxPanel';
    FWx_Enabled := True;
    FWx_BorderAlignment := [wxAll];
    FWx_Alignment := [wxALIGN_CENTER];
    FWx_IDValue := -1;
    FWx_StretchFactor := 0;
    FWx_ProxyBGColorString := TWxColorString.Create;
    FWx_ProxyFGColorString := TWxColorString.Create;
    defaultBGColor := self.color;
    defaultFGColor := self.font.color;
    FWx_Comments := TStringList.Create;

End; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
Procedure TWxNoteBookPage.AutoDestroy;
Begin
    FWx_PropertyList.Destroy;
    FWx_EventList.Destroy;
    FWx_ProxyBGColorString.Destroy;
    FWx_ProxyFGColorString.Destroy;
    FWx_Comments.Destroy;
End; { of AutoDestroy }



Function TWxNoteBookPage.GenerateEnumControlIDs: String;
Begin
    Result := GetWxEnum(self.Wx_IDValue, self.Wx_IDName);
End;

Function TWxNoteBookPage.GenerateControlIDs: String;
Begin
    Result := '';
    If (Wx_IDValue > 0) And (trim(Wx_IDName) <> '') Then
        Result := Format('#define %s %d ', [Wx_IDName, Wx_IDValue]);
End;

Function TWxNoteBookPage.GenerateEventTableEntries(CurrClassName: String): String;
Begin
    Result := '';
    If trim(EVT_UPDATE_UI) <> '' Then
        Result := Result + #13 + Format('EVT_UPDATE_UI(%s,%s::%s)',
            [WX_IDName, CurrClassName, EVT_UPDATE_UI]) + '';

End;

Function TWxNoteBookPage.GenerateXRCControlCreation(IndentString: String): TStringList;
Var
    i: Integer;
    wxcompInterface: IWxComponentInterface;
    tempstring: TStringList;
Begin

    Result := TStringList.Create;

    Try
        Result.Add(IndentString + Format('<object class="%s" name="%s">',
            [self.Wx_Class, self.Name]));
        Result.Add(IndentString + Format('  <IDident>%s</IDident>', [self.Wx_IDName]));
        Result.Add(IndentString + Format('  <ID>%d</ID>', [self.Wx_IDValue]));
        Result.Add(IndentString + Format('  <label>%s</label>', [XML_Label(self.Caption)]));

        For i := 0 To self.ControlCount - 1 Do // Iterate
            If self.Controls[i].GetInterface(IID_IWxComponentInterface, wxcompInterface) Then
        // Only add the XRC control if it is a child of the top-most parent (the form)
        //  If it is a child of a sizer, panel, or other object, then it's XRC code
        //  is created in GenerateXRCControlCreation of that control.
                If (self.Controls[i].GetParentComponent.Name = self.Name) Then
                Begin
                    tempstring := wxcompInterface.GenerateXRCControlCreation('    ' + IndentString);
                    Try
                        Result.AddStrings(tempstring)
                    Finally
                        tempstring.Free
                    End;
                End; // for

        Result.Add(IndentString + '</object>');

    Except
        Result.Free;
        Raise;
    End;

End;

Function TWxNoteBookPage.GenerateGUIControlCreation: String;
Var
    strColorStr: String;
    strStyle: String;
    parentName, strAlignment: String;
Begin
    Result := '';
    strStyle := GetStdStyleString(self.Wx_GeneralStyle);
    If trim(strStyle) <> '' Then
        strStyle := ', ' + strStyle;

    parentName := GetWxWidgetParent(self, False);

    If (XRCGEN) Then
    Begin//generate xrc loading code
        Result := GetCommentString(self.FWx_Comments.Text) +
            Format('%s = XRCCTRL(*%s, %s("%s"), %s);',
            [self.Name, parentName, StringFormat, self.Name, self.wx_Class]);
    End
    Else
    Begin//generate the cpp code
        Result := GetCommentString(self.FWx_Comments.Text) +
            Format('%s = new %s(%s, %s, %s, %s%s);',
            [self.Name, self.wx_Class, parentName, GetWxIDString(self.Wx_IDName,
            self.Wx_IDValue),
            GetWxPosition(self.Left, self.Top), GetWxSize(self.Width, self.Height), strStyle]);
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
        If (self.Parent Is TWxSizerPanel) Then
        Begin
            strAlignment := SizerAlignmentToStr(Wx_Alignment) + ' | ' + BorderAlignmentToStr(Wx_BorderAlignment);
            Result := Result + #13 + Format('%s->Add(%s, %d, %s, %d);',
                [self.Parent.Name, self.Name, self.Wx_StretchFactor, strAlignment,
                self.Wx_Border]);

        End;
    If Not (XRCGEN) Then //NUKLEAR ZELPH
        Result := Result + #13 + Format('%s->AddPage(%s, %s);',
            [parentName, self.Name, GetCppString(self.Caption)]);

End;

Function TWxNoteBookPage.GenerateGUIControlDeclaration: String;
Begin
    Result := Format('%s *%s;', [trim(Self.Wx_Class), trim(Self.Name)]);
End;

Function TWxNoteBookPage.GenerateHeaderInclude: String;
Begin
    Result := '#include <wx/panel.h>';
End;

Function TWxNoteBookPage.GenerateImageInclude: String;
Begin

End;

Function TWxNoteBookPage.GetEventList: TStringList;
Begin
    Result := Wx_EventList;
End;

Function TWxNoteBookPage.GetIDName: String;
Begin
    Result := wx_IDName;
End;

Function TWxNoteBookPage.GetIDValue: Integer;
Begin
    Result := wx_IDValue;
End;

Function TWxNoteBookPage.GetParameterFromEventName(EventName: String): String;
Begin
    If EventName = 'EVT_UPDATE_UI' Then
    Begin
        Result := 'wxUpdateUIEvent& event';
        exit;
    End;
End;

Function TWxNoteBookPage.GetPropertyList: TStringList;
Begin
    Result := FWx_PropertyList;
End;

Function TWxNoteBookPage.GetStretchFactor: Integer;
Begin
    Result := FWx_StretchFactor;
End;

Function TWxNoteBookPage.GetTypeFromEventName(EventName: String): String;
Begin

End;

Function TWxNoteBookPage.GetBorderAlignment: TWxBorderAlignment;
Begin
    Result := FWx_BorderAlignment;
End;

Procedure TWxNoteBookPage.SetBorderAlignment(border: TWxBorderAlignment);
Begin
    FWx_BorderAlignment := border;
End;

Function TWxNoteBookPage.GetBorderWidth: Integer;
Begin
    Result := FWx_Border;
End;

Procedure TWxNoteBookPage.SetBorderWidth(width: Integer);
Begin
    FWx_Border := width;
End;

Function TWxNoteBookPage.GetWxClassName: String;
Begin
    If trim(wx_Class) = '' Then
        wx_Class := 'wxPanel';
    Result := wx_Class;
End;

Procedure TWxNoteBookPage.SaveControlOrientation(
    ControlOrientation: TWxControlOrientation);
Begin
    wx_ControlOrientation := ControlOrientation;
End;

Procedure TWxNoteBookPage.SetIDName(IDName: String);
Begin
    wx_IDName := IDName;
End;

Procedure TWxNoteBookPage.SetIDValue(IDValue: Integer);
Begin
    Wx_IDValue := IDVAlue;
End;

Procedure TWxNoteBookPage.SetStretchFactor(intValue: Integer);
Begin
    FWx_StretchFactor := intValue;
End;

Procedure TWxNoteBookPage.SetWxClassName(wxClassName: String);
Begin
    wx_Class := wxClassName;
End;

Function TWxNoteBookPage.GetGenericColor(strVariableName: String): String;
Begin

End;
Procedure TWxNoteBookPage.SetGenericColor(strVariableName, strValue: String);
Begin

End;


Function TWxNoteBookPage.GetFGColor: String;
Begin
    Result := FInvisibleFGColorString;
End;

Procedure TWxNoteBookPage.SetFGColor(strValue: String);
Begin
    FInvisibleFGColorString := strValue;
    If IsDefaultColorStr(strValue) Then
        self.Font.Color := defaultFGColor
    Else
        self.Font.Color := GetColorFromString(strValue);
End;

Function TWxNoteBookPage.GetBGColor: String;
Begin
    Result := FInvisibleBGColorString;
End;

Procedure TWxNoteBookPage.SetBGColor(strValue: String);
Begin
    FInvisibleBGColorString := strValue;
    If IsDefaultColorStr(strValue) Then
        self.Color := defaultBGColor
    Else
        self.Color := GetColorFromString(strValue);
End;

Procedure TWxNoteBookPage.SetProxyFGColorString(Value: String);
Begin
    FInvisibleFGColorString := Value;
    self.Color := GetColorFromString(Value);
End;

Procedure TWxNoteBookPage.SetProxyBGColorString(Value: String);
Begin
    FInvisibleBGColorString := Value;
    self.Font.Color := GetColorFromString(Value);
End;

Procedure Register;
Begin
    RegisterComponents('wxWidgets', [TWxNoteBookPage]);
End;

End.
