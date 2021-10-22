unit AWS4D.SNS.Model.ListSubscriptions.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  AWS4D.Core.Model.Types;

type TAWS4DSNSModelListSubscriptionsRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSListSubscriptionsRequest<I>)

  private
    [Weak]
    FParent: I;
    FNextToken: string;

  protected
    function NextToken(Value: String): IAWS4DSNSListSubscriptionsRequest<I>; overload;
    function NextToken: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSListSubscriptionsRequest<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelListSubscriptionsRequest<I> }

constructor TAWS4DSNSModelListSubscriptionsRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelListSubscriptionsRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelListSubscriptionsRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSNSModelListSubscriptionsRequest<I>.New(Parent: I): IAWS4DSNSListSubscriptionsRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelListSubscriptionsRequest<I>.NextToken(Value: String): IAWS4DSNSListSubscriptionsRequest<I>;
begin
  result := Self;
  FNextToken := Value;
end;

function TAWS4DSNSModelListSubscriptionsRequest<I>.NextToken: String;
begin
  result := FNextToken;
end;

end.
