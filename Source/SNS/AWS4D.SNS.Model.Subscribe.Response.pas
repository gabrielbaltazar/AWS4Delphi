unit AWS4D.SNS.Model.Subscribe.Response;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  System.JSON,
  AWS4D.Core.Helper.JSON;

type TAWS4DSNSModelSubscribeResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSNSSubscribeResponse<I>)

  private
    [Weak]
    FParent: I;
    FSubscriptionArn: string;

    procedure FromJSON(Value: TJSONObject);

  protected
    function SubscriptionArn: string;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSNSSubscribeResponse<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelSubscribeResponse<I> }

constructor TAWS4DSNSModelSubscribeResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FromJSON(JSON);
end;

destructor TAWS4DSNSModelSubscribeResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelSubscribeResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4DSNSModelSubscribeResponse<I>.FromJSON(Value: TJSONObject);
var
  LJSON: TJSONObject;
begin
  if not Assigned(Value) then
    Exit;

  LJSON := Value.ValueAsJSONObject('SubscribeResponse')
               .ValueAsJSONObject('SubscribeResult');

  FSubscriptionArn := LJSON.ValueAsString('SubscriptionArn');
end;

class function TAWS4DSNSModelSubscribeResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSNSSubscribeResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

function TAWS4DSNSModelSubscribeResponse<I>.SubscriptionArn: string;
begin
  result := FSubscriptionArn;
end;

end.
