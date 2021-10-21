unit AWS4D.SNS.Model.ListTopics.Response;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Helper.JSON,
  System.Generics.Collections,
  System.JSON;

type TAWS4DSNSModelListTopicsResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSNSListTopicsResponse<I>)

  private
    [Weak]
    FParent: I;
    FNextToken: string;
    FTopics: IAWS4DIterator<String>;

    procedure FromJSON(Value: TJSONObject);

  protected
    function NextToken: string;
    function Topics: IAWS4DIterator<String>;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSNSListTopicsResponse<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelListTopicsResponse<I> }

constructor TAWS4DSNSModelListTopicsResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FromJSON(JSON);
end;

destructor TAWS4DSNSModelListTopicsResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelListTopicsResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4DSNSModelListTopicsResponse<I>.FromJSON(Value: TJSONObject);
var
  json: TJSONObject;
  jsonTopics: TJSONArray;
  topics : TList<String>;
  i: Integer;
begin
  inherited;
  if not Assigned(Value) then
    Exit;

  json := Value.ValueAsJSONObject('ListTopicsResponse')
               .ValueAsJSONObject('ListTopicsResult');

  FNextToken := json.ValueAsString('NextToken');
  topics := TList<String>.Create;
  try
    jsonTopics := json.ValueAsJSONArray('Topics');
    if Assigned(jsonTopics) then
    begin
      for i := 0 to Pred(jsonTopics.Count) do
        topics.Add(jsonTopics.ItemAsString(i, 'TopicArn'));
    end;
  except
    topics.Free;
    raise;
  end;

  FTopics := TAWS4DCoreModelIterator<String>.New(topics);
end;

class function TAWS4DSNSModelListTopicsResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSNSListTopicsResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

function TAWS4DSNSModelListTopicsResponse<I>.NextToken: string;
begin
  result := FNextToken;
end;

function TAWS4DSNSModelListTopicsResponse<I>.Topics: IAWS4DIterator<String>;
begin
  result := FTopics;
end;

end.
