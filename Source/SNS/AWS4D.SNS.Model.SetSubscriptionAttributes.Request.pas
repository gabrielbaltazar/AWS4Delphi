unit AWS4D.SNS.Model.SetSubscriptionAttributes.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces;

type TAWS4DSNSModelSetSubscriptionAttributesRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSSetSubscriptionAttributesRequest<I>)

  private
    [Weak]
    FParent: I;
    FAttributeName: String;
    FAttributeValue: String;
    FSubscriptionArn: string;

  protected
    function AttributeName(Value: string): IAWS4DSNSSetSubscriptionAttributesRequest<I>; overload;
    function AttributeName: String; overload;

    function AttributeValue(Value: string): IAWS4DSNSSetSubscriptionAttributesRequest<I>; overload;
    function AttributeValue: String; overload;

    function SubscriptionArn(Value: String): IAWS4DSNSSetSubscriptionAttributesRequest<I>; overload;
    function SubscriptionArn: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSSetSubscriptionAttributesRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSModelSetSubscriptionAttributesRequest<I> }

function TAWS4DSNSModelSetSubscriptionAttributesRequest<I>.AttributeName: String;
begin
  result := FAttributeName;
end;

function TAWS4DSNSModelSetSubscriptionAttributesRequest<I>.AttributeName(Value: string): IAWS4DSNSSetSubscriptionAttributesRequest<I>;
begin
  result := Self;
  FAttributeName := Value;
end;

function TAWS4DSNSModelSetSubscriptionAttributesRequest<I>.AttributeValue(Value: string): IAWS4DSNSSetSubscriptionAttributesRequest<I>;
begin
  result := Self;
  FAttributeValue := Value;
end;

function TAWS4DSNSModelSetSubscriptionAttributesRequest<I>.AttributeValue: String;
begin
  result := FAttributeValue;
end;

constructor TAWS4DSNSModelSetSubscriptionAttributesRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelSetSubscriptionAttributesRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelSetSubscriptionAttributesRequest<I>.&End: I;
begin
  Result := FParent;
end;

class function TAWS4DSNSModelSetSubscriptionAttributesRequest<I>.New(Parent: I): IAWS4DSNSSetSubscriptionAttributesRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelSetSubscriptionAttributesRequest<I>.SubscriptionArn(Value: String): IAWS4DSNSSetSubscriptionAttributesRequest<I>;
begin
  result := Self;
  FSubscriptionArn := Value;
end;

function TAWS4DSNSModelSetSubscriptionAttributesRequest<I>.SubscriptionArn: string;
begin
  result := FSubscriptionArn;
end;

end.
