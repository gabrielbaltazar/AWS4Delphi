unit AWS4D.SNS.Model.CreateTopic.Response;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  System.JSON,
  AWS4D.Core.Helper.JSON;

type TAWS4DSNSModelCreateTopicResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSNSCreateTopicResponse<I>)

  private
    [Weak]
    FParent: I;
    FTopicArn: string;

    procedure FromJSON(Value: TJSONObject);

  protected
    function TopicArn: string;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSNSCreateTopicResponse<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelCreateTopicResponse<I> }

constructor TAWS4DSNSModelCreateTopicResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FromJSON(JSON);
end;

destructor TAWS4DSNSModelCreateTopicResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelCreateTopicResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4DSNSModelCreateTopicResponse<I>.FromJSON(Value: TJSONObject);
var
  json: TJSONObject;
begin
  if not Assigned(Value) then
    Exit;

  json := Value.ValueAsJSONObject('CreateTopicResponse')
               .ValueAsJSONObject('CreateTopicResult');

  FTopicArn := json.ValueAsString('TopicArn');
end;

class function TAWS4DSNSModelCreateTopicResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSNSCreateTopicResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

function TAWS4DSNSModelCreateTopicResponse<I>.TopicArn: string;
begin
  Result := FTopicArn;
end;

end.
