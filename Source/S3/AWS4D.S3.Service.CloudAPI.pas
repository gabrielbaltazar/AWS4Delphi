unit AWS4D.S3.Service.CloudAPI;

interface

uses
  AWS4D.Service.Interfaces,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.Exceptions,
  AWS4D.S3.Model.ObjectInfo,
  AWS4D.S3.Model.DownloadObject.Response,
  AWS4D.Service.Base,
  Data.Cloud.CloudAPI,
  Data.Cloud.AmazonAPI,
  System.Classes,
  System.Generics.Collections,
  System.NetEncoding,
  System.StrUtils,
  System.SysUtils;

type TAWS4DS3ServiceCloudAPI = class(TAWS4DServiceBase, IAWS4DServiceS3)

  private
    FAmazonConnection: TAmazonConnectionInfo;
    FStorage: TAmazonStorageService;

    function FileBytes(AStream: TStream): TBytes;

    function GetRegion: TAmazonRegion;
    function GetBucket(ABucketName: String): TAmazonBucketResult;

    function Storage: TAmazonStorageService;
    procedure PrepareRequest;

    function S3Exception(AResponseInfo: TCloudResponseInfo): EAWS4DS3ModelException;

//    function
  protected
    function ListBuckets: TArray<String>;
    procedure CreateBucket(BucketName: String);
    procedure DeleteBucket(BucketName: String);
    function  ExistBucket(BucketName: String): Boolean;

    function ListObjects(BucketName: String): TList<IAWS4DS3ModelObjectInfo>;
    procedure CreateObject(Request: IAWS4DS3ModelCreateObjectRequest);
    procedure DeleteObject(Request: IAWS4DS3ModelDeleteObjectRequest);
    function ExistObject(Request: IAWS4DS3ModelObjectExistRequest): Boolean;
    function DownloadObject(Request: IAWS4DS3ModelDownloadObjectRequest): IAWS4DS3ModelDownloadObjectResponse;
  public
    constructor create;
    class function New: IAWS4DServiceS3;
    destructor Destroy; override;
end;

implementation

{ TAWS4DS3ServiceCloudAPI }

constructor TAWS4DS3ServiceCloudAPI.create;
begin
  FAmazonConnection := TAmazonConnectionInfo.Create(nil);
end;

procedure TAWS4DS3ServiceCloudAPI.createBucket(BucketName: String);
var
  response : TCloudResponseInfo;
begin
  response := TCloudResponseInfo.Create;
  try
    if not Storage.CreateBucket(BucketName, amzbaPrivate, GetRegion, response) then
      raise S3Exception(response);
  finally
    response.Free;
  end;
end;

procedure TAWS4DS3ServiceCloudAPI.createObject(Request: IAWS4DS3ModelCreateObjectRequest);
var
  response: TCloudResponseInfo;
  metaInfo: TStrings;
begin
  metaInfo     := nil;
  response := TCloudResponseInfo.Create;
  try
    metaInfo := TStringList.Create;
    metaInfo.Add('Content-type=text/xml');
    Request.FileStream.Position := 0;

    if not Storage.UploadObject(
        Request.BucketName,
        Request.ObjectName,
        FileBytes(Request.FileStream),
        False,
        metaInfo,
        nil,
        amzbaPrivate,
        response)
    then
      raise S3Exception(response);

  finally
    response.Free;
    metaInfo.Free;
  end;
end;

procedure TAWS4DS3ServiceCloudAPI.DeleteBucket(BucketName: String);
var
  response: TCloudResponseInfo;
begin
  response := TCloudResponseInfo.Create;
  try
    if not Storage.DeleteBucket(BucketName, response, GetRegion) then
      raise S3Exception(response);
  finally
    response.Free;
  end;
end;

procedure TAWS4DS3ServiceCloudAPI.DeleteObject(Request: IAWS4DS3ModelDeleteObjectRequest);
var
  response: TCloudResponseInfo;
begin
  response := TCloudResponseInfo.Create;
  try
    if not Storage.DeleteObject(Request.BucketName, Request.ObjectName, response) then
      raise S3Exception(response);
  finally
    response.Free;
  end;
end;

destructor TAWS4DS3ServiceCloudAPI.Destroy;
begin
  FAmazonConnection.Free;
  FStorage.Free;
  inherited;
end;

function TAWS4DS3ServiceCloudAPI.DownloadObject(Request: IAWS4DS3ModelDownloadObjectRequest): IAWS4DS3ModelDownloadObjectResponse;
var
  responseInfo: TCloudResponseInfo;
  memory: TMemoryStream;
begin
  memory := TMemoryStream.Create;
  try
    responseInfo := TCloudResponseInfo.Create;
    try
      if not Storage.GetObject(Request.BucketName, Request.ObjectName, memory, responseInfo) then
        raise S3Exception(responseInfo);

      result := TAWS4DS3ModelDownloadObjectResponse.New(memory);
    finally
      responseInfo.Free;
    end;
  except
    memory.Free;
    raise;
  end;
end;

function TAWS4DS3ServiceCloudAPI.ExistBucket(BucketName: String): Boolean;
var
  bucket: TAmazonBucketResult;
begin
  bucket := Storage.GetBucket(BucketName, nil, nil, GetRegion);
  try
    result := Assigned(bucket);
  finally
    bucket.Free;
  end;
end;

function TAWS4DS3ServiceCloudAPI.ExistObject(Request: IAWS4DS3ModelObjectExistRequest): Boolean;
var
  stream : TMemoryStream;
begin
  stream := TMemoryStream.Create;
  try
    result := Storage.GetObject(Request.BucketName,
                             Request.ObjectName,
                             stream);
  finally
    stream.Free;
  end;
end;

function TAWS4DS3ServiceCloudAPI.FileBytes(AStream: TStream): TBytes;
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

function TAWS4DS3ServiceCloudAPI.GetBucket(ABucketName: String): TAmazonBucketResult;
var
  response: TCloudResponseInfo;
begin
  response := TCloudResponseInfo.Create;
  try
    result := Storage.GetBucket(ABucketName, nil, response, GetRegion);
    if not Assigned(Result) then
      raise EResNotFound.CreateFmt('Bucket %s not found', [ABucketName]);
  finally
    response.Free;
  end;
end;

function TAWS4DS3ServiceCloudAPI.GetRegion: TAmazonRegion;
begin
  Result := Storage.GetRegionFromString(Region.toString);
end;

function TAWS4DS3ServiceCloudAPI.ListBuckets: TArray<String>;
var
  listBuckets: TStrings;
  response   : TCloudResponseInfo;
  i: Integer;
begin
  response := TCloudResponseInfo.Create;
  try
    listBuckets := Storage.ListBuckets(response);
    if listBuckets = nil then
      raise S3Exception(response);
    try
      SetLength(result, listBuckets.Count);
      for i := 0 to Pred(listBuckets.Count) do
        Result[i] := listBuckets.Names[i];
    finally
      listBuckets.Free;
    end;
  finally
    response.Free;
  end;
end;

function TAWS4DS3ServiceCloudAPI.ListObjects(BucketName: String): TList<IAWS4DS3ModelObjectInfo>;
var
  bucketInfo: TAmazonBucketResult;
  objectInfo: TAmazonObjectResult;
  response  : TCloudResponseInfo;
begin
  response := TCloudResponseInfo.Create;
  try
    bucketInfo := GetBucket(BucketName);
    try
      result := TList<IAWS4DS3ModelObjectInfo>.Create;
      try
        for objectInfo in bucketInfo.Objects do
          if objectInfo.Size > 0 then
            result.Add(TAWS4DS3ModelObjectInfo.CreateFromObjectResult(objectInfo));
      except
        result.Free;
        raise;
      end;
    finally
      bucketInfo.Free;
    end;
  finally
    response.Free;
  end;
end;


class function TAWS4DS3ServiceCloudAPI.New: IAWS4DServiceS3;
begin
  result := Self.create;
end;

procedure TAWS4DS3ServiceCloudAPI.PrepareRequest;
begin
  FreeAndNil(FStorage);
end;

function TAWS4DS3ServiceCloudAPI.S3Exception(AResponseInfo: TCloudResponseInfo): EAWS4DS3ModelException;
begin
  result := EAWS4DS3ModelException.create(AResponseInfo.StatusCode, AResponseInfo.StatusMessage);
end;

function TAWS4DS3ServiceCloudAPI.Storage: TAmazonStorageService;
begin
  if not Assigned(FStorage) then
  begin
    FAmazonConnection.AccountName := Self.AccessKeyID;
    FAmazonConnection.AccountKey  := Self.SecretKey;
    {$IF CompilerVersion >= 33.0}
      FAmazonConnection.Region := GetRegion;
    {$IFEND}

    FStorage := TAmazonStorageService.Create(FAmazonConnection);
    {$IF CompilerVersion < 33.0}
    FAmazonConnection.StorageEndpoint := FStorage.GetEndpointFromRegion(GetRegion)
    {$ENDIF}
  end;
  result := FStorage;
end;

end.
