unit AWS4D.S3.Service.CloudAPI;

interface

uses
  AWS4D.Core.Model.Types,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.ListBuckets.Response,
  Data.Cloud.CloudAPI,
  Data.Cloud.AmazonAPI,
  System.Classes,
  System.Generics.Collections,
  System.NetEncoding,
  System.StrUtils,
  System.SysUtils;

type TAWS4DS3ServiceCloudAPI<I: IInterface> = class(TInterfacedObject, IAWS4DS3Service<I>)

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

  protected
    function AccessKey(Value: String): IAWS4DS3Service<I>;
    function SecretKey(Value: String): IAWS4DS3Service<I>;
    function Region(Value: String): IAWS4DS3Service<I>; overload;
    function Region(Value: TAWS4DRegion): IAWS4DS3Service<I>; overload;

    function ListBuckets: IAWS4DS3ListBucketsResponse<I>;

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
  FAmazonConnection := TAmazonConnectionInfo.Create(nil);
  FAmazonConnection.AccountName := FAccessKey;
  FAmazonConnection.AccountKey := FSecretKey;
  {$IF CompilerVersion >= 33.0}
    FAmazonConnection.Region := FRegion.toString;
  {$IFEND}

  FStorage := TAmazonStorageService.Create(FAmazonConnection);
  {$IF CompilerVersion < 33.0}
    FAmazonConnection.StorageEndpoint := FStorage.GetEndpointFromRegion(FRegion.toString);
  {$ENDIF}

  FCloudResponse := TCloudResponseInfo.Create;
end;

procedure TAWS4DS3ServiceCloudAPI<I>.AWSComponentsDestroy;
begin
  FreeAndNil(FAmazonConnection);
  FreeAndNil(FStorage);
  FreeAndNil(FCloudResponse);
end;

constructor TAWS4DS3ServiceCloudAPI<I>.create;
begin
end;

destructor TAWS4DS3ServiceCloudAPI<I>.Destroy;
begin
  AWSComponentsDestroy;
  inherited;
end;

function TAWS4DS3ServiceCloudAPI<I>.&End: I;
begin
  result := FParent;
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
  try
    list := FStorage.ListBuckets(FCloudResponse);
    try
      if list = nil then
        RaiseException;

      result := TAWS4DS3ListBucketsResponse<I>.New(FParent, list);
    finally
      list.Free;
    end;
  finally
    AWSComponentsDestroy;
  end;
end;

class function TAWS4DS3ServiceCloudAPI<I>.New: IAWS4DS3Service<I>;
begin
  result := Self.create;
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
