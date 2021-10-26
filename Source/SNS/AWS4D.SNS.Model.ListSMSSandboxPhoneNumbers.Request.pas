unit AWS4D.SNS.Model.ListSMSSandboxPhoneNumbers.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  AWS4D.Core.Model.Types;

type TAWS4DSNSModelListSMSSandboxPhoneNumbersRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSListSMSSandboxPhoneNumbersRequest<I>)

  private
    [Weak]
    FParent: I;
    FNextToken: string;
    FMaxResults: Integer;

  protected
    function MaxResults(Value: Integer): IAWS4DSNSListSMSSandboxPhoneNumbersRequest<I>; overload;
    function MaxResults: Integer; overload;

    function NextToken(Value: String): IAWS4DSNSListSMSSandboxPhoneNumbersRequest<I>; overload;
    function NextToken: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSListSMSSandboxPhoneNumbersRequest<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelListSMSSandboxPhoneNumbersRequest<I> }

constructor TAWS4DSNSModelListSMSSandboxPhoneNumbersRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelListSMSSandboxPhoneNumbersRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelListSMSSandboxPhoneNumbersRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSNSModelListSMSSandboxPhoneNumbersRequest<I>.MaxResults(Value: Integer): IAWS4DSNSListSMSSandboxPhoneNumbersRequest<I>;
begin
  result := Self;
  FMaxResults := Value;
end;

function TAWS4DSNSModelListSMSSandboxPhoneNumbersRequest<I>.MaxResults: Integer;
begin
  result := FMaxResults;
end;

class function TAWS4DSNSModelListSMSSandboxPhoneNumbersRequest<I>.New(Parent: I): IAWS4DSNSListSMSSandboxPhoneNumbersRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelListSMSSandboxPhoneNumbersRequest<I>.NextToken(Value: String): IAWS4DSNSListSMSSandboxPhoneNumbersRequest<I>;
begin
  result := Self;
  FNextToken := Value;
end;

function TAWS4DSNSModelListSMSSandboxPhoneNumbersRequest<I>.NextToken: String;
begin
  result := FNextToken;
end;

end.
