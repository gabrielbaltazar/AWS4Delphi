unit AWS4D.SNS.Model.ListTopics.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  AWS4D.Core.Model.Types;

type TAWS4DSNSModelListTopicsRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSListTopicsRequest<I>)

  private
    [Weak]
    FParent: I;
    FNextToken: string;

  protected
    function NextToken(Value: String): IAWS4DSNSListTopicsRequest<I>; overload;
    function NextToken: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSListTopicsRequest<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelListTopicsRequest<I> }

constructor TAWS4DSNSModelListTopicsRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelListTopicsRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelListTopicsRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSNSModelListTopicsRequest<I>.New(Parent: I): IAWS4DSNSListTopicsRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelListTopicsRequest<I>.NextToken(Value: String): IAWS4DSNSListTopicsRequest<I>;
begin
  result := Self;
  FNextToken := Value;
end;

function TAWS4DSNSModelListTopicsRequest<I>.NextToken: String;
begin
  Result := FNextToken;
end;

end.
