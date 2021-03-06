object PictureEdit: TPictureEdit
  Left = 306
  Top = 195
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Picture Editor'
  ClientHeight = 323
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grpImage: TGroupBox
    Left = 8
    Top = 6
    Width = 297
    Height = 259
    Caption = 'Image'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 216
      Width = 42
      Height = 13
      Caption = 'Filename'
    end
    object btnLoad: TButton
      Left = 208
      Top = 16
      Width = 75
      Height = 23
      Caption = 'Load'
      TabOrder = 0
      OnClick = btnLoadClick
    end
    object btnSave: TButton
      Left = 208
      Top = 72
      Width = 75
      Height = 23
      Caption = 'Save'
      TabOrder = 1
      Visible = False
    end
    object Panel1: TPanel
      Left = 10
      Top = 18
      Width = 193
      Height = 193
      BevelOuter = bvLowered
      TabOrder = 2
      object Image1: TImage
        Left = 1
        Top = 1
        Width = 191
        Height = 191
        Align = alClient
        Center = True
        Transparent = True
      end
    end
    object btnClear: TButton
      Left = 208
      Top = 44
      Width = 75
      Height = 23
      Caption = 'Delete'
      TabOrder = 3
      OnClick = btnClearClick
    end
    object FileName: TEdit
      Left = 8
      Top = 232
      Width = 273
      Height = 21
      Hint = 'Filename'
      ReadOnly = True
      TabOrder = 4
    end
  end
  object btnOK: TBitBtn
    Left = 60
    Top = 272
    Width = 80
    Height = 23
    TabOrder = 2
    Kind = bkOK
  end
  object btnCancel: TBitBtn
    Left = 177
    Top = 272
    Width = 80
    Height = 23
    TabOrder = 0
    Kind = bkCancel
  end
  object KeepFormat: TCheckBox
    Left = 80
    Top = 301
    Width = 177
    Height = 17
    Caption = 'Keep original graphic format'
    TabOrder = 3
  end
  object OpenDialog1: TOpenPictureDialog
    Filter = 
      'All (*.png;*.xpm;*.jpg;*.jpeg;*.gif;*.bmp;*.ico;*.emf;*.wmf)|*.x' +
      'pm;*.png;*.jpg;*.jpeg;*.gif;*.bmp;*.ico;*.emf;*.wmf|JPEG Image F' +
      'ile (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Graphics Inter' +
      'change Format (*.gif)|*.gif|Bitmaps (*.bmp)|*.bmp|Icons (*.ico)|' +
      '*.ico|Enhanced Metafiles (*.emf)|*.emf|Metafiles (*.wmf)|*.wmf|P' +
      'NG Files(*.png)|*.png|XPM Files(*.xpm)|*.xpm'
    Left = 8
    Top = 269
  end
  object XPMenu: TXPMenu
    DimLevel = 30
    GrayLevel = 10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
    DrawMenuBar = False
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    UseDimColor = False
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = False
    XPControls = [xcMainMenu, xcPopupMenu, xcToolbar, xcControlbar, xcCombo, xcListBox, xcEdit, xcMaskEdit, xcMemo, xcRichEdit, xcMiscEdit, xcCheckBox, xcRadioButton, xcButton, xcBitBtn, xcSpeedButton, xcUpDown, xcPanel, xcTreeView, xcListView, xcProgressBar, xcHotKey]
    Active = False
    Left = 36
    Top = 269
  end
end
