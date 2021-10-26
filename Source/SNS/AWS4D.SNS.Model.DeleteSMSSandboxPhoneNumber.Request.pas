unit AWS4D.SNS.Model.DeleteSMSSandboxPhoneNumber.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces;

type TAWS4DSNSModelDeleteSMSSandboxPhoneNumberRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<I>)

  private
    [Weak]
    FParent: I;
    FPhoneNumber: string;

  protected
    function PhoneNumber(Value: String): IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<I>; overload;
    function PhoneNumber: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSModelDeleteSMSSandboxPhoneNumberRequest<I> }

constructor TAWS4DSNSModelDeleteSMSSandboxPhoneNumberRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelDeleteSMSSandboxPhoneNumberRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelDeleteSMSSandboxPhoneNumberRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSNSModelDeleteSMSSandboxPhoneNumberRequest<I>.New(Parent: I): IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelDeleteSMSSandboxPhoneNumberRequest<I>.PhoneNumber(Value: String): IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<I>;
begin
  result := Self;
  FPhoneNumber := Value;
end;

function TAWS4DSNSModelDeleteSMSSandboxPhoneNumberRequest<I>.PhoneNumber: String;
begin
  result := FPhoneNumber;
end;

end.
