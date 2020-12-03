unit AWS4D.S3.Model.DownloadObject.Request;

interface

uses
  AWS4D.S3.Model.Interfaces;

type TAWS4DS3ModelDownloadObjectRequest = class(TInterfacedObject, IAWS4DS3ModelDownloadObjectRequest)

  private
    FBucketName: string;
    FObjectName: String;

  protected
    function BucketName (Value: String): IAWS4DS3ModelDownloadObjectRequest; overload;
    function ObjectName (Value: String): IAWS4DS3ModelDownloadObjectRequest; overload;

    function BucketName : string; overload;
    function ObjectName : String; overload;

  public
    class function New: IAWS4DS3ModelDownloadObjectRequest;
end;

implementation

{ TAWS4DS3ModelDownloadObjectRequest }

function TAWS4DS3ModelDownloadObjectRequest.BucketName(Value: String): IAWS4DS3ModelDownloadObjectRequest;
begin
  result := Self;
  FBucketName := Value;
end;

function TAWS4DS3ModelDownloadObjectRequest.BucketName: string;
begin
  result := FBucketName;
end;

class function TAWS4DS3ModelDownloadObjectRequest.New: IAWS4DS3ModelDownloadObjectRequest;
begin
  result := Self.Create;
end;

function TAWS4DS3ModelDownloadObjectRequest.ObjectName(Value: String): IAWS4DS3ModelDownloadObjectRequest;
begin
  result := Self;
  FObjectName := Value;
end;

function TAWS4DS3ModelDownloadObjectRequest.ObjectName: String;
begin
  Result := FObjectName;
end;

end.
