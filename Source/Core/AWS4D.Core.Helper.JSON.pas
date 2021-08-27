unit AWS4D.Core.Helper.JSON;

interface

uses
  {$IF CompilerVersion <= 34.0}
  REST.Json,
  {$ENDIF}
  System.Generics.Collections,
  System.Classes,
  System.DateUtils,
  System.JSON,
  System.SysUtils;

type
  TAWS4DCoreHelperJSONObject = class helper for TJSONObject

  public
    function ValueAsString   (Name: string; Default: string = ''): string;
    function ValueAsInteger  (Name: string; Default: Integer = 0): Integer;
    function ValueAsFloat    (Name: string; Default: Double = 0): Double;
    function ValueAsDateTime (Name: string; AFormat: String = ''; Default: TDateTime = 0): TDateTime;
    function ValueAsBoolean  (Name: string; Default: Boolean = True): Boolean;

    function ValueAsJSONObject(Name: String): TJSONObject;
    function ValueAsJSONArray (Name: String): TJSONArray;
  end;

  TAWS4DCoreHelperJSONArray = class helper for TJSONArray
  public
    function ItemAsString(Index: Integer; Name: string; Default: string = ''): string;
    function ItemAsInteger(Index: Integer; Name: string; Default: Integer = 0): Integer;
    function ItemAsFloat  (Index: Integer; Name: string; Default: Double = 0): Double;
    function ItemAsDateTime(Index: Integer; Name: string; AFormat: String = ''; Default: TDateTime = 0): TDateTime;
    function ItemAsBoolean(Index: Integer; Name: string; Default: Boolean = True): Boolean;

    function ItemAsJSONObject(Index: Integer): TJSONObject; overload;
    function ItemAsJSONObject(Index: Integer; Name: String): TJSONObject; overload;
    function ItemAsJSONArray(Index: Integer): TJSONArray; overload;
    function ItemAsJSONArray(Index: Integer; Name: String): TJSONArray; overload;

    function ToListString: TList<String>;
  end;

implementation

{ TAWS4DCoreHelperJSONObject }

function TAWS4DCoreHelperJSONObject.ValueAsBoolean(Name: string; Default: Boolean): Boolean;
var
  strValue: string;
begin
  result := Default;
  if GetValue(Name) <> nil then
  begin
    strValue := GetValue(Name).ToString;
    result := not strValue.Equals('false');
  end;
end;

function TAWS4DCoreHelperJSONObject.ValueAsDateTime(Name, AFormat: String; Default: TDateTime): TDateTime;
var
  strValue: string;
begin
  result := Default;
  strValue := ValueAsString(Name, '0');
  if strValue <> '0' then
    result := ISO8601ToDate(strValue);
end;

function TAWS4DCoreHelperJSONObject.ValueAsFloat(Name: string; Default: Double): Double;
var
  strValue: string;
begin
  strValue := ValueAsString(Name, Default.ToString);
  result := StrToFloatDef(strValue, Default);
end;

function TAWS4DCoreHelperJSONObject.ValueAsInteger(Name: string; Default: Integer): Integer;
var
  strValue: string;
begin
  strValue := ValueAsString(Name, default.ToString);
  result := StrToIntDef(strValue, Default);
end;

function TAWS4DCoreHelperJSONObject.ValueAsJSONArray(Name: String): TJSONArray;
begin
  result := nil;
  if GetValue(Name) is TJSONArray then
    result := TJSONArray( GetValue(Name) );
end;

function TAWS4DCoreHelperJSONObject.ValueAsJSONObject(Name: String): TJSONObject;
begin
  result := nil;
  if GetValue(Name) is TJSONObject then
    result := TJSONObject( GetValue(Name) );
end;

function TAWS4DCoreHelperJSONObject.ValueAsString(Name, Default: string): string;
begin
  result := Default;
  if GetValue(Name) <> nil then
    result := GetValue(Name).Value;
end;

{ TAWS4DCoreHelperJSONArray }

function TAWS4DCoreHelperJSONArray.ItemAsBoolean(Index: Integer; Name: string; Default: Boolean): Boolean;
var
  json: TJSONObject;
begin
  json := ItemAsJSONObject(Index);
  result := json.ValueAsBoolean(Name, Default);
end;

function TAWS4DCoreHelperJSONArray.ItemAsDateTime(Index: Integer; Name, AFormat: String; Default: TDateTime): TDateTime;
var
  json: TJSONObject;
begin
  json := ItemAsJSONObject(Index);
  result := json.ValueAsDateTime(Name, AFormat, Default);
end;

function TAWS4DCoreHelperJSONArray.ItemAsFloat(Index: Integer; Name: string; Default: Double): Double;
var
  json: TJSONObject;
begin
  json := ItemAsJSONObject(Index);
  result := json.ValueAsFloat(Name, Default);
end;

function TAWS4DCoreHelperJSONArray.ItemAsInteger(Index: Integer; Name: string; Default: Integer): Integer;
var
  json: TJSONObject;
begin
  json := ItemAsJSONObject(Index);
  result := json.ValueAsInteger(Name, Default);
end;

function TAWS4DCoreHelperJSONArray.ItemAsJSONArray(Index: Integer): TJSONArray;
begin
  result := {$IF CompilerVersion > 26.0} Items[Index] as TJSONArray; {$ELSE} Self.Get(Index) as TJSONArray; {$ENDIF}
end;

function TAWS4DCoreHelperJSONArray.ItemAsJSONArray(Index: Integer; Name: String): TJSONArray;
var
  json: TJSONObject;
begin
  json := ItemAsJSONObject(Index);
  result := json.ValueAsJSONArray(Name);
end;

function TAWS4DCoreHelperJSONArray.ItemAsJSONObject(Index: Integer): TJSONObject;
begin
  result := {$IF CompilerVersion > 26.0} Items[Index] as TJSONObject; {$ELSE} Self.Get(Index) as TJSONObject; {$ENDIF}
end;

function TAWS4DCoreHelperJSONArray.ItemAsJSONObject(Index: Integer; Name: String): TJSONObject;
var
  json: TJSONObject;
begin
  json := ItemAsJSONObject(Index);
  result := json.ValueAsJSONObject(Name);
end;

function TAWS4DCoreHelperJSONArray.ItemAsString(Index: Integer; Name, Default: string): string;
var
  json: TJSONObject;
begin
  json := ItemAsJSONObject(Index);
  result := json.ValueAsString(Name, Default);
end;

function TAWS4DCoreHelperJSONArray.ToListString: TList<String>;
var
  i: Integer;
begin
  result := TList<String>.create;
  try
    for i := 0 to Pred(Self.Count) do
      result.Add( Self.Items[i].Value );
  except
    result.Free;
    raise;
  end;
end;

end.
