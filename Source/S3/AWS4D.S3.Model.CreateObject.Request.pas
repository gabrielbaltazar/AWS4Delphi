unit AWS4D.S3.Model.CreateObject.Request;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.S3.Model.Interfaces,
  System.Classes,
  System.SysUtils;

type TAWS4DS3ModelCreateObjectRequest = class(TInterfacedObject, IAWS4DS3ModelCreateObjectRequest)

  protected
    FOwnerStream: Boolean;

    FBucketName : string;
    FFileName   : String;
    FFileStream : TStream;
    FObjectName : string;

    function BucketName (Value: String): IAWS4DS3ModelCreateObjectRequest; overload;
    function FileName   (Value: String): IAWS4DS3ModelCreateObjectRequest; overload;
    function FileStream (Value: TStream): IAWS4DS3ModelCreateObjectRequest; overload;
    function ObjectName (Value: String): IAWS4DS3ModelCreateObjectRequest; overload;

    function BucketName : string; overload;
    function FileName   : string; overload;
    function ObjectName : String; overload;
    function FileStream : TStream; overload;

  public
    constructor create;
    destructor Destroy; override;
    class function New: IAWS4DS3ModelCreateObjectRequest;

end;

implementation

{ TAWS4DS3ModelCreateObjectRequest }

function TAWS4DS3ModelCreateObjectRequest.BucketName: string;
begin
  Result := FBucketName;
end;

constructor TAWS4DS3ModelCreateObjectRequest.create;
begin
  FOwnerStream := False;
end;

destructor TAWS4DS3ModelCreateObjectRequest.Destroy;
begin
  if FOwnerStream then
    FFileStream.Free;
  inherited;
end;

function TAWS4DS3ModelCreateObjectRequest.BucketName(Value: String): IAWS4DS3ModelCreateObjectRequest;
begin
  result := Self;
  FBucketName := Value;
end;

function TAWS4DS3ModelCreateObjectRequest.FileName(Value: String): IAWS4DS3ModelCreateObjectRequest;
begin
  result := Self;
  FFileName := Value;
end;

function TAWS4DS3ModelCreateObjectRequest.FileName: string;
begin
  result := FFileName;
end;

function TAWS4DS3ModelCreateObjectRequest.FileStream: TStream;
begin
  result := nil;
  if Assigned(FFileStream) then
    Exit(FFileStream);

  if FileExists(FFileName) then
  begin
    FOwnerStream := True;
    FFileStream  := TFileStream.Create(FFileName, fmOpenRead);
    result       := FFileStream;
  end;
end;

class function TAWS4DS3ModelCreateObjectRequest.New: IAWS4DS3ModelCreateObjectRequest;
begin
  result := Self.create;
end;

function TAWS4DS3ModelCreateObjectRequest.FileStream(Value: TStream): IAWS4DS3ModelCreateObjectRequest;
begin
  result := Self;
  FreeAndNil(FFileStream);
  FOwnerStream := False;
  FFileStream  := Value;
end;

function TAWS4DS3ModelCreateObjectRequest.ObjectName(Value: String): IAWS4DS3ModelCreateObjectRequest;
begin
  result := Self;
  FObjectName := Value;
end;

function TAWS4DS3ModelCreateObjectRequest.ObjectName: String;
begin
  result := FObjectName;
end;

end.
