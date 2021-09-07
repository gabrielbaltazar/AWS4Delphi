unit AWS4D.Core.Model.Tag;

interface

uses
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Helper.JSON,
  System.Generics.Collections,
  System.Classes,
  System.JSON;

type TAWS4DCoreModelAttribute = class(TInterfacedObject, IAWS4DCoreModelAttribute)

  private
    FKey: string;
    FValue: string;

  protected
    function Key: String; overload;
    function Value: string; overload;

    function Key(Value: String): IAWS4DCoreModelAttribute; overload;
    function Value(AValue: string): IAWS4DCoreModelAttribute; overload;

  public
    class function New: IAWS4DCoreModelAttribute;
    class function NewIterator(JSONArray: TJSONArray): IAWS4DIterator<IAWS4DCoreModelAttribute>; overload;
    class function NewIterator(Values: TDictionary<string, String>): IAWS4DIterator<IAWS4DCoreModelAttribute>; overload;
    class function NewIterator(Values: TStrings): IAWS4DIterator<IAWS4DCoreModelAttribute>; overload;
end;

implementation

{ TAWS4DCoreModelAttribute }

function TAWS4DCoreModelAttribute.Key(Value: String): IAWS4DCoreModelAttribute;
begin
  result := Self;
  FKey := Value;
end;

function TAWS4DCoreModelAttribute.Key: String;
begin
  result := FKey;
end;

class function TAWS4DCoreModelAttribute.New: IAWS4DCoreModelAttribute;
begin
  result := Self.Create;
end;

class function TAWS4DCoreModelAttribute.NewIterator(Values: TStrings): IAWS4DIterator<IAWS4DCoreModelAttribute>;
var
  list: TList<IAWS4DCoreModelAttribute>;
  i: Integer;
begin
  list := TList<IAWS4DCoreModelAttribute>.create;
  try
    result := TAWS4DCoreModelIterator<IAWS4DCoreModelAttribute>.New(list);
    for i := 0 to Pred(Values.Count) do
    begin
      list.Add(TAWS4DCoreModelAttribute.New);
      list.Last.Key(Values.Names[i]);
      list.Last.Value(Values.ValueFromIndex[i]);
    end;

  except
    list.Free;
    raise;
  end;
end;

class function TAWS4DCoreModelAttribute.NewIterator(Values: TDictionary<string, String>): IAWS4DIterator<IAWS4DCoreModelAttribute>;
var
  list: TList<IAWS4DCoreModelAttribute>;
  key: string;
begin
  list := TList<IAWS4DCoreModelAttribute>.create;
  try
    result := TAWS4DCoreModelIterator<IAWS4DCoreModelAttribute>.New(list);
    for key in Values.Keys do
    begin
      list.Add(TAWS4DCoreModelAttribute.New);
      list.Last.Key(key);
      list.Last.Value(Values.Items[key]);
    end;

  except
    list.Free;
    raise;
  end;
end;

class function TAWS4DCoreModelAttribute.NewIterator(JSONArray: TJSONArray): IAWS4DIterator<IAWS4DCoreModelAttribute>;
var
  list: TList<IAWS4DCoreModelAttribute>;
  I: Integer;
begin
  list := TList<IAWS4DCoreModelAttribute>.create;
  try
    result := TAWS4DCoreModelIterator<IAWS4DCoreModelAttribute>.New(list);
    if not Assigned(JSONArray) then
      Exit;

    for I := 0 to Pred(JSONArray.Count) do
    begin
      list.Add(TAWS4DCoreModelAttribute.New);
      list.Last.Key(JSONArray.ItemAsString(i, 'Key'));
      list.Last.Value(JSONArray.ItemAsString(i, 'Value'));
    end;

  except
    list.Free;
    raise;
  end;
end;

function TAWS4DCoreModelAttribute.Value(AValue: string): IAWS4DCoreModelAttribute;
begin
  result := Self;
  FValue := AValue;
end;

function TAWS4DCoreModelAttribute.Value: string;
begin
  Result := FValue;
end;

end.
