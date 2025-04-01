unit AWS4D.S3.Facade;

interface

uses
  System.SysUtils,
  System.Classes,
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Facade.ExistBucket,
  AWS4D.S3.Facade.CreateBucket,
  AWS4D.S3.Facade.DeleteBucket,
  AWS4D.S3.Facade.DownloadObject,
  AWS4D.S3.Facade.ExistObject,
  AWS4D.S3.Facade.GetObjectProperties,
  AWS4D.S3.Facade.ListBuckets,
  AWS4D.S3.Facade.ListObjects,
  AWS4D.S3.Facade.CreateObject,
  AWS4D.S3.Facade.DeleteObject,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Service.CloudAPI,
  AWS4D.Core.Model.Types;

type
  TAWS4DS3Facade = class(TInterfacedObject, IAWS4DS3Facade)
  private
    FAccessKey: string;
    FSecretKey: string;
    FRegion: TAWS4DRegion;

    FCreateBucket: IAWS4DS3FacadeCreateBucket;
    FCreateObject: IAWS4DS3FacadeCreateObject;
    FDeleteBucket: IAWS4DS3FacadeDeleteBucket;
    FDeleteObject: IAWS4DS3FacadeDeleteObject;
    FDownloadObject: IAWS4DS3FacadeDownloadObject;
    FExistBucket: IAWS4DS3FacadeExistBucket;
    FExistObject: IAWS4DS3FacadeExistObject;
    FGetObjectProperties: IAWS4DS3FacadeGetObjectProperties;
    FListBuckets: IAWS4DS3FacadeListBuckets;
    FListObjects: IAWS4DS3FacadeListObjects;

    function S3Service<I: IInterface>: IAWS4DS3Service<I>;
  protected
    function AccessKey(AValue: string): IAWS4DS3Facade;
    function SecretKey(AValue: string): IAWS4DS3Facade;
    function Region(AValue: string): IAWS4DS3Facade; overload;
    function Region(AValue: TAWS4DRegion): IAWS4DS3Facade; overload;

    function CreateBucket: IAWS4DS3FacadeCreateBucket;
    function CreateObject: IAWS4DS3FacadeCreateObject;
    function DeleteBucket: IAWS4DS3FacadeDeleteBucket;
    function DeleteObject: IAWS4DS3FacadeDeleteObject;
    function DownloadObject: IAWS4DS3FacadeDownloadObject;
    function ExistObject: IAWS4DS3FacadeExistObject;
    function ExistBucket: IAWS4DS3FacadeExistBucket;
    function GetObjectProperties: IAWS4DS3FacadeGetObjectProperties;
    function ListBuckets: IAWS4DS3FacadeListBuckets;
    function ListObjects: IAWS4DS3FacadeListObjects;
  public
    constructor Create;
    class function New: IAWS4DS3Facade;
  end;

implementation

{ TAWS4DS3Facade }

function TAWS4DS3Facade.AccessKey(AValue: string): IAWS4DS3Facade;
begin
  Result := Self;
  FAccessKey := AValue;
end;

function TAWS4DS3Facade.ExistBucket: IAWS4DS3FacadeExistBucket;
var
  LService: IAWS4DS3Service<IAWS4DS3FacadeExistBucket>;
begin
  if not Assigned(FExistBucket) then
  begin
    LService := Self.S3Service<IAWS4DS3FacadeExistBucket>;
    FExistBucket := TAWS4DS3FacadeExistBucket.New(LService);
  end;
  Result := FExistBucket;
end;

function TAWS4DS3Facade.ExistObject: IAWS4DS3FacadeExistObject;
var
  service: IAWS4DS3Service<IAWS4DS3FacadeExistObject>;
begin
  if not Assigned(FExistObject) then
  begin
    service := Self.S3Service<IAWS4DS3FacadeExistObject>;
    FExistObject := TAWS4DS3FacadeExistObject.New(service);
  end;

  Result := FExistObject;
end;

function TAWS4DS3Facade.GetObjectProperties: IAWS4DS3FacadeGetObjectProperties;
var
  service: IAWS4DS3Service<IAWS4DS3FacadeGetObjectProperties>;
begin
  if not Assigned(FGetObjectProperties) then
  begin
    service := Self.S3Service<IAWS4DS3FacadeGetObjectProperties>;
    FGetObjectProperties := TAWS4DS3FacadeGetObjectProperties.New(service);
  end;

  Result := FGetObjectProperties;
end;

constructor TAWS4DS3Facade.Create;
begin
  FRegion := aws4dUSEast1;
end;

function TAWS4DS3Facade.CreateBucket: IAWS4DS3FacadeCreateBucket;
var
  service: IAWS4DS3Service<IAWS4DS3FacadeCreateBucket>;
begin
  if not Assigned(FCreateBucket) then
  begin
    service := Self.S3Service<IAWS4DS3FacadeCreateBucket>;
    FCreateBucket := TAWS4DS3FacadeCreateBucket.New(service);
  end;

  Result := FCreateBucket;
end;

function TAWS4DS3Facade.DeleteBucket: IAWS4DS3FacadeDeleteBucket;
var
  service: IAWS4DS3Service<IAWS4DS3FacadeDeleteBucket>;
begin
  if not Assigned(FDeleteBucket) then
  begin
    service := Self.S3Service<IAWS4DS3FacadeDeleteBucket>;
    FDeleteBucket := TAWS4DS3FacadeDeleteBucket.New(service);
  end;

  Result := FDeleteBucket;
end;

function TAWS4DS3Facade.DownloadObject: IAWS4DS3FacadeDownloadObject;
var
  service: IAWS4DS3Service<IAWS4DS3FacadeDownloadObject>;
begin
  if not Assigned(FDownloadObject) then
  begin
    service := Self.S3Service<IAWS4DS3FacadeDownloadObject>;
    FDownloadObject := TAWS4DS3FacadeDownloadObject.New(service);
  end;

  Result := FDownloadObject;
end;

function TAWS4DS3Facade.ListBuckets: IAWS4DS3FacadeListBuckets;
var
  service: IAWS4DS3Service<IAWS4DS3FacadeListBuckets>;
begin
  if not Assigned(FListBuckets) then
  begin
    service := Self.S3Service<IAWS4DS3FacadeListBuckets>;
    FListBuckets := TAWS4DS3FacadeListBuckets.New(service);
  end;

  Result := FListBuckets;
end;

function TAWS4DS3Facade.ListObjects: IAWS4DS3FacadeListObjects;
var
  service: IAWS4DS3Service<IAWS4DS3FacadeListObjects>;
begin
  if not Assigned(FListObjects) then
  begin
    service := Self.S3Service<IAWS4DS3FacadeListObjects>;
    FListObjects := TAWS4DS3FacadeListObjects.New(service);
  end;

  Result := FListObjects;
end;

class function TAWS4DS3Facade.New: IAWS4DS3Facade;
begin
  Result := Self.Create;
end;

function TAWS4DS3Facade.CreateObject: IAWS4DS3FacadeCreateObject;
var
  service: IAWS4DS3Service<IAWS4DS3FacadeCreateObject>;
begin
  if not Assigned(FCreateObject) then
  begin
    service := Self.S3Service<IAWS4DS3FacadeCreateObject>;
    FCreateObject := TAWS4DS3FacadeCreateObject.New(service);
  end;

  Result := FCreateObject;
end;

function TAWS4DS3Facade.DeleteObject: IAWS4DS3FacadeDeleteObject;
var
  service: IAWS4DS3Service<IAWS4DS3FacadeDeleteObject>;
begin
  if not Assigned(FDeleteObject) then
  begin
    service := Self.S3Service<IAWS4DS3FacadeDeleteObject>;
    FDeleteObject := TAWS4DS3FacadeDeleteObject.New(service);
  end;

  Result := FDeleteObject;
end;

function TAWS4DS3Facade.Region(AValue: string): IAWS4DS3Facade;
begin
  Result := Self;
  FRegion.fromstring(AValue);
end;

function TAWS4DS3Facade.Region(AValue: TAWS4DRegion): IAWS4DS3Facade;
begin
  Result := Self;
  FRegion := AValue;
end;

function TAWS4DS3Facade.S3Service<I>: IAWS4DS3Service<I>;
begin
  Result := TAWS4DS3ServiceCloudAPI<I>.New;
  Result
    .AccessKey(FAccessKey)
    .SecretKey(FSecretKey)
    .Region(FRegion);
end;

function TAWS4DS3Facade.SecretKey(AValue: string): IAWS4DS3Facade;
begin
  Result := Self;
  FSecretKey := AValue;
end;

end.
