unit AWS4D.S3.Service.CloudAPI;

interface

uses
  AWS4D.Core.Model.Types,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.DownloadObject.Response,
  AWS4D.S3.Model.ExistBucket.Response,
  AWS4D.S3.Model.ExistObject.Response,
  AWS4D.S3.Model.GetObjectProperties.Response,
  AWS4D.S3.Model.ListBuckets.Response,
  AWS4D.S3.Model.ListObjects.Response,
  AWS4D.S3.Model.ObjectInfo,
  Data.Cloud.CloudAPI,
  Data.Cloud.AmazonAPI,
  System.Classes,
  System.Generics.Collections,
  System.NetEncoding,
  System.StrUtils,
  System.SysUtils;

type
  TAWS4DS3ServiceCloudAPI<I: IInterface> = class(TInterfacedObject, IAWS4DS3Service<I>)
  private
    [Weak]
    FParent: I;
    FAccessKey: String;
    FSecretKey: String;
    FRegion: TAWS4DRegion;

    FAmazonConnection: TAmazonConnectionInfo;
    FStorage: TAmazonStorageService;
    FCloudResponse: TCloudResponseInfo;

    procedure AWSComponentsCreate;
    procedure AWSComponentsDestroy;

    procedure RaiseException;
    function FileBytes(AStream: TStream): TBytes;

    function GetACLType(AACLType: TAWS4DACLType): TAmazonACLType;
    function GetAmazonRegion: {$IF CompilerVersion <= 33.0} TAmazonRegion; {$ELSE} String; {$ENDIF}
    function GetBucket(ABucketName: String; AParams: TStrings = nil): TAmazonBucketResult;

  protected
    function AccessKey(Value: String): IAWS4DS3Service<I>;
    function SecretKey(Value: String): IAWS4DS3Service<I>;
    function Region(Value: String): IAWS4DS3Service<I>; overload;
    function Region(Value: TAWS4DRegion): IAWS4DS3Service<I>; overload;

    function BucketExist(Request: IAWS4DS3ExistBucketRequest<I>): IAWS4DS3ExistBucketResponse<I>;
    procedure CreateBucket(Request: IAWS4DS3CreateBucketRequest<I>);
    procedure DeleteBucket(Request: IAWS4DS3DeleteBucketRequest<I>);
    function DownloadObject(Request: IAWS4DS3DownloadObjectRequest<I>): IAWS4DS3DownloadObjectResponse<I>;
    function ExistObject(Request: IAWS4DS3ExistObjectRequest<I>): IAWS4DS3ExistObjectResponse<I>;
    function GetObjectProperties(Request: IAWS4DS3GetObjectPropertiesRequest<I>): IAWS4DS3GetObjectPropertiesResponse<I>;
    function ListBuckets: IAWS4DS3ListBucketsResponse<I>;
    function ListObjects(Request: IAWS4DS3ListObjectsRequest<I>): IAWS4DS3ListObjectsResponse<I>;
    procedure ObjectCreate(Request: IAWS4DS3CreateObjectRequest<I>);
    procedure ObjectDelete(Request: IAWS4DS3DeleteObjectRequest<I>);

    function Parent(Value: I): IAWS4DS3Service<I>;
    function &End: I;

  public
    constructor create;
    class function New: IAWS4DS3Service<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DS3ServiceCloudAPI<I> }

procedure TAWS4DS3ServiceCloudAPI<I>.AWSComponentsCreate;
begin
  AWSComponentsDestroy;

  FAmazonConnection := TAmazonConnectionInfo.Create(nil);
  FAmazonConnection.AccountName := FAccessKey;
  FAmazonConnection.AccountKey := FSecretKey;
  {$IF CompilerVersion >= 33.0}
    FAmazonConnection.Region := GetAmazonRegion;
  {$IFEND}

  FStorage := TAmazonStorageService.Create(FAmazonConnection);
  {$IF CompilerVersion < 33.0}
    FAmazonConnection.StorageEndpoint := FStorage.GetEndpointFromRegion(TAmazonRegion(Integer(FRegion)));
  {$ENDIF}

  FCloudResponse := TCloudResponseInfo.Create;
end;

procedure TAWS4DS3ServiceCloudAPI<I>.AWSComponentsDestroy;
begin
  FreeAndNil(FAmazonConnection);
  FreeAndNil(FStorage);
  FreeAndNil(FCloudResponse);
end;

function TAWS4DS3ServiceCloudAPI<I>.BucketExist(Request: IAWS4DS3ExistBucketRequest<I>): IAWS4DS3ExistBucketResponse<I>;
var
  bucket: TAmazonBucketResult;
  exist: Boolean;
begin
  AWSComponentsCreate;
  bucket := FStorage.GetBucket(Request.BucketName,
                               nil,
                               nil,
                               GetAmazonRegion);
  try
    exist := Assigned(bucket);
    result := TAWS4S3ExistBucketResponse<I>.New(FParent, exist);
  finally
    bucket.Free;
  end;
end;

constructor TAWS4DS3ServiceCloudAPI<I>.create;
begin
  FRegion := aws4dUSEast1;
end;

procedure TAWS4DS3ServiceCloudAPI<I>.CreateBucket(Request: IAWS4DS3CreateBucketRequest<I>);
begin
  AWSComponentsCreate;
  if not FStorage.CreateBucket(Request.BucketName,
                               amzbaPrivate,
                               GetAmazonRegion,
                               FCloudResponse)
  then
    RaiseException;
end;

procedure TAWS4DS3ServiceCloudAPI<I>.DeleteBucket(Request: IAWS4DS3DeleteBucketRequest<I>);
begin
  AWSComponentsCreate;
  if not FStorage.DeleteBucket(Request.BucketName,
                               FCloudResponse,
                               GetAmazonRegion)
  then
    RaiseException;
end;

destructor TAWS4DS3ServiceCloudAPI<I>.Destroy;
begin
  AWSComponentsDestroy;
  inherited;
end;

function TAWS4DS3ServiceCloudAPI<I>.DownloadObject(Request: IAWS4DS3DownloadObjectRequest<I>): IAWS4DS3DownloadObjectResponse<I>;
var
  stream: TMemoryStream;
begin
  AWSComponentsCreate;
  stream := TMemoryStream.Create;
  try
    if not FStorage.GetObject(
        Request.BucketName,
        Request.ObjectName,
        stream,
        FCloudResponse
        {$IF CompilerVersion >= 33.0}
        , GetAmazonRegion)
        {$ELSE}
        )
        {$ENDIF}
    then
      RaiseException;

    result := TAWS4S3DownloadObjectResponse<I>.New(FParent, stream);
  finally
    stream.Free;
  end;
end;

function TAWS4DS3ServiceCloudAPI<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DS3ServiceCloudAPI<I>.ExistObject(Request: IAWS4DS3ExistObjectRequest<I>): IAWS4DS3ExistObjectResponse<I>;
var
  exist: Boolean;
  stream: TMemoryStream;
begin
  AWSComponentsCreate;
  stream := TMemoryStream.Create;
  try
    exist := FStorage.GetObject(Request.BucketName,
                                Request.ObjectName,
                                stream);

    result := TAWS4S3ExistObjectResponse<I>.New(FParent, exist);
  finally
    stream.Free;
  end;
end;

function TAWS4DS3ServiceCloudAPI<I>.FileBytes(AStream: TStream): TBytes;
var
  fileReader: TBinaryReader;
begin
  fileReader := TBinaryReader.Create(AStream);
  try
    result := fileReader.ReadBytes(AStream.Size);
  finally
    fileReader.Free;
  end;
end;

function TAWS4DS3ServiceCloudAPI<I>.GetACLType(AACLType: TAWS4DACLType): TAmazonACLType;
begin
  case AACLType of
    aws4dNotSpecified: Result := amzbaNotSpecified;
    aws4dPrivate: Result := amzbaPrivate;
    aws4dPublicRead: Result := amzbaPublicRead;
    aws4dPublicReadWrite: Result := amzbaPublicReadWrite;
    aws4dAuthenticatedRead: Result := amzbaAuthenticatedRead;
    aws4dBucketOwnerRead: Result := amzbaBucketOwnerRead;
    aws4dBucketOwnerFullControl: Result := amzbaBucketOwnerFullControl;
    aws4dAWSExecRead: Result := amzbaAWSExecRead;
    aws4dLogDeliveryWrite: Result := amzbaLogDeliveryWrite;
  end;
end;

function TAWS4DS3ServiceCloudAPI<I>.GetAmazonRegion: {$IF CompilerVersion <= 33.0} TAmazonRegion; {$ELSE} String; {$ENDIF}
begin
  {$IF CompilerVersion <= 33.0}
    result := TAmazonRegion(Integer(FRegion));
  {$ELSE}
    result := FRegion.toString;
  {$ENDIF}
end;

function TAWS4DS3ServiceCloudAPI<I>.GetBucket(ABucketName: String; AParams: TStrings): TAmazonBucketResult;
begin
  AWSComponentsCreate;
  result := FStorage.GetBucket(ABucketName,
                               AParams,
                               FCloudResponse,
                               GetAmazonRegion);
  if not Assigned(Result) then
    raise EResNotFound.CreateFmt('Bucket %s not found', [ABucketName]);
end;

function TAWS4DS3ServiceCloudAPI<I>.GetObjectProperties(Request: IAWS4DS3GetObjectPropertiesRequest<I>): IAWS4DS3GetObjectPropertiesResponse<I>;
var
  properties: TStrings;
  metaData: TStrings;
begin
  AWSComponentsCreate;
  properties := nil;
  metaData := nil;
  try
    if not FStorage.GetObjectProperties(
        Request.BucketName,
        Request.ObjectName,
        Request.OptionParams,
        properties,
        metaData,
        FCloudResponse)
    then
      RaiseException;

    result := TAWS4S3GetObjectPropertiesResponse<I>.New(FParent, properties, metaData);
  finally
    properties.Free;
    metaData.Free;
  end;
end;

function TAWS4DS3ServiceCloudAPI<I>.AccessKey(Value: String): IAWS4DS3Service<I>;
begin
  result := Self;
  FAccessKey := Value;
end;

function TAWS4DS3ServiceCloudAPI<I>.Region(Value: String): IAWS4DS3Service<I>;
begin
  result := Self;
  FRegion.fromString(Value);
end;

function TAWS4DS3ServiceCloudAPI<I>.ListBuckets: IAWS4DS3ListBucketsResponse<I>;
var
  list: TStrings;
begin
  AWSComponentsCreate;
  list := FStorage.ListBuckets(FCloudResponse);
  try
    if list = nil then
      RaiseException;

    result := TAWS4DS3ListBucketsResponse<I>.New(FParent, list);
  finally
    list.Free;
  end;
end;

function TAWS4DS3ServiceCloudAPI<I>.ListObjects(Request: IAWS4DS3ListObjectsRequest<I>): IAWS4DS3ListObjectsResponse<I>;
var
  params: TStrings;
  bucketInfo: TAmazonBucketResult;
  objectInfo: TAmazonObjectResult;
  list: TList<IAWS4DS3ModelObjectInfo>;
begin
  AWSComponentsCreate;
  params := TStringList.Create;
  try
    list := TList<IAWS4DS3ModelObjectInfo>.Create;
    try
      params.Values['prefix'] := Request.Prefix;
      params.Values['max-keys'] := Request.MaxKeys.ToString;
      params.Values['marker'] := Request.Marker;
      bucketInfo := GetBucket(Request.BucketName, params);
      try
        for objectInfo in bucketInfo.Objects do
          if objectInfo.Size > 0 then
            list.Add(TAWS4DS3ModelObjectInfo.CreateFromObjectResult(objectInfo));

        while (bucketInfo.IsTruncated) and (Request.FullBucket) do
        begin
          params.Values['prefix'] := Request.Prefix;
          params.Values['max-keys'] := Request.MaxKeys.ToString;
          params.Values['marker'] := bucketInfo.Objects.Last.Name;
          FreeAndNil(bucketInfo);
          bucketInfo := GetBucket(Request.BucketName, params);

          for objectInfo in bucketInfo.Objects do
            if objectInfo.Size > 0 then
              list.Add(TAWS4DS3ModelObjectInfo.CreateFromObjectResult(objectInfo));
        end;

        result := TAWS4S3ListObjectsResponse<I>.New(FParent, list);
      finally
        bucketInfo.Free;
      end;
    except
      list.Free;
      raise;
    end;
  finally
    params.Free;
  end;
end;

class function TAWS4DS3ServiceCloudAPI<I>.New: IAWS4DS3Service<I>;
begin
  result := Self.create;
end;

procedure TAWS4DS3ServiceCloudAPI<I>.ObjectCreate(Request: IAWS4DS3CreateObjectRequest<I>);
var
  LHeaders: TStrings;
begin
  LHeaders := TStringList.Create;
  try
    AWSComponentsCreate;
    Request.FileStream.Position := 0;
    if Request.ContentType <> EmptyStr then
      LHeaders.Values['Content-type'] := Request.ContentType;

    if not FStorage.UploadObject(
        Request.BucketName,
        Request.ObjectName,
        FileBytes(Request.FileStream),
        False,
        Request.MetaInfo,
        LHeaders,
        GetACLType(Request.ACLType),
        FCloudResponse)
    then
      RaiseException;
  finally
    LHeaders.Free;
  end;
end;

procedure TAWS4DS3ServiceCloudAPI<I>.ObjectDelete(Request: IAWS4DS3DeleteObjectRequest<I>);
begin
  AWSComponentsCreate;
  if not FStorage.DeleteObject(
      Request.BucketName,
      Request.ObjectName,
      FCloudResponse)
  then
    RaiseException;
end;

function TAWS4DS3ServiceCloudAPI<I>.Parent(Value: I): IAWS4DS3Service<I>;
begin
  result := Self;
  FParent := Value;
end;

procedure TAWS4DS3ServiceCloudAPI<I>.RaiseException;
begin
  raise Exception.CreateFmt('%s: %s', [FCloudResponse.StatusCode.ToString,
                                       FCloudResponse.StatusMessage]);
end;

function TAWS4DS3ServiceCloudAPI<I>.Region(Value: TAWS4DRegion): IAWS4DS3Service<I>;
begin
  result := Self;
  FRegion := Value;
end;

function TAWS4DS3ServiceCloudAPI<I>.SecretKey(Value: String): IAWS4DS3Service<I>;
begin
  result := Self;
  FSecretKey := Value;
end;

end.
