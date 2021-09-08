unit AWS4D.S3.Facade.CreateObject;

interface

uses
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.CreateObject.Request;

type TAWS4DS3FacadeCreateObject = class(TInterfacedObject, IAWS4DS3FacadeCreateObject)

  private
    FService: IAWS4DS3Service<IAWS4DS3FacadeCreateObject>;

    FRequest: IAWS4DS3CreateObjectRequest<IAWS4DS3FacadeCreateObject>;

  protected
    function Request: IAWS4DS3CreateObjectRequest<IAWS4DS3FacadeCreateObject>;
    function Send: IAWS4DS3FacadeCreateObject;

  public
    class function New(Service: IAWS4DS3Service<IAWS4DS3FacadeCreateObject>): IAWS4DS3FacadeCreateObject;
    constructor create(Service: IAWS4DS3Service<IAWS4DS3FacadeCreateObject>);

end;

implementation

constructor TAWS4DS3FacadeCreateObject.create(Service: IAWS4DS3Service<IAWS4DS3FacadeCreateObject>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DS3FacadeCreateObject.New(Service: IAWS4DS3Service<IAWS4DS3FacadeCreateObject>): IAWS4DS3FacadeCreateObject;
begin
  result := Self.create(Service);
end;

function TAWS4DS3FacadeCreateObject.Request: IAWS4DS3CreateObjectRequest<IAWS4DS3FacadeCreateObject>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DS3CreateObjectRequest<IAWS4DS3FacadeCreateObject>.New(Self);
  result := FRequest;
end;

function TAWS4DS3FacadeCreateObject.Send: IAWS4DS3FacadeCreateObject;
begin
  try
    result := Self;
    FService.ObjectCreate(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
