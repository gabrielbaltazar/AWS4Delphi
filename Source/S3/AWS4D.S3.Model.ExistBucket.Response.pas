unit AWS4D.S3.Model.ExistBucket.Response;

interface

uses
  AWS4D.S3.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  System.Generics.Collections;

type TAWS4S3ExistBucketResponse<I: IInterface> = class(TInterfacedObject, IAWS4DS3ExistBucketResponse<I>)

  private
    [Weak]
    FParent: I;
    FExist: Boolean;

  protected
    function Exist: Boolean;

    function &End: I;

  public
    constructor create(Parent: I; bExist: Boolean);
    class function New(Parent: I; bExist: Boolean): IAWS4DS3ExistBucketResponse<I>;
    destructor Destroy; override;

end;

implementation

constructor TAWS4S3ExistBucketResponse<I>.create(Parent: I; bExist: Boolean);
begin
  FParent := Parent;
  FExist := bExist;
end;

destructor TAWS4S3ExistBucketResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4S3ExistBucketResponse<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4S3ExistBucketResponse<I>.Exist: Boolean;
begin
  result := FExist;
end;

class function TAWS4S3ExistBucketResponse<I>.New(Parent: I; bExist: Boolean): IAWS4DS3ExistBucketResponse<I>;
begin
  result := Self.create(Parent, bExist);
end;

end.
