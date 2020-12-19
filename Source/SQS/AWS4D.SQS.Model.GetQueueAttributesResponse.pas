unit AWS4D.SQS.Model.GetQueueAttributesResponse;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Model.Classes,
  System.Generics.Collections,
  System.JSON,
  System.SysUtils;

type TAWS4DSQSModelGetQueueAttributesResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelGetQueueAttributesResponse)

  private
    FAttributes: TDictionary<String, string>;

  protected
    function Attributes: TDictionary<String, String>;

  public
    constructor create(JSONString: String); override;
    class function New(JSONString: String): IAWS4DSQSModelGetQueueAttributesResponse;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSQSModelGetQueueAttributesResponse }

function TAWS4DSQSModelGetQueueAttributesResponse.Attributes: TDictionary<String, String>;
begin
  result := FAttributes;
end;

constructor TAWS4DSQSModelGetQueueAttributesResponse.create(JSONString: String);
var
  LJSON: TJSONObject;
  LJSONArray: TJSONArray;
  i: Integer;
  name : String;
  value: string;
begin
  inherited;
  FAttributes := TDictionary<String, String>.create;
  if not Assigned(FJSON) then
    Exit;

  LJSON := FJSON.GetValue('GetQueueAttributesResponse')
                .GetValue<TJSONObject>('GetQueueAttributesResult');

  if not Assigned(LJSON) then
    exit;

  LJSONArray := LJSON.GetValue('Attributes') as TJSONArray;
  if not Assigned(LJSONArray) then
    Exit;

  for i := 0 to Pred(LJSONArray.Count) do
  begin
    LJSONArray.Items[i].TryGetValue<String>('Name', name);
    LJSONArray.Items[i].TryGetValue<String>('Value', value);

    if not name.IsEmpty then
      FAttributes.AddOrSetValue(name, value);
  end;
end;

destructor TAWS4DSQSModelGetQueueAttributesResponse.Destroy;
begin
  FAttributes.Free;
  inherited;
end;

class function TAWS4DSQSModelGetQueueAttributesResponse.New(JSONString: String): IAWS4DSQSModelGetQueueAttributesResponse;
begin
  result := Self.create(JSONString);
end;

end.
