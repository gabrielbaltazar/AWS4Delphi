unit AWS4D.Core.Model.Tag;

interface

uses
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Helper.JSON,
  System.Generics.Collections,
  System.JSON;

type TAWS4DCoreModelTag = class(TInterfacedObject, IAWS4DCoreModelTag)

  private
    FKey: string;
    FValue: string;

  protected
    function Key: String; overload;
    function Value: string; overload;

    function Key(Value: String): IAWS4DCoreModelTag; overload;
    function Value(AValue: string): IAWS4DCoreModelTag; overload;

  public
    class function New: IAWS4DCoreModelTag;
    class function NewIterator(JSONArray: TJSONArray): IAWS4DIterator<IAWS4DCoreModelTag>;
end;

implementation

{ TAWS4DCoreModelTag }

function TAWS4DCoreModelTag.Key(Value: String): IAWS4DCoreModelTag;
begin
  result := Self;
  FKey := Value;
end;

function TAWS4DCoreModelTag.Key: String;
begin
  result := FKey;
end;

class function TAWS4DCoreModelTag.New: IAWS4DCoreModelTag;
begin
  result := Self.Create;
end;

class function TAWS4DCoreModelTag.NewIterator(JSONArray: TJSONArray): IAWS4DIterator<IAWS4DCoreModelTag>;
var
  list: TList<IAWS4DCoreModelTag>;
  I: Integer;
begin
  list := TList<IAWS4DCoreModelTag>.create;
  try
    result := TAWS4DCoreModelIterator<IAWS4DCoreModelTag>.New(list);
    for I := 0 to Pred(JSONArray.Count) do
    begin
      list.Add(TAWS4DCoreModelTag.New);
      list.Last.Key(JSONArray.ItemAsString(i, 'Key'));
      list.Last.Value(JSONArray.ItemAsString(i, 'Value'));
    end;

  except
    list.Free;
    raise;
  end;
end;

function TAWS4DCoreModelTag.Value(AValue: string): IAWS4DCoreModelTag;
begin
  result := Self;
  FValue := AValue;
end;

function TAWS4DCoreModelTag.Value: string;
begin
  Result := FValue;
end;

end.
