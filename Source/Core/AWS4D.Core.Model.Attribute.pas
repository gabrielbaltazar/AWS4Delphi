unit AWS4D.Core.Model.Attribute;

interface

uses
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Helper.JSON,
  System.Generics.Collections,
  System.JSON;

type
  TAWS4DCoreModelAttribute = class(TInterfacedObject, IAWS4DCoreModelAttribute)
  private
    FKey: string;
    FValue: string;
  protected
    function Key: string; overload;
    function Value: string; overload;

    function Key(Value: string): IAWS4DCoreModelAttribute; overload;
    function Value(AValue: string): IAWS4DCoreModelAttribute; overload;
  public
    class function New: IAWS4DCoreModelAttribute;
    class function NewIterator(AJSONArray: TJSONArray): IAWS4DIterator<IAWS4DCoreModelAttribute>; overload;
    class function NewIterator(AValues: TDictionary<string, string>): IAWS4DIterator<IAWS4DCoreModelAttribute>; overload;
  end;

implementation

{ TAWS4DCoreModelAttribute }

function TAWS4DCoreModelAttribute.Key(Value: string): IAWS4DCoreModelAttribute;
begin
  Result := Self;
  FKey := Value;
end;

function TAWS4DCoreModelAttribute.Key: string;
begin
  Result := FKey;
end;

class function TAWS4DCoreModelAttribute.New: IAWS4DCoreModelAttribute;
begin
  Result := Self.Create;
end;

class function TAWS4DCoreModelAttribute.NewIterator(AValues: TDictionary<string, string>): IAWS4DIterator<IAWS4DCoreModelAttribute>;
var
  LList: TList<IAWS4DCoreModelAttribute>;
  LKey: string;
begin
  LList := TList<IAWS4DCoreModelAttribute>.create;
  try
    Result := TAWS4DCoreModelIterator<IAWS4DCoreModelAttribute>.New(LList);
    for LKey in AValues.Keys do
    begin
      LList.Add(TAWS4DCoreModelAttribute.New);
      LList.Last.Key(LKey);
      LList.Last.Value(AValues.Items[LKey]);
    end;
  except
    LList.Free;
    raise;
  end;
end;

class function TAWS4DCoreModelAttribute.NewIterator(AJSONArray: TJSONArray): IAWS4DIterator<IAWS4DCoreModelAttribute>;
var
  LList: TList<IAWS4DCoreModelAttribute>;
  I: Integer;
begin
  LList := TList<IAWS4DCoreModelAttribute>.create;
  try
    Result := TAWS4DCoreModelIterator<IAWS4DCoreModelAttribute>.New(LList);
    if not Assigned(AJSONArray) then
      Exit;

    for I := 0 to Pred(AJSONArray.Count) do
    begin
      LList.Add(TAWS4DCoreModelAttribute.New);
      LList.Last.Key(AJSONArray.ItemAsstring(i, 'Key'));
      LList.Last.Value(AJSONArray.ItemAsstring(i, 'Value'));
    end;
  except
    LList.Free;
    raise;
  end;
end;

function TAWS4DCoreModelAttribute.Value(AValue: string): IAWS4DCoreModelAttribute;
begin
  Result := Self;
  FValue := AValue;
end;

function TAWS4DCoreModelAttribute.Value: string;
begin
  Result := FValue;
end;

end.
