unit AWS4D.SNS.Facade.GetSMSSandboxAccountStatus;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.GetSMSSandboxAccountStatus.Response;

type TAWS4DSNSFacadeGetSMSSandboxAccountStatus = class(TInterfacedObject, IAWS4DSNSFacadeGetSMSSandboxAccountStatus)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeGetSMSSandboxAccountStatus>;

    FResponse: IAWS4DSNSGetSMSSandboxAccountStatusResponse<IAWS4DSNSFacadeGetSMSSandboxAccountStatus>;

  protected
    function Send: IAWS4DSNSGetSMSSandboxAccountStatusResponse<IAWS4DSNSFacadeGetSMSSandboxAccountStatus>;
    function Response: IAWS4DSNSGetSMSSandboxAccountStatusResponse<IAWS4DSNSFacadeGetSMSSandboxAccountStatus>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeGetSMSSandboxAccountStatus>): IAWS4DSNSFacadeGetSMSSandboxAccountStatus;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeGetSMSSandboxAccountStatus>);

end;

implementation

{ TAWS4DSNSFacadeGetSMSSandboxAccountStatus }

constructor TAWS4DSNSFacadeGetSMSSandboxAccountStatus.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeGetSMSSandboxAccountStatus>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeGetSMSSandboxAccountStatus.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeGetSMSSandboxAccountStatus>): IAWS4DSNSFacadeGetSMSSandboxAccountStatus;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeGetSMSSandboxAccountStatus.Response: IAWS4DSNSGetSMSSandboxAccountStatusResponse<IAWS4DSNSFacadeGetSMSSandboxAccountStatus>;
begin
  result := FResponse;
end;

function TAWS4DSNSFacadeGetSMSSandboxAccountStatus.Send: IAWS4DSNSGetSMSSandboxAccountStatusResponse<IAWS4DSNSFacadeGetSMSSandboxAccountStatus>;
begin
  FResponse := FService.GetSMSSandboxAccountStatus;
  result := Response;
end;

end.
