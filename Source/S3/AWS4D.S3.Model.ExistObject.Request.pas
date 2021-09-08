unit AWS4D.S3.Model.ExistObject.Request;

interface

uses
  AWS4D.S3.Model.Interfaces;

type TAWS4DS3ExistObjectRequest<I: IInterface> = class(TInterfacedObject, IAWS4DS3ExistObjectRequest<I>)

  private
    [Weak]
    FParent: I;
    FBucketName: String;
    FObjectName: String;

  protected
    function BucketName (Value: String): IAWS4DS3ExistObjectRequest<I>; overload;
    function ObjectName (Value: String): IAWS4DS3ExistObjectRequest<I>; overload;

    function BucketName : string; overload;
    function ObjectName : String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DS3ExistObjectRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DS3ExistObjectRequest<I>.BucketName(Value: String): IAWS4DS3ExistObjectRequest<I>;
begin
  result := Self;
  FBucketName := Value;
end;

function TAWS4DS3ExistObjectRequest<I>.BucketName: string;
begin
  result := FBucketName;
end;

constructor TAWS4DS3ExistObjectRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DS3ExistObjectRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DS3ExistObjectRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DS3ExistObjectRequest<I>.New(Parent: I): IAWS4DS3ExistObjectRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DS3ExistObjectRequest<I>.ObjectName(Value: String): IAWS4DS3ExistObjectRequest<I>;
begin
  result := Self;
  FObjectName := Value;
end;

function TAWS4DS3ExistObjectRequest<I>.ObjectName: String;
begin
  result := FObjectName;
end;

end.
