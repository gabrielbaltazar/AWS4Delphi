unit AWS4D.S3.Facade.CreateObject;

interface

uses
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.CreateObject.Request;

type
  TAWS4DS3FacadeCreateObject = class(TInterfacedObject, IAWS4DS3FacadeCreateObject)
  private
    FService: IAWS4DS3Service<IAWS4DS3FacadeCreateObject>;
    FRequest: IAWS4DS3CreateObjectRequest<IAWS4DS3FacadeCreateObject>;
  protected
    function Request: IAWS4DS3CreateObjectRequest<IAWS4DS3FacadeCreateObject>;
    function Send: IAWS4DS3FacadeCreateObject;
  public
    constructor Create(AService: IAWS4DS3Service<IAWS4DS3FacadeCreateObject>);
    class function New(AService: IAWS4DS3Service<IAWS4DS3FacadeCreateObject>): IAWS4DS3FacadeCreateObject;
  end;

implementation

constructor TAWS4DS3FacadeCreateObject.Create(AService: IAWS4DS3Service<IAWS4DS3FacadeCreateObject>);
begin
  FService := AService;
  FService.Parent(Self);
end;

class function TAWS4DS3FacadeCreateObject.New(AService: IAWS4DS3Service<IAWS4DS3FacadeCreateObject>): IAWS4DS3FacadeCreateObject;
begin
  Result := Self.Create(AService);
end;

function TAWS4DS3FacadeCreateObject.Request: IAWS4DS3CreateObjectRequest<IAWS4DS3FacadeCreateObject>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DS3CreateObjectRequest<IAWS4DS3FacadeCreateObject>.New(Self);
  Result := FRequest;
end;

function TAWS4DS3FacadeCreateObject.Send: IAWS4DS3FacadeCreateObject;
begin
  try
    Result := Self;
    FService.ObjectCreate(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
