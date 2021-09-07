unit AWS4D.S3.Facade.ObjectDelete;

interface

uses
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.ObjectDelete.Request;

type TAWS4DS3FacadeObjectDelete = class(TInterfacedObject, IAWS4DS3FacadeObjectDelete)

  private
    FService: IAWS4DS3Service<IAWS4DS3FacadeObjectDelete>;

    FRequest: IAWS4DS3ObjectDeleteRequest<IAWS4DS3FacadeObjectDelete>;

  protected
    function Request: IAWS4DS3ObjectDeleteRequest<IAWS4DS3FacadeObjectDelete>;
    function Send: IAWS4DS3FacadeObjectDelete;

  public
    class function New(Service: IAWS4DS3Service<IAWS4DS3FacadeObjectDelete>): IAWS4DS3FacadeObjectDelete;
    constructor create(Service: IAWS4DS3Service<IAWS4DS3FacadeObjectDelete>);

end;

implementation

constructor TAWS4DS3FacadeObjectDelete.create(Service: IAWS4DS3Service<IAWS4DS3FacadeObjectDelete>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DS3FacadeObjectDelete.New(Service: IAWS4DS3Service<IAWS4DS3FacadeObjectDelete>): IAWS4DS3FacadeObjectDelete;
begin
  result := Self.create(Service);
end;

function TAWS4DS3FacadeObjectDelete.Request: IAWS4DS3ObjectDeleteRequest<IAWS4DS3FacadeObjectDelete>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DS3ObjectDeleteRequest<IAWS4DS3FacadeObjectDelete>.New(Self);
  result := FRequest;
end;

function TAWS4DS3FacadeObjectDelete.Send: IAWS4DS3FacadeObjectDelete;
begin
  result := Self;
  try
    FService.ObjectDelete(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
