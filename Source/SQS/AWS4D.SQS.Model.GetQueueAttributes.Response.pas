unit AWS4D.SQS.Model.GetQueueAttributes.Response;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Classes,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Helper.JSON,
  System.Generics.Collections,
  System.JSON;

type TAWS4SQSGetQueueAttributesResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSQSGetQueueAttributesResponse<I>)

  private
    [Weak]
    FParent: I;
    FAttributes: TList<IAWS4DCoreModelAttribute>;
    FIteratorAttributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;

    procedure FromJSON(Value: TJSONObject);

  protected
    function Attributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSQSGetQueueAttributesResponse<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4SQSGetQueueAttributesResponse<I>.Attributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;
begin
  result := FIteratorAttributes;
end;

constructor TAWS4SQSGetQueueAttributesResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FAttributes := TList<IAWS4DCoreModelAttribute>.Create;
  FIteratorAttributes := TAWS4DCoreModelIterator<IAWS4DCoreModelAttribute>.New(FAttributes);
  FromJSON(JSON);
end;

destructor TAWS4SQSGetQueueAttributesResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4SQSGetQueueAttributesResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4SQSGetQueueAttributesResponse<I>.FromJSON(Value: TJSONObject);
var
  i: Integer;
  json: TJSONObject;
  jsonArray: TJSONArray;
begin
  inherited;
  if not Assigned(Value) then
    Exit;

  json := Value.ValueAsJSONObject('GetQueueAttributesResponse')
               .ValueAsJSONObject('GetQueueAttributesResult');

  if not Assigned(json) then
    exit;

  jsonArray := json.ValueAsJSONArray('Attributes');
  if not Assigned(jsonArray) then
    Exit;

  for i := 0 to Pred(jsonArray.Count) do
  begin
    FAttributes.Add(TAWS4DCoreModelAttribute.New);
    FAttributes.Last.Key(jsonArray.ItemAsString(i, 'Name'));
    FAttributes.Last.Value(jsonArray.ItemAsString(i, 'Value'));
  end;
end;

class function TAWS4SQSGetQueueAttributesResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSQSGetQueueAttributesResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

end.
