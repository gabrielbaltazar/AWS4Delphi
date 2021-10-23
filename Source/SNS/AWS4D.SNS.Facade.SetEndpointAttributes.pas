unit AWS4D.SNS.Facade.SetEndpointAttributes;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.SetEndpointAttributes.Request;

type TAWS4DSNSFacadeSetEndpointAttributes = class(TInterfacedObject, IAWS4DSNSFacadeSetEndpointAttributes)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeSetEndpointAttributes>;

    FRequest: IAWS4DSNSSetEndpointAttributesRequest<IAWS4DSNSFacadeSetEndpointAttributes>;

  protected
    function Request: IAWS4DSNSSetEndpointAttributesRequest<IAWS4DSNSFacadeSetEndpointAttributes>;
    function Send: IAWS4DSNSSetEndpointAttributesRequest<IAWS4DSNSFacadeSetEndpointAttributes>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetEndpointAttributes>): IAWS4DSNSFacadeSetEndpointAttributes;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetEndpointAttributes>);

end;

implementation

{ TAWS4DSNSFacadeSetEndpointAttributes }

constructor TAWS4DSNSFacadeSetEndpointAttributes.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetEndpointAttributes>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeSetEndpointAttributes.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetEndpointAttributes>): IAWS4DSNSFacadeSetEndpointAttributes;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeSetEndpointAttributes.Request: IAWS4DSNSSetEndpointAttributesRequest<IAWS4DSNSFacadeSetEndpointAttributes>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelSetEndpointAttributesRequest<IAWS4DSNSFacadeSetEndpointAttributes>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeSetEndpointAttributes.Send: IAWS4DSNSSetEndpointAttributesRequest<IAWS4DSNSFacadeSetEndpointAttributes>;
begin
  FService.SetEndpointAttributes(Request);
  FRequest := nil;
  result := Request;
end;

end.
