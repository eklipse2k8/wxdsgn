�
 TMENUITEMFORM 0H  TPF0TMenuItemFormMenuItemFormLeft� Top� BorderStylebsDialogCaptionMenu Item EditorClientHeightkClientWidthKColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style Menu	MainMenu1OldCreateOrder	PositionpoMainFormCenterOnCreate
FormCreate	OnDestroyFormDestroyPixelsPerInch`
TextHeight 	TGroupBox	GroupBox1LeftTopWidth6Height� Caption
PropertiesTabOrder  TLabelLabel1Left
TopWidthHeightCaptionType  TLabelLabel2Left
Top,Width$HeightCaptionCaption  TLabelLabel3Left
ToprWidth+HeightCaptionChecked  TLabelLabel5Left
Top� Width'HeightCaptionEnabled  TLabelLabel8Left
Top� WidthHeightCaptionHint  TLabelLabel12Left
TopAWidth*HeightCaptionID Name  TLabelLabel13Left
Top� WidthHeightCaptionVisibleVisible  TLabelLabel7Left
TopYWidth)HeightCaptionID Value  TLabelLabel10Left
Top� Width%HeightCaptionBitmaps  TImagebmpMenuImageLeft@Top� Width!HeightCenter	Transparent	  TImageImage1Left� Top� Width!HeightCenter	Transparent	Visible  	TComboBox
cbMenuTypeLeftCTopWidth� HeightStylecsDropDownListEnabled
ItemHeightTabOrder OnChangecbMenuTypeChangeItems.Strings	Menu Item	Seperator
Check Item
Radio ItemFile History   TEdit
txtCaptionLeftCTop(Width� HeightEnabledImeName   ÇÑ±¹¾î(ÇÑ±Û)TabOrderOnExittxtCaptionExit	OnKeyDowntxtCaptionKeyDown  	TComboBox	cbCheckedLeftCTopnWidthJHeightStylecsDropDownListEnabled
ItemHeight	ItemIndex TabOrderTextFalseItems.StringsFalseTrue   	TComboBox	cbEnabledLeftCTop� WidthJHeightStylecsDropDownListEnabled
ItemHeight	ItemIndexTabOrderTextTrueItems.StringsFalseTrue   TEdittxtHintLeftCTop� Width� HeightEnabledTabOrder  	TComboBox	cbVisibleLeftCTop� WidthJHeightStylecsDropDownListEnabled
ItemHeight	ItemIndexTabOrderTextTrueVisibleItems.StringsFalseTrue   TEdit
txtIDValueLeftCTopVWidth� HeightEnabledTabOrder  TButtonbtBrowseLeftlTop� Width-HeightCaptionBrowseEnabledTabOrderOnClickbtBrowseClick  TButtonButton3Left� Top� Width-HeightCaptionBrowseEnabledTabOrder	VisibleOnClickbtBrowseClick  	TComboBox	txtIDNameLeftCTop>Width� HeightEnabled
ItemHeightTabOrder   	TGroupBox	GroupBox2LeftTopWidth� Height-Caption
Menu ItemsTabOrder 	TTreeView
tvMenuItemLeftTopWidth� HeightHint�TO RE-ORDER MENU
==================

* Left click, drag and drop = Item moves after the drop point
* SHIFT + left click, drag and drop = Item becomes child of the drop pointDragModedmAutomaticHideSelectionIndentParentShowHint	PopupMenu
PopupMenu1ReadOnly	ShowHint	TabOrder OnChangetvMenuItemChange
OnDragDroptvMenuItemDragDrop
OnDragOvertvMenuItemDragOver	OnKeyDowntvMenuItemKeyDown   TButtonbtnOKLeft�TopHWidthKHeightCaptionOKModalResultTabOrder  TButton	btnCancelLeft TopHWidthKHeightCaptionCancelModalResultTabOrder  TButton	btnInsertLeftsTopHWidthKHeightCaptionAdd ItemTabOrderOnClickbtnInsertClick  TButton	btnDeleteLeft`TopHWidthKHeightCaptionDeleteTabOrderOnClickbtnDeleteClick  TButton
btnSubmenuLeftTopHWidth`HeightCaptionCreate SubmenuTabOrderOnClickbtnSubmenuClick  	TGroupBox	GroupBox3LeftTop� Width5HeightACaptionEventsTabOrder TLabelLabel4LeftTopWidth)HeightCaptionOnMenu  TLabelLabel6LeftTop)Width<HeightCaption
OnUpdateUI  	TComboBoxcbOnMenuLeftHTopWidth� HeightEnabled
ItemHeightTabOrder   	TComboBoxcbOnUpdateUILeftHTop'Width� HeightEnabled
ItemHeightTabOrder   TButtonbtApplyLeft� TopHWidthJHeightCaptionApplyEnabledTabOrderOnClickbtApplyClick  TButtonbtEditLeftTopHWidthLHeightCaptionEditTabOrder	OnClickbtEditClick  TButtonbtNewOnMenuLeft�Top
Width>HeightCaptionCreateEnabledTabOrder
OnClickbtNewOnMenuClick  TButtonbtNewUpdateUILeft�Top$Width>HeightCaptionCreateEnabledTabOrderOnClickbtNewUpdateUIClick  
TPopupMenu
PopupMenu1Left� Toph 	TMenuItemiNSERT1CaptionInsertOnClickiNSERT1Click  	TMenuItemDelete1CaptionDeleteOnClickDelete1Click  	TMenuItemN1Caption-  	TMenuItemCreateSubmenu1CaptionCreate SubmenuOnClickCreateSubmenu1Click   	TMainMenu	MainMenu1Left� Top@   