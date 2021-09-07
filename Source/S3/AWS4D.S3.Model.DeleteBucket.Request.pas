unit AWS4D.S3.Model.DeleteBucket.Request;

interface

uses
  AWS4D.S3.Model.Interfaces;

type TAWS4DS3DeleteBucketRequest<I: IInterface> = class(TInterfacedObject, IAWS4DS3DeleteBucketRequest<I>)

  private
    [Weak]
    FParent: I;
    FBucketName: String;

  protected
    function BucketName(Value: String): IAWS4DS3DeleteBucketRequest<I>; overload;
    function BucketName: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DS3DeleteBucketRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DS3DeleteBucketRequest<I>.BucketName: String;
begin
  result := FBucketName;
end;

function TAWS4DS3DeleteBucketRequest<I>.BucketName(Value: String): IAWS4DS3DeleteBucketRequest<I>;
begin
  result := Self;
  FBucketName := Value;
end;

constructor TAWS4DS3DeleteBucketRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DS3DeleteBucketRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DS3DeleteBucketRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DS3DeleteBucketRequest<I>.New(Parent: I): IAWS4DS3DeleteBucketRequest<I>;
begin
  result := Self.create(Parent);
end;

end.
