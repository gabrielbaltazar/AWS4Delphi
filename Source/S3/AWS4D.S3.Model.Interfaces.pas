unit AWS4D.S3.Model.Interfaces;

interface

uses
  AWS4D.Core.Model.Types,
  System.Classes;

type
  IAWS4DS3CreateBucketRequest<I: IInterface> = interface
    ['{904D2523-5D22-4B94-AB44-86662FB680A6}']
    function BucketName(Value: String): IAWS4DS3CreateBucketRequest<I>; overload;
    function BucketName: String; overload;

    function &End: I;
  end;

  IAWS4DS3DeleteBucketRequest<I: IInterface> = interface
    ['{B8FB6B27-E75F-4DE6-A229-FB35723E39D7}']
    function BucketName(Value: String): IAWS4DS3DeleteBucketRequest<I>; overload;
    function BucketName: String; overload;

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

  IAWS4DS3ListBucketsResponse<I: IInterface> = interface
    ['{4EE25118-D4CB-419D-A238-E19C9818EF6F}']
    function Buckets: IAWS4DIterator<String>;
  end;

  IAWS4DS3ObjectCreateRequest<I: IInterface> = interface
    ['{A0B0C2B1-2FF8-4422-8CCF-0848061D6CB7}']
    function BucketName(Value: String): IAWS4DS3ObjectCreateRequest<I>; overload;
    function FileName(Value: String): IAWS4DS3ObjectCreateRequest<I>; overload;
    function FileStream(Value: TStream): IAWS4DS3ObjectCreateRequest<I>; overload;
    function ObjectName(Value: String): IAWS4DS3ObjectCreateRequest<I>; overload;

    function AddMetaInfo(Key, Value: String): IAWS4DS3ObjectCreateRequest<I>;

    function BucketName: string; overload;
    function FileName: string; overload;
    function ObjectName: String; overload;
    function FileStream: TStream; overload;
    function MetaInfo: TStrings;

    function &End: I;
  end;

  IAWS4DS3ObjectDeleteRequest<I: IInterface> = interface
    ['{4381BB8B-3B34-47BB-AB53-D41E94F85D89}']
    function BucketName(Value: String): IAWS4DS3ObjectDeleteRequest<I>; overload;
    function ObjectName(Value: String): IAWS4DS3ObjectDeleteRequest<I>; overload;

    function BucketName: string; overload;
    function ObjectName: String; overload;

    function &End: I;
  end;

implementation

end.
