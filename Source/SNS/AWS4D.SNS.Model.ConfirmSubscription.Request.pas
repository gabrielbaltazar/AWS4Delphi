unit AWS4D.SNS.Model.ConfirmSubscription.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces;

type TAWS4DSNSModelConfirmSubscriptionRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSConfirmSubscriptionRequest<I>)

  private
    [Weak]
    FParent: I;
    FAuthenticateOnUnsubscribe: Boolean;
    FToken: String;
    FTopicArn: string;

  protected
    function AuthenticateOnUnsubscribe(Value: Boolean): IAWS4DSNSConfirmSubscriptionRequest<I>; overload;
    function AuthenticateOnUnsubscribe: Boolean; overload;

    function Token(Value: String): IAWS4DSNSConfirmSubscriptionRequest<I>; overload;
    function Token: string; overload;

    function TopicArn(Value: String): IAWS4DSNSConfirmSubscriptionRequest<I>; overload;
    function TopicArn: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSConfirmSubscriptionRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSModelConfirmSubscriptionRequest<I> }

function TAWS4DSNSModelConfirmSubscriptionRequest<I>.AuthenticateOnUnsubscribe(Value: Boolean): IAWS4DSNSConfirmSubscriptionRequest<I>;
begin
  result := Self;
  FAuthenticateOnUnsubscribe := Value;
end;

function TAWS4DSNSModelConfirmSubscriptionRequest<I>.AuthenticateOnUnsubscribe: Boolean;
begin
  result := FAuthenticateOnUnsubscribe;
end;

constructor TAWS4DSNSModelConfirmSubscriptionRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FAuthenticateOnUnsubscribe := False;
end;

destructor TAWS4DSNSModelConfirmSubscriptionRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelConfirmSubscriptionRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSNSModelConfirmSubscriptionRequest<I>.New(Parent: I): IAWS4DSNSConfirmSubscriptionRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelConfirmSubscriptionRequest<I>.Token: string;
begin
  result := FToken;
end;

function TAWS4DSNSModelConfirmSubscriptionRequest<I>.Token(Value: String): IAWS4DSNSConfirmSubscriptionRequest<I>;
begin
  result := Self;
  FToken := Value;
end;

function TAWS4DSNSModelConfirmSubscriptionRequest<I>.TopicArn(Value: String): IAWS4DSNSConfirmSubscriptionRequest<I>;
begin
  result := Self;
  FTopicArn := Value;
end;

function TAWS4DSNSModelConfirmSubscriptionRequest<I>.TopicArn: string;
begin
  result := FTopicArn;
end;

end.
