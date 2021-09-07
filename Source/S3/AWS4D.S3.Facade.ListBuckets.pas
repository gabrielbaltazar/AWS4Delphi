unit AWS4D.S3.Facade.ListBuckets;

interface

uses
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.ListBuckets.Response;

type TAWS4DS3FacadeListBuckets = class(TInterfacedObject, IAWS4DS3FacadeListBuckets)

  private
    FService: IAWS4DS3Service<IAWS4DS3FacadeListBuckets>;
    FResponse: IAWS4DS3ListBucketsResponse<IAWS4DS3FacadeListBuckets>;

  protected
    function Send: IAWS4DS3ListBucketsResponse<IAWS4DS3FacadeListBuckets>;
    function Response: IAWS4DS3ListBucketsResponse<IAWS4DS3FacadeListBuckets>;

  public
    class function New(Service: IAWS4DS3Service<IAWS4DS3FacadeListBuckets>): IAWS4DS3FacadeListBuckets;
    constructor create(Service: IAWS4DS3Service<IAWS4DS3FacadeListBuckets>);

end;

implementation

constructor TAWS4DS3FacadeListBuckets.create(Service: IAWS4DS3Service<IAWS4DS3FacadeListBuckets>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DS3FacadeListBuckets.New(Service: IAWS4DS3Service<IAWS4DS3FacadeListBuckets>): IAWS4DS3FacadeListBuckets;
begin
  result := Self.create(Service);
end;

function TAWS4DS3FacadeListBuckets.Response: IAWS4DS3ListBucketsResponse<IAWS4DS3FacadeListBuckets>;
begin
  result := FResponse;
end;

function TAWS4DS3FacadeListBuckets.Send: IAWS4DS3ListBucketsResponse<IAWS4DS3FacadeListBuckets>;
begin
  FResponse := FService.ListBuckets;
end;

end.
