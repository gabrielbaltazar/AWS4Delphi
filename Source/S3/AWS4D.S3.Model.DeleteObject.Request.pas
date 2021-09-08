unit AWS4D.S3.Model.DeleteObject.Request;

interface

uses
  AWS4D.S3.Model.Interfaces;

type TAWS4DS3DeleteObjectRequest<I: IInterface> = class(TInterfacedObject, IAWS4DS3DeleteObjectRequest<I>)

  private
    [Weak]
    FParent: I;
    FBucketName: String;
    FObjectName: String;

  protected
    function BucketName(Value: String): IAWS4DS3DeleteObjectRequest<I>; overload;
    function ObjectName(Value: String): IAWS4DS3DeleteObjectRequest<I>; overload;

    function BucketName: string; overload;
    function ObjectName: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DS3DeleteObjectRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DS3DeleteObjectRequest<I>.BucketName(Value: String): IAWS4DS3DeleteObjectRequest<I>;
begin
  result := Self;
  FBucketName := Value;
end;

function TAWS4DS3DeleteObjectRequest<I>.BucketName: string;
begin
  result := FBucketName;
end;

constructor TAWS4DS3DeleteObjectRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DS3DeleteObjectRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DS3DeleteObjectRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DS3DeleteObjectRequest<I>.New(Parent: I): IAWS4DS3DeleteObjectRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DS3DeleteObjectRequest<I>.ObjectName(Value: String): IAWS4DS3DeleteObjectRequest<I>;
begin
  result := Self;
  FObjectName := Value;
end;

function TAWS4DS3DeleteObjectRequest<I>.ObjectName: String;
begin
  result := FObjectName;
end;

end.
