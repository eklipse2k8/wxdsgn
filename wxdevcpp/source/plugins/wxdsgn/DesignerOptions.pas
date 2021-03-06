// $Id: DesignerOptions.pas 938 2007-05-15 03:57:34Z gururamnath $
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


unit DesignerOptions;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, StdCtrls, Buttons, INIFiles, XPMenu, ExtCtrls, wxutils, wxversion;

type
    TDesignerForm = class(TForm)
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        btnHelp: TBitBtn;
        notebook: TPageControl;
        TabSheet1: TTabSheet;
        GroupBox1: TGroupBox;
        Label6: TLabel;
        Label7: TLabel;
        lbGridXStep: TLabel;
        lbGridYStep: TLabel;
        cbGridVisible: TCheckBox;
        cbSnapToGrid: TCheckBox;
        lbGridXStepUpDown: TUpDown;
        lbGridYStepUpDown: TUpDown;
        GroupBox3: TGroupBox;
        cbControlHints: TCheckBox;
        cbSizeHints: TCheckBox;
        cbMoveHints: TCheckBox;
        cbInsertHints: TCheckBox;
        Bevel1: TBevel;
        Bevel2: TBevel;
        XPMenu: TXPMenu;
        TabSheet2: TTabSheet;
        codegen: TGroupBox;
        cbGenerateXRC: TCheckBox;
        Label1: TLabel;
        cbStringFormat: TComboBox;
        gpSizerOptons: TGroupBox;
        cbUseDefaultPos: TCheckBox;
        cbUseDefaultSize: TCheckBox;
        GroupBox2: TGroupBox;
        cbFloating: TCheckBox;
        cbIndividualEnums: TCheckBox;
        procedure FormCreate(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
        procedure lbGridXStepUpDownClick(Sender: TObject; Button: TUDBtnType);
        procedure lbGridYStepUpDownClick(Sender: TObject; Button: TUDBtnType);
        procedure FormShow(Sender: TObject);
        procedure cbStringFormatChange(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    protected
        procedure CreateParams(var Params: TCreateParams); override;
    end;

var
    DesignerForm: TDesignerForm;

implementation

{$R *.dfm}

uses wxdesigner, ELDsgnr, Designerfrm, wxeditor;

procedure TDesignerForm.FormCreate(Sender: TObject);
begin
    DesktopFont := TRUE;
    XPMenu.Active := wx_designer.XPTheme;
    cbGridVisible.Checked := wx_designer.ELDesigner1.Grid.Visible;
    lbGridXStep.Caption := IntToStr(wx_designer.ELDesigner1.Grid.XStep);
    lbGridXStepUpDown.Position := wx_designer.ELDesigner1.Grid.XStep;

    lbGridYStep.Caption := IntToStr(wx_designer.ELDesigner1.Grid.YStep);
    lbGridYStepUpDown.Position := wx_designer.ELDesigner1.Grid.YStep;
    cbSnapToGrid.Checked := wx_designer.ELDesigner1.SnapToGrid;
    cbGenerateXRC.Checked := wx_designer.ELDesigner1.GenerateXRC;
    cbFloating.Checked := wx_designer.ELDesigner1.Floating;

    cbStringFormat.Text := StringFormat;
    cbUseDefaultPos.Checked := UseDefaultPos;
    cbUseDefaultSize.Checked := UseDefaultSize;
    cbIndividualEnums.Checked := UseIndividEnums;
    cbControlHints.Checked := htControl in wx_designer.ELDesigner1.ShowingHints;
    cbSizeHints.Checked := htSize in wx_designer.ELDesigner1.ShowingHints;
    cbMoveHints.Checked := htMove in wx_designer.ELDesigner1.ShowingHints;
    cbInsertHints.Checked := htInsert in wx_designer.ELDesigner1.ShowingHints;
end;

procedure TDesignerForm.btnOkClick(Sender: TObject);
var
    ini: TiniFile;
    FileName: string;
    strLstXRCCode: TStringList;
    editorName: string;
    i: integer;

begin
    wx_designer.ELDesigner1.Grid.Visible := cbGridVisible.Checked;
    wx_designer.ELDesigner1.Grid.XStep := lbGridXStepUpDown.Position;

    wx_designer.ELDesigner1.Grid.YStep := lbGridYStepUpDown.Position;
    wx_designer.ELDesigner1.SnapToGrid := cbSnapToGrid.Checked;
    FileName := ChangeFileExt(wx_designer.GetCurrentFileName, XRC_EXT);
    UseDefaultPos := cbUseDefaultPos.Checked;
    UseDefaultSize := cbUseDefaultSize.Checked;
    UseIndividEnums := cbIndividualEnums.Checked;

    if (wx_designer.main.IsProjectNotNil) then
    begin
        if (wx_designer.ELDesigner1.GenerateXRC = FALSE) and (cbGenerateXRC.Checked) then
        begin
            if not wx_designer.main.FileAlreadyExistsInProject(FileName) then
            begin
                if not wx_designer.main.isFileOpenedinEditor(FileName) then
                begin
                    strLstXRCCode := CreateBlankXRC;
                    SaveStringToFile(strLstXRCCode.Text, FileName);
                    strLstXRCCode.Destroy;
                end;

                wx_designer.main.AddProjectUnit(FileName, FALSE);
            end;
        end
        else
            wx_designer.main.CloseUnit(FileName);
    end
    else
    if not wx_designer.main.isFileOpenedinEditor(FileName) and cbGenerateXRC.Checked then
    begin
        strLstXRCCode := CreateBlankXRC;
        SaveStringToFile(strLstXRCCode.Text, FileName);
        strLstXRCCode.Destroy;
    end;

    if cbControlHints.Checked then
        wx_designer.ELDesigner1.ShowingHints :=
            wx_designer.ELDesigner1.ShowingHints + [htControl];
    if cbSizeHints.Checked then
        wx_designer.ELDesigner1.ShowingHints := [htSize] + wx_designer.ELDesigner1.ShowingHints;
    if cbMoveHints.Checked then
        wx_designer.ELDesigner1.ShowingHints := [htMove] + wx_designer.ELDesigner1.ShowingHints;
    if cbInsertHints.Checked then
        wx_designer.ELDesigner1.ShowingHints :=
            [htInsert] + wx_designer.ELDesigner1.ShowingHints;

    if cbFloating.Checked then
    begin
        wx_designer.ELDesigner1.Floating := cbFloating.Checked;
        for i := 0 to wx_designer.editors.ItemCount - 1 do
        begin
            SetWindowLong((wx_designer.editors[wx_designer.editorNames[i]] as TWXEditor).GetDesigner.Handle, GWL_STYLE, WS_CHILD xor (GetWindowLong((wx_designer.editors[wx_designer.editorNames[i]] as TWXEditor).GetDesigner.Handle, GWL_STYLE)));
            Windows.SetParent((wx_designer.editors[wx_designer.editorNames[i]] as TWXEditor).GetDesigner.Handle, 0);
            (wx_designer.editors[wx_designer.editorNames[i]] as TWXEditor).btnFloatingDesigner.Visible := TRUE;
            if i > 0 then
            begin
                (wx_designer.editors[wx_designer.editorNames[i]] as TWXEditor).GetDesigner.Top := (wx_designer.editors[wx_designer.editorNames[i - 1]] as TWXEditor).GetDesigner.Top + 25;
                (wx_designer.editors[wx_designer.editorNames[i]] as TWXEditor).GetDesigner.Left := (wx_designer.editors[wx_designer.editorNames[i - 1]] as TWXEditor).GetDesigner.Left + 15;
            end;
        end;
    end
    else
    begin
        wx_designer.ELDesigner1.Floating := cbFloating.Checked;
        for i := 0 to wx_designer.editors.ItemCount - 1 do
        begin
            (wx_designer.editors[wx_designer.editorNames[i]] as TWXEditor).btnFloatingDesigner.Visible := FALSE;
            SetWindowLong((wx_designer.editors[wx_designer.editorNames[i]] as TWXEditor).GetDesigner.Handle, GWL_STYLE, WS_CHILD or
                (GetWindowLong((wx_designer.editors[wx_designer.editorNames[i]] as TWXEditor).GetDesigner.Handle, GWL_STYLE)));
            Windows.SetParent((wx_designer.editors[wx_designer.editorNames[i]] as TWXEditor).GetDesigner.Handle, (wx_designer.editors[wx_designer.editorNames[i]] as TWXEditor).ScrollDesign.Handle);
            (wx_designer.editors[wx_designer.editorNames[i]] as TWXEditor).GetDesigner.Top := 8;
            (wx_designer.editors[wx_designer.editorNames[i]] as TWXEditor).GetDesigner.Left := 8;
        end;
    end;


    wx_designer.ELDesigner1.GenerateXRC := cbGenerateXRC.Checked;
    XRCGEN := wx_designer.ELDesigner1.GenerateXRC; //Nuklear Zelph
    if wx_designer.ELDesigner1.GenerateXRC then
    begin
        editorName := wx_designer.main.GetActiveEditorName;
        if editorName <> '' then
            wx_designer.UpdateDesignerData(editorName);
    end;

    ini := TiniFile.Create(wx_designer.ConfigFolder + ChangeFileExt(ExtractFileName(Application.ExeName), '') + '.ini');
    try
        ini.WriteBool('wxWidgets', 'cbGridVisible', cbGridVisible.Checked);
        ini.WriteBool('wxWidgets', 'cbGenerateXRC', cbGenerateXRC.Checked);
        ini.WriteInteger('wxWidgets', 'lbGridXStepUpDown', lbGridXStepUpDown.Position);
        ini.WriteInteger('wxWidgets', 'lbGridYStepUpDown', lbGridYStepUpDown.Position);
        ini.WriteBool('wxWidgets', 'cbSnapToGrid', cbSnapToGrid.Checked);
        ini.WriteBool('wxWidgets', 'cbControlHints', cbControlHints.Checked);
        ini.WriteBool('wxWidgets', 'cbSizeHints', cbSizeHints.Checked);
        ini.WriteBool('wxWidgets', 'cbMoveHints', cbMoveHints.Checked);
        ini.WriteBool('wxWidgets', 'cbInsertHints', cbInsertHints.Checked);
        ini.WriteString('wxWidgets', 'cbStringFormat', cbStringFormat.Text);
        ini.WriteBool('wxWidgets', 'cbUseDefaultPos', cbUseDefaultPos.Checked);
        ini.WriteBool('wxWidgets', 'cbUseDefaultSize', cbUseDefaultSize.Checked);
        ini.WriteBool('wxWidgets', 'cbIndividualEnums', cbIndividualEnums.Checked);
        ini.WriteBool('wxWidgets', 'cbFloating', cbFloating.Checked);

    finally
        ini.Destroy;
    end;

end;

procedure TDesignerForm.lbGridXStepUpDownClick(Sender: TObject; Button: TUDBtnType);
begin
    lbGridXStep.Caption := IntToStr(lbGridXStepUpDown.position);
end;

procedure TDesignerForm.lbGridYStepUpDownClick(Sender: TObject; Button: TUDBtnType);
begin
    lbGridYStep.Caption := IntToStr(lbGridYStepUpDown.position);
end;

procedure TDesignerForm.FormShow(Sender: TObject);
begin
    if wx_designer.XPTheme then
        XPMenu.Active := TRUE
    else
        XPMenu.Active := FALSE;
end;

procedure TDesignerForm.cbStringFormatChange(Sender: TObject);
begin

    StringFormat := cbStringFormat.Text;

end;

procedure TDesignerForm.FormDestroy(Sender: TObject);
begin
    XPMenu.Active := FALSE;
    XPMenu.Free;
end;

procedure TDesignerForm.CreateParams(var Params: TCreateParams);
begin
    inherited;
    if (Parent <> NIL) or (ParentWindow <> 0) then
        Exit;  // must not mess with wndparent if form is embedded

    if Assigned(Owner) and (Owner is TWincontrol) then
        Params.WndParent := TWinControl(Owner).handle
    else
    if Assigned(Screen.Activeform) then
        Params.WndParent := Screen.Activeform.Handle;
end;

end.
