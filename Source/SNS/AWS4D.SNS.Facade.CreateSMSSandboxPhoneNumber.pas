unit AWS4D.SNS.Facade.CreateSMSSandboxPhoneNumber;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.CreateSMSSandboxPhoneNumber.Request;

type TAWS4DSNSFacadeCreateSMSSandboxPhoneNumber = class(TInterfacedObject, IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber>;

    FRequest: IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber>;

  protected
    function Request: IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber>;
    function Send: IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber>): IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber>);

end;

implementation

{ TAWS4DSNSFacadeCreateSMSSandboxPhoneNumber }

constructor TAWS4DSNSFacadeCreateSMSSandboxPhoneNumber.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeCreateSMSSandboxPhoneNumber.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber>): IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeCreateSMSSandboxPhoneNumber.Request: IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelCreateSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeCreateSMSSandboxPhoneNumber.Send: IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber>;
begin
  FService.CreateSMSSandboxPhoneNumber(Request);
  FRequest := nil;
  result := Request;
end;

end.
