unit AWS4D.S3.Model.ExistBucket.Request;

interface

uses
  AWS4D.S3.Model.Interfaces;

type TAWS4DS3ExistBucketRequest<I: IInterface> = class(TInterfacedObject, IAWS4DS3ExistBucketRequest<I>)

  private
    [Weak]
    FParent: I;
    FBucketName: string;

  protected
    function BucketName(Value: String): IAWS4DS3ExistBucketRequest<I>; overload;
    function BucketName: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DS3ExistBucketRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DS3ExistBucketRequest<I>.BucketName: String;
begin
  result := FBucketName;
end;

function TAWS4DS3ExistBucketRequest<I>.BucketName(Value: String): IAWS4DS3ExistBucketRequest<I>;
begin
  result := Self;
  FBucketName := Value;
end;

constructor TAWS4DS3ExistBucketRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DS3ExistBucketRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DS3ExistBucketRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DS3ExistBucketRequest<I>.New(Parent: I): IAWS4DS3ExistBucketRequest<I>;
begin
  result := Self.create(Parent);
end;

end.
