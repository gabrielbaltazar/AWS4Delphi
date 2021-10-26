unit AWS4D.SNS.Facade.RemovePermission;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.RemovePermission.Request;

type TAWS4DSNSFacadeRemovePermission = class(TInterfacedObject, IAWS4DSNSFacadeRemovePermission)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeRemovePermission>;

    FRequest: IAWS4DSNSRemovePermissionRequest<IAWS4DSNSFacadeRemovePermission>;

  protected
    function Request: IAWS4DSNSRemovePermissionRequest<IAWS4DSNSFacadeRemovePermission>;
    function Send: IAWS4DSNSRemovePermissionRequest<IAWS4DSNSFacadeRemovePermission>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeRemovePermission>): IAWS4DSNSFacadeRemovePermission;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeRemovePermission>);

end;

implementation

{ TAWS4DSNSFacadeRemovePermission }

constructor TAWS4DSNSFacadeRemovePermission.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeRemovePermission>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeRemovePermission.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeRemovePermission>): IAWS4DSNSFacadeRemovePermission;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeRemovePermission.Request: IAWS4DSNSRemovePermissionRequest<IAWS4DSNSFacadeRemovePermission>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelRemovePermissionRequest<IAWS4DSNSFacadeRemovePermission>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeRemovePermission.Send: IAWS4DSNSRemovePermissionRequest<IAWS4DSNSFacadeRemovePermission>;
begin
  FService.RemovePermission(Request);
  FRequest := nil;
  result := Request;
end;

end.
