unit AWS4D.S3.Model.Interfaces;

interface

uses
  AWS4D.Model.Interfaces,
  System.Classes;

type
  IAWS4DS3ModelObjectInfo = interface
    ['{6A3A9C63-7559-4DB1-8D80-A69FD10425A2}']
    function Name             (Value: string): IAWS4DS3ModelObjectInfo; overload;
    function LastModified     (Value: TDateTime): IAWS4DS3ModelObjectInfo; overload;
    function ETag             (Value: String): IAWS4DS3ModelObjectInfo; overload;
    function OwnerID          (Value: String): IAWS4DS3ModelObjectInfo; overload;
    function OwnerDisplayName (Value: String): IAWS4DS3ModelObjectInfo; overload;
    function VersionId        (Value: String): IAWS4DS3ModelObjectInfo; overload;
    function StorageClass     (Value: String): IAWS4DS3ModelObjectInfo; overload;
    function IsLatest         (Value: Boolean): IAWS4DS3ModelObjectInfo; overload;
    function IsDeleted        (Value: Boolean): IAWS4DS3ModelObjectInfo; overload;
    function Size             (Value: Int64): IAWS4DS3ModelObjectInfo; overload;

    function Name            : string; overload;
    function LastModified    : TDateTime; overload;
    function ETag            : String; overload;
    function OwnerID         : String; overload;
    function OwnerDisplayName: String; overload;
    function VersionId       : String; overload;
    function StorageClass    : String; overload;
    function IsLatest        : Boolean; overload;
    function IsDeleted       : Boolean; overload;
    function Size            : Int64; overload;
  end;

  IAWS4DS3ModelCreateObjectRequest = interface(IAWS4DModelRequest)
    ['{3CE0EA8E-22CD-4B87-876D-2F0C7564AB24}']
    function BucketName (Value: String): IAWS4DS3ModelCreateObjectRequest; overload;
    function FileName   (Value: String): IAWS4DS3ModelCreateObjectRequest; overload;
    function FileStream (Value: TStream): IAWS4DS3ModelCreateObjectRequest; overload;
    function ObjectName (Value: String): IAWS4DS3ModelCreateObjectRequest; overload;

    function BucketName : string; overload;
    function FileName   : string; overload;
    function ObjectName : String; overload;
    function FileStream : TStream; overload;
  end;

  IAWS4DS3ModelFactory = interface
    ['{3D8D63D1-2147-4F04-8A3F-43113F085A54}']
    function CreateObjectInfo: IAWS4DS3ModelObjectInfo;
    function CreateObjectRequest: IAWS4DS3ModelCreateObjectRequest;
  end;

function S3ModelFactory: IAWS4DS3ModelFactory;

implementation

uses
  AWS4D.S3.Model.Factory;

function S3ModelFactory: IAWS4DS3ModelFactory;
begin
  result := TAWS4DS3ModelFactory.GetInstance;
end;

end.
