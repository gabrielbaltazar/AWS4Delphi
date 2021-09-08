unit AWS4D.SQS.Model.ListQueues.Response;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Helper.JSON,
  System.Generics.Collections,
  System.JSON;

type TAWS4DSQSModelListQueuesResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSQSListQueuesResponse<I>)

  private
    [Weak]
    FParent: I;
    FNextToken: string;
    FQueuesUrls: IAWS4DIterator<String>;

    procedure FromJSON(Value: TJSONObject);

  protected
    function NextToken: string;
    function QueueUrls: IAWS4DIterator<String>;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSQSListQueuesResponse<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSQSModelListQueuesResponse<I> }

constructor TAWS4DSQSModelListQueuesResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FromJSON(JSON);
end;

destructor TAWS4DSQSModelListQueuesResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSQSModelListQueuesResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4DSQSModelListQueuesResponse<I>.FromJSON(Value: TJSONObject);
var
  json: TJSONObject;
  queues : TList<String>;
begin
  inherited;
  if not Assigned(Value) then
    Exit;

  json := Value.ValueAsJSONObject('ListQueuesResponse')
               .ValueAsJSONObject('ListQueuesResult');

  FNextToken := json.ValueAsString('NextToken');
  queues := json.ValueAsJSONArray('queueUrls').ToListString;

  FQueuesUrls := TAWS4DCoreModelIterator<String>.New(queues);
end;

class function TAWS4DSQSModelListQueuesResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSQSListQueuesResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

function TAWS4DSQSModelListQueuesResponse<I>.NextToken: string;
begin
  result := FNextToken;
end;

function TAWS4DSQSModelListQueuesResponse<I>.QueueUrls: IAWS4DIterator<String>;
begin
  result := FQueuesUrls;
end;

end.
