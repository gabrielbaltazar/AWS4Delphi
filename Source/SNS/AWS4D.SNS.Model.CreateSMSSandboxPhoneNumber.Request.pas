unit AWS4D.SNS.Model.CreateSMSSandboxPhoneNumber.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  System.SysUtils;

type TAWS4DSNSModelCreateSMSSandboxPhoneNumberRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<I>)

  private
    [Weak]
    FParent: I;
    FLanguageCode: string;
    FPhoneNumber: string;

  protected
    function LanguageCode(Value: String): IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<I>; overload;
    function LanguageCode: String; overload;

    function PhoneNumber(Value: String): IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<I>; overload;
    function PhoneNumber: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSModelCreateSMSSandboxPhoneNumberRequest<I> }

constructor TAWS4DSNSModelCreateSMSSandboxPhoneNumberRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelCreateSMSSandboxPhoneNumberRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelCreateSMSSandboxPhoneNumberRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSNSModelCreateSMSSandboxPhoneNumberRequest<I>.LanguageCode(Value: String): IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<I>;
begin
  result := Self;
  FLanguageCode := Value;
end;

function TAWS4DSNSModelCreateSMSSandboxPhoneNumberRequest<I>.LanguageCode: String;
begin
  result := FLanguageCode;
end;

class function TAWS4DSNSModelCreateSMSSandboxPhoneNumberRequest<I>.New(Parent: I): IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelCreateSMSSandboxPhoneNumberRequest<I>.PhoneNumber(Value: String): IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<I>;
begin
  result := Self;
  FPhoneNumber := Value;
  if not PhoneNumber.StartsWith('+') then
    FPhoneNumber := '+' + FPhoneNumber;
end;

function TAWS4DSNSModelCreateSMSSandboxPhoneNumberRequest<I>.PhoneNumber: String;
begin
  result := FPhoneNumber;
end;

end.
