unit AWS4D.SQS.Model.CreateQueue.Response;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Helper.JSON,
  System.Generics.Collections,
  System.JSON;

type TAWS4SQSCreateQueueResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSQSCreateQueueResponse<I>)

  private
    [Weak]
    FParent: I;
    FQueueUrl: String;

    procedure FromJSON(Value: TJSONObject);

  protected
    function QueueUrl: string;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSQSCreateQueueResponse<I>;
    destructor Destroy; override;

end;

implementation

constructor TAWS4SQSCreateQueueResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FromJSON(JSON);
end;

destructor TAWS4SQSCreateQueueResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4SQSCreateQueueResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4SQSCreateQueueResponse<I>.FromJSON(Value: TJSONObject);
var
  json: TJSONObject;
begin
  inherited;
  if not Assigned(Value) then
    Exit;

  json := Value.ValueAsJSONObject('CreateQueueResponse')
               .ValueAsJSONObject('CreateQueueResult');

  if not Assigned(json) then
    exit;

  FQueueUrl := json.ValueAsString('QueueUrl');
end;

class function TAWS4SQSCreateQueueResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSQSCreateQueueResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

function TAWS4SQSCreateQueueResponse<I>.QueueUrl: string;
begin
  result := FQueueUrl;
end;

end.
