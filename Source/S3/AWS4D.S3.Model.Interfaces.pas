unit AWS4D.S3.Model.Interfaces;

interface

uses
  AWS4D.Core.Model.Types,
  Data.Cloud.AmazonAPI,
  System.Classes;

type
  IAWS4DS3ModelObjectInfo = interface;

  IAWS4DS3CreateBucketRequest<I: IInterface> = interface
    ['{904D2523-5D22-4B94-AB44-86662FB680A6}']
    function BucketName(Value: String): IAWS4DS3CreateBucketRequest<I>; overload;
    function BucketName: String; overload;

    function &End: I;
  end;

  IAWS4DS3CreateObjectRequest<I: IInterface> = interface
    ['{A0B0C2B1-2FF8-4422-8CCF-0848061D6CB7}']
    function BucketName(Value: String): IAWS4DS3CreateObjectRequest<I>; overload;
    function FileName(Value: String): IAWS4DS3CreateObjectRequest<I>; overload;
    function FileStream(Value: TStream): IAWS4DS3CreateObjectRequest<I>; overload;
    function ObjectName(Value: String): IAWS4DS3CreateObjectRequest<I>; overload;

    function AddMetaInfo(Key, Value: String): IAWS4DS3CreateObjectRequest<I>;

    function BucketName: string; overload;
    function FileName: string; overload;
    function ObjectName: String; overload;
    function FileStream: TStream; overload;
    function MetaInfo: TStrings;

    function &End: I;
  end;

  IAWS4DS3DeleteBucketRequest<I: IInterface> = interface
    ['{B8FB6B27-E75F-4DE6-A229-FB35723E39D7}']
    function BucketName(Value: String): IAWS4DS3DeleteBucketRequest<I>; overload;
    function BucketName: String; overload;

    function &End: I;
  end;

  IAWS4DS3DeleteObjectRequest<I: IInterface> = interface
    ['{4381BB8B-3B34-47BB-AB53-D41E94F85D89}']
    function BucketName(Value: String): IAWS4DS3DeleteObjectRequest<I>; overload;
    function ObjectName(Value: String): IAWS4DS3DeleteObjectRequest<I>; overload;

    function BucketName: string; overload;
    function ObjectName: String; overload;

    function &End: I;
  end;

  IAWS4DS3DownloadObjectRequest<I: IInterface> = interface
    ['{8C6FC293-AF4E-41C5-A9ED-AAAC882B7A4E}']
    function BucketName (Value: String): IAWS4DS3DownloadObjectRequest<I>; overload;
    function ObjectName (Value: String): IAWS4DS3DownloadObjectRequest<I>; overload;

    function BucketName : string; overload;
    function ObjectName : String; overload;

    function &End: I;
  end;

  IAWS4DS3DownloadObjectResponse<I: IInterface> = interface
    ['{5752D790-B36C-4D7A-A02F-F34585165260}']
    function Stream: TMemoryStream;
    function Base64: string;
    procedure SaveToFile(AFileName: String);
  end;

  IAWS4DS3ExistBucketRequest<I: IInterface> = interface
    ['{46D157EB-75BD-426E-A7D1-68B31F9632A8}']
    function BucketName(Value: String): IAWS4DS3ExistBucketRequest<I>; overload;
    function BucketName: String; overload;

    function &End: I;
  end;

  IAWS4DS3ExistBucketResponse<I: IInterface> = interface
    ['{5661C319-A357-4FD7-AC24-3F5FB7700F12}']
    function Exist: Boolean;
    function &End: I;
  end;

  IAWS4DS3ExistObjectRequest<I: IInterface> = interface
    ['{CA1B0CE7-3926-4C10-BC34-3CABFE2C9333}']
    function BucketName (Value: String): IAWS4DS3ExistObjectRequest<I>; overload;
    function ObjectName (Value: String): IAWS4DS3ExistObjectRequest<I>; overload;

    function BucketName : string; overload;
    function ObjectName : String; overload;

    function &End: I;
  end;

  IAWS4DS3ExistObjectResponse<I: IInterface> = interface
    ['{85B3E147-D4D2-4E88-B556-F3BF58B15296}']
    function Exist: Boolean;
    function &End: I;
  end;

  IAWS4DS3GetObjectPropertiesRequest<I: IInterface> = interface
    ['{7137E7A0-EA02-4DE6-9DC3-6B235910DB2B}']
    function BucketName (Value: String): IAWS4DS3GetObjectPropertiesRequest<I>; overload;
    function ObjectName (Value: String): IAWS4DS3GetObjectPropertiesRequest<I>; overload;
    function ResponseContentType(Value: string): IAWS4DS3GetObjectPropertiesRequest<I>;
    function ResponseContentLanguage(Value: string): IAWS4DS3GetObjectPropertiesRequest<I>;
    function ResponseExpires(Value: string): IAWS4DS3GetObjectPropertiesRequest<I>;
    function ResponseCacheControl(Value: string): IAWS4DS3GetObjectPropertiesRequest<I>;
    function ResponseContentDisposition(Value: string): IAWS4DS3GetObjectPropertiesRequest<I>;
    function ResponseContentEncoding(Value: string): IAWS4DS3GetObjectPropertiesRequest<I>;
    function RangeStartByte(Value: Integer): IAWS4DS3GetObjectPropertiesRequest<I>;
    function RangeEndByte(Value: Integer): IAWS4DS3GetObjectPropertiesRequest<I>;

    function BucketName : string; overload;
    function ObjectName : String; overload;
    function OptionParams: TAmazonGetObjectOptionals;

    function &End: I;
  end;

  IAWS4DS3GetObjectPropertiesResponse<I: IInterface> = interface
    ['{543162FA-DC24-4557-B1C4-33B4DFD9D538}']
    function Properties: IAWS4DIterator<IAWS4DCoreModelAttribute>;
    function MetaData: IAWS4DIterator<IAWS4DCoreModelAttribute>;

    function MetaDataValue(Key: String): string;
    function PropertyValue(Key: String): string;

    function &End: I;
  end;

  IAWS4DS3ListBucketsResponse<I: IInterface> = interface
    ['{4EE25118-D4CB-419D-A238-E19C9818EF6F}']
    function Buckets: IAWS4DIterator<String>;
    function &End: I;
  end;

  IAWS4DS3ListObjectsRequest<I: IInterface> = interface
    ['{B964A524-B492-483C-8FCE-AE8A6A6DF527}']
    function BucketName(Value: String): IAWS4DS3ListObjectsRequest<I>; overload;
    function Marker(Value: string): IAWS4DS3ListObjectsRequest<I>; overload;
    function Prefix(Value: string): IAWS4DS3ListObjectsRequest<I>; overload;
    function MaxKeys(Value: Integer): IAWS4DS3ListObjectsRequest<I>; overload;
    function FullBucket(Value: Boolean): IAWS4DS3ListObjectsRequest<I>; overload;

    function BucketName: string; overload;
    function Marker: string; overload;
    function Prefix: string; overload;
    function MaxKeys: Integer; overload;
    function FullBucket: Boolean; overload;

    function &End: I;
  end;

  IAWS4DS3ListObjectsResponse<I: IInterface> = interface
    ['{8ADA4FED-0D86-4B92-9310-8BD0648E31C7}']
    function Objects: IAWS4DIterator<IAWS4DS3ModelObjectInfo>;
    function &End: I;
  end;

  IAWS4DS3ModelObjectInfo = interface
    ['{43A9902C-0C1B-4DA4-ADE7-3239CE0D3058}']
    function Name(Value: string): IAWS4DS3ModelObjectInfo; overload;
    function LastModified(Value: TDateTime): IAWS4DS3ModelObjectInfo; overload;
    function ETag(Value: String): IAWS4DS3ModelObjectInfo; overload;
    function OwnerID(Value: String): IAWS4DS3ModelObjectInfo; overload;
    function OwnerDisplayName(Value: String): IAWS4DS3ModelObjectInfo; overload;
    function VersionId(Value: String): IAWS4DS3ModelObjectInfo; overload;
    function StorageClass(Value: String): IAWS4DS3ModelObjectInfo; overload;
    function IsLatest(Value: Boolean): IAWS4DS3ModelObjectInfo; overload;
    function IsDeleted(Value: Boolean): IAWS4DS3ModelObjectInfo; overload;
    function Size(Value: Int64): IAWS4DS3ModelObjectInfo; overload;

    function Name: string; overload;
    function LastModified: TDateTime; overload;
    function ETag: String; overload;
    function OwnerID: String; overload;
    function OwnerDisplayName: String; overload;
    function VersionId: String; overload;
    function StorageClass: String; overload;
    function IsLatest: Boolean; overload;
    function IsDeleted: Boolean; overload;
    function Size: Int64; overload;
  end;

implementation

end.
