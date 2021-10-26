unit AWS4D.SNS.Facade.GetSubscriptionAttributes;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.GetSubscriptionAttributes.Request,
  AWS4D.SNS.Model.GetSubscriptionAttributes.Response;

type TAWS4DSNSFacadeGetSubscriptionAttributes = class(TInterfacedObject, IAWS4DSNSFacadeGetSubscriptionAttributes)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeGetSubscriptionAttributes>;

    FRequest: IAWS4DSNSGetSubscriptionAttributesRequest<IAWS4DSNSFacadeGetSubscriptionAttributes>;
    FResponse: IAWS4DSNSGetSubscriptionAttributesResponse<IAWS4DSNSFacadeGetSubscriptionAttributes>;

  protected
    function Request: IAWS4DSNSGetSubscriptionAttributesRequest<IAWS4DSNSFacadeGetSubscriptionAttributes>;
    function Send: IAWS4DSNSGetSubscriptionAttributesResponse<IAWS4DSNSFacadeGetSubscriptionAttributes>;
    function Response: IAWS4DSNSGetSubscriptionAttributesResponse<IAWS4DSNSFacadeGetSubscriptionAttributes>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeGetSubscriptionAttributes>): IAWS4DSNSFacadeGetSubscriptionAttributes;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeGetSubscriptionAttributes>);

end;

implementation

{ TAWS4DSNSFacadeGetSubscriptionAttributes }

constructor TAWS4DSNSFacadeGetSubscriptionAttributes.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeGetSubscriptionAttributes>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeGetSubscriptionAttributes.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeGetSubscriptionAttributes>): IAWS4DSNSFacadeGetSubscriptionAttributes;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeGetSubscriptionAttributes.Request: IAWS4DSNSGetSubscriptionAttributesRequest<IAWS4DSNSFacadeGetSubscriptionAttributes>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelGetSubscriptionAttributesRequest<IAWS4DSNSFacadeGetSubscriptionAttributes>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeGetSubscriptionAttributes.Response: IAWS4DSNSGetSubscriptionAttributesResponse<IAWS4DSNSFacadeGetSubscriptionAttributes>;
begin
  result := FResponse;
end;

function TAWS4DSNSFacadeGetSubscriptionAttributes.Send: IAWS4DSNSGetSubscriptionAttributesResponse<IAWS4DSNSFacadeGetSubscriptionAttributes>;
begin
  FResponse := nil;
  try
    FResponse := FService.GetSubscriptionAttributes(Request);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
