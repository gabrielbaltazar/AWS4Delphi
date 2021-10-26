unit AWS4D.SNS.Model.Unsubscribe.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces;

type TAWS4DSNSModelUnsubscribeRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSUnsubscribeRequest<I>)

  private
    [Weak]
    FParent: I;
    FSubscriptionArn: string;

  protected
    function SubscriptionArn(Value: String): IAWS4DSNSUnsubscribeRequest<I>; overload;
    function SubscriptionArn: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSUnsubscribeRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSModelUnsubscribeRequest<I> }

constructor TAWS4DSNSModelUnsubscribeRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelUnsubscribeRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelUnsubscribeRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSNSModelUnsubscribeRequest<I>.New(Parent: I): IAWS4DSNSUnsubscribeRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelUnsubscribeRequest<I>.SubscriptionArn(Value: String): IAWS4DSNSUnsubscribeRequest<I>;
begin
  result := Self;
  FSubscriptionArn := Value;
end;

function TAWS4DSNSModelUnsubscribeRequest<I>.SubscriptionArn: string;
begin
  result := FSubscriptionArn;
end;

end.
