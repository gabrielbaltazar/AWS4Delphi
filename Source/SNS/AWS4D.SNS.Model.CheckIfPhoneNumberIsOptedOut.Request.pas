unit AWS4D.SNS.Model.CheckIfPhoneNumberIsOptedOut.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces;

type TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSCheckIfPhoneNumberIsOptedOutRequest<I>)

  private
    [Weak]
    FParent: I;
    FPhoneNumber: string;

  protected
    function PhoneNumber(Value: String): IAWS4DSNSCheckIfPhoneNumberIsOptedOutRequest<I>; overload;
    function PhoneNumber: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSCheckIfPhoneNumberIsOptedOutRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutRequest<I> }

constructor TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutRequest<I>.&End: I;
begin
  Result := FParent;
end;

class function TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutRequest<I>.New(Parent: I): IAWS4DSNSCheckIfPhoneNumberIsOptedOutRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutRequest<I>.PhoneNumber(Value: String): IAWS4DSNSCheckIfPhoneNumberIsOptedOutRequest<I>;
begin
  result := Self;
  FPhoneNumber := Value;
end;

function TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutRequest<I>.PhoneNumber: String;
begin
  result := FPhoneNumber;
end;

end.
