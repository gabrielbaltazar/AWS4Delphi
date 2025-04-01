unit AWS4D.S3.Service.CloudAPI;

interface

uses
  System.Classes,
  System.Generics.Collections,
  System.NetEncoding,
  System.StrUtils,
  System.SysUtils,
  Data.Cloud.CloudAPI,
  Data.Cloud.AmazonAPI,
  AWS4D.Core.Model.Types,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.DownloadObject.Response,
  AWS4D.S3.Model.ExistBucket.Response,
  AWS4D.S3.Model.ExistObject.Response,
  AWS4D.S3.Model.GetObjectProperties.Response,
  AWS4D.S3.Model.ListBuckets.Response,
  AWS4D.S3.Model.ListObjects.Response,
  AWS4D.S3.Model.ObjectInfo;

type
  TAWS4DS3ServiceCloudAPI<I: IInterface> = class(TInterfacedObject, IAWS4DS3Service<I>)
  private
    [Weak]
    FParent: I;
    FAccessKey: string;
    FSecretKey: string;
    FRegion: TAWS4DRegion;

    FAmazonConnection: TAmazonConnectionInfo;
    FStorage: TAmazonStorageService;
    FCloudResponse: TCloudResponseInfo;

    procedure AWSComponentsCreate;
    procedure AWSComponentsDestroy;

    procedure RaiseException;
    function FileBytes(AStream: TStream): TBytes;

    function GetACLType(AACLType: TAWS4DACLType): TAmazonACLType;
    function GetAmazonRegion: {$IF CompilerVersion <= 33.0} TAmazonRegion; {$ELSE} string; {$ENDIF}
    function GetBucket(ABucketName: string; AParams: TStrings = nil): TAmazonBucketResult;
  protected
    function AccessKey(AValue: string): IAWS4DS3Service<I>;
    function SecretKey(AValue: string): IAWS4DS3Service<I>;
    function Region(AValue: string): IAWS4DS3Service<I>; overload;
    function Region(AValue: TAWS4DRegion): IAWS4DS3Service<I>; overload;

    function BucketExist(ARequest: IAWS4DS3ExistBucketRequest<I>): IAWS4DS3ExistBucketResponse<I>;
    procedure CreateBucket(ARequest: IAWS4DS3CreateBucketRequest<I>);
    procedure DeleteBucket(ARequest: IAWS4DS3DeleteBucketRequest<I>);
    function DownloadObject(ARequest: IAWS4DS3DownloadObjectRequest<I>): IAWS4DS3DownloadObjectResponse<I>;
    function ExistObject(ARequest: IAWS4DS3ExistObjectRequest<I>): IAWS4DS3ExistObjectResponse<I>;
    function GetObjectProperties(ARequest: IAWS4DS3GetObjectPropertiesRequest<I>): IAWS4DS3GetObjectPropertiesResponse<I>;
    function ListBuckets: IAWS4DS3ListBucketsResponse<I>;
    function ListObjects(ARequest: IAWS4DS3ListObjectsRequest<I>): IAWS4DS3ListObjectsResponse<I>;
    procedure ObjectCreate(ARequest: IAWS4DS3CreateObjectRequest<I>);
    procedure ObjectDelete(ARequest: IAWS4DS3DeleteObjectRequest<I>);

    function Parent(AValue: I): IAWS4DS3Service<I>;
    function &End: I;
  public
    constructor Create;
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

function TAWS4DS3ServiceCloudAPI<I>.BucketExist(ARequest: IAWS4DS3ExistBucketRequest<I>): IAWS4DS3ExistBucketResponse<I>;
var
  LBucket: TAmazonBucketResult;
  LExist: Boolean;
begin
  AWSComponentsCreate;
  LBucket := FStorage.GetBucket(ARequest.BucketName, nil, nil, GetAmazonRegion);
  try
    LExist := Assigned(LBucket);
    Result := TAWS4S3ExistBucketResponse<I>.New(FParent, LExist);
  finally
    LBucket.Free;
  end;
end;

constructor TAWS4DS3ServiceCloudAPI<I>.Create;
begin
  FRegion := aws4dUSEast1;
end;

procedure TAWS4DS3ServiceCloudAPI<I>.CreateBucket(ARequest: IAWS4DS3CreateBucketRequest<I>);
begin
  AWSComponentsCreate;
  if not FStorage.CreateBucket(ARequest.BucketName, amzbaPrivate, GetAmazonRegion, FCloudResponse) then
    RaiseException;
end;

procedure TAWS4DS3ServiceCloudAPI<I>.DeleteBucket(ARequest: IAWS4DS3DeleteBucketRequest<I>);
begin
  AWSComponentsCreate;
  if not FStorage.DeleteBucket(ARequest.BucketName, FCloudResponse, GetAmazonRegion) then
    RaiseException;
end;

destructor TAWS4DS3ServiceCloudAPI<I>.Destroy;
begin
  AWSComponentsDestroy;
  inherited;
end;

function TAWS4DS3ServiceCloudAPI<I>.DownloadObject(ARequest: IAWS4DS3DownloadObjectRequest<I>): IAWS4DS3DownloadObjectResponse<I>;
var
  LStream: TMemoryStream;
  LSuccess: Boolean;
begin
  AWSComponentsCreate;
  LStream := TMemoryStream.Create;
  try
{$IF CompilerVersion >= 33.0}
    LSuccess := FStorage.GetObject(ARequest.BucketName, ARequest.ObjectName, LStream, FCloudResponse, GetAmazonRegion);
{$ELSE}
    LSuccess := FStorage.GetObject(ARequest.BucketName, ARequest.ObjectName, LStream, FCloudResponse);
{$ENDIF}
    if not LSuccess then
      RaiseException;
    Result := TAWS4S3DownloadObjectResponse<I>.New(FParent, LStream);
  finally
    LStream.Free;
  end;
end;

function TAWS4DS3ServiceCloudAPI<I>.&End: I;
begin
  Result := FParent;
end;

function TAWS4DS3ServiceCloudAPI<I>.ExistObject(ARequest: IAWS4DS3ExistObjectRequest<I>): IAWS4DS3ExistObjectResponse<I>;
var
  LExist: Boolean;
  LStream: TMemoryStream;
begin
  AWSComponentsCreate;
  LStream := TMemoryStream.Create;
  try
    LExist := FStorage.GetObject(ARequest.BucketName, ARequest.ObjectName, LStream);
    Result := TAWS4S3ExistObjectResponse<I>.New(FParent, LExist);
  finally
    LStream.Free;
  end;
end;

function TAWS4DS3ServiceCloudAPI<I>.FileBytes(AStream: TStream): TBytes;
var
  LFileReader: TBinaryReader;
begin
  LFileReader := TBinaryReader.Create(AStream);
  try
    Result := LFileReader.ReadBytes(AStream.Size);
  finally
    LFileReader.Free;
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

function TAWS4DS3ServiceCloudAPI<I>.GetAmazonRegion: {$IF CompilerVersion <= 33.0} TAmazonRegion; {$ELSE} string; {$ENDIF}
begin
{$IF CompilerVersion <= 33.0}
  Result := TAmazonRegion(Integer(FRegion));
{$ELSE}
  Result := FRegion.ToString;
{$ENDIF}
end;

function TAWS4DS3ServiceCloudAPI<I>.GetBucket(ABucketName: string; AParams: TStrings): TAmazonBucketResult;
begin
  AWSComponentsCreate;
  Result := FStorage.GetBucket(ABucketName, AParams, FCloudResponse, GetAmazonRegion);
  if not Assigned(Result) then
    raise EResNotFound.CreateFmt('Bucket %s not found', [ABucketName]);
end;

function TAWS4DS3ServiceCloudAPI<I>.GetObjectProperties(ARequest: IAWS4DS3GetObjectPropertiesRequest<I>): IAWS4DS3GetObjectPropertiesResponse<I>;
var
  LProperties: Tstrings;
  LMetaData: Tstrings;
begin
  AWSComponentsCreate;
  LProperties := nil;
  LMetaData := nil;
  try
    if not FStorage.GetObjectProperties(ARequest.BucketName, ARequest.ObjectName, ARequest.OptionParams,
      LProperties, LMetaData, FCloudResponse) then
      RaiseException;

    Result := TAWS4S3GetObjectPropertiesResponse<I>.New(FParent, LProperties, LMetaData);
  finally
    LProperties.Free;
    LMetaData.Free;
  end;
end;

function TAWS4DS3ServiceCloudAPI<I>.AccessKey(AValue: string): IAWS4DS3Service<I>;
begin
  Result := Self;
  FAccessKey := AValue;
end;

function TAWS4DS3ServiceCloudAPI<I>.Region(AValue: string): IAWS4DS3Service<I>;
begin
  Result := Self;
  FRegion.fromstring(AValue);
end;

function TAWS4DS3ServiceCloudAPI<I>.ListBuckets: IAWS4DS3ListBucketsResponse<I>;
var
  LList: TStrings;
begin
  AWSComponentsCreate;
  LList := FStorage.ListBuckets(FCloudResponse);
  try
    if LList = nil then
      RaiseException;

    Result := TAWS4DS3ListBucketsResponse<I>.New(FParent, LList);
  finally
    LList.Free;
  end;
end;

function TAWS4DS3ServiceCloudAPI<I>.ListObjects(ARequest: IAWS4DS3ListObjectsRequest<I>): IAWS4DS3ListObjectsResponse<I>;
var
  LParams: Tstrings;
  LBucketInfo: TAmazonBucketResult;
  LObjectInfo: TAmazonObjectResult;
  LList: TList<IAWS4DS3ModelObjectInfo>;
begin
  AWSComponentsCreate;
  LParams := TstringList.Create;
  try
    LList := TList<IAWS4DS3ModelObjectInfo>.Create;
    try
      LParams.Values['prefix'] := ARequest.Prefix;
      LParams.Values['max-keys'] := ARequest.MaxKeys.ToString;
      LParams.Values['marker'] := ARequest.Marker;
      LBucketInfo := GetBucket(ARequest.BucketName, LParams);
      try
        for LObjectInfo in LBucketInfo.Objects do
          if LObjectInfo.Size > 0 then
            LList.Add(TAWS4DS3ModelObjectInfo.CreateFromObjectResult(LObjectInfo));

        while (LBucketInfo.IsTruncated) and (ARequest.FullBucket) do
        begin
          LParams.Values['prefix'] := ARequest.Prefix;
          LParams.Values['max-keys'] := ARequest.MaxKeys.Tostring;
          LParams.Values['marker'] := LBucketInfo.Objects.Last.Name;
          FreeAndNil(LBucketInfo);
          LBucketInfo := GetBucket(ARequest.BucketName, LParams);

          for LObjectInfo in LBucketInfo.Objects do
            if LObjectInfo.Size > 0 then
              LList.Add(TAWS4DS3ModelObjectInfo.CreateFromObjectResult(LObjectInfo));
        end;

        Result := TAWS4S3ListObjectsResponse<I>.New(FParent, LList);
      finally
        LBucketInfo.Free;
      end;
    except
      LList.Free;
      raise;
    end;
  finally
    LParams.Free;
  end;
end;

class function TAWS4DS3ServiceCloudAPI<I>.New: IAWS4DS3Service<I>;
begin
  Result := Self.Create;
end;

procedure TAWS4DS3ServiceCloudAPI<I>.ObjectCreate(ARequest: IAWS4DS3CreateObjectRequest<I>);
var
  LHeaders: TStrings;
begin
  LHeaders := TStringList.Create;
  try
    AWSComponentsCreate;
    ARequest.FileStream.Position := 0;
    if ARequest.ContentType <> EmptyStr then
      LHeaders.Values['Content-type'] := ARequest.ContentType;

    if not FStorage.UploadObject(ARequest.BucketName, ARequest.ObjectName, FileBytes(ARequest.FileStream),
      False, ARequest.MetaInfo, LHeaders, GetACLType(ARequest.ACLType), FCloudResponse) then
      RaiseException;
  finally
    LHeaders.Free;
  end;
end;

procedure TAWS4DS3ServiceCloudAPI<I>.ObjectDelete(ARequest: IAWS4DS3DeleteObjectRequest<I>);
begin
  AWSComponentsCreate;
  if not FStorage.DeleteObject(ARequest.BucketName, ARequest.ObjectName, FCloudResponse) then
    RaiseException;
end;

function TAWS4DS3ServiceCloudAPI<I>.Parent(AValue: I): IAWS4DS3Service<I>;
begin
  Result := Self;
  FParent := AValue;
end;

procedure TAWS4DS3ServiceCloudAPI<I>.RaiseException;
begin
  raise Exception.CreateFmt('%s: %s', [FCloudResponse.StatusCode.ToString,
    FCloudResponse.StatusMessage]);
end;

function TAWS4DS3ServiceCloudAPI<I>.Region(AValue: TAWS4DRegion): IAWS4DS3Service<I>;
begin
  Result := Self;
  FRegion := AValue;
end;

function TAWS4DS3ServiceCloudAPI<I>.SecretKey(AValue: string): IAWS4DS3Service<I>;
begin
  Result := Self;
  FSecretKey := AValue;
end;

end.
