unit AWS4D.S3.Model.GetObjectProperties.Request;

interface

uses
  AWS4D.S3.Model.Interfaces,
  Data.Cloud.AmazonAPI;

type TAWS4DS3GetObjectPropertiesRequest<I: IInterface> = class(TInterfacedObject, IAWS4DS3GetObjectPropertiesRequest<I>)

  private
    [Weak]
    FParent: I;
    FBucketName: string;
    FObjectName: String;
    FAmazonOptions: TAmazonGetObjectOptionals;

  protected
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

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DS3GetObjectPropertiesRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DS3GetObjectPropertiesRequest<I>.BucketName(Value: String): IAWS4DS3GetObjectPropertiesRequest<I>;
begin
  result := Self;
  FBucketName := Value;
end;

function TAWS4DS3GetObjectPropertiesRequest<I>.BucketName: string;
begin
  result := FBucketName;
end;

constructor TAWS4DS3GetObjectPropertiesRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FAmazonOptions := TAmazonGetObjectOptionals.Create;
end;

destructor TAWS4DS3GetObjectPropertiesRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DS3GetObjectPropertiesRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DS3GetObjectPropertiesRequest<I>.New(Parent: I): IAWS4DS3GetObjectPropertiesRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DS3GetObjectPropertiesRequest<I>.ObjectName: String;
begin
  result := FObjectName;
end;

function TAWS4DS3GetObjectPropertiesRequest<I>.ObjectName(Value: String): IAWS4DS3GetObjectPropertiesRequest<I>;
begin
  result := Self;
  FObjectName := Value;
end;

function TAWS4DS3GetObjectPropertiesRequest<I>.OptionParams: TAmazonGetObjectOptionals;
begin
  result := FAmazonOptions;
end;

function TAWS4DS3GetObjectPropertiesRequest<I>.RangeEndByte(Value: Integer): IAWS4DS3GetObjectPropertiesRequest<I>;
begin
  Result := Self;
  FAmazonOptions.RangeEndByte := Value;
end;

function TAWS4DS3GetObjectPropertiesRequest<I>.RangeStartByte(Value: Integer): IAWS4DS3GetObjectPropertiesRequest<I>;
begin
  Result := Self;
  FAmazonOptions.RangeStartByte := Value;
end;

function TAWS4DS3GetObjectPropertiesRequest<I>.ResponseCacheControl(Value: string): IAWS4DS3GetObjectPropertiesRequest<I>;
begin
  Result := Self;
  FAmazonOptions.ResponseCacheControl := Value;
end;

function TAWS4DS3GetObjectPropertiesRequest<I>.ResponseContentDisposition(Value: string): IAWS4DS3GetObjectPropertiesRequest<I>;
begin
  Result := Self;
  FAmazonOptions.ResponseContentDisposition := Value;
end;

function TAWS4DS3GetObjectPropertiesRequest<I>.ResponseContentEncoding(Value: string): IAWS4DS3GetObjectPropertiesRequest<I>;
begin
  Result := Self;
  FAmazonOptions.ResponseContentEncoding := Value;
end;

function TAWS4DS3GetObjectPropertiesRequest<I>.ResponseContentLanguage(Value: string): IAWS4DS3GetObjectPropertiesRequest<I>;
begin
  Result := Self;
  FAmazonOptions.ResponseContentLanguage := Value;
end;

function TAWS4DS3GetObjectPropertiesRequest<I>.ResponseContentType(Value: string): IAWS4DS3GetObjectPropertiesRequest<I>;
begin
  Result := Self;
  FAmazonOptions.ResponseContentType := Value;
end;

function TAWS4DS3GetObjectPropertiesRequest<I>.ResponseExpires(Value: string): IAWS4DS3GetObjectPropertiesRequest<I>;
begin
  Result := Self;
  FAmazonOptions.ResponseExpires := Value;
end;

end.
