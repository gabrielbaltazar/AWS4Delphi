unit AWS4D.S3.Facade;

interface

uses
  AWS4D.S3.Facade.Interfaces,
  AWS4D.S3.Facade.ListBuckets,
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Service.CloudAPI,
  AWS4D.Core.Model.Types,
  System.SysUtils,
  System.Classes;

type TAWS4DS3Facade = class(TInterfacedObject, IAWS4DS3Facade)

  private
    FAccessKey: String;
    FSecretKey: String;
    FRegion: TAWS4DRegion;

    FListBuckets: IAWS4DS3FacadeListBuckets;

    function S3Service<I: IInterface>: IAWS4DS3Service<I>;

  protected
    function AccessKey(Value: String): IAWS4DS3Facade;
    function SecretKey(Value: String): IAWS4DS3Facade;
    function Region(Value: String): IAWS4DS3Facade; overload;
    function Region(Value: TAWS4DRegion): IAWS4DS3Facade; overload;

    function ListBuckets: IAWS4DS3FacadeListBuckets;

  public
    constructor create;
    class function New: IAWS4DS3Facade;
end;

implementation

{ TAWS4DS3Facade }

function TAWS4DS3Facade.AccessKey(Value: String): IAWS4DS3Facade;
begin
  result := Self;
  FAccessKey := Value;
end;

constructor TAWS4DS3Facade.create;
begin

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

  result := FListBuckets;
end;

class function TAWS4DS3Facade.New: IAWS4DS3Facade;
begin
  result := Self.create;
end;

function TAWS4DS3Facade.Region(Value: String): IAWS4DS3Facade;
begin
  result := Self;
  FRegion.fromString(Value);
end;

function TAWS4DS3Facade.Region(Value: TAWS4DRegion): IAWS4DS3Facade;
begin
  result := Self;
  FRegion := Value;
end;

function TAWS4DS3Facade.S3Service<I>: IAWS4DS3Service<I>;
begin
  result := TAWS4DS3ServiceCloudAPI<I>.New;
  result
    .AccessKey(FAccessKey)
    .SecretKey(FSecretKey)
    .Region(FRegion);
end;

function TAWS4DS3Facade.SecretKey(Value: String): IAWS4DS3Facade;
begin
  result := Self;
  FSecretKey := Value;
end;

end.
