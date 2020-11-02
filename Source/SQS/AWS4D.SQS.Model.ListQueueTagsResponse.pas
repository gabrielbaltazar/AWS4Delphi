unit AWS4D.SQS.Model.ListQueueTagsResponse;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces,
  System.JSON,
  System.Generics.Collections;

type TAWS4DSQSModelListQueueTagsResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelListQueueTagsResponse)

  private
    FTags: TDictionary<String, String>;

  protected
    function Tags: TDictionary<String, String>;

  public
    constructor create(JSONString: String); override;
    class function New(JSONString: String): IAWS4DSQSModelListQueueTagsResponse;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSQSModelListQueueTagsResponse }

constructor TAWS4DSQSModelListQueueTagsResponse.create(JSONString: String);
var
  i     : Integer;
  key   : string;
  value : string;
  LJSON : TJSONObject;
  tags  : TJSONArray;
begin
  inherited;
  FTags := TDictionary<String, String>.create;
  if not Assigned(FJSON) then
    Exit;

  LJSON := FJSON.GetValue('ListQueueTagsResponse')
                .GetValue<TJSONObject>('ListQueueTagsResult');

  tags := LJSON.GetValue('Tags') as TJSONArray;
  if not Assigned(tags) then
    Exit;

  for i := 0 to Pred(tags.Count) do
  begin
    LJSON := tags.Items[i] as TJSONObject;
    LJSON.TryGetValue<string>('Key', Key);
    LJSON.TryGetValue<string>('Value', Value);

    FTags.Add(key, value);
  end;

end;

destructor TAWS4DSQSModelListQueueTagsResponse.Destroy;
begin
  FTags.Free;
  inherited;
end;

class function TAWS4DSQSModelListQueueTagsResponse.New(JSONString: String): IAWS4DSQSModelListQueueTagsResponse;
begin
  result := Self.create(JSONString);
end;

function TAWS4DSQSModelListQueueTagsResponse.Tags: TDictionary<String, String>;
begin
  result := FTags;
end;

end.
