unit AWS4D.S3.Facade.DeleteObject;

interface

uses
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.DeleteObject.Request;

type TAWS4DS3FacadeDeleteObject = class(TInterfacedObject, IAWS4DS3FacadeDeleteObject)

  private
    FService: IAWS4DS3Service<IAWS4DS3FacadeDeleteObject>;

    FRequest: IAWS4DS3DeleteObjectRequest<IAWS4DS3FacadeDeleteObject>;

  protected
    function Request: IAWS4DS3DeleteObjectRequest<IAWS4DS3FacadeDeleteObject>;
    function Send: IAWS4DS3FacadeDeleteObject;

  public
    class function New(Service: IAWS4DS3Service<IAWS4DS3FacadeDeleteObject>): IAWS4DS3FacadeDeleteObject;
    constructor create(Service: IAWS4DS3Service<IAWS4DS3FacadeDeleteObject>);

end;

implementation

constructor TAWS4DS3FacadeDeleteObject.create(Service: IAWS4DS3Service<IAWS4DS3FacadeDeleteObject>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DS3FacadeDeleteObject.New(Service: IAWS4DS3Service<IAWS4DS3FacadeDeleteObject>): IAWS4DS3FacadeDeleteObject;
begin
  result := Self.create(Service);
end;

function TAWS4DS3FacadeDeleteObject.Request: IAWS4DS3DeleteObjectRequest<IAWS4DS3FacadeDeleteObject>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DS3DeleteObjectRequest<IAWS4DS3FacadeDeleteObject>.New(Self);
  result := FRequest;
end;

function TAWS4DS3FacadeDeleteObject.Send: IAWS4DS3FacadeDeleteObject;
begin
  result := Self;
  try
    FService.ObjectDelete(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
