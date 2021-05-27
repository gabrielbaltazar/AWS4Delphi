unit AWS4D.SQS.Model.ListQueuesResponse;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces,
  System.JSON,
  System.Generics.Collections;

type TAWS4DSQSModelListQueuesResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelListQueuesResponse)

  private
    FQueuesUrls: TList<String>;
    FNextToken: string;

  protected
    function QueuesUrls: TList<String>; overload;
    function NextToken: string; overload;

  public
    function NextToken(Value: String): TAWS4DSQSModelListQueuesResponse; overload;
    function AddQueueUrl(Value: String): TAWS4DSQSModelListQueuesResponse; overload;

    constructor create; overload; override;
    class function New: IAWS4DSQSModelListQueuesResponse; overload;

    constructor create(JSONString: String); overload; override;
    class function New(JSONString: String): IAWS4DSQSModelListQueuesResponse; overload;
    destructor Destroy; override;
end;


implementation

{ TAWS4DSQSModelListQueuesResponse }

function TAWS4DSQSModelListQueuesResponse.NextToken: string;
begin
  result := FNextToken;
end;

function TAWS4DSQSModelListQueuesResponse.QueuesUrls: TList<String>;
begin
  result := FQueuesUrls;
end;

function TAWS4DSQSModelListQueuesResponse.AddQueueUrl(Value: String): TAWS4DSQSModelListQueuesResponse;
begin
  result := Self;
  FQueuesUrls.Add(Value);
end;

constructor TAWS4DSQSModelListQueuesResponse.create(JSONString: String);
var
  LJSON: TJSONObject;
  queues : TJSONArray;
  i: Integer;
begin
  inherited;
  if not Assigned(FJSON) then
    Exit;

  LJSON := FJSON.GetValue('ListQueuesResponse')
                .GetValue<TJSONObject>('ListQueuesResult');

  LJSON.TryGetValue<string>('NextToken', FNextToken);
  LJSON.TryGetValue<TJSONArray>('queueUrls', queues);

  FQueuesUrls := TList<String>.create;
  for i := 0 to Pred(queues.Count) do
    FQueuesUrls.Add(queues.Items[i].Value);
end;

constructor TAWS4DSQSModelListQueuesResponse.create;
begin
  inherited;
  FQueuesUrls := TList<String>.create;
end;

destructor TAWS4DSQSModelListQueuesResponse.Destroy;
begin
  FQueuesUrls.Free;
  inherited;
end;

class function TAWS4DSQSModelListQueuesResponse.New(JSONString: String): IAWS4DSQSModelListQueuesResponse;
begin
  result := Self.Create(JSONString);
end;

class function TAWS4DSQSModelListQueuesResponse.New: IAWS4DSQSModelListQueuesResponse;
begin
  Result := Self.create;
end;

function TAWS4DSQSModelListQueuesResponse.NextToken(Value: String): TAWS4DSQSModelListQueuesResponse;
begin
  result := Self;
  FNextToken := Value;
end;

end.
