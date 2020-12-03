unit AWS4D.S3.Model.ObjectInfo;

interface

uses
  System.SysUtils,
  AWS4D.S3.Model.Interfaces,
  Data.Cloud.AmazonAPI,
  AWS4D.Helper.DateTime;

type TAWS4DS3ModelObjectInfo = class(TInterfacedObject, IAWS4DS3ModelObjectInfo)

  private
    FName            : string;
    FLastModified    : TDateTime;
    FETag            : String;
    FOwnerID         : String;
    FOwnerDisplayName: String;
    FVersionId       : String;
    FStorageClass    : String;
    FIsLatest        : Boolean;
    FIsDeleted       : Boolean;
    FSize            : Int64;

  protected
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

  public
    class function New: IAWS4DS3ModelObjectInfo;
    class function CreateFromObjectResult(Value: TAmazonObjectResult): IAWS4DS3ModelObjectInfo;
end;

implementation

{ TAWS4DS3ModelObjectInfo }

function TAWS4DS3ModelObjectInfo.ETag(Value: String): IAWS4DS3ModelObjectInfo;
begin
  result := Self;
  FETag := Value;
end;

class function TAWS4DS3ModelObjectInfo.CreateFromObjectResult(Value: TAmazonObjectResult): IAWS4DS3ModelObjectInfo;
var
  lastModified: TDateTime;
begin
  lastModified.fromIso8601ToDateTime(Value.LastModified);
  result := New;
  Result
    .Name(Value.Name)
    .ETag(Value.ETag)
    .OwnerID(Value.OwnerID)
    .OwnerDisplayName(Value.OwnerDisplayName)
    .VersionId(Value.VersionId)
    .StorageClass(Value.StorageClass)
    .LastModified(lastModified)
    .IsLatest(Value.IsLatest)
    .IsDeleted(Value.IsDeleted)
    .Size(Value.Size)
end;

function TAWS4DS3ModelObjectInfo.ETag: String;
begin
  result := FETag;
end;

function TAWS4DS3ModelObjectInfo.IsDeleted: Boolean;
begin
  result := FIsDeleted;
end;

function TAWS4DS3ModelObjectInfo.IsDeleted(Value: Boolean): IAWS4DS3ModelObjectInfo;
begin
  result := Self;
  FIsDeleted := Value;
end;

function TAWS4DS3ModelObjectInfo.IsLatest: Boolean;
begin
  result := FIsLatest;
end;

function TAWS4DS3ModelObjectInfo.IsLatest(Value: Boolean): IAWS4DS3ModelObjectInfo;
begin
  result := Self;
  FIsLatest := Value;
end;

function TAWS4DS3ModelObjectInfo.LastModified(Value: TDateTime): IAWS4DS3ModelObjectInfo;
begin
  result := Self;
  FLastModified := Value;
end;

function TAWS4DS3ModelObjectInfo.LastModified: TDateTime;
begin
  result := FLastModified;
end;

function TAWS4DS3ModelObjectInfo.Name: string;
begin
  result := FName;
end;

function TAWS4DS3ModelObjectInfo.Name(Value: string): IAWS4DS3ModelObjectInfo;
begin
  result := Self;
  FName  := Value;
end;

class function TAWS4DS3ModelObjectInfo.New: IAWS4DS3ModelObjectInfo;
begin
  result := Self.Create;
end;

function TAWS4DS3ModelObjectInfo.OwnerDisplayName(Value: String): IAWS4DS3ModelObjectInfo;
begin
  Result := Self;
  FOwnerDisplayName := Value;
end;

function TAWS4DS3ModelObjectInfo.OwnerDisplayName: String;
begin
  result := FOwnerDisplayName;
end;

function TAWS4DS3ModelObjectInfo.OwnerID: String;
begin
  result := FOwnerID;
end;

function TAWS4DS3ModelObjectInfo.OwnerID(Value: String): IAWS4DS3ModelObjectInfo;
begin
  result := Self;
  FOwnerID := Value;
end;

function TAWS4DS3ModelObjectInfo.Size(Value: Int64): IAWS4DS3ModelObjectInfo;
begin
  result := Self;
  FSize  := Value;
end;

function TAWS4DS3ModelObjectInfo.Size: Int64;
begin
  result := FSize;
end;

function TAWS4DS3ModelObjectInfo.StorageClass: String;
begin
  result := FStorageClass;
end;

function TAWS4DS3ModelObjectInfo.StorageClass(Value: String): IAWS4DS3ModelObjectInfo;
begin
  result := Self;
  FStorageClass := Value;
end;

function TAWS4DS3ModelObjectInfo.VersionId: String;
begin
  result := FVersionId;
end;

function TAWS4DS3ModelObjectInfo.VersionId(Value: String): IAWS4DS3ModelObjectInfo;
begin
  result := Self;
  FVersionId := Value;
end;

end.
