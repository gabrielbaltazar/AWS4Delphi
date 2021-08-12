unit AWS4D.S3.Service.Interfaces;

interface

uses
  AWS4D.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  System.Generics.Collections;

type
  IAWS4DServiceS3 = interface(IAWS4DService)
    ['{C5FB57EF-F2FC-4C50-9861-4F5463B9A90D}']
    function ListBuckets: TArray<String>;
    procedure CreateBucket(BucketName: String);
    procedure DeleteBucket(BucketName: String);
    function  ExistBucket(BucketName: String): Boolean;

    function ListObjects(BucketName: String; Prefix: String = ''): TList<IAWS4DS3ModelObjectInfo>;
    procedure CreateObject(Request: IAWS4DS3ModelCreateObjectRequest);
    procedure DeleteObject(Request: IAWS4DS3ModelDeleteObjectRequest);
    function ExistObject(Request: IAWS4DS3ModelObjectExistRequest): Boolean;
    function DownloadObject(Request: IAWS4DS3ModelDownloadObjectRequest): IAWS4DS3ModelDownloadObjectResponse;

    function GetObjectProperties(Request: IAWS4DS3ModelGetObjectPropertiesRequest): IAWS4DS3ModelGetObjectPropertiesResponse; overload;
    function GetObjectProperties(BucketName, ObjectName: String): IAWS4DS3ModelGetObjectPropertiesResponse; overload;
  end;

function S3Service: IAWS4DServiceS3;

implementation

uses
  AWS4D.S3.Service.CloudAPI;

function S3Service: IAWS4DServiceS3;
begin
  result := TAWS4DS3ServiceCloudAPI.New;
end;

end.
