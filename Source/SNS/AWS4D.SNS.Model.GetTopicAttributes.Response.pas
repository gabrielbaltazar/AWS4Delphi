unit AWS4D.SNS.Model.GetTopicAttributes.Response;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  System.JSON,
  AWS4D.Core.Helper.JSON;

type TAWS4DSNSModelGetTopicAttributesResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSNSGetTopicAttributesResponse<I>)

  private
    [Weak]
    FParent: I;
    FDisplayName: String;
    FEffectiveDeliveryPolicy: String;
    FOwner: string;
    FPolicy: String;
    FSubscriptionsConfirmed: Integer;
    FSubscriptionsDeleted: Integer;
    FSubscriptionsPending: Integer;
    FTopicArn: string;

    procedure FromJSON(Value: TJSONObject);

  protected
    function DisplayName(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function DisplayName: String; overload;

    function EffectiveDeliveryPolicy(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function EffectiveDeliveryPolicy: String; overload;

    function Owner(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function Owner: String; overload;

    function Policy(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function Policy: String; overload;

    function SubscriptionsConfirmed(Value: Integer): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function SubscriptionsConfirmed: Integer; overload;

    function SubscriptionsDeleted(Value: Integer): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function SubscriptionsDeleted: Integer; overload;

    function SubscriptionsPending(Value: Integer): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function SubscriptionsPending: Integer; overload;

    function TopicArn(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function TopicArn: String; overload;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSNSGetTopicAttributesResponse<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelGetTopicAttributesResponse<I> }

constructor TAWS4DSNSModelGetTopicAttributesResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FromJSON(JSON);
end;

destructor TAWS4DSNSModelGetTopicAttributesResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.DisplayName(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>;
begin
  result := Self;
  FDisplayName := Value;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.DisplayName: String;
begin
  result := FDisplayName;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.EffectiveDeliveryPolicy: String;
begin
  Result := FEffectiveDeliveryPolicy;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.EffectiveDeliveryPolicy(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>;
begin
  Result := Self;
  FEffectiveDeliveryPolicy := Value;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4DSNSModelGetTopicAttributesResponse<I>.FromJSON(Value: TJSONObject);
var
  LJSON: TJSONObject;
begin
  if not Assigned(Value) then
    Exit;

  LJSON := Value.ValueAsJSONObject('GetTopicAttributesResponse')
                .ValueAsJSONObject('GetTopicAttributesResult')
                .ValueAsJSONObject('Attributes');

  FDisplayName := LJSON.ValueAsString('DisplayName');
  FEffectiveDeliveryPolicy := LJSON.ValueAsString('EffectiveDeliveryPolicy');
  FOwner := LJSON.ValueAsString('Owner');
  FPolicy := LJSON.ValueAsString('Policy');
  FSubscriptionsConfirmed := LJSON.ValueAsInteger('SubscriptionsConfirmed');
  FSubscriptionsDeleted := LJSON.ValueAsInteger('SubscriptionsDeleted');
  FSubscriptionsPending := LJSON.ValueAsInteger('SubscriptionsPending');
  FTopicArn := LJSON.ValueAsString('TopicArn');
end;

class function TAWS4DSNSModelGetTopicAttributesResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSNSGetTopicAttributesResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.Owner: String;
begin
  result := FOwner;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.Owner(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>;
begin
  result := Self;
  FOwner := Value;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.Policy(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>;
begin
  result := Self;
  FPolicy := Value;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.Policy: String;
begin
  Result := FPolicy;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.SubscriptionsConfirmed(Value: Integer): IAWS4DSNSGetTopicAttributesResponse<I>;
begin
  result := Self;
  FSubscriptionsConfirmed := Value;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.SubscriptionsConfirmed: Integer;
begin
  result := FSubscriptionsConfirmed;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.SubscriptionsDeleted: Integer;
begin
  result := FSubscriptionsDeleted;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.SubscriptionsDeleted(Value: Integer): IAWS4DSNSGetTopicAttributesResponse<I>;
begin
  result := Self;
  FSubscriptionsDeleted := Value;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.SubscriptionsPending(Value: Integer): IAWS4DSNSGetTopicAttributesResponse<I>;
begin
  result := Self;
  FSubscriptionsPending := Value;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.SubscriptionsPending: Integer;
begin
  result := FSubscriptionsPending;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.TopicArn: String;
begin
  result := FTopicArn;
end;

function TAWS4DSNSModelGetTopicAttributesResponse<I>.TopicArn(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>;
begin
  result := Self;
  FTopicArn := Value;
end;

end.
