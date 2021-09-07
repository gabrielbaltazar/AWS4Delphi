unit AWS4D.S3.Model.CreateBucket.Request;

interface

uses
  AWS4D.S3.Model.Interfaces;

type TAWS4DS3CreateBucketRequest<I: IInterface> = class(TInterfacedObject, IAWS4DS3CreateBucketRequest<I>)

  private
    [Weak]
    FParent: I;
    FBucketName: string;

  protected
    function BucketName(Value: String): IAWS4DS3CreateBucketRequest<I>; overload;
    function BucketName: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DS3CreateBucketRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DS3CreateBucketRequest<I>.BucketName: String;
begin
  result := FBucketName;
end;

function TAWS4DS3CreateBucketRequest<I>.BucketName(Value: String): IAWS4DS3CreateBucketRequest<I>;
begin
  result := Self;
  FBucketName := Value;
end;

constructor TAWS4DS3CreateBucketRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DS3CreateBucketRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DS3CreateBucketRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DS3CreateBucketRequest<I>.New(Parent: I): IAWS4DS3CreateBucketRequest<I>;
begin
  result := Self.create(Parent);
end;

end.
