unit AWS4D.S3.Facade.Interfaces;

interface

uses
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.Core.Model.Types;

type
  IAWS4DS3FacadeCreateBucket = interface;
  IAWS4DS3FacadeDeleteBucket = interface;
  IAWS4DS3FacadeDownloadObject = interface;
  IAWS4DS3FacadeExistObject = interface;
  IAWS4DS3FacadeGetObjectProperties = interface;
  IAWS4DS3FacadeListBuckets = interface;
  IAWS4DS3FacadeListObjects = interface;
  IAWS4DS3FacadeExistBucket = interface;
  IAWS4DS3FacadeCreateObject = interface;
  IAWS4DS3FacadeDeleteObject = interface;

  IAWS4DS3Facade = interface
    ['{136DB671-C3AC-41B7-8FFE-28EA75A92C2C}']
    function AccessKey(Value: String): IAWS4DS3Facade;
    function SecretKey(Value: String): IAWS4DS3Facade;
    function Region(Value: String): IAWS4DS3Facade; overload;
    function Region(Value: TAWS4DRegion): IAWS4DS3Facade; overload;

    function CreateBucket: IAWS4DS3FacadeCreateBucket;
    function CreateObject: IAWS4DS3FacadeCreateObject;
    function DeleteBucket: IAWS4DS3FacadeDeleteBucket;
    function DeleteObject: IAWS4DS3FacadeDeleteObject;
    function DownloadObject: IAWS4DS3FacadeDownloadObject;
    function ExistBucket: IAWS4DS3FacadeExistBucket;
    function ExistObject: IAWS4DS3FacadeExistObject;
    function GetObjectProperties: IAWS4DS3FacadeGetObjectProperties;
    function ListBuckets: IAWS4DS3FacadeListBuckets;
    function ListObjects: IAWS4DS3FacadeListObjects;
  end;

  IAWS4DS3FacadeCreateBucket = interface
    ['{95DC0F0F-7002-408C-86F6-B8AF6AF3C795}']
    function Request: IAWS4DS3CreateBucketRequest<IAWS4DS3FacadeCreateBucket>;
    function Send: IAWS4DS3FacadeCreateBucket;
  end;

  IAWS4DS3FacadeCreateObject = interface
    ['{74806E84-8E9D-4EB2-A559-7129D8B81662}']
    function Request: IAWS4DS3CreateObjectRequest<IAWS4DS3FacadeCreateObject>;
    function Send: IAWS4DS3FacadeCreateObject;
  end;

  IAWS4DS3FacadeDeleteBucket = interface
    ['{D133071F-700D-409E-9537-019A7C951107}']
    function Request: IAWS4DS3DeleteBucketRequest<IAWS4DS3FacadeDeleteBucket>;
    function Send: IAWS4DS3FacadeDeleteBucket;
  end;

  IAWS4DS3FacadeDeleteObject = interface
    ['{0159DF73-3FB6-4E3F-8C85-B0AF9C58C0D5}']
    function Request: IAWS4DS3DeleteObjectRequest<IAWS4DS3FacadeDeleteObject>;
    function Send: IAWS4DS3FacadeDeleteObject;
  end;

  IAWS4DS3FacadeDownloadObject = interface
    ['{B7D37425-346F-43B7-92E8-32B5C1F450E9}']
    function Request: IAWS4DS3DownloadObjectRequest<IAWS4DS3FacadeDownloadObject>;
    function Send: IAWS4DS3DownloadObjectResponse<IAWS4DS3FacadeDownloadObject>;
    function Response: IAWS4DS3DownloadObjectResponse<IAWS4DS3FacadeDownloadObject>;
  end;

  IAWS4DS3FacadeExistBucket = interface
    ['{1A8BE370-EE79-43CF-A1AF-1AD42AEBED4A}']
    function Request: IAWS4DS3ExistBucketRequest<IAWS4DS3FacadeExistBucket>;
    function Send: IAWS4DS3ExistBucketResponse<IAWS4DS3FacadeExistBucket>;
    function Response: IAWS4DS3ExistBucketResponse<IAWS4DS3FacadeExistBucket>;
  end;

  IAWS4DS3FacadeExistObject = interface
    ['{3A758ADE-736C-447A-A36F-F27A09E52107}']
    function Request: IAWS4DS3ExistObjectRequest<IAWS4DS3FacadeExistObject>;
    function Send: IAWS4DS3ExistObjectResponse<IAWS4DS3FacadeExistObject>;
    function Response: IAWS4DS3ExistObjectResponse<IAWS4DS3FacadeExistObject>;
  end;

  IAWS4DS3FacadeGetObjectProperties = interface
    ['{82CFE272-6A15-4E15-8C71-6B580E342427}']
    function Request: IAWS4DS3GetObjectPropertiesRequest<IAWS4DS3FacadeGetObjectProperties>;
    function Send: IAWS4DS3GetObjectPropertiesResponse<IAWS4DS3FacadeGetObjectProperties>;
    function Response: IAWS4DS3GetObjectPropertiesResponse<IAWS4DS3FacadeGetObjectProperties>;
  end;

  IAWS4DS3FacadeListBuckets = interface
    ['{BAA4A272-ABCC-410C-B2E9-BD3B32DBAAF9}']
    function Send: IAWS4DS3ListBucketsResponse<IAWS4DS3FacadeListBuckets>;
    function Response: IAWS4DS3ListBucketsResponse<IAWS4DS3FacadeListBuckets>;
  end;

  IAWS4DS3FacadeListObjects = interface
    ['{A0C8A577-9D64-4BD8-BC5A-8F5AB694536F}']
    function Request: IAWS4DS3ListObjectsRequest<IAWS4DS3FacadeListObjects>;
    function Send: IAWS4DS3ListObjectsResponse<IAWS4DS3FacadeListObjects>;
    function Response: IAWS4DS3ListObjectsResponse<IAWS4DS3FacadeListObjects>;
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
