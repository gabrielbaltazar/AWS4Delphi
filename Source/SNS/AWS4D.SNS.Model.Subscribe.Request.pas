unit AWS4D.SNS.Model.Subscribe.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.Types,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Model.Attribute,
  System.Generics.Collections;

type TAWS4DSNSModelSubscribeRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSSubscribeRequest<I>)

  private
    [Weak]
    FParent: I;
    FDeliveryPolicy: String;
    FFilterPolicy: String;
    FRawMessageDelivery: String;
    FRedrivePolicy: Boolean;
    FSubscriptionRoleArn: String;
    FEndpoint: String;
    FProtocol: String;
    FReturnSubscriptionArn: Boolean;
    FTopicArn: string;

  protected
    function DeliveryPolicy(Value: String): IAWS4DSNSSubscribeRequest<I>; overload;
    function DeliveryPolicy: String; overload;

    function FilterPolicy(Value: String): IAWS4DSNSSubscribeRequest<I>; overload;
    function FilterPolicy: String; overload;

    function RawMessageDelivery(Value: String): IAWS4DSNSSubscribeRequest<I>; overload;
    function RawMessageDelivery: String; overload;

    function RedrivePolicy(Value: Boolean): IAWS4DSNSSubscribeRequest<I>; overload;
    function RedrivePolicy: Boolean; overload;

    function SubscriptionRoleArn(Value: String): IAWS4DSNSSubscribeRequest<I>; overload;
    function SubscriptionRoleArn: String; overload;

    function Endpoint(Value: String): IAWS4DSNSSubscribeRequest<I>; overload;
    function Endpoint: String; overload;

    function Protocol(Value: String): IAWS4DSNSSubscribeRequest<I>; overload;
    function Protocol(Value: TAWS4DSNSProtocol): IAWS4DSNSSubscribeRequest<I>; overload;
    function Protocol: String; overload;

    function ReturnSubscriptionArn(Value: Boolean): IAWS4DSNSSubscribeRequest<I>; overload;
    function ReturnSubscriptionArn: Boolean; overload;

    function TopicArn(Value: String): IAWS4DSNSSubscribeRequest<I>; overload;
    function TopicArn: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSSubscribeRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSModelSubscribeRequest<I> }

constructor TAWS4DSNSModelSubscribeRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FRedrivePolicy := False;
end;

function TAWS4DSNSModelSubscribeRequest<I>.DeliveryPolicy(Value: String): IAWS4DSNSSubscribeRequest<I>;
begin
  result := Self;
  FDeliveryPolicy := Value;
end;

function TAWS4DSNSModelSubscribeRequest<I>.DeliveryPolicy: String;
begin
  Result := FDeliveryPolicy;
end;

destructor TAWS4DSNSModelSubscribeRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelSubscribeRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSNSModelSubscribeRequest<I>.Endpoint: String;
begin
  result := FEndpoint;
end;

function TAWS4DSNSModelSubscribeRequest<I>.Endpoint(Value: String): IAWS4DSNSSubscribeRequest<I>;
begin
  result := Self;
  FEndpoint := Value;
end;

function TAWS4DSNSModelSubscribeRequest<I>.FilterPolicy: String;
begin
  result := FFilterPolicy;
end;

function TAWS4DSNSModelSubscribeRequest<I>.FilterPolicy(Value: String): IAWS4DSNSSubscribeRequest<I>;
begin
  Result := Self;
  FFilterPolicy := Value;
end;

class function TAWS4DSNSModelSubscribeRequest<I>.New(Parent: I): IAWS4DSNSSubscribeRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelSubscribeRequest<I>.Protocol(Value: TAWS4DSNSProtocol): IAWS4DSNSSubscribeRequest<I>;
begin
  result := Self;
  FProtocol := Value.ToString;
end;

function TAWS4DSNSModelSubscribeRequest<I>.Protocol(Value: String): IAWS4DSNSSubscribeRequest<I>;
begin
  result := Self;
  FProtocol := Value;
end;

function TAWS4DSNSModelSubscribeRequest<I>.Protocol: String;
begin
  result := FProtocol;
end;

function TAWS4DSNSModelSubscribeRequest<I>.RawMessageDelivery: String;
begin
  result := FRawMessageDelivery;
end;

function TAWS4DSNSModelSubscribeRequest<I>.RawMessageDelivery(Value: String): IAWS4DSNSSubscribeRequest<I>;
begin
  result := Self;
  FRawMessageDelivery := Value;
end;

function TAWS4DSNSModelSubscribeRequest<I>.RedrivePolicy: Boolean;
begin
  result := FRedrivePolicy;
end;

function TAWS4DSNSModelSubscribeRequest<I>.RedrivePolicy(Value: Boolean): IAWS4DSNSSubscribeRequest<I>;
begin
  result := Self;
  FRedrivePolicy := Value;
end;

function TAWS4DSNSModelSubscribeRequest<I>.ReturnSubscriptionArn: Boolean;
begin
  result := FReturnSubscriptionArn;
end;

function TAWS4DSNSModelSubscribeRequest<I>.ReturnSubscriptionArn(Value: Boolean): IAWS4DSNSSubscribeRequest<I>;
begin
  result := Self;
  FReturnSubscriptionArn := Value;
end;

function TAWS4DSNSModelSubscribeRequest<I>.SubscriptionRoleArn(Value: String): IAWS4DSNSSubscribeRequest<I>;
begin
  result := Self;
  FSubscriptionRoleArn := Value;
end;

function TAWS4DSNSModelSubscribeRequest<I>.SubscriptionRoleArn: String;
begin
  result := FSubscriptionRoleArn;
end;

function TAWS4DSNSModelSubscribeRequest<I>.TopicArn(Value: String): IAWS4DSNSSubscribeRequest<I>;
begin
  result := Self;
  FTopicArn := Value;
end;

function TAWS4DSNSModelSubscribeRequest<I>.TopicArn: String;
begin
  result := FTopicArn;
end;

end.
