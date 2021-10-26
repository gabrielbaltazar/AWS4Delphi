unit AWS4D.SNS.Facade.SetPlatformApplicationAttributes;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.SetPlatformApplicationAttributes.Request;

type TAWS4DSNSFacadeSetPlatformApplicationAttributes = class(TInterfacedObject, IAWS4DSNSFacadeSetPlatformApplicationAttributes)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeSetPlatformApplicationAttributes>;

    FRequest: IAWS4DSNSSetPlatformApplicationAttributesRequest<IAWS4DSNSFacadeSetPlatformApplicationAttributes>;

  protected
    function Request: IAWS4DSNSSetPlatformApplicationAttributesRequest<IAWS4DSNSFacadeSetPlatformApplicationAttributes>;
    function Send: IAWS4DSNSSetPlatformApplicationAttributesRequest<IAWS4DSNSFacadeSetPlatformApplicationAttributes>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetPlatformApplicationAttributes>): IAWS4DSNSFacadeSetPlatformApplicationAttributes;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetPlatformApplicationAttributes>);

end;

implementation

{ TAWS4DSNSFacadeSetPlatformApplicationAttributes }

constructor TAWS4DSNSFacadeSetPlatformApplicationAttributes.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetPlatformApplicationAttributes>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeSetPlatformApplicationAttributes.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetPlatformApplicationAttributes>): IAWS4DSNSFacadeSetPlatformApplicationAttributes;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeSetPlatformApplicationAttributes.Request: IAWS4DSNSSetPlatformApplicationAttributesRequest<IAWS4DSNSFacadeSetPlatformApplicationAttributes>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelSetPlatformApplicationAttributesRequest<IAWS4DSNSFacadeSetPlatformApplicationAttributes>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeSetPlatformApplicationAttributes.Send: IAWS4DSNSSetPlatformApplicationAttributesRequest<IAWS4DSNSFacadeSetPlatformApplicationAttributes>;
begin
  FService.SetPlatformApplicationAttributes(Request);
  FRequest := nil;
  result := Request;
end;

end.
