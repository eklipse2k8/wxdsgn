// $Id$
//

unit wxTimer;

interface

uses
  Windows, Messages, SysUtils, Classes,wxUtils,WxNonVisibleBaseComponent;

type
  TWxTimer = class(TWxNonVisibleBaseComponent,IWxComponentInterface)
  private
    { Private declarations }
        FWx_Class : String;
        FWx_PropertyList : TStringList;
        FWx_EventList : TStringList;
        FWx_IDName:String;
        FWx_IDValue:Integer;
        FWx_Interval:Integer;
        FWx_AutoStart:Boolean;
        FEVT_TIMER:String;

        procedure AutoInitialize;
        procedure AutoDestroy;

  protected

  public
        constructor Create(AOwner: TComponent); override;
        destructor Destroy; override;
        function GenerateControlIDs:String;
        function GenerateEnumControlIDs:String;
        function GenerateEventTableEntries(CurrClassName:String):String;
        function GenerateGUIControlCreation:String;
        function GenerateGUIControlDeclaration:String;
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
        procedure SetIDValue(IDValue:longInt);
        procedure SetStretchFactor(intValue:Integer);
        procedure SetWxClassName(wxClassName:String);
        function GetFGColor:string;
        procedure SetFGColor(strValue:String);
        function GetBGColor:string;
        procedure SetBGColor(strValue:String);
        procedure SetProxyFGColorString(value:String);
        procedure SetProxyBGColorString(value:String);
  published
    { Published declarations }
        property Wx_Class : String read FWx_Class write FWx_Class;
        property Wx_IDName:String  read  FWx_IDName write  FWx_IDName;
        property Wx_IDValue:Integer  read  FWx_IDValue write FWx_IDValue;
        property Wx_Interval:Integer  read  FWx_Interval write FWx_Interval;
        property Wx_AutoStart:Boolean  read  FWx_AutoStart write FWx_AutoStart;
        property EVT_TIMER:String  read  FEVT_TIMER write FEVT_TIMER;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('wxWidgets', [TWxTimer]);
end;

{ Method to set variable and property values and create objects }
procedure TWxTimer.AutoInitialize;
begin
     FWx_PropertyList := TStringList.Create;
     FWx_EventList := TStringList.Create;
     FWx_Class := 'wxTimer';
     Glyph.Handle:=LoadBitmap(hInstance, 'TWxTimer');
     FWx_Interval:=100;
     FWx_AutoStart:=false;
end; { of AutoInitialize }

{ Method to free any objects created by AutoInitialize }
procedure TWxTimer.AutoDestroy;
begin
     FWx_PropertyList.Free;
     FWx_EventList.Free;
end; { of AutoDestroy }

constructor TWxTimer.Create(AOwner: TComponent);
begin
     { Call the Create method of the container's parent class       }
     inherited Create(AOwner);

     { AutoInitialize sets the initial values of variables          }
     { (including subcomponent variables) and properties;           }
     { also, it creates objects for properties of standard          }
     { Delphi object types (e.g., TFont, TTimer, TPicture)          }
     { and for any variables marked as objects.                     }
     { AutoInitialize method is generated by Component Create.      }
     AutoInitialize;

     { Code to perform other tasks when the component is created }
     { Code to perform other tasks when the component is created }
     FWx_PropertyList.add('Wx_IDName:IDName');
     FWx_PropertyList.add('Wx_IDValue:IDValue');
     FWx_PropertyList.add('Wx_Interval:Interval');
     FWx_PropertyList.add('Wx_AutoStart:AutoStart');

     FWx_PropertyList.add('Name:Name');
     FWx_PropertyList.add('Wx_Class:Base Class');

     FWx_EventList.add('EVT_TIMER:OnTimer');


end;

destructor TWxTimer.Destroy;
begin
     { AutoDestroy, which is generated by Component Create, frees any   }
     { objects created by AutoInitialize.                               }
     AutoDestroy;

     { Here, free any other dynamic objects that the component methods  }
     { created but have not yet freed.  Also perform any other clean-up }
     { operations needed before the component is destroyed.             }

     { Last, free the component by calling the Destroy method of the    }
     { parent class.                                                    }
     inherited Destroy;
end;

function TWxTimer.GenerateEnumControlIDs:String;
begin
     Result:='';
     if (Wx_IDValue > 0) and (trim(Wx_IDName) <> '') then
        Result:=Format('%s = %d , ',[Wx_IDName,Wx_IDValue]);
end;

function TWxTimer.GenerateControlIDs:String;
begin
     Result:='';
     if (Wx_IDValue > 0) and (trim(Wx_IDName) <> '') then
        Result:=Format('#define %s %d ',[Wx_IDName,Wx_IDValue]);
end;

function TWxTimer.GenerateEventTableEntries(CurrClassName:String):String;
begin
     Result:='';
     if trim(EVT_TIMER) <> '' then
     begin
          Result:=Format('EVT_TIMER(%s,%s::%s)',[WX_IDName,CurrClassName,EVT_TIMER]) +'';
     end;
end;

function TWxTimer.GenerateGUIControlCreation:String;
begin
    Result:='';
    Result:=Format('%s =  new %s();',[self.Name,self.wx_Class] );
    Result:=Result+#13+Format('%s->SetOwner(this,%s);',[self.Name,Wx_IDName] );

    if Wx_AutoStart = true then
        Result:=Result+#13+Format('%s->Start(%d);',[self.Name,self.Wx_Interval] );


end;

function TWxTimer.GenerateGUIControlDeclaration:String;
begin
     Result:='';
     Result:=Format('%s *%s;',[trim(Self.Wx_Class),trim(Self.Name)]);
end;

function TWxTimer.GenerateHeaderInclude:String;
begin
     Result:='';
     Result:='#include <wx/timer.h>';
end;

function TWxTimer.GenerateImageInclude: string;
begin

end;

function TWxTimer.GetEventList:TStringlist;
begin
    Result:=FWx_EventList;
end;

function TWxTimer.GetIDName:String;
begin
    Result:=wx_IDName;    
end;

function TWxTimer.GetIDValue:LongInt;
begin
  Result:=wx_IDValue;
end;

function TWxTimer.GetParameterFromEventName(EventName: string):String;
begin
    Result:='';
    if EventName = 'EVT_TIMER' then
    begin
     Result:='wxTimerEvent& event';
     exit;
    end;
end;

function TWxTimer.GetStretchFactor:Integer;
begin
//
end;

function TWxTimer.GetPropertyList:TStringList;
begin
     Result:=FWx_PropertyList;
end;

function TWxTimer.GetTypeFromEventName(EventName: string):string;
begin

end;

function TWxTimer.GetWxClassName:String;
begin
     if trim(wx_Class) = '' then
        wx_Class:='wxTimer';
     Result:=wx_Class;
end;

procedure TWxTimer.SaveControlOrientation(ControlOrientation:TWxControlOrientation);
begin
    //
end;

procedure TWxTimer.SetIDName(IDName:String);
begin
     wx_IDName:=IDName;
end;

procedure TWxTimer.SetIDValue(IDValue:longInt);
begin
     Wx_IDValue:=IDVAlue;
end;

procedure TWxTimer.SetStretchFactor(intValue:Integer);
begin
end;

procedure TWxTimer.SetWxClassName(wxClassName:String);
begin
     wx_Class:=wxClassName;
end;

function TWxTimer.GetFGColor:string;
begin

end;

procedure TWxTimer.SetFGColor(strValue:String);
begin
end;
    
function TWxTimer.GetBGColor:string;
begin
end;

procedure TWxTimer.SetBGColor(strValue:String);
begin
end;
procedure TWxTimer.SetProxyFGColorString(value:String);
begin
end;

procedure TWxTimer.SetProxyBGColorString(value:String);
begin

end;

end.
 
