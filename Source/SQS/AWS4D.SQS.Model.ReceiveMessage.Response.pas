unit AWS4D.SQS.Model.ReceiveMessage.Response;

interface

uses
  System.Generics.Collections,
  System.JSON,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Helper.JSON,
  AWS4D.SQS.Model.ReceiveMessage;

type
  TAWS4SQSReceiveMessageResponse<I: IInterface> = class(TInterfacedObject,
    IAWS4DSQSReceiveMessageResponse<I>)
  private
    [Weak]
    FParent: I;
    FMessages: TList<IAWS4DSQSReceiveMessage>;
    FIteratorMessages: IAWS4DIterator<IAWS4DSQSReceiveMessage>;

    procedure FromJSON(AValue: TJSONObject);
  protected
    function Messages: IAWS4DIterator<IAWS4DSQSReceiveMessage>;
    function &End: I;
  public
    constructor Create(AParent: I; AJSON: TJSONObject);
    class function New(AParent: I; AJSON: TJSONObject): IAWS4DSQSReceiveMessageResponse<I>;
  end;

implementation

constructor TAWS4SQSReceiveMessageResponse<I>.Create(AParent: I; AJSON: TJSONObject);
begin
  FParent := AParent;
  FMessages := TList<IAWS4DSQSReceiveMessage>.Create;
  FIteratorMessages := TAWS4DCoreModelIterator<IAWS4DSQSReceiveMessage>.New(FMessages);
  FromJSON(AJSON);
end;

function TAWS4SQSReceiveMessageResponse<I>.&End: I;
begin
  Result := FParent;
end;

procedure TAWS4SQSReceiveMessageResponse<I>.FromJSON(AValue: TJSONObject);
var
  LJSON: TJSONArray;
  I: Integer;
begin
  inherited;
  if not Assigned(AValue) then
    Exit;

  LJSON := AValue.ValueAsJSONArray('Messages');
  if not Assigned(LJSON) then
    Exit;

  for I := 0 to Pred(LJSON.Count) do
    FMessages.Add(TAWS4SQSReceiveMessage.New(LJSON.ItemAsJSONObject(I)));
end;

function TAWS4SQSReceiveMessageResponse<I>.Messages: IAWS4DIterator<IAWS4DSQSReceiveMessage>;
begin
  Result := FIteratorMessages;
end;

class function TAWS4SQSReceiveMessageResponse<I>.New(AParent: I; AJSON: TJSONObject): IAWS4DSQSReceiveMessageResponse<I>;
begin
  Result := Self.Create(AParent, AJSON);
end;

end.
