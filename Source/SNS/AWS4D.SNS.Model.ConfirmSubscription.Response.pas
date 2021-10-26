unit AWS4D.SNS.Model.ConfirmSubscription.Response;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  System.JSON,
  AWS4D.Core.Helper.JSON;

type TAWS4DSNSModelConfirmSubscriptionResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSNSConfirmSubscriptionResponse<I>)

  private
    [Weak]
    FParent: I;
    FSubscriptionArn: String;

    procedure FromJSON(Value: TJSONObject);

  protected
    function SubscriptionArn: string;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSNSConfirmSubscriptionResponse<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelConfirmSubscriptionResponse<I> }

constructor TAWS4DSNSModelConfirmSubscriptionResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FromJSON(JSON);
end;

destructor TAWS4DSNSModelConfirmSubscriptionResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelConfirmSubscriptionResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4DSNSModelConfirmSubscriptionResponse<I>.FromJSON(Value: TJSONObject);
var
  LJSON: TJSONObject;
begin
  inherited;
  if not Assigned(Value) then
    Exit;

  LJSON := Value.ValueAsJSONObject('ConfirmSubscriptionResponse')
               .ValueAsJSONObject('ConfirmSubscriptionResult');

  FSubscriptionArn := LJSON.ValueAsString('SubscriptionArn');
end;

class function TAWS4DSNSModelConfirmSubscriptionResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSNSConfirmSubscriptionResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

function TAWS4DSNSModelConfirmSubscriptionResponse<I>.SubscriptionArn: string;
begin
  result := FSubscriptionArn;
end;

end.
