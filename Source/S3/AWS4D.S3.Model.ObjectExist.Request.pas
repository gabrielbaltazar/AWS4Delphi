unit AWS4D.S3.Model.ObjectExist.Request;

interface

uses
  AWS4D.S3.Model.Interfaces;

type TAWS4DS3ModelObjectExistRequest = class(TInterfacedObject, IAWS4DS3ModelObjectExistRequest)

  private
    FBucketName: String;
    FObjectName: string;

  protected
    function BucketName (Value: String): IAWS4DS3ModelObjectExistRequest; overload;
    function ObjectName (Value: String): IAWS4DS3ModelObjectExistRequest; overload;

    function BucketName : string; overload;
    function ObjectName : String; overload;

  public
    class function New: IAWS4DS3ModelObjectExistRequest;

end;

implementation

{ TAWS4DS3ModelObjectExistRequest }

function TAWS4DS3ModelObjectExistRequest.BucketName(Value: String): IAWS4DS3ModelObjectExistRequest;
begin
  result := Self;
  FBucketName := Value;
end;

function TAWS4DS3ModelObjectExistRequest.BucketName: string;
begin
  result := FBucketName;
end;

class function TAWS4DS3ModelObjectExistRequest.New: IAWS4DS3ModelObjectExistRequest;
begin
  result := Self.Create;
end;

function TAWS4DS3ModelObjectExistRequest.ObjectName(Value: String): IAWS4DS3ModelObjectExistRequest;
begin
  result := Self;
  FObjectName := Value;
end;

function TAWS4DS3ModelObjectExistRequest.ObjectName: String;
begin
  result := FObjectName;
end;

end.

