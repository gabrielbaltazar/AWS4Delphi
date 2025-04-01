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
    function GetPair(AIndex: Integer): TJSONPair;
    function ValueAsString(AName: string; ADefault: string = ''): string;
    function ValueAsInteger(AName: string; ADefault: Integer = 0): Integer;
    function ValueAsFloat(AName: string; ADefault: Double = 0): Double;
    function ValueAsDateTime(AName: string; AFormat: string = '';
      ADefault: TDateTime = 0): TDateTime;
    function ValueAsBoolean(AName: string; ADefault: Boolean = True): Boolean;

    function ValueAsJSONObject(AName: string): TJSONObject;
    function ValueAsJSONArray(AName: string): TJSONArray;

    function SetValue(AName, AValue: string): TJSONObject;
  end;

  TAWS4DCoreHelperJSONArray = class helper for TJSONArray
  public
    function ItemAsString(AIndex: Integer; AName: string; ADefault: string = ''): string;
    function ItemAsInteger(AIndex: Integer; AName: string; ADefault: Integer = 0): Integer;
    function ItemAsFloat(AIndex: Integer; AName: string; ADefault: Double = 0): Double;
    function ItemAsDateTime(AIndex: Integer; AName: string; AFormat: string = '';
      ADefault: TDateTime = 0): TDateTime;
    function ItemAsBoolean(AIndex: Integer; AName: string; ADefault: Boolean = True): Boolean;

    function ItemAsJSONObject(AIndex: Integer): TJSONObject; overload;
    function ItemAsJSONObject(AIndex: Integer; AName: string): TJSONObject; overload;
    function ItemAsJSONArray(AIndex: Integer): TJSONArray; overload;
    function ItemAsJSONArray(AIndex: Integer; AName: string): TJSONArray; overload;

    function ToListString: TList<string>;
  end;

implementation

{ TAWS4DCoreHelperJSONObject }

function TAWS4DCoreHelperJSONObject.GetPair(AIndex: Integer): TJSONPair;
begin
{$IF CompilerVersion <= 26.0}
  Result := Self.Get(AIndex);
{$ELSE}
  Result := Self.Pairs[AIndex];
{$ENDIF}
end;

function TAWS4DCoreHelperJSONObject.SetValue(AName, AValue: string): TJSONObject;
begin
  Result := Self;
  if GetValue(AName) <> nil then
    Self.RemovePair(AName).Free;

  Self.AddPair(AName, AValue);
end;

function TAWS4DCoreHelperJSONObject.ValueAsBoolean(AName: string; ADefault: Boolean): Boolean;
var
  LStrValue: string;
begin
  Result := ADefault;
  if GetValue(AName) <> nil then
  begin
    LStrValue := GetValue(AName).ToString;
    Result := not LStrValue.Equals('false');
  end;
end;

function TAWS4DCoreHelperJSONObject.ValueAsDateTime(AName, AFormat: string; ADefault: TDateTime): TDateTime;
var
  LStrValue: string;
begin
  Result := ADefault;
  LStrValue := ValueAsString(AName, '0');
  if LStrValue <> '0' then
    Result := ISO8601ToDate(LStrValue);
end;

function TAWS4DCoreHelperJSONObject.ValueAsFloat(AName: string; ADefault: Double): Double;
var
  LStrValue: string;
begin
  LStrValue := ValueAsString(AName, ADefault.ToString);
  Result := StrToFloatDef(LStrValue, ADefault);
end;

function TAWS4DCoreHelperJSONObject.ValueAsInteger(AName: string; ADefault: Integer = 0): Integer;
var
  LStrValue: string;
begin
  LStrValue := ValueAsString(AName, ADefault.ToString);
  Result := StrToIntDef(LStrValue, ADefault);
end;

function TAWS4DCoreHelperJSONObject.ValueAsJSONArray(AName: string): TJSONArray;
begin
  Result := nil;
  if GetValue(AName) is TJSONArray then
    Result := TJSONArray(GetValue(AName));
end;

function TAWS4DCoreHelperJSONObject.ValueAsJSONObject(AName: string): TJSONObject;
begin
  Result := nil;
  if GetValue(AName) is TJSONObject then
    Result := TJSONObject(GetValue(AName));
end;

function TAWS4DCoreHelperJSONObject.ValueAsString(AName, ADefault: string): string;
begin
  Result := ADefault;
  if GetValue(AName) <> nil then
    Result := GetValue(AName).Value;
end;

{ TAWS4DCoreHelperJSONArray }

function TAWS4DCoreHelperJSONArray.ItemAsBoolean(AIndex: Integer; AName: string; ADefault: Boolean): Boolean;
var
  LJSON: TJSONObject;
begin
  LJSON := ItemAsJSONObject(AIndex);
  Result := LJSON.ValueAsBoolean(AName, ADefault);
end;

function TAWS4DCoreHelperJSONArray.ItemAsDateTime(AIndex: Integer; AName, AFormat: string; ADefault: TDateTime): TDateTime;
var
  LJSON: TJSONObject;
begin
  LJSON := ItemAsJSONObject(AIndex);
  Result := LJSON.ValueAsDateTime(AName, AFormat, ADefault);
end;

function TAWS4DCoreHelperJSONArray.ItemAsFloat(AIndex: Integer; AName: string; ADefault: Double): Double;
var
  LJSON: TJSONObject;
begin
  LJSON := ItemAsJSONObject(AIndex);
  Result := LJSON.ValueAsFloat(AName, ADefault);
end;

function TAWS4DCoreHelperJSONArray.ItemAsInteger(AIndex: Integer; AName: string; ADefault: Integer): Integer;
var
  LJSON: TJSONObject;
begin
  LJSON := ItemAsJSONObject(AIndex);
  Result := LJSON.ValueAsInteger(AName, ADefault);
end;

function TAWS4DCoreHelperJSONArray.ItemAsJSONArray(AIndex: Integer): TJSONArray;
begin
  Result :=
{$IF CompilerVersion > 26.0}
    Items[AIndex] as TJSONArray;
{$ELSE}
    Self.Get(Index) as TJSONArray;
{$ENDIF}
end;

function TAWS4DCoreHelperJSONArray.ItemAsJSONArray(AIndex: Integer; AName: string): TJSONArray;
var
  LJSON: TJSONObject;
begin
  LJSON := ItemAsJSONObject(AIndex);
  Result := LJSON.ValueAsJSONArray(AName);
end;

function TAWS4DCoreHelperJSONArray.ItemAsJSONObject(AIndex: Integer): TJSONObject;
begin
  Result :=
{$IF CompilerVersion > 26.0}
    Items[AIndex] as TJSONObject;
{$ELSE}
    Self.Get(Index) as TJSONObject;
{$ENDIF}
end;

function TAWS4DCoreHelperJSONArray.ItemAsJSONObject(AIndex: Integer; AName: string): TJSONObject;
var
  LJSON: TJSONObject;
begin
  LJSON := ItemAsJSONObject(AIndex);
  Result := LJSON.ValueAsJSONObject(AName);
end;

function TAWS4DCoreHelperJSONArray.ItemAsString(AIndex: Integer; AName, ADefault: string): string;
var
  LJSON: TJSONObject;
begin
  LJSON := ItemAsJSONObject(AIndex);
  Result := LJSON.ValueAsString(AName, ADefault);
end;

function TAWS4DCoreHelperJSONArray.ToListString: TList<string>;
var
  I: Integer;
begin
  Result := TList<string>.create;
  try
    for I := 0 to Pred(Self.Count) do
      Result.Add( Self.Items[I].Value );
  except
    Result.Free;
    raise;
  end;
end;

end.
