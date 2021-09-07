unit AWS4D.S3.Facade.DownloadObject;

interface

uses
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.DownloadObject.Request,
  AWS4D.S3.Model.DownloadObject.Response;

type TAWS4DS3FacadeDownloadObject = class(TInterfacedObject, IAWS4DS3FacadeDownloadObject)

  private
    FService: IAWS4DS3Service<IAWS4DS3FacadeDownloadObject>;

    FRequest: IAWS4DS3DownloadObjectRequest<IAWS4DS3FacadeDownloadObject>;
    FResponse: IAWS4DS3DownloadObjectResponse<IAWS4DS3FacadeDownloadObject>;

  protected
    function Request: IAWS4DS3DownloadObjectRequest<IAWS4DS3FacadeDownloadObject>;
    function Send: IAWS4DS3DownloadObjectResponse<IAWS4DS3FacadeDownloadObject>;
    function Response: IAWS4DS3DownloadObjectResponse<IAWS4DS3FacadeDownloadObject>;

  public
    class function New(Service: IAWS4DS3Service<IAWS4DS3FacadeDownloadObject>): IAWS4DS3FacadeDownloadObject;
    constructor create(Service: IAWS4DS3Service<IAWS4DS3FacadeDownloadObject>);

end;

implementation

constructor TAWS4DS3FacadeDownloadObject.create(Service: IAWS4DS3Service<IAWS4DS3FacadeDownloadObject>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DS3FacadeDownloadObject.New(Service: IAWS4DS3Service<IAWS4DS3FacadeDownloadObject>): IAWS4DS3FacadeDownloadObject;
begin
  result := Self.create(Service);
end;

function TAWS4DS3FacadeDownloadObject.Request: IAWS4DS3DownloadObjectRequest<IAWS4DS3FacadeDownloadObject>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DS3DownloadObjectRequest<IAWS4DS3FacadeDownloadObject>.New(Self);
  result := FRequest;
end;

function TAWS4DS3FacadeDownloadObject.Response: IAWS4DS3DownloadObjectResponse<IAWS4DS3FacadeDownloadObject>;
begin
  result := FResponse;
end;

function TAWS4DS3FacadeDownloadObject.Send: IAWS4DS3DownloadObjectResponse<IAWS4DS3FacadeDownloadObject>;
begin
  FResponse := nil;
  try
    FResponse := FService.DownloadObject(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
