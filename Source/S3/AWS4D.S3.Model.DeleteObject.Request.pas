unit AWS4D.S3.Model.DeleteObject.Request;

interface

uses
  AWS4D.S3.Model.Interfaces;

type TAWS4DS3ModelDeleteObjectRequest = class(TInterfacedObject, IAWS4DS3ModelDeleteObjectRequest)

  private
    FBucketName: String;
    FObjectName: string;

  protected
    function BucketName (Value: String): IAWS4DS3ModelDeleteObjectRequest; overload;
    function ObjectName (Value: String): IAWS4DS3ModelDeleteObjectRequest; overload;

    function BucketName : string; overload;
    function ObjectName : String; overload;

  public
    class function New: IAWS4DS3ModelDeleteObjectRequest;

end;

implementation

{ TAWS4DS3ModelDeleteObjectRequest }

function TAWS4DS3ModelDeleteObjectRequest.BucketName(Value: String): IAWS4DS3ModelDeleteObjectRequest;
begin
  result := Self;
  FBucketName := Value;
end;

function TAWS4DS3ModelDeleteObjectRequest.BucketName: string;
begin
  result := FBucketName;
end;

class function TAWS4DS3ModelDeleteObjectRequest.New: IAWS4DS3ModelDeleteObjectRequest;
begin
  result := Self.Create;
end;

function TAWS4DS3ModelDeleteObjectRequest.ObjectName(Value: String): IAWS4DS3ModelDeleteObjectRequest;
begin
  result := Self;
  FObjectName := Value;
end;

function TAWS4DS3ModelDeleteObjectRequest.ObjectName: String;
begin
  result := FObjectName;
end;

end.
