unit AWS4D.SNS.Model.VerifySMSSandboxPhoneNumber.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  AWS4D.Core.Model.Types;

type TAWS4DSNSModelVerifySMSSandboxPhoneNumberRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<I>)

  private
    [Weak]
    FParent: I;
    FOneTimePassword: string;
    FPhoneNumber: string;

  protected
    function OneTimePassword(Value: string): IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<I>; overload;
    function OneTimePassword: string; overload;

    function PhoneNumber(Value: string): IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<I>; overload;
    function PhoneNumber: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelVerifySMSSandboxPhoneNumberRequest<I> }

constructor TAWS4DSNSModelVerifySMSSandboxPhoneNumberRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelVerifySMSSandboxPhoneNumberRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelVerifySMSSandboxPhoneNumberRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSNSModelVerifySMSSandboxPhoneNumberRequest<I>.New(Parent: I): IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelVerifySMSSandboxPhoneNumberRequest<I>.OneTimePassword(Value: string): IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<I>;
begin
  result := Self;
  FOneTimePassword := Value;
end;

function TAWS4DSNSModelVerifySMSSandboxPhoneNumberRequest<I>.OneTimePassword: string;
begin
  result := FOneTimePassword;
end;

function TAWS4DSNSModelVerifySMSSandboxPhoneNumberRequest<I>.PhoneNumber: string;
begin
  result := FPhoneNumber;
end;

function TAWS4DSNSModelVerifySMSSandboxPhoneNumberRequest<I>.PhoneNumber(Value: string): IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<I>;
begin
  result := Self;
  FPhoneNumber := Value;
end;

end.
