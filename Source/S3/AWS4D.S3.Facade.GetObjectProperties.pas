unit AWS4D.S3.Facade.GetObjectProperties;

interface

uses
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.GetObjectProperties.Request,
  AWS4D.S3.Model.GetObjectProperties.Response;

type TAWS4DS3FacadeGetObjectProperties = class(TInterfacedObject, IAWS4DS3FacadeGetObjectProperties)

  private
    FService: IAWS4DS3Service<IAWS4DS3FacadeGetObjectProperties>;

    FRequest: IAWS4DS3GetObjectPropertiesRequest<IAWS4DS3FacadeGetObjectProperties>;
    FResponse: IAWS4DS3GetObjectPropertiesResponse<IAWS4DS3FacadeGetObjectProperties>;

  protected
    function Request: IAWS4DS3GetObjectPropertiesRequest<IAWS4DS3FacadeGetObjectProperties>;
    function Send: IAWS4DS3GetObjectPropertiesResponse<IAWS4DS3FacadeGetObjectProperties>;
    function Response: IAWS4DS3GetObjectPropertiesResponse<IAWS4DS3FacadeGetObjectProperties>;

  public
    class function New(Service: IAWS4DS3Service<IAWS4DS3FacadeGetObjectProperties>): IAWS4DS3FacadeGetObjectProperties;
    constructor create(Service: IAWS4DS3Service<IAWS4DS3FacadeGetObjectProperties>);

end;

implementation

constructor TAWS4DS3FacadeGetObjectProperties.create(Service: IAWS4DS3Service<IAWS4DS3FacadeGetObjectProperties>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DS3FacadeGetObjectProperties.New(Service: IAWS4DS3Service<IAWS4DS3FacadeGetObjectProperties>): IAWS4DS3FacadeGetObjectProperties;
begin
  result := Self.create(Service);
end;

function TAWS4DS3FacadeGetObjectProperties.Request: IAWS4DS3GetObjectPropertiesRequest<IAWS4DS3FacadeGetObjectProperties>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DS3GetObjectPropertiesRequest<IAWS4DS3FacadeGetObjectProperties>.New(Self);
  result := FRequest;
end;

function TAWS4DS3FacadeGetObjectProperties.Response: IAWS4DS3GetObjectPropertiesResponse<IAWS4DS3FacadeGetObjectProperties>;
begin
  result := FResponse;
end;

function TAWS4DS3FacadeGetObjectProperties.Send: IAWS4DS3GetObjectPropertiesResponse<IAWS4DS3FacadeGetObjectProperties>;
begin
  FResponse := nil;
  try
    FResponse := FService.GetObjectProperties(FRequest);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
