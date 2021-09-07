unit AWS4D.S3.Facade.ExistBucket;

interface

uses
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.ExistBucket.Request,
  AWS4D.S3.Model.ExistBucket.Response;

type TAWS4DS3FacadeExistBucket = class(TInterfacedObject, IAWS4DS3FacadeExistBucket)

  private
    FService: IAWS4DS3Service<IAWS4DS3FacadeExistBucket>;

    FRequest: IAWS4DS3ExistBucketRequest<IAWS4DS3FacadeExistBucket>;
    FResponse: IAWS4DS3ExistBucketResponse<IAWS4DS3FacadeExistBucket>;

  protected
    function Request: IAWS4DS3ExistBucketRequest<IAWS4DS3FacadeExistBucket>;
    function Send: IAWS4DS3ExistBucketResponse<IAWS4DS3FacadeExistBucket>;
    function Response: IAWS4DS3ExistBucketResponse<IAWS4DS3FacadeExistBucket>;

  public
    class function New(Service: IAWS4DS3Service<IAWS4DS3FacadeExistBucket>): IAWS4DS3FacadeExistBucket;
    constructor create(Service: IAWS4DS3Service<IAWS4DS3FacadeExistBucket>);

end;

implementation

constructor TAWS4DS3FacadeExistBucket.create(Service: IAWS4DS3Service<IAWS4DS3FacadeExistBucket>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DS3FacadeExistBucket.New(Service: IAWS4DS3Service<IAWS4DS3FacadeExistBucket>): IAWS4DS3FacadeExistBucket;
begin
  result := Self.create(Service);
end;

function TAWS4DS3FacadeExistBucket.Request: IAWS4DS3ExistBucketRequest<IAWS4DS3FacadeExistBucket>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DS3ExistBucketRequest<IAWS4DS3FacadeExistBucket>.New(Self);
  result := FRequest;
end;

function TAWS4DS3FacadeExistBucket.Response: IAWS4DS3ExistBucketResponse<IAWS4DS3FacadeExistBucket>;
begin
  result := FResponse;
end;

function TAWS4DS3FacadeExistBucket.Send: IAWS4DS3ExistBucketResponse<IAWS4DS3FacadeExistBucket>;
begin
  FResponse := nil;
  try
    FResponse := FService.BucketExist(FRequest);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
