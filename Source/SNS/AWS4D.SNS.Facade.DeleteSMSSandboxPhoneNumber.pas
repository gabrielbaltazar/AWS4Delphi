unit AWS4D.SNS.Facade.DeleteSMSSandboxPhoneNumber;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.DeleteSMSSandboxPhoneNumber.Request;

type TAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber = class(TInterfacedObject, IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber>;

    FRequest: IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber>;

  protected
    function Request: IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber>;
    function Send: IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber>): IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber>);

end;

implementation

{ TAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber }

constructor TAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber>): IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber.Request: IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelDeleteSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber.Send: IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber>;
begin
  FService.DeleteSMSSandboxPhoneNumber(Request);
  FRequest := nil;
  result := Request;
end;

end.
