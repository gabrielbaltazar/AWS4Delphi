unit AWS4D.SNS.Facade.ListSMSSandboxPhoneNumbers;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.ListSMSSandboxPhoneNumbers.Request,
  AWS4D.SNS.Model.ListSMSSandboxPhoneNumbers.Response;

type TAWS4DSNSFacadeListSMSSandboxPhoneNumbers = class(TInterfacedObject, IAWS4DSNSFacadeListSMSSandboxPhoneNumbers)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>;

    FRequest: IAWS4DSNSListSMSSandboxPhoneNumbersRequest<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>;
    FResponse: IAWS4DSNSListSMSSandboxPhoneNumbersResponse<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>;

  protected
    function Request: IAWS4DSNSListSMSSandboxPhoneNumbersRequest<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>;
    function Send: IAWS4DSNSListSMSSandboxPhoneNumbersResponse<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>;
    function Response: IAWS4DSNSListSMSSandboxPhoneNumbersResponse<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>): IAWS4DSNSFacadeListSMSSandboxPhoneNumbers;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>);

end;

implementation

{ TAWS4DSNSFacadeListSMSSandboxPhoneNumbers }

constructor TAWS4DSNSFacadeListSMSSandboxPhoneNumbers.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeListSMSSandboxPhoneNumbers.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>): IAWS4DSNSFacadeListSMSSandboxPhoneNumbers;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeListSMSSandboxPhoneNumbers.Request: IAWS4DSNSListSMSSandboxPhoneNumbersRequest<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelListSMSSandboxPhoneNumbersRequest<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeListSMSSandboxPhoneNumbers.Response: IAWS4DSNSListSMSSandboxPhoneNumbersResponse<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>;
begin
  result := FResponse;
end;

function TAWS4DSNSFacadeListSMSSandboxPhoneNumbers.Send: IAWS4DSNSListSMSSandboxPhoneNumbersResponse<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>;
begin
  FResponse := nil;
  try
    FResponse := FService.ListSMSSandboxPhoneNumbers(Request);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
