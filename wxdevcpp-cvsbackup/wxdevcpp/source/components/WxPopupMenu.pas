unit WxPopupMenu;

interface

uses
  Windows, Messages, SysUtils, Classes,WxNonVisibleBaseComponent,
  Wxutils,WxSizerPanel,Menus,WxCustomMenuItem,dbugintf;

type
  TWxPopupMenu = class(TWxNonVisibleBaseComponent,IWxComponentInterface)
  private
    { Private declarations }
        FWx_Class : String;
        FWx_Caption:String;
        FWx_PropertyList : TStringList;
        FWx_MenuItems: TWxCustomMenuItem;
        
        procedure AutoInitialize;
        procedure AutoDestroy;
  protected
    { Protected declarations }
  public
    { Public declarations }
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function GenerateControlIDs:String;
        function GenerateEventTableEntries(CurrClassName:String):String;
        function GenerateGUIControlCreation:String;
        function GenerateGUIControlDeclaration:String;
        function GetMenuItemCode:String;
        function GetCodeForOneMenuItem(parentName:String;item:TWxCustomMenuItem):string;
        function GenerateHeaderInclude:String;
        function GenerateImageInclude: string;
        function GetEventList:TStringlist;
        function GetIDName:String;
        function GetIDValue:LongInt;
        function GetParameterFromEventName(EventName: string):String;
        function GetPropertyList:TStringList;
        function GetStretchFactor:Integer;
        function GetTypeFromEventName(EventName: string):string;
        function GetWxClassName:String;
        procedure SaveControlOrientation(ControlOrientation:TWxControlOrientation);
        procedure SetIDName(IDName:String);
        function GetMaxID:Integer;
        procedure SetIDValue(IDValue:longInt);
        procedure SetStretchFactor(intValue:Integer);
        procedure SetWxClassName(wxClassName:String);
        function GetFGColor:string;
        procedure SetFGColor(strValue:String);
        function GetBGColor:string;
        procedure SetBGColor(strValue:String);
        procedure SetProxyFGColorString(value:String);
        procedure SetProxyBGColorString(value:String);

        //function GetSubComponent: TPersistent;
        //procedure SetSubComponent(Value: TPersistent);

  published
    { Published declarations }
        property Wx_Class : String read FWx_Class write FWx_Class;
        property Wx_Caption : String read FWx_Caption write FWx_Caption;
        property Wx_MenuItems : TWxCustomMenuItem  read FWx_MenuItems  write FWx_MenuItems;

  end;

procedure Register;

implementation

uses main;

procedure Register;
begin
  RegisterComponents('wxWidgets', [TWxPopupMenu]);
end;

procedure TWxPopupMenu.AutoInitialize;
var
    mnuItem:TWxCustomMenuItem;
begin
     FWx_PropertyList := TStringList.Create;
     FWx_Class := 'wxMenu';
     FWx_MenuItems:=TWxCustomMenuItem.Create(self.Parent);
     Glyph.Handle:=LoadBitmap(hInstance, 'TWxPopupMenu');
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TWxPopupMenu.AutoDestroy;
begin
     FWx_PropertyList.Free;
    FWx_MenuItems.Free;
end; { of AutoDestroy }

constructor TWxPopupMenu.Create(AOwner: TComponent);
begin
     { Call the Create method of the container's parent class       }
     inherited Create(AOwner);
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;
     { Code to perform other tasks when the component is created }
     FWx_PropertyList.add('wx_Class:Base Class');
     FWx_PropertyList.add('Wx_Caption :Caption');
     FWx_PropertyList.add('Name : Name');
     FWx_PropertyList.add('Wx_MenuItems: Menu Items');
end;

destructor TWxPopupMenu.Destroy;
begin
     { AutoDestroy, which is generated by Component Create, frees any   }
     { objects created by AutoInitialize.                               }
     AutoDestroy;
     inherited Destroy;
end;

function TWxPopupMenu.GenerateControlIDs:String;
var
  I: Integer;
  retValue:Integer;
  strF:String;
  strLst:TStringList;

  procedure GetControlIDFromSubMenu(idstrList:TStringList;submnu:TWxCustomMenuItem);
  var
    myretValue:Integer;
    J:Integer;
    strData:String;
  begin
    for J := 0 to submnu.Count - 1 do    // Iterate
    begin
        strData:='#define '+submnu.Items[J].Wx_IDName+' '+IntToStr(submnu.Items[J].wx_IDValue);
        idstrList.add(strData);

        if submnu.items[J].Count > 0 then
        begin
            GetControlIDFromSubMenu(idstrList,submnu.items[J]);
        end;
    end;    // for
  end;

begin

    Result :='';
    strLst:=TStringList.Create;

    for I := 0 to Wx_MenuItems.Count - 1 do    // Iterate
    begin
        strF:='#define '+Wx_MenuItems.Items[i].Wx_IDName+' '+IntToStr(Wx_MenuItems.Items[i].wx_IDValue);
        if trim(strF) <> '' then
        begin
            strLst.add(strF);
        end;

        if Wx_MenuItems.items[i].Count > 0 then
        begin
            GetControlIDFromSubMenu(strLst,Wx_MenuItems.items[i]);
        end
    end;    // for
    Result:=strLst.Text;
    strLst.Destroy;

end;

function TWxPopupMenu.GenerateEventTableEntries(CurrClassName:String):String;
var
  I: Integer;
  retValue:Integer;
  strF:String;
  strLst:TStringList;

  procedure GenerateEventTableEntriesFromSubMenu(idstrList:TStringList;submnu:TWxCustomMenuItem);
  var
    myretValue:Integer;
    J:Integer;
    strData:String;
  begin
    for J := 0 to submnu.Count - 1 do    // Iterate
    begin
        if submnu.items[J].Count > 0 then
        begin
            GenerateEventTableEntriesFromSubMenu(idstrList,submnu.items[J]);
        end
        else
        begin
            if trim(submnu.Items[j].EVT_Menu) <> '' then
                strLst.add('EVT_MENU('+submnu.Items[j].Wx_IDName +' , '+CurrClassName +'::'+submnu.Items[j].EVT_Menu+')');

            if trim(submnu.Items[j].EVT_UPDATE_UI) <> '' then
                strLst.add('EVT_UPDATE_UI('+submnu.Items[j].Wx_IDName +' , '+CurrClassName +'::'+submnu.Items[j].EVT_UPDATE_UI+')');
        end;
    end;    // for
  end;

begin

    Result :='';
    strLst:=TStringList.Create;

    for I := 0 to Wx_MenuItems.Count - 1 do    // Iterate
    begin
        if Wx_MenuItems.items[i].Count > 0 then
        begin
            GenerateEventTableEntriesFromSubMenu(strLst,Wx_MenuItems.items[i]);
        end
        else
        begin
            if trim(Wx_MenuItems.Items[i].EVT_Menu) <> '' then
                strLst.add('EVT_MENU('+Wx_MenuItems.Items[i].Wx_IDName +' , '+CurrClassName +'::'+Wx_MenuItems.Items[i].EVT_Menu+')');

            if trim(Wx_MenuItems.Items[i].EVT_UPDATE_UI) <> '' then
                strLst.add('EVT_UPDATE_UI('+Wx_MenuItems.Items[i].Wx_IDName +' , '+CurrClassName +'::'+Wx_MenuItems.Items[i].EVT_UPDATE_UI+')');

        end;
    end;    // for
    Result:=strLst.Text;
    strLst.Destroy;
end;

function TWxPopupMenu.GenerateGUIControlCreation:String;
var
     strColorStr:String;
     strStyle,parentName,strAlignment:String;
     strMenucodeData:String;
begin
     Result:='';
    parentName:=GetWxWidgetParent(self);

    //strStyle:=GetStdStyleString(self.Wx_GeneralStyle);
    if trim(strStyle) <> '' then
       strStyle:=',' +strStyle;
    Result:=Format('%s =  new %s(_("%s") %s );',[self.Name,self.Wx_Class,GetCppString(Wx_Caption),strStyle] );
    strMenucodeData:=GetMenuItemCode;
    Result:=Result+#13+strMenucodeData;
end;

function TWxPopupMenu.GetCodeForOneMenuItem(parentName:String;item:TWxCustomMenuItem):String;
begin
    Result:='';
    if item.Count < 1 then
    begin
        if item.Wx_MenuItemStyle = wxMnuItm_Separator then
            Result:=parentName+'->AppendSeparator();'
        else
        begin
            if item.WX_BITMAP.Bitmap.Handle <> 0 then
            begin
                Result:=' wxMenuItem * '+item.Wx_IDName+'_mnuItem_obj = new wxMenuItem ('+Format('%s,%s,_("%s"),_("%s"), %s',[parentName,item.Wx_IDName,GetCppString(item.Wx_Caption),GetCppString(item.Wx_HelpText),GetMenuKindAsText(item.Wx_MenuItemStyle)])+');';
                Result:=Result+#13+#10+'wxBitmap '+item.Wx_IDName+'_mnuItem_obj_BMP('+ item.Wx_IDName+'_XPM);';
                Result:=Result+#13+#10+item.Wx_IDName+'_mnuItem_obj->SetBitmap('+item.Wx_IDName+'_mnuItem_obj_BMP);';
                Result:=Result+#13+#10+parentName+'->Append('+item.Wx_IDName+'_mnuItem_obj);';
            end
            else
            begin
                Result:=parentName+'->Append('+ Format('%s,_("%s"),_("%s"), %s',[item.Wx_IDName,GetCppString(item.Wx_Caption),GetCppString(item.Wx_HelpText),GetMenuKindAsText(item.Wx_MenuItemStyle)]) +');';
            end;

            if item.Wx_Checked then
            begin
                Result:=Result+#13+#10+parentName+'->Check('+ item.Wx_IDName +',true);';
            end;

            if not item.Wx_Enabled then
            begin
                Result:=Result+#13+#10+parentName+'->Enable('+ item.Wx_IDName +',false);';
            end;
        end;
    end;
end;

function TWxPopupMenu.GetMenuItemCode:String;
var
  I: Integer;
  retValue:Integer;
  strF:String;
  strLst:TStringList;

  procedure GetCodeFromSubMenu(submnustrlst:TStringList;submnu:TWxCustomMenuItem);
  var
    myretValue:Integer;
    J:Integer;
    parentItemName,strV:String;
  begin
    Result:='';
     strV:='wxMenu *'+submnu.wx_IDName+'_Obj = new wxMenu();';
    parentItemName:=submnu.wx_IDName+'_Obj';
    submnustrlst.add(strV);

    for J := 0 to submnu.Count - 1 do    // Iterate
    begin
        if submnu.items[J].Count > 0 then
        begin
            GetCodeFromSubMenu(submnustrlst,submnu.items[J]);
            strV:=parentItemName+'->Append('+format('%s,_("%s") , %s',[submnu.items[J].Wx_IDNAME,GetCppString(submnu.items[J].Wx_Caption),submnu.items[J].Wx_IDName+'_obj'])+');';
            strLst.add(strV);
        end
        Else
        begin
            strV:=GetCodeForOneMenuItem(parentItemName,submnu.items[J]);
            if trim(strV) <> '' then
            begin
                strLst.add(strV);
                strLst.add('');
                //sendDebug(strV);
            end;
        end;
    end;    // for
  end;

begin

    Result :='';
    strLst:=TStringList.Create;
    for I := 0 to Wx_MenuItems.Count - 1 do    // Iterate
    begin
        if Wx_MenuItems.items[i].Count > 0 then
        begin
            GetCodeFromSubMenu(strLst,Wx_MenuItems.items[i]);
            strLst.add(self.Name+'->Append('+Wx_MenuItems.items[i].Wx_IDName+',_("'+Wx_MenuItems.items[i].Wx_Caption+'"),'+Wx_MenuItems.items[i].Wx_IDName+'_Obj ' +');');
        end
        Else
        begin
            strF:=GetCodeForOneMenuItem(self.Name,Wx_MenuItems.Items[i]);
            if trim(strF) <> '' then
            begin
                strLst.add(strF);
                strLst.add('');
            end;
        end;
    end;    // for
    Result:=strLst.Text;
    strLst.Destroy;

end;

function TWxPopupMenu.GenerateGUIControlDeclaration:String;
begin
     Result:='';
     Result:=Format('%s *%s;',[trim(Self.Wx_Class),trim(Self.Name)]);
end;

function TWxPopupMenu.GenerateHeaderInclude:String;
begin
     Result:='';
     Result:='#include <wx/menu.h>';
end;


function TWxPopupMenu.GenerateImageInclude: string;
var
  I: Integer;
  retValue:Integer;
  strF:String;
  strLst:TStringList;

  procedure GetImageIncludeFromSubMenu(idstrList:TStringList;submnu:TWxCustomMenuItem);
  var
    myretValue:Integer;
    J:Integer;
    strData:String;
  begin
    for J := 0 to submnu.Count - 1 do    // Iterate
    begin
        if submnu.Items[J].WX_BITMAP.Bitmap.Handle <> 0 then
            strData:='#include "'+submnu.Items[J].Wx_IDName+'_XPM.xpm"'
        else
            strData:='';
        if strData <> '' then
            idstrList.add(strData);

        if submnu.items[J].Count > 0 then
        begin
            GetImageIncludeFromSubMenu(idstrList,submnu.items[J]);
        end;
    end;    // for
  end;

begin

    Result :='';
    strLst:=TStringList.Create;

    for I := 0 to Wx_MenuItems.Count - 1 do    // Iterate
    begin
        if Wx_MenuItems.Items[i].wx_Bitmap.Bitmap.Handle <> 0 then
            strF:='#include "'+Wx_MenuItems.Items[i].Wx_IDName+'_XPM.xpm"'
        else
            strF:='';
        if trim(strF) <> '' then
        begin
            strLst.add(strF);
        end;

        if Wx_MenuItems.items[i].Count > 0 then
        begin
            GetImageIncludeFromSubMenu(strLst,Wx_MenuItems.items[i]);
        end
    end;    // for
    Result:=strLst.Text;
    strLst.Destroy;

end;

function TWxPopupMenu.GetEventList:TStringlist;
begin
Result:=nil;
end;

function TWxPopupMenu.GetIDName:String;
begin
     Result:='';
end;

function TWxPopupMenu.GetIDValue:LongInt;
begin
    result:=GetMaxID;
end;

function TWxPopupMenu.GetParameterFromEventName(EventName: string):String;
begin

end;

function TWxPopupMenu.GetStretchFactor:Integer;
begin
//
end;

function TWxPopupMenu.GetPropertyList:TStringList;
begin
     Result:=FWx_PropertyList;
end;

function TWxPopupMenu.GetTypeFromEventName(EventName: string):string;
begin

end;

function TWxPopupMenu.GetWxClassName:String;
begin
     if trim(wx_Class) = '' then
        wx_Class:='wxMenu';
     Result:=wx_Class;
end;

procedure TWxPopupMenu.SaveControlOrientation(ControlOrientation:TWxControlOrientation);
begin
    //
end;

function TWxPopupMenu.GetMaxID:Integer;
var
  I: Integer;
  retValue:Integer;
  
  function GetMaxIDFromSubMenu(submnu:TWxCustomMenuItem):Integer;
  var
    myretValue:Integer;
    J:Integer;
  begin
    Result :=submnu.Wx_IDValue;
    for J := 0 to submnu.Count - 1 do    // Iterate
    begin
        if submnu.items[J].Wx_IDValue > Result then
            Result:=submnu.items[J].Wx_IDValue;
        if submnu.items[J].Count > 0 then
        begin
            myretValue:=GetMaxIDFromSubMenu(submnu.items[J]);
            if myretValue > Result then
                Result:=myretValue;
        end;
    end;    // for
  end;

begin
    Result :=Wx_MenuItems.Wx_IDValue;
    for I := 0 to Wx_MenuItems.Count - 1 do    // Iterate
    begin
        if Wx_MenuItems.items[i].Wx_IDValue > Result then
            Result:=Wx_MenuItems.items[i].Wx_IDValue;
        if Wx_MenuItems.items[i].Count > 0 then
        begin
            retValue:=GetMaxIDFromSubMenu(Wx_MenuItems.items[i]);
            if retValue > Result then
                Result:=retValue;
        end;
    end;    // for
end;


procedure TWxPopupMenu.SetIDName(IDName:String);
begin

end;

procedure TWxPopupMenu.SetIDValue(IDValue:longInt);
begin

end;

procedure TWxPopupMenu.SetStretchFactor(intValue:Integer);
begin
end;

procedure TWxPopupMenu.SetWxClassName(wxClassName:String);
begin
     wx_Class:=wxClassName;
end;

function TWxPopupMenu.GetFGColor:string;
begin

end;

procedure TWxPopupMenu.SetFGColor(strValue:String);
begin
end;

function TWxPopupMenu.GetBGColor:string;
begin
end;

procedure TWxPopupMenu.SetBGColor(strValue:String);
begin
end;
procedure TWxPopupMenu.SetProxyFGColorString(value:String);
begin
end;

procedure TWxPopupMenu.SetProxyBGColorString(value:String);
begin
end;

end.
