{
    $Id: Envirofrm.pas 768 2006-12-24 05:44:42Z lowjoel $

    This file is part of Dev-C++
    Copyright (c) 2004 Bloodshed Software

    Dev-C++ is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    Dev-C++ is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Dev-C++; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}

{$WARN UNIT_PLATFORM OFF}
unit Envirofrm;

interface

uses
{$IFDEF WIN32}
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Spin, ExtCtrls, devTabs, ExtDlgs, Buttons, DevThemes,
    CheckLst, XPMenu, Grids, ValEdit, ComCtrls;
{$ENDIF}
{$IFDEF LINUX}
  SysUtils, Variants, Classes, QGraphics, QControls, QForms,
  QDialogs, QStdCtrls, QComCtrls, QExtCtrls, devTabs, QButtons, DevThemes,
  QCheckLst, QGrids;
{$ENDIF}

type
    TEnviroForm = class(TForm)
        PagesMain: TPageControl;
        tabGeneral: TTabSheet;
        tabPaths: TTabSheet;
        cbBackups: TCheckBox;
        cbMinOnRun: TCheckBox;
        cbDefCpp: TCheckBox;
        cbShowBars: TCheckBox;
        lblUserDir: TLabel;
        edUserDir: TEdit;
        lblTemplatesDir: TLabel;
        edTemplatesDir: TEdit;
        lblSplash: TLabel;
        edSplash: TEdit;
        lblIcoLib: TLabel;
        edIcoLib: TEdit;
        dlgPic: TOpenPictureDialog;
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        btnHelp: TBitBtn;
        cbShowMenu: TCheckBox;
        rgbAutoOpen: TRadioGroup;
        cbdblFiles: TCheckBox;
        lblLangPath: TLabel;
        edLang: TEdit;
        tabInterface: TTabSheet;
        lblLang: TLabel;
        cboLang: TComboBox;
        lblTheme: TLabel;
        cboTheme: TComboBox;
        lblmsgTabs: TLabel;
        cboTabsTop: TComboBox;
        lblMRU: TLabel;
        seMRUMax: TSpinEdit;
        rgbOpenStyle: TRadioGroup;
        cbNoSplashScreen: TCheckBox;
        tabAssocs: TTabSheet;
        lblAssocFileTypes: TLabel;
        lstAssocFileTypes: TCheckListBox;
        lblAssocDesc: TLabel;
        tabCVS: TTabSheet;
        lblCVSExec: TLabel;
        edCVSExec: TEdit;
        lblCVSCompression: TLabel;
        spnCVSCompression: TSpinEdit;
        chkCVSUseSSH: TCheckBox;
        XPMenu: TXPMenu;
        cbXPTheme: TCheckBox;
        gbProgress: TGroupBox;
        cbShowProgress: TCheckBox;
        cbAutoCloseProgress: TCheckBox;
        tabExternal: TTabSheet;
        lblExternal: TLabel;
        vleExternal: TValueListEditor;
        btnExtAdd: TSpeedButton;
        btnExtDel: TSpeedButton;
        gbDebugger: TGroupBox;
        cbWatchHint: TCheckBox;
        cbWatchError: TCheckBox;
        gbAltConfig: TGroupBox;
        chkAltConfig: TCheckBox;
        edAltConfig: TEdit;
        btnAltConfig: TSpeedButton;
        btnDefBrws: TSpeedButton;
        btnOutputbrws: TSpeedButton;
        btnBrwIcon: TSpeedButton;
        btnBrwLang: TSpeedButton;
        btnBrwSplash: TSpeedButton;
        btnCVSExecBrws: TSpeedButton;
        cbSingleInstance: TCheckBox;
        cbNativeDocks: TCheckBox;
        cbHiliteActiveTab: TCheckBox;
        lblOpenSaveOptions: TLabel;
        cbNoToolTip: TCheckBox;
        procedure BrowseClick(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure btnHelpClick(Sender: TObject);
        procedure FormKeyDown(Sender: TObject; var Key: word;
            Shift: TShiftState);
        procedure FormCreate(Sender: TObject);
        procedure vleExternalEditButtonClick(Sender: TObject);
        procedure vleExternalValidate(Sender: TObject; ACol, ARow: integer;
            const KeyName, KeyValue: string);
        procedure btnExtAddClick(Sender: TObject);
        procedure btnExtDelClick(Sender: TObject);
        procedure chkAltConfigClick(Sender: TObject);
    private
        procedure LoadText;
    public
        { Public declarations }
    end;

implementation

uses
{$IFDEF WIN32}
    Filectrl, devcfg, MultiLangSupport, version, datamod, utils,
    FileAssocs, ImageTheme, hh, uvista,
    main;
{$ENDIF}
{$IFDEF LINUX}
  Xlib, devcfg, MultiLangSupport, version, datamod, utils, FileAssocs, ImageTheme;
{$ENDIF}

{$R *.dfm}

const
    Help_Topics: array[0..5] of string =
        ('html\environ_general.html',
        'html\environ_interface.html',
        'html\environ_filesdirs.html',
        'html\environ_general.html',
        'html\environ_fileassoc.html',
        'html\environ_cvs.html');

procedure TEnviroForm.BrowseClick(Sender: TObject);
var
    s: string;
begin
    case (Sender as TComponent).Tag of
        1: // default dir browse
        begin
            s := edUserDir.Text;
            if SelectDirectory(Lang[ID_ENV_SELUSERDIR], '', s) then
                edUserDir.Text := IncludeTrailingPathDelimiter(s);
        end;

        2: // output dir browse
        begin
            s := ExpandFileto(edTemplatesDir.Text, devDirs.Exec);
            if SelectDirectory(Lang[ID_ENV_SELTEMPLATESDIR], '', s) then
                edTemplatesDir.Text := IncludeTrailingPathDelimiter(s);
        end;

        // why was it commented-out???
        3: // icon library browse
        begin
            s := ExpandFileto(edIcoLib.Text, devDirs.Exec);
            if SelectDirectory(Lang[ID_ENV_SELICOLIB], '', s) then
                edIcoLib.Text := IncludeTrailingPathDelimiter(s);
        end;

        4: // splash screen browse
        begin
            dlgPic.InitialDir := ExtractFilePath(edSplash.Text);
            if dlgPic.Execute then
                edSplash.Text := dlgPic.FileName;
        end;

        5: // Language Dir
        begin
            s := ExpandFileto(edLang.Text, devDirs.Exec);
            if SelectDirectory(Lang[ID_ENV_SELLANGDIR], '', s) then
                edLang.Text := IncludeTrailingPathDelimiter(
                    ExtractRelativePath(devDirs.Exec, s));
        end;

        6: // CVS Executable Filename
        begin
            dmMain.OpenDialog.Filter := FLT_ALLFILES;
            dmMain.OpenDialog.FileName := edCVSExec.Text;
            if dmMain.OpenDialog.Execute then
                edCVSExec.Text := dmMain.OpenDialog.FileName;
        end;

        7: // Alternate Configuration File
        begin
            dmMain.OpenDialog.Filter := FLT_ALLFILES;
            dmMain.OpenDialog.FileName := edAltConfig.Text;
            if dmMain.OpenDialog.Execute then
                edAltConfig.Text := dmMain.OpenDialog.FileName;
        end;
    end;
end;

procedure TEnviroForm.FormShow(Sender: TObject);
var
    idx: integer;
begin
    with devData do
    begin
        rgbAutoOpen.ItemIndex := AutoOpen;
        cbSingleInstance.Checked := SingleInstance;
        cbDefCpp.Checked := defCpp;
        cbShowBars.Checked := ShowBars;
        cbBackups.Checked := BackUps;
        cbMinOnRun.Checked := MinOnRun;
        cbdblFiles.Checked := DblFiles;
        cbNoSplashScreen.Checked := NoSplashScreen;
        cbNoToolTip.Checked := NoToolTip;
        cbHiliteActiveTab.Checked := HiliteActiveTab;
        seMRUMax.Value := MRUMax;
        cboLang.Clear;
        for idx := 0 to pred(Lang.Langs.Count) do
            cboLang.Items.append(Lang.Langs.Values[idx]);
        cboLang.ItemIndex := cboLang.Items.Indexof(Lang.CurrentLanguage);
        rgbOpenStyle.ItemIndex := OpenStyle;

        {*** Modified by Peter ***}
        cboTheme.Items.Clear;
        devImageThemes.GetThemeTitles(cboTheme.Items);
        cboTheme.ItemIndex := devImageThemes.IndexOf(
            devImageThemes.CurrentTheme.Title);
        //cboTheme.Text := devImageThemes.CurrentTheme.Title;
        //cboTheme.Items.AddStrings(devTheme.ThemeList);
        //cboTheme.ItemIndex := cboTheme.Items.IndexOf(devData.Theme);

        cbXPTheme.Checked := XPTheme;
        cbNativeDocks.Checked := NativeDocks;

        cbShowProgress.Checked := ShowProgress;
        cbAutoCloseProgress.Checked := AutoCloseProgress;

        cbWatchHint.Checked := WatchHint;
        cbWatchError.Checked := WatchError;

        cboTabsTop.ItemIndex := ord(msgTabs);

        chkAltConfig.Checked := UseAltConfigFile;
        edAltConfig.Text := AltConfigFile;
        chkAltConfigClick(NIL);

        edSplash.Text := Splash;
        edIcoLib.Text := ExtractRelativePath(devDirs.Exec, devDirs.Icons);
        edUserDir.Text := devDirs.Default;
        edTemplatesDir.Text := ExtractRelativePath(devDirs.Exec,
            devDirs.Templates);
        edLang.Text := ExtractRelativePath(devDirs.Exec, devDirs.Lang);

        vleExternal.Strings.Assign(devExternalPrograms.Programs);
        for idx := 0 to vleExternal.Strings.Count - 1 do
            vleExternal.ItemProps[idx].EditStyle := esEllipsis;

        lstAssocFileTypes.Clear;
        for idx := 0 to AssociationsCount - 1 do
        begin
            lstAssocFileTypes.Items.Add(Format('%s  (*.%s)',
                [Associations[idx, 1], Associations[idx, 0]]));
            lstAssocFileTypes.Checked[lstAssocFileTypes.Items.Count - 1] :=
                IsAssociated(idx);
        end;

        edCVSExec.Text := devCVSHandler.Executable;
        spnCVSCompression.Value := devCVSHandler.Compression;
        chkCVSUseSSH.Checked := devCVSHandler.UseSSH;

        // On Windows >= Vista we can't update the registry
        //  settings if UAC has not been elevated to admin
        //  So let's check and see if that's been done to
        //   decide whether or not to show the Assocs tab.
        if (isElevatedUAC) then
            tabAssocs.TabVisible := TRUE
        else
            tabAssocs.TabVisible := FALSE;


    end;
end;

procedure TEnviroForm.btnOkClick(Sender: TObject);
var
    idx: integer;
    s: string;
begin

    Screen.Cursor := crHourGlass;
    btnOk.Enabled := FALSE;

    if chkAltConfig.Enabled then
    begin
        if UseAltConfigFile <> chkAltConfig.Checked then
            MessageDlg(Lang[ID_ENV_CONFIGCHANGED], mtInformation, [mbOk], 0);
        UseAltConfigFile := chkAltConfig.Checked and (edAltConfig.Text <> '');
        AltConfigFile := edAltConfig.Text;
        UpdateAltConfigFile;
    end;

    with devData do
    begin
        SingleInstance := cbSingleInstance.Checked;
        DefCpp := cbDefCpp.Checked;
        ShowBars := cbShowBars.Checked;
        ShowMenu := cbShowMenu.Checked;
        BackUps := cbBackups.Checked;
        MinOnRun := cbMinOnRun.Checked;
        DblFiles := cbdblFiles.Checked;
        MRUMax := seMRUMax.Value;
        MsgTabs := boolean(cboTabsTop.ItemIndex);
        OpenStyle := rgbOpenStyle.ItemIndex;
        AutoOpen := rgbAutoOpen.ItemIndex;
        Splash := edSplash.Text;

        s := Lang.FileFromDescription(cboLang.Text);
        LangChange := s <> Language;
        Language := s;
        ThemeChange := cboTheme.Text <> devData.Theme;
        Theme := cboTheme.Text;
        NoSplashScreen := cbNoSplashScreen.Checked;
        NoToolTip := cbNoToolTip.Checked;
        HiliteActiveTab := cbHiliteActiveTab.Checked;
        if not ThemeChange then
            ThemeChange := XPTheme <> cbXPTheme.Checked;
        XPTheme := cbXPTheme.Checked;
        if not ThemeChange then
            ThemeChange := NativeDocks <> cbNativeDocks.Checked;
        NativeDocks := cbNativeDocks.Checked;
        ShowProgress := cbShowProgress.Checked;
        AutoCloseProgress := cbAutoCloseProgress.Checked;
        WatchHint := cbWatchHint.Checked;
        WatchError := cbWatchError.Checked;
    end;

    devDirs.Icons := IncludeTrailingPathDelimiter(
        ExpandFileto(edIcoLib.Text, devDirs.Exec));
    devDirs.Templates := IncludeTrailingPathDelimiter(
        ExpandFileto(edTemplatesDir.Text, devDirs.Exec));
    devDirs.Default := edUserDir.Text;

    if edLang.Text <> ExtractRelativePath(devDirs.Exec, devDirs.Lang) then
    begin
        devDirs.Lang := IncludeTrailingPathDelimiter(
            ExpandFileto(edLang.Text, devDirs.Exec));
        Lang.CheckLanguageFiles;
    end;

    if not IsWindowsVista then
    begin
        with dmMain.OpenDialog do
            case devData.OpenStyle of
                0: // win2k
                begin
                    OptionsEx := [];
                    Options := Options - [ofOldStyleDialog, ofNoLongNames];
                end;
                1: // win9x
                begin
                    OptionsEx := [ofExNoPlacesBar];
                    Options := Options - [ofOldStyleDialog, ofNoLongNames];
                end;
                2: // win31
                begin
                    OptionsEx := [ofExNoPlacesBar]; // basically ignored anyway
                    Options := Options + [ofOldStyleDialog, ofNoLongNames];
                end;
            end;

        dmMain.SaveDialog.OptionsEx := dmMain.OpenDialog.OptionsEx;
        dmMain.SaveDialog.Options := dmMain.OpenDialog.Options;
    end;

    devExternalPrograms.Programs.Assign(vleExternal.Strings);

    for idx := 0 to AssociationsCount - 1 do
        if lstAssocFileTypes.Checked[idx] then
            Associate(idx)
        else
            Unassociate(idx);

    devCVSHandler.Executable := edCVSExec.Text;
    devCVSHandler.Compression := spnCVSCompression.Value;
    devCVSHandler.UseSSH := chkCVSUseSSH.Checked;

    btnOk.Enabled := TRUE;
    Cursor := crDefault;

end;

procedure TEnviroForm.LoadText;
begin
    DesktopFont := TRUE;
    XPMenu.Active := devData.XPTheme;
    Caption := Lang[ID_ENV];

    //Tabs
    tabGeneral.Caption := Lang[ID_ENV_GENTAB];
    tabInterface.Caption := Lang[ID_ENV_INTERFACETAB];
    tabPaths.Caption := Lang[ID_ENV_PATHTAB];
    tabAssocs.Caption := Lang[ID_ENV_FASSTAB];
    tabCVS.Caption := Lang[ID_ENV_CVSTAB];
    tabExternal.Caption := Lang[ID_ENV_EXTERNALS];

    //Buttons
    btnOk.Caption := Lang[ID_BTN_OK];
    btnCancel.Caption := Lang[ID_BTN_CANCEL];
    btnHelp.Caption := Lang[ID_BTN_HELP];

    //Controls
    cbDefCpp.Caption := Lang[ID_ENV_DEFCPP];
    cbShowBars.Caption := Lang[ID_ENV_SHOWBARS];
    cbShowMenu.Caption := Lang[ID_ENV_SHOWMENU];
    cbBackups.Caption := Lang[ID_ENV_BACKUPS];
    cbMinOnRun.Caption := Lang[ID_ENV_MINONRUN];
    cbdblFiles.Caption := Lang[ID_ENV_DBLFILES];
    cbNoSplashScreen.Caption := Lang[ID_ENV_NOSPLASH];
    cbHiliteActiveTab.Caption := Lang[ID_ENV_HILITETAB];
    cbXPTheme.Caption := Lang[ID_ENV_XPTHEME];

    gbProgress.Caption := Lang[ID_ENV_COMPPROGRESSWINDOW];
    cbShowProgress.Caption := Lang[ID_ENV_SHOWPROGRESS];
    cbAutoCloseProgress.Caption := Lang[ID_ENV_AUTOCLOSEPROGRESS];

    cbWatchHint.Caption := Lang[ID_ENV_WATCHHINT];
    cbWatchError.Caption := Lang[ID_ENV_WATCHERROR];
    gbDebugger.Caption := Lang[ID_ENV_DEBUGGER];

    rgbOpenStyle.Caption := Lang[ID_ENV_OPENSTYLE];
    rgbOpenStyle.Items[0] := Lang[ID_ENV_OPEN2k];
    rgbOpenStyle.Items[1] := Lang[ID_ENV_OPEN9x];
    rgbOpenStyle.Items[2] := Lang[ID_ENV_OPEN31];
    lblOpenSaveOptions.Caption := Lang[ID_WX_NO_OPEN_SAVE_DIALOG_OPT];


    rgbAutoOpen.Caption := Lang[ID_ENV_AUTOOPEN];
    rgbAutoOpen.Items[0] := Lang[ID_ENV_AUTOALL];
    rgbAutoOpen.Items[1] := Lang[ID_ENV_AUTOFIRST];
    rgbAutoOpen.Items[2] := Lang[ID_ENV_AUTONONE];

    gbAltConfig.Caption := Lang[ID_ENV_GBALTCONFIG];
    chkAltConfig.Caption := Lang[ID_ENV_USEALTCONFIG];
    lblLang.Caption := Lang[ID_ENV_LANGUAGE];
    lblTheme.Caption := Lang[ID_ENV_THEME];
    lblmsgTabs.Caption := Lang[ID_ENV_MSGTABS];
    lblMRU.Caption := Lang[ID_ENV_MRU];

    lblUserDir.Caption := Lang[ID_ENV_USERDIR];
    lblTemplatesDir.Caption := Lang[ID_ENV_TEMPLATESDIR];
    lblIcoLib.Caption := Lang[ID_ENV_ICOLIB];
    lblSplash.Caption := Lang[ID_ENV_SPLASH];
    lblLangPath.Caption := Lang[ID_ENV_SELLANGDIR];

    // externals tab
    lblExternal.Caption := Lang[ID_ENV_EXTERNPROGASSOCS];
    vleExternal.TitleCaptions.Clear;
    vleExternal.TitleCaptions.Add(Lang[ID_ENV_EXTERNEXT]);
    vleExternal.TitleCaptions.Add(Lang[ID_ENV_EXTERNPROG]);
    btnExtAdd.Caption := Lang[ID_BTN_ADD];
    btnExtDel.Caption := Lang[ID_BTN_DELETE];

    // associations tab
    lblAssocFileTypes.Caption := Lang[ID_ENV_FASSTYPES];
    lblAssocDesc.Caption := Lang[ID_ENV_FASSDESC];

    // CVS support tab
    lblCVSExec.Caption := Lang[ID_ENV_CVSEXE];
    lblCVSCompression.Caption := Lang[ID_ENV_CVSCOMPR];
    chkCVSUseSSH.Caption := Lang[ID_ENV_CVSUSESSH];
end;

procedure TEnviroForm.btnHelpClick(Sender: TObject);
begin
    HelpFile := devDirs.Help + DEV_MAINHELP_FILE;
    HtmlHelp(self.handle, pchar(HelpFile), HH_DISPLAY_TOPIC,
        DWORD(pchar('html\environ_general.html')));
end;

procedure TEnviroForm.FormKeyDown(Sender: TObject; var Key: word;
    Shift: TShiftState);
begin
{$IFDEF WIN32}
    if key = vk_F1 then
{$ENDIF}
{$IFDEF LINUX}
  if key = XK_F1 then
{$ENDIF}
    begin
        HelpFile := devDirs.Help + DEV_MAINHELP_FILE;
        HtmlHelp(MainForm.handle, pchar(HelpFile), HH_DISPLAY_TOPIC,
            DWORD(pchar(Help_Topics[PagesMain.ActivePageIndex])));
    end;
end;

procedure TEnviroForm.FormCreate(Sender: TObject);
begin
    LoadText;
    PagesMain.ActivePageIndex := 0;
    if IsWindowsVista then
    begin
        rgbOpenStyle.Enabled := FALSE;
        lblOpenSaveOptions.Visible := TRUE;
        // EAB TODO: Add multi language support  
    end;
end;

procedure TEnviroForm.vleExternalEditButtonClick(Sender: TObject);
begin
    if Trim(vleExternal.Cells[0, vleExternal.Row]) = '' then
    begin
        MessageDlg('Add an extension first!', mtError, [mbOk], 0);
        Exit;
    end;

    with dmMain.OpenDialog do
    begin
        Filter := FLT_ALLFILES;
        if Execute then
            vleExternal.Cells[1, vleExternal.Row] := Filename;
    end;
end;

procedure TEnviroForm.vleExternalValidate(Sender: TObject; ACol,
    ARow: integer; const KeyName, KeyValue: string);
var
    idx: integer;
begin
    if vleExternal.FindRow(KeyName, idx) and (idx <> ARow) then
    begin
        MessageDlg('Extension exists...', mtError, [mbOk], 0);
        vleExternal.Col := 0;
        vleExternal.Row := ARow;
        Abort;
    end;
    vleExternal.ItemProps[ARow - 1].EditStyle := esEllipsis;
end;

procedure TEnviroForm.btnExtAddClick(Sender: TObject);
begin
    vleExternal.InsertRow('', '', TRUE);
    vleExternal.Row := vleExternal.RowCount - 1;
    vleExternal.Col := 0;
    vleExternal.SetFocus;
end;

procedure TEnviroForm.btnExtDelClick(Sender: TObject);
begin
    if (vleExternal.Row = 1) and (vleExternal.RowCount = 2) and
        (vleExternal.Cells[0, 1] = '') then
        exit;
    if (vleExternal.RowCount > 1) and (vleExternal.Row > 0) then
        vleExternal.DeleteRow(vleExternal.Row);
end;

procedure TEnviroForm.chkAltConfigClick(Sender: TObject);
begin
    chkAltConfig.Enabled := ConfigMode <> CFG_PARAM;
    edAltConfig.Enabled := chkAltConfig.Enabled and chkAltConfig.Checked;
    btnAltConfig.Enabled := chkAltConfig.Enabled and chkAltConfig.Checked;
end;

end.
