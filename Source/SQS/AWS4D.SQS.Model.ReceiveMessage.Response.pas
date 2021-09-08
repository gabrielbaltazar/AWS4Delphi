unit AWS4D.SQS.Model.ReceiveMessage.Response;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Helper.JSON,
  AWS4D.SQS.Model.ReceiveMessage,
  System.Generics.Collections,
  System.JSON;

type TAWS4SQSReceiveMessageResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSQSReceiveMessageResponse<I>)

  private
    [Weak]
    FParent: I;
    FMessages: TList<IAWS4DSQSReceiveMessage>;
    FIteratorMessages: IAWS4DIterator<IAWS4DSQSReceiveMessage>;

    procedure FromJSON(Value: TJSONObject);

  protected
    function Messages: IAWS4DIterator<IAWS4DSQSReceiveMessage>;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSQSReceiveMessageResponse<I>;
    destructor Destroy; override;

end;

implementation

constructor TAWS4SQSReceiveMessageResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FMessages := TList<IAWS4DSQSReceiveMessage>.create;
  FIteratorMessages := TAWS4DCoreModelIterator<IAWS4DSQSReceiveMessage>.New(FMessages);
  FromJSON(JSON);
end;

destructor TAWS4SQSReceiveMessageResponse<I>.Destroy;
begin
  inherited;
end;

function TAWS4SQSReceiveMessageResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4SQSReceiveMessageResponse<I>.FromJSON(Value: TJSONObject);
var
  json: TJSONArray;
  i: Integer;
begin
  inherited;
  if not Assigned(Value) then
    Exit;

  json := Value.ValueAsJSONObject('ReceiveMessageResponse')
               .ValueAsJSONObject('ReceiveMessageResult')
               .ValueAsJSONArray('messages');

  if not Assigned(json) then
    Exit;

  for i := 0 to Pred(json.Count) do
    FMessages.Add(TAWS4SQSReceiveMessage.New(json.ItemAsJSONObject(i)));
end;

function TAWS4SQSReceiveMessageResponse<I>.Messages: IAWS4DIterator<IAWS4DSQSReceiveMessage>;
begin
  result := FIteratorMessages;
end;

class function TAWS4SQSReceiveMessageResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSQSReceiveMessageResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

end.
