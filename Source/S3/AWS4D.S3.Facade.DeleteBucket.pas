unit AWS4D.S3.Facade.DeleteBucket;

interface

uses
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.DeleteBucket.Request;

type TAWS4DS3FacadeDeleteBucket = class(TInterfacedObject, IAWS4DS3FacadeDeleteBucket)

  private
    FService: IAWS4DS3Service<IAWS4DS3FacadeDeleteBucket>;

    FRequest: IAWS4DS3DeleteBucketRequest<IAWS4DS3FacadeDeleteBucket>;

  protected
    function Request: IAWS4DS3DeleteBucketRequest<IAWS4DS3FacadeDeleteBucket>;
    function Send: IAWS4DS3FacadeDeleteBucket;

  public
    class function New(Service: IAWS4DS3Service<IAWS4DS3FacadeDeleteBucket>): IAWS4DS3FacadeDeleteBucket;
    constructor create(Service: IAWS4DS3Service<IAWS4DS3FacadeDeleteBucket>);

end;

implementation

constructor TAWS4DS3FacadeDeleteBucket.create(Service: IAWS4DS3Service<IAWS4DS3FacadeDeleteBucket>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DS3FacadeDeleteBucket.New(Service: IAWS4DS3Service<IAWS4DS3FacadeDeleteBucket>): IAWS4DS3FacadeDeleteBucket;
begin
  result := Self.create(Service);
end;

function TAWS4DS3FacadeDeleteBucket.Request: IAWS4DS3DeleteBucketRequest<IAWS4DS3FacadeDeleteBucket>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DS3DeleteBucketRequest<IAWS4DS3FacadeDeleteBucket>.New(Self);
  result := FRequest;
end;

function TAWS4DS3FacadeDeleteBucket.Send: IAWS4DS3FacadeDeleteBucket;
begin
  result := Self;
  try
    FService.DeleteBucket(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
