unit AWS4D.S3.Service.Interfaces;

interface

uses
  AWS4D.Core.Model.Types,
  AWS4D.S3.Model.Interfaces;

type
  IAWS4DS3Service<I: IInterface> = interface
    ['{9A30B487-7C85-4D4F-A8AE-AFA2EE84DCFB}']
    function AccessKey(Value: String): IAWS4DS3Service<I>;
    function SecretKey(Value: String): IAWS4DS3Service<I>;
    function Region(Value: String): IAWS4DS3Service<I>; overload;
    function Region(Value: TAWS4DRegion): IAWS4DS3Service<I>; overload;

    function BucketExist(Request: IAWS4DS3ExistBucketRequest<I>): IAWS4DS3ExistBucketResponse<I>;
    procedure CreateBucket(Request: IAWS4DS3CreateBucketRequest<I>);
    procedure DeleteBucket(Request: IAWS4DS3DeleteBucketRequest<I>);
    function DownloadObject(Request: IAWS4DS3DownloadObjectRequest<I>): IAWS4DS3DownloadObjectResponse<I>;
    function ExistObject(Request: IAWS4DS3ExistObjectRequest<I>): IAWS4DS3ExistObjectResponse<I>;
    function ListBuckets: IAWS4DS3ListBucketsResponse<I>;
    procedure ObjectCreate(Request: IAWS4DS3ObjectCreateRequest<I>);
    procedure ObjectDelete(Request: IAWS4DS3ObjectDeleteRequest<I>);

    function Parent(Value: I): IAWS4DS3Service<I>;
    function &End: I;
  end;

implementation

end.
