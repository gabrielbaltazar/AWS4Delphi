unit AWS4D.S3.Facade.Interfaces;

interface

uses
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.Core.Model.Types;

type
  IAWS4DS3FacadeCreateBucket = interface;
  IAWS4DS3FacadeDeleteBucket = interface;
  IAWS4DS3FacadeListBuckets = interface;
  IAWS4DS3FacadeExistBucket = interface;

  IAWS4DS3Facade = interface
    ['{136DB671-C3AC-41B7-8FFE-28EA75A92C2C}']
    function AccessKey(Value: String): IAWS4DS3Facade;
    function SecretKey(Value: String): IAWS4DS3Facade;
    function Region(Value: String): IAWS4DS3Facade; overload;
    function Region(Value: TAWS4DRegion): IAWS4DS3Facade; overload;

    function CreateBucket: IAWS4DS3FacadeCreateBucket;
    function DeleteBucket: IAWS4DS3FacadeDeleteBucket;
    function ExistBucket: IAWS4DS3FacadeExistBucket;
    function ListBuckets: IAWS4DS3FacadeListBuckets;
  end;

  IAWS4DS3FacadeDeleteBucket = interface
    ['{D133071F-700D-409E-9537-019A7C951107}']
    function Request: IAWS4DS3DeleteBucketRequest<IAWS4DS3FacadeDeleteBucket>;
    function Send: IAWS4DS3FacadeDeleteBucket;
  end;

  IAWS4DS3FacadeExistBucket = interface
    ['{1A8BE370-EE79-43CF-A1AF-1AD42AEBED4A}']
    function Request: IAWS4DS3ExistBucketRequest<IAWS4DS3FacadeExistBucket>;
    function Send: IAWS4DS3ExistBucketResponse<IAWS4DS3FacadeExistBucket>;
    function Response: IAWS4DS3ExistBucketResponse<IAWS4DS3FacadeExistBucket>;
  end;

  IAWS4DS3FacadeCreateBucket = interface
    ['{95DC0F0F-7002-408C-86F6-B8AF6AF3C795}']
    function Request: IAWS4DS3CreateBucketRequest<IAWS4DS3FacadeCreateBucket>;
    function Send: IAWS4DS3FacadeCreateBucket;
  end;

  IAWS4DS3FacadeListBuckets = interface
    ['{BAA4A272-ABCC-410C-B2E9-BD3B32DBAAF9}']
    function Send: IAWS4DS3ListBucketsResponse<IAWS4DS3FacadeListBuckets>;
    function Response: IAWS4DS3ListBucketsResponse<IAWS4DS3FacadeListBuckets>;
  end;

function NewS3Facade: IAWS4DS3Facade;

implementation

uses
  AWS4D.S3.Facade;

function NewS3Facade: IAWS4DS3Facade;
begin
  result := TAWS4DS3Facade.New;
end;

end.
