unit AWS4D.SNS.Facade.SetSubscriptionAttributes;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.SetSubscriptionAttributes.Request;

type TAWS4DSNSFacadeSetSubscriptionAttributes = class(TInterfacedObject, IAWS4DSNSFacadeSetSubscriptionAttributes)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeSetSubscriptionAttributes>;

    FRequest: IAWS4DSNSSetSubscriptionAttributesRequest<IAWS4DSNSFacadeSetSubscriptionAttributes>;

  protected
    function Request: IAWS4DSNSSetSubscriptionAttributesRequest<IAWS4DSNSFacadeSetSubscriptionAttributes>;
    function Send: IAWS4DSNSSetSubscriptionAttributesRequest<IAWS4DSNSFacadeSetSubscriptionAttributes>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetSubscriptionAttributes>): IAWS4DSNSFacadeSetSubscriptionAttributes;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetSubscriptionAttributes>);

end;

implementation

{ TAWS4DSNSFacadeSetSubscriptionAttributes }

constructor TAWS4DSNSFacadeSetSubscriptionAttributes.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetSubscriptionAttributes>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeSetSubscriptionAttributes.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetSubscriptionAttributes>): IAWS4DSNSFacadeSetSubscriptionAttributes;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeSetSubscriptionAttributes.Request: IAWS4DSNSSetSubscriptionAttributesRequest<IAWS4DSNSFacadeSetSubscriptionAttributes>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelSetSubscriptionAttributesRequest<IAWS4DSNSFacadeSetSubscriptionAttributes>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeSetSubscriptionAttributes.Send: IAWS4DSNSSetSubscriptionAttributesRequest<IAWS4DSNSFacadeSetSubscriptionAttributes>;
begin
  FService.SetSubscriptionAttributes(Request);
  FRequest := nil;
  result := Request;
end;

end.
