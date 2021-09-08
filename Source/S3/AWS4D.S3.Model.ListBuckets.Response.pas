unit AWS4D.S3.Model.ListBuckets.Response;

interface

uses
  AWS4D.S3.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Helper.JSON,
  System.Classes,
  System.Generics.Collections,
  System.JSON;

type TAWS4DS3ListBucketsResponse<I: IInterface> = class(TInterfacedObject, IAWS4DS3ListBucketsResponse<I>)

  private
    [Weak]
    FParent: I;
    FBuckets: TList<string>;
    FIteratorBuckets: IAWS4DIterator<String>;

  protected
    function Buckets: IAWS4DIterator<String>;

    function &End: I;

  public
    constructor create(Parent: I; ABuckets: TStrings);
    class function New(Parent: I; ABuckets: TStrings): IAWS4DS3ListBucketsResponse<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DS3ListBucketsResponse<I>.Buckets: IAWS4DIterator<String>;
begin
  Result := FIteratorBuckets;
end;

constructor TAWS4DS3ListBucketsResponse<I>.create(Parent: I; ABuckets: TStrings);
var
  i : Integer;
begin
  FParent := Parent;
  FBuckets:= TList<String>.create;

  for i := 0 to Pred(ABuckets.Count) do
    FBuckets.Add(ABuckets[i]);

  FIteratorBuckets := TAWS4DCoreModelIterator<String>.New(FBuckets);
end;

destructor TAWS4DS3ListBucketsResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4DS3ListBucketsResponse<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DS3ListBucketsResponse<I>.New(Parent: I; ABuckets: TStrings): IAWS4DS3ListBucketsResponse<I>;
begin
  result := Self.create(Parent, ABuckets);
end;

end.
