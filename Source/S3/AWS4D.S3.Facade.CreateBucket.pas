unit AWS4D.S3.Facade.CreateBucket;

interface

uses
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.CreateBucket.Request;

type TAWS4DS3FacadeCreateBucket = class(TInterfacedObject, IAWS4DS3FacadeCreateBucket)

  private
    FService: IAWS4DS3Service<IAWS4DS3FacadeCreateBucket>;

    FRequest: IAWS4DS3CreateBucketRequest<IAWS4DS3FacadeCreateBucket>;

  protected
    function Request: IAWS4DS3CreateBucketRequest<IAWS4DS3FacadeCreateBucket>;
    function Send: IAWS4DS3FacadeCreateBucket;

  public
    class function New(Service: IAWS4DS3Service<IAWS4DS3FacadeCreateBucket>): IAWS4DS3FacadeCreateBucket;
    constructor create(Service: IAWS4DS3Service<IAWS4DS3FacadeCreateBucket>);

end;

implementation

constructor TAWS4DS3FacadeCreateBucket.create(Service: IAWS4DS3Service<IAWS4DS3FacadeCreateBucket>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DS3FacadeCreateBucket.New(Service: IAWS4DS3Service<IAWS4DS3FacadeCreateBucket>): IAWS4DS3FacadeCreateBucket;
begin
  result := Self.create(Service);
end;

function TAWS4DS3FacadeCreateBucket.Request: IAWS4DS3CreateBucketRequest<IAWS4DS3FacadeCreateBucket>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DS3CreateBucketRequest<IAWS4DS3FacadeCreateBucket>.New(Self);
  result := FRequest;
end;

function TAWS4DS3FacadeCreateBucket.Send: IAWS4DS3FacadeCreateBucket;
begin
  result := Self;
  try
    FService.CreateBucket(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
