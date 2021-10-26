unit AWS4D.SNS.Model.GetSubscriptionAttributes.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces;

type TAWS4DSNSModelGetSubscriptionAttributesRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSGetSubscriptionAttributesRequest<I>)

  private
    [Weak]
    FParent: I;
    FSubscriptionArn: string;

  protected
    function SubscriptionArn(Value: String): IAWS4DSNSGetSubscriptionAttributesRequest<I>; overload;
    function SubscriptionArn: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSGetSubscriptionAttributesRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSModelGetSubscriptionAttributesRequest<I> }

constructor TAWS4DSNSModelGetSubscriptionAttributesRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelGetSubscriptionAttributesRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelGetSubscriptionAttributesRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSNSModelGetSubscriptionAttributesRequest<I>.New(Parent: I): IAWS4DSNSGetSubscriptionAttributesRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelGetSubscriptionAttributesRequest<I>.SubscriptionArn(Value: String): IAWS4DSNSGetSubscriptionAttributesRequest<I>;
begin
  result := Self;
  FSubscriptionArn := Value;
end;

function TAWS4DSNSModelGetSubscriptionAttributesRequest<I>.SubscriptionArn: string;
begin
  result := FSubscriptionArn;
end;

end.
