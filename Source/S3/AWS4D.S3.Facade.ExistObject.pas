unit AWS4D.S3.Facade.ExistObject;

interface

uses
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.ExistObject.Request,
  AWS4D.S3.Model.ExistObject.Response;

type TAWS4DS3FacadeExistObject = class(TInterfacedObject, IAWS4DS3FacadeExistObject)

  private
    FService: IAWS4DS3Service<IAWS4DS3FacadeExistObject>;

    FRequest: IAWS4DS3ExistObjectRequest<IAWS4DS3FacadeExistObject>;
    FResponse: IAWS4DS3ExistObjectResponse<IAWS4DS3FacadeExistObject>;

  protected
    function Request: IAWS4DS3ExistObjectRequest<IAWS4DS3FacadeExistObject>;
    function Send: IAWS4DS3ExistObjectResponse<IAWS4DS3FacadeExistObject>;
    function Response: IAWS4DS3ExistObjectResponse<IAWS4DS3FacadeExistObject>;

  public
    class function New(Service: IAWS4DS3Service<IAWS4DS3FacadeExistObject>): IAWS4DS3FacadeExistObject;
    constructor create(Service: IAWS4DS3Service<IAWS4DS3FacadeExistObject>);

end;

implementation

constructor TAWS4DS3FacadeExistObject.create(Service: IAWS4DS3Service<IAWS4DS3FacadeExistObject>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DS3FacadeExistObject.New(Service: IAWS4DS3Service<IAWS4DS3FacadeExistObject>): IAWS4DS3FacadeExistObject;
begin
  result := Self.create(Service);
end;

function TAWS4DS3FacadeExistObject.Request: IAWS4DS3ExistObjectRequest<IAWS4DS3FacadeExistObject>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DS3ExistObjectRequest<IAWS4DS3FacadeExistObject>.New(Self);
  result := FRequest;
end;

function TAWS4DS3FacadeExistObject.Response: IAWS4DS3ExistObjectResponse<IAWS4DS3FacadeExistObject>;
begin
  result := FResponse;
end;

function TAWS4DS3FacadeExistObject.Send: IAWS4DS3ExistObjectResponse<IAWS4DS3FacadeExistObject>;
begin
  FResponse := nil;
  try
    FResponse := FService.ExistObject(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
