unit AWS4D.SNS.Model.GetSubscriptionAttributes.Response;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  System.JSON,
  AWS4D.Core.Helper.JSON;

type TAWS4DSNSModelGetSubscriptionAttributesResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSNSGetSubscriptionAttributesResponse<I>)

  private
    [Weak]
    FParent: I;
    FConfirmationWasAuthenticated: Boolean;
    FEndpoint: String;
    FOwner: string;
    FPendingConfirmation: Boolean;
    FProtocol: String;
    FRawMessageDelivery: Boolean;
    FSubscriptionArn: string;
    FTopicArn: String;

    procedure FromJSON(Value: TJSONObject);

  protected
    function ConfirmationWasAuthenticated(Value: Boolean): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function ConfirmationWasAuthenticated: Boolean; overload;

    function Endpoint(Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function Endpoint: string; overload;

    function Owner(Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function Owner: string; overload;

    function PendingConfirmation(Value: Boolean): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function PendingConfirmation: Boolean; overload;

    function Protocol(Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function Protocol: string; overload;

    function RawMessageDelivery(Value: Boolean): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function RawMessageDelivery: Boolean; overload;

    function SubscriptionArn(Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function SubscriptionArn: string; overload;

    function TopicArn(Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function TopicArn: string; overload;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSNSGetSubscriptionAttributesResponse<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelGetSubscriptionAttributesResponse<I> }

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.ConfirmationWasAuthenticated(Value: Boolean): IAWS4DSNSGetSubscriptionAttributesResponse<I>;
begin
  result := Self;
  FConfirmationWasAuthenticated := Value;
end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.ConfirmationWasAuthenticated: Boolean;
begin
  result := FConfirmationWasAuthenticated;
end;

constructor TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FConfirmationWasAuthenticated := False;
  FPendingConfirmation := False;
  FRawMessageDelivery := False;
  FromJSON(JSON);
end;

destructor TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.Endpoint: string;
begin
  result := FEndpoint;
end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.Endpoint(Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>;
begin
  result := Self;
  FEndpoint := Value;
end;

procedure TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.FromJSON(Value: TJSONObject);
var
  LJSON: TJSONObject;
begin
  if not Assigned(Value) then
    Exit;

  LJSON := Value.ValueAsJSONObject('GetSubscriptionAttributesResponse')
                .ValueAsJSONObject('GetSubscriptionAttributesResult')
                .ValueAsJSONObject('Attributes');

  FConfirmationWasAuthenticated := LJSON.ValueAsBoolean('ConfirmationWasAuthenticated');
  FEndpoint := LJSON.ValueAsString('Endpoint');
  FOwner := LJSON.ValueAsString('Owner');
  FPendingConfirmation := LJSON.ValueAsBoolean('PendingConfirmation');
  FProtocol := LJSON.ValueAsString('Protocol');
  FRawMessageDelivery := LJSON.ValueAsBoolean('RawMessageDelivery');
  FSubscriptionArn := LJSON.ValueAsString('SubscriptionArn');
  FTopicArn := LJSON.ValueAsString('TopicArn');
end;

class function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.New(
  Parent: I;
  JSON: TJSONObject): IAWS4DSNSGetSubscriptionAttributesResponse<I>;
begin

end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.Owner: string;
begin

end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.Owner(
  Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>;
begin

end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.PendingConfirmation(
  Value: Boolean): IAWS4DSNSGetSubscriptionAttributesResponse<I>;
begin

end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.PendingConfirmation: Boolean;
begin

end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.Protocol(
  Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>;
begin

end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.Protocol: string;
begin

end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.RawMessageDelivery(
  Value: Boolean): IAWS4DSNSGetSubscriptionAttributesResponse<I>;
begin

end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.RawMessageDelivery: Boolean;
begin

end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.SubscriptionArn: string;
begin

end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.SubscriptionArn(
  Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>;
begin

end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.TopicArn: string;
begin

end;

function TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.TopicArn(
  Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>;
begin

end;

end.
