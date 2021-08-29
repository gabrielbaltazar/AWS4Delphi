unit AWS4D.SQS.Model.ListQueueTags.Response;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Model.Classes,
  AWS4D.Core.Helper.JSON,
  System.Generics.Collections,
  System.JSON;

type TAWS4DSQSModelListQueueTagsResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSQSListQueueTagsResponse<I>)

  private
    [Weak]
    FParent: I;
    FTags: IAWS4DIterator<IAWS4DCoreModelAttribute>;

    procedure FromJSON(Value: TJSONObject);

  protected
    function Tags: IAWS4DIterator<IAWS4DCoreModelAttribute>;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSQSListQueueTagsResponse<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSQSModelListQueueTagsResponse<I> }

constructor TAWS4DSQSModelListQueueTagsResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FromJSON(JSON);
end;

destructor TAWS4DSQSModelListQueueTagsResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSQSModelListQueueTagsResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4DSQSModelListQueueTagsResponse<I>.FromJSON(Value: TJSONObject);
var
  json: TJSONObject;
begin
  if not Assigned(Value) then
    Exit;

  json := Value.ValueAsJSONObject('ListQueueTagsResponse')
               .ValueAsJSONObject('ListQueueTagsResult');

  FTags := TAWS4DCoreModelAttribute.NewIterator(json.ValueAsJSONArray('Tags'));
end;

class function TAWS4DSQSModelListQueueTagsResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSQSListQueueTagsResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

function TAWS4DSQSModelListQueueTagsResponse<I>.Tags: IAWS4DIterator<IAWS4DCoreModelAttribute>;
begin
  result := FTags;
end;

end.
