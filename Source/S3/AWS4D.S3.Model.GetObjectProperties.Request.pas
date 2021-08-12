unit AWS4D.S3.Model.GetObjectProperties.Request;

interface

uses
  AWS4D.S3.Model.Interfaces,
  Data.Cloud.AmazonAPI;

type TAWS4DS3ModelGetObjectPropertiesRequest = class(TInterfacedObject, IAWS4DS3ModelGetObjectPropertiesRequest)

  private
    FBucketName: string;
    FObjectName: String;
    FAmazonOptions: TAmazonGetObjectOptionals;

  protected
    function BucketName (Value: String): IAWS4DS3ModelGetObjectPropertiesRequest; overload;
    function ObjectName (Value: String): IAWS4DS3ModelGetObjectPropertiesRequest; overload;
    function ResponseContentType(Value: string): IAWS4DS3ModelGetObjectPropertiesRequest;
    function ResponseContentLanguage(Value: string): IAWS4DS3ModelGetObjectPropertiesRequest;
    function ResponseExpires(Value: string): IAWS4DS3ModelGetObjectPropertiesRequest;
    function ResponseCacheControl(Value: string): IAWS4DS3ModelGetObjectPropertiesRequest;
    function ResponseContentDisposition(Value: string): IAWS4DS3ModelGetObjectPropertiesRequest;
    function ResponseContentEncoding(Value: string): IAWS4DS3ModelGetObjectPropertiesRequest;
    function RangeStartByte(Value: Integer): IAWS4DS3ModelGetObjectPropertiesRequest;
    function RangeEndByte(Value: Integer): IAWS4DS3ModelGetObjectPropertiesRequest;

    function BucketName : string; overload;
    function ObjectName : String; overload;
    function OptionParams: TAmazonGetObjectOptionals;

  public
    constructor create;
    class function New: IAWS4DS3ModelGetObjectPropertiesRequest;
end;

implementation

{ TAWS4DS3ModelGetObjectPropertiesRequest }

function TAWS4DS3ModelGetObjectPropertiesRequest.BucketName(Value: String): IAWS4DS3ModelGetObjectPropertiesRequest;
begin
  result := Self;
  FBucketName := Value;
end;

function TAWS4DS3ModelGetObjectPropertiesRequest.BucketName: string;
begin
  result := FBucketName;
end;

constructor TAWS4DS3ModelGetObjectPropertiesRequest.create;
begin
  FAmazonOptions := TAmazonGetObjectOptionals.Create;
end;

class function TAWS4DS3ModelGetObjectPropertiesRequest.New: IAWS4DS3ModelGetObjectPropertiesRequest;
begin
  result := Self.Create;
end;

function TAWS4DS3ModelGetObjectPropertiesRequest.ObjectName(Value: String): IAWS4DS3ModelGetObjectPropertiesRequest;
begin
  result := Self;
  FObjectName := Value;
end;

function TAWS4DS3ModelGetObjectPropertiesRequest.ObjectName: String;
begin
  result := FObjectName;
end;

function TAWS4DS3ModelGetObjectPropertiesRequest.OptionParams: TAmazonGetObjectOptionals;
begin
  result := FAmazonOptions;
end;

function TAWS4DS3ModelGetObjectPropertiesRequest.RangeEndByte(Value: Integer): IAWS4DS3ModelGetObjectPropertiesRequest;
begin
  Result := Self;
  FAmazonOptions.RangeEndByte := Value;
end;

function TAWS4DS3ModelGetObjectPropertiesRequest.RangeStartByte(Value: Integer): IAWS4DS3ModelGetObjectPropertiesRequest;
begin
  Result := Self;
  FAmazonOptions.RangeStartByte := Value;
end;

function TAWS4DS3ModelGetObjectPropertiesRequest.ResponseCacheControl(Value: string): IAWS4DS3ModelGetObjectPropertiesRequest;
begin
  Result := Self;
  FAmazonOptions.ResponseCacheControl := Value;
end;

function TAWS4DS3ModelGetObjectPropertiesRequest.ResponseContentDisposition(Value: string): IAWS4DS3ModelGetObjectPropertiesRequest;
begin
  Result := Self;
  FAmazonOptions.ResponseContentDisposition := Value;
end;

function TAWS4DS3ModelGetObjectPropertiesRequest.ResponseContentEncoding(Value: string): IAWS4DS3ModelGetObjectPropertiesRequest;
begin
  Result := Self;
  FAmazonOptions.ResponseContentEncoding := Value;
end;

function TAWS4DS3ModelGetObjectPropertiesRequest.ResponseContentLanguage(Value: string): IAWS4DS3ModelGetObjectPropertiesRequest;
begin
  Result := Self;
  FAmazonOptions.ResponseContentLanguage := Value;
end;

function TAWS4DS3ModelGetObjectPropertiesRequest.ResponseContentType(Value: string): IAWS4DS3ModelGetObjectPropertiesRequest;
begin
  Result := Self;
  FAmazonOptions.ResponseContentType := Value;
end;

function TAWS4DS3ModelGetObjectPropertiesRequest.ResponseExpires(Value: string): IAWS4DS3ModelGetObjectPropertiesRequest;
begin
  Result := Self;
  FAmazonOptions.ResponseExpires := Value;
end;

end.
