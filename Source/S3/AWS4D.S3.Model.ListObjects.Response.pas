unit AWS4D.S3.Model.ListObjects.Response;

interface

uses
  AWS4D.S3.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  System.Generics.Collections;

type TAWS4S3ListObjectsResponse<I: IInterface> = class(TInterfacedObject, IAWS4DS3ListObjectsResponse<I>)

  private
    [Weak]
    FParent: I;
    FObjects: IAWS4DIterator<IAWS4DS3ModelObjectInfo>;

  protected
    function Objects: IAWS4DIterator<IAWS4DS3ModelObjectInfo>;

    function &End: I;

  public
    constructor create(Parent: I; AObjects: TList<IAWS4DS3ModelObjectInfo>);
    class function New(Parent: I; AObjects: TList<IAWS4DS3ModelObjectInfo>): IAWS4DS3ListObjectsResponse<I>;
    destructor Destroy; override;

end;

implementation

constructor TAWS4S3ListObjectsResponse<I>.create(Parent: I; AObjects: TList<IAWS4DS3ModelObjectInfo>);
begin
  FParent := Parent;
  FObjects := TAWS4DCoreModelIterator<IAWS4DS3ModelObjectInfo>.New(AObjects);
end;

destructor TAWS4S3ListObjectsResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4S3ListObjectsResponse<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4S3ListObjectsResponse<I>.New(Parent: I; AObjects: TList<IAWS4DS3ModelObjectInfo>): IAWS4DS3ListObjectsResponse<I>;
begin
  result := Self.create(Parent, AObjects);
end;

function TAWS4S3ListObjectsResponse<I>.Objects: IAWS4DIterator<IAWS4DS3ModelObjectInfo>;
begin
  result := FObjects;
end;

end.
