unit AWS4D.SNS.Facade.CheckIfPhoneNumberIsOptedOut;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.CheckIfPhoneNumberIsOptedOut.Request,
  AWS4D.SNS.Model.CheckIfPhoneNumberIsOptedOut.Response;

type TAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut = class(TInterfacedObject, IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>;

    FRequest: IAWS4DSNSCheckIfPhoneNumberIsOptedOutRequest<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>;
    FResponse: IAWS4DSNSCheckIfPhoneNumberIsOptedOutResponse<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>;

  protected
    function Request: IAWS4DSNSCheckIfPhoneNumberIsOptedOutRequest<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>;
    function Send: IAWS4DSNSCheckIfPhoneNumberIsOptedOutResponse<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>;
    function Response: IAWS4DSNSCheckIfPhoneNumberIsOptedOutResponse<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>): IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>);

end;

implementation

{ TAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut }

constructor TAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>): IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut.Request: IAWS4DSNSCheckIfPhoneNumberIsOptedOutRequest<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutRequest<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut.Response: IAWS4DSNSCheckIfPhoneNumberIsOptedOutResponse<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>;
begin
  result := FResponse;
end;

function TAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut.Send: IAWS4DSNSCheckIfPhoneNumberIsOptedOutResponse<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>;
begin
  FResponse := nil;
  try
    FResponse := FService.CheckIfPhoneNumberIsOptedOut(Request);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
