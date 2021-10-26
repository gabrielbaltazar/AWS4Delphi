unit AWS4D.SNS.Facade.VerifySMSSandboxPhoneNumber;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.VerifySMSSandboxPhoneNumber.Request;

type TAWS4DSNSFacadeVerifySMSSandboxPhoneNumber = class(TInterfacedObject, IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber>;

    FRequest: IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber>;

  protected
    function Request: IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber>;
    function Send: IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber>): IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber>);

end;

implementation

{ TAWS4DSNSFacadeVerifySMSSandboxPhoneNumber }

constructor TAWS4DSNSFacadeVerifySMSSandboxPhoneNumber.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeVerifySMSSandboxPhoneNumber.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber>): IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeVerifySMSSandboxPhoneNumber.Request: IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelVerifySMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeVerifySMSSandboxPhoneNumber.Send: IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber>;
begin
  FService.VerifySMSSandboxPhoneNumber(Request);
  FRequest := nil;
  result := Request;
end;

end.
