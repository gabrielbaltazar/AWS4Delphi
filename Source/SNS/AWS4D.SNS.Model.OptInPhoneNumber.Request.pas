unit AWS4D.SNS.Model.OptInPhoneNumber.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  AWS4D.Core.Model.Types;

type TAWS4DSNSModelOptInPhoneNumberRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSOptInPhoneNumberRequest<I>)

  private
    [Weak]
    FParent: I;
    FPhoneNumber: string;

  protected
    function PhoneNumber(Value: String): IAWS4DSNSOptInPhoneNumberRequest<I>; overload;
    function PhoneNumber: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSOptInPhoneNumberRequest<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelOptInPhoneNumberRequest<I> }

constructor TAWS4DSNSModelOptInPhoneNumberRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelOptInPhoneNumberRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelOptInPhoneNumberRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSNSModelOptInPhoneNumberRequest<I>.New(Parent: I): IAWS4DSNSOptInPhoneNumberRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelOptInPhoneNumberRequest<I>.PhoneNumber(Value: String): IAWS4DSNSOptInPhoneNumberRequest<I>;
begin
  result := Self;
  FPhoneNumber := Value;
end;

function TAWS4DSNSModelOptInPhoneNumberRequest<I>.PhoneNumber: string;
begin
  result := FPhoneNumber;
end;

end.
