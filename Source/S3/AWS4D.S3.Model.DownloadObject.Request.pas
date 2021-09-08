unit AWS4D.S3.Model.DownloadObject.Request;

interface

uses
  AWS4D.S3.Model.Interfaces;

type TAWS4DS3DownloadObjectRequest<I: IInterface> = class(TInterfacedObject, IAWS4DS3DownloadObjectRequest<I>)

  private
    [Weak]
    FParent: I;
    FBucketName: String;
    FObjectName: String;

  protected
    function BucketName (Value: String): IAWS4DS3DownloadObjectRequest<I>; overload;
    function ObjectName (Value: String): IAWS4DS3DownloadObjectRequest<I>; overload;

    function BucketName : string; overload;
    function ObjectName : String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DS3DownloadObjectRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DS3DownloadObjectRequest<I>.BucketName(Value: String): IAWS4DS3DownloadObjectRequest<I>;
begin
  result := Self;
  FBucketName := Value;
end;

function TAWS4DS3DownloadObjectRequest<I>.BucketName: string;
begin
  result := FBucketName;
end;

constructor TAWS4DS3DownloadObjectRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DS3DownloadObjectRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DS3DownloadObjectRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DS3DownloadObjectRequest<I>.New(Parent: I): IAWS4DS3DownloadObjectRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DS3DownloadObjectRequest<I>.ObjectName(Value: String): IAWS4DS3DownloadObjectRequest<I>;
begin
  result := Self;
  FObjectName := Value;
end;

function TAWS4DS3DownloadObjectRequest<I>.ObjectName: String;
begin
  result := FObjectName;
end;

end.
