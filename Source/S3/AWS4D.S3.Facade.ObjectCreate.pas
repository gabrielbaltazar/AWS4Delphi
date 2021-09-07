unit AWS4D.S3.Facade.ObjectCreate;

interface

uses
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.ObjectCreate.Request;

type TAWS4DS3FacadeObjectCreate = class(TInterfacedObject, IAWS4DS3FacadeObjectCreate)

  private
    FService: IAWS4DS3Service<IAWS4DS3FacadeObjectCreate>;

    FRequest: IAWS4DS3ObjectCreateRequest<IAWS4DS3FacadeObjectCreate>;

  protected
    function Request: IAWS4DS3ObjectCreateRequest<IAWS4DS3FacadeObjectCreate>;
    function Send: IAWS4DS3FacadeObjectCreate;

  public
    class function New(Service: IAWS4DS3Service<IAWS4DS3FacadeObjectCreate>): IAWS4DS3FacadeObjectCreate;
    constructor create(Service: IAWS4DS3Service<IAWS4DS3FacadeObjectCreate>);

end;

implementation

constructor TAWS4DS3FacadeObjectCreate.create(Service: IAWS4DS3Service<IAWS4DS3FacadeObjectCreate>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DS3FacadeObjectCreate.New(Service: IAWS4DS3Service<IAWS4DS3FacadeObjectCreate>): IAWS4DS3FacadeObjectCreate;
begin
  result := Self.create(Service);
end;

function TAWS4DS3FacadeObjectCreate.Request: IAWS4DS3ObjectCreateRequest<IAWS4DS3FacadeObjectCreate>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DS3ObjectCreateRequest<IAWS4DS3FacadeObjectCreate>.New(Self);
  result := FRequest;
end;

function TAWS4DS3FacadeObjectCreate.Send: IAWS4DS3FacadeObjectCreate;
begin
  try
    result := Self;
    FService.ObjectCreate(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
