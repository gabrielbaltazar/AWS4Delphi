unit AWS4D.S3.Facade.ListObjects;

interface

uses
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.ListObjects.Request,
  AWS4D.S3.Model.ListObjects.Response;

type TAWS4DS3FacadeListObjects = class(TInterfacedObject, IAWS4DS3FacadeListObjects)

  private
    FService: IAWS4DS3Service<IAWS4DS3FacadeListObjects>;

    FRequest: IAWS4DS3ListObjectsRequest<IAWS4DS3FacadeListObjects>;
    FResponse: IAWS4DS3ListObjectsResponse<IAWS4DS3FacadeListObjects>;

  protected
    function Request: IAWS4DS3ListObjectsRequest<IAWS4DS3FacadeListObjects>;
    function Send: IAWS4DS3ListObjectsResponse<IAWS4DS3FacadeListObjects>;
    function Response: IAWS4DS3ListObjectsResponse<IAWS4DS3FacadeListObjects>;

  public
    class function New(Service: IAWS4DS3Service<IAWS4DS3FacadeListObjects>): IAWS4DS3FacadeListObjects;
    constructor create(Service: IAWS4DS3Service<IAWS4DS3FacadeListObjects>);

end;

implementation

constructor TAWS4DS3FacadeListObjects.create(Service: IAWS4DS3Service<IAWS4DS3FacadeListObjects>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DS3FacadeListObjects.New(Service: IAWS4DS3Service<IAWS4DS3FacadeListObjects>): IAWS4DS3FacadeListObjects;
begin
  result := Self.create(Service);
end;

function TAWS4DS3FacadeListObjects.Request: IAWS4DS3ListObjectsRequest<IAWS4DS3FacadeListObjects>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DS3ListObjectsRequest<IAWS4DS3FacadeListObjects>.New(Self);
  result := FRequest;
end;

function TAWS4DS3FacadeListObjects.Response: IAWS4DS3ListObjectsResponse<IAWS4DS3FacadeListObjects>;
begin
  result := FResponse;
end;

function TAWS4DS3FacadeListObjects.Send: IAWS4DS3ListObjectsResponse<IAWS4DS3FacadeListObjects>;
begin
  FResponse := nil;
  try
    FResponse := FService.ListObjects(FRequest);
    result := FResponse;
  finally
    if FResponse.Objects.Count > 0 then
    begin
      FRequest.Marker(FResponse.Objects.Last.Name);
      FResponse.Objects.Index(-1);
    end;
  end;
end;

end.
