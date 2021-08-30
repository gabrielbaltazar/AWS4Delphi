unit AWS4D.SQS.Model.GetQueueUrl.Response;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Helper.JSON,
  System.JSON;

type TAWS4SQSGetQueueUrlResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSQSGetQueueUrlResponse<I>)

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
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSQSGetQueueUrlResponse<I>;
    destructor Destroy; override;

end;

implementation

constructor TAWS4SQSGetQueueUrlResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FromJSON(JSON);
end;

destructor TAWS4SQSGetQueueUrlResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4SQSGetQueueUrlResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4SQSGetQueueUrlResponse<I>.FromJSON(Value: TJSONObject);
var
  json: TJSONObject;
begin
  inherited;
  if not Assigned(Value) then
    Exit;

  json := Value.ValueAsJSONObject('GetQueueUrlResponse')
               .ValueAsJSONObject('GetQueueUrlResult');

  if Assigned(json) then
    FQueueUrl := json.ValueAsString('QueueUrl');
end;

class function TAWS4SQSGetQueueUrlResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSQSGetQueueUrlResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

function TAWS4SQSGetQueueUrlResponse<I>.QueueUrl: string;
begin
  result := FQueueUrl;
end;

end.
