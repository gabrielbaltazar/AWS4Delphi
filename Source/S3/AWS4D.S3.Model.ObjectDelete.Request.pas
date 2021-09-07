unit AWS4D.S3.Model.ObjectDelete.Request;

interface

uses
  AWS4D.S3.Model.Interfaces;

type TAWS4DS3ObjectDeleteRequest<I: IInterface> = class(TInterfacedObject, IAWS4DS3ObjectDeleteRequest<I>)

  private
    [Weak]
    FParent: I;
    FBucketName: String;
    FObjectName: String;

  protected
    function BucketName(Value: String): IAWS4DS3ObjectDeleteRequest<I>; overload;
    function ObjectName(Value: String): IAWS4DS3ObjectDeleteRequest<I>; overload;

    function BucketName: string; overload;
    function ObjectName: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DS3ObjectDeleteRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DS3ObjectDeleteRequest<I>.BucketName(Value: String): IAWS4DS3ObjectDeleteRequest<I>;
begin
  result := Self;
  FBucketName := Value;
end;

function TAWS4DS3ObjectDeleteRequest<I>.BucketName: string;
begin
  result := FBucketName;
end;

constructor TAWS4DS3ObjectDeleteRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DS3ObjectDeleteRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DS3ObjectDeleteRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DS3ObjectDeleteRequest<I>.New(Parent: I): IAWS4DS3ObjectDeleteRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DS3ObjectDeleteRequest<I>.ObjectName(Value: String): IAWS4DS3ObjectDeleteRequest<I>;
begin
  result := Self;
  FObjectName := Value;
end;

function TAWS4DS3ObjectDeleteRequest<I>.ObjectName: String;
begin
  result := FObjectName;
end;

end.
