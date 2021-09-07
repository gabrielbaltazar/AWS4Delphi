unit AWS4D.S3.Model.ListObjects.Request;

interface

uses
  AWS4D.S3.Model.Interfaces;

type TAWS4DS3ListObjectsRequest<I: IInterface> = class(TInterfacedObject, IAWS4DS3ListObjectsRequest<I>)

  private
    [Weak]
    FParent: I;
    FBucketName: String;
    FMarker: String;
    FPrefix: String;
    FMaxKeys: Integer;
    FFullBucket: Boolean;

  protected
    function BucketName(Value: String): IAWS4DS3ListObjectsRequest<I>; overload;
    function Marker(Value: string): IAWS4DS3ListObjectsRequest<I>; overload;
    function Prefix(Value: string): IAWS4DS3ListObjectsRequest<I>; overload;
    function MaxKeys(Value: Integer): IAWS4DS3ListObjectsRequest<I>; overload;
    function FullBucket(Value: Boolean): IAWS4DS3ListObjectsRequest<I>; overload;

    function BucketName: string; overload;
    function Marker: string; overload;
    function Prefix: string; overload;
    function MaxKeys: Integer; overload;
    function FullBucket: Boolean; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DS3ListObjectsRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DS3ListObjectsRequest<I>.BucketName(Value: String): IAWS4DS3ListObjectsRequest<I>;
begin
  result := Self;
  FBucketName := Value;
end;

function TAWS4DS3ListObjectsRequest<I>.BucketName: string;
begin
  result := FBucketName;
end;

constructor TAWS4DS3ListObjectsRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FMaxKeys := 1000;
  FFullBucket := False;
end;

destructor TAWS4DS3ListObjectsRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DS3ListObjectsRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DS3ListObjectsRequest<I>.FullBucket: Boolean;
begin
  result := FFullBucket;
end;

function TAWS4DS3ListObjectsRequest<I>.FullBucket(Value: Boolean): IAWS4DS3ListObjectsRequest<I>;
begin
  result := Self;
  FFullBucket := Value;
end;

function TAWS4DS3ListObjectsRequest<I>.Marker(Value: string): IAWS4DS3ListObjectsRequest<I>;
begin
  result := Self;
  FMarker := Value;
end;

function TAWS4DS3ListObjectsRequest<I>.Marker: string;
begin
  result := FMarker;
end;

class function TAWS4DS3ListObjectsRequest<I>.New(Parent: I): IAWS4DS3ListObjectsRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DS3ListObjectsRequest<I>.MaxKeys(Value: Integer): IAWS4DS3ListObjectsRequest<I>;
begin
  result := Self;
  FMaxKeys := Value;

  if Value > 1000 then
    FMaxKeys := 1000;
end;

function TAWS4DS3ListObjectsRequest<I>.MaxKeys: Integer;
begin
  result := FMaxKeys;
end;

function TAWS4DS3ListObjectsRequest<I>.Prefix(Value: string): IAWS4DS3ListObjectsRequest<I>;
begin
  result := Self;
  FPrefix := Value;
end;

function TAWS4DS3ListObjectsRequest<I>.Prefix: string;
begin
  result := FPrefix;
end;

end.
