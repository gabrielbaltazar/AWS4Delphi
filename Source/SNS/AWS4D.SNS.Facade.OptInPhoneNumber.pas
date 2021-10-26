unit AWS4D.SNS.Facade.OptInPhoneNumber;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.OptInPhoneNumber.Request;

type TAWS4DSNSFacadeOptInPhoneNumber = class(TInterfacedObject, IAWS4DSNSFacadeOptInPhoneNumber)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeOptInPhoneNumber>;

    FRequest: IAWS4DSNSOptInPhoneNumberRequest<IAWS4DSNSFacadeOptInPhoneNumber>;

  protected
    function Request: IAWS4DSNSOptInPhoneNumberRequest<IAWS4DSNSFacadeOptInPhoneNumber>;
    function Send: IAWS4DSNSOptInPhoneNumberRequest<IAWS4DSNSFacadeOptInPhoneNumber>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeOptInPhoneNumber>): IAWS4DSNSFacadeOptInPhoneNumber;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeOptInPhoneNumber>);

end;

implementation

{ TAWS4DSNSFacadeOptInPhoneNumber }

constructor TAWS4DSNSFacadeOptInPhoneNumber.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeOptInPhoneNumber>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeOptInPhoneNumber.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeOptInPhoneNumber>): IAWS4DSNSFacadeOptInPhoneNumber;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeOptInPhoneNumber.Request: IAWS4DSNSOptInPhoneNumberRequest<IAWS4DSNSFacadeOptInPhoneNumber>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelOptInPhoneNumberRequest<IAWS4DSNSFacadeOptInPhoneNumber>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeOptInPhoneNumber.Send: IAWS4DSNSOptInPhoneNumberRequest<IAWS4DSNSFacadeOptInPhoneNumber>;
begin
  FService.OptInPhoneNumber(Request);
  FRequest := nil;
  result := Request;
end;

end.
