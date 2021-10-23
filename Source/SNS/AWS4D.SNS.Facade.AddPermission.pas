unit AWS4D.SNS.Facade.AddPermission;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.AddPermission.Request;

type TAWS4DSNSFacadeAddPermission = class(TInterfacedObject, IAWS4DSNSFacadeAddPermission)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeAddPermission>;

    FRequest: IAWS4DSNSAddPermissionRequest<IAWS4DSNSFacadeAddPermission>;

  protected
    function Request: IAWS4DSNSAddPermissionRequest<IAWS4DSNSFacadeAddPermission>;
    function Send: IAWS4DSNSAddPermissionRequest<IAWS4DSNSFacadeAddPermission>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeAddPermission>): IAWS4DSNSFacadeAddPermission;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeAddPermission>);

end;

implementation

{ TAWS4DSNSFacadeAddPermission }

constructor TAWS4DSNSFacadeAddPermission.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeAddPermission>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeAddPermission.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeAddPermission>): IAWS4DSNSFacadeAddPermission;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeAddPermission.Request: IAWS4DSNSAddPermissionRequest<IAWS4DSNSFacadeAddPermission>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelAddPermissionRequest<IAWS4DSNSFacadeAddPermission>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeAddPermission.Send: IAWS4DSNSAddPermissionRequest<IAWS4DSNSFacadeAddPermission>;
begin
  FService.AddPermission(Request);
  FRequest := nil;
  result := Request;
end;

end.
