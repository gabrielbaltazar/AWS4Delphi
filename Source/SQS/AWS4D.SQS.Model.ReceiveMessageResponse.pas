unit AWS4D.SQS.Model.ReceiveMessageResponse;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.ReceiveMessage,
  System.Generics.Collections,
  System.JSON;

type TAWS4DSQSModelReceiveMessageResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelReceiveMessageResponse)

  private
    FMessages: TList<IAWS4DSQSModelReceiveMessage>;

  protected
    function Messages: TList<IAWS4DSQSModelReceiveMessage>;

  public
    function NewMessage: IAWS4DSQSModelReceiveMessage;

    constructor create; overload; override;
    class function New: IAWS4DSQSModelReceiveMessageResponse; overload;

    constructor create(JSONString: String); overload; override;
    class function New(JSONString: String): IAWS4DSQSModelReceiveMessageResponse; overload;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSQSModelReceiveMessageResponse }

constructor TAWS4DSQSModelReceiveMessageResponse.create(JSONString: String);
var
  i : Integer;
  LJSONArray: TJSONArray;
  LJSON: TJSONObject;
begin
  inherited;
  FMessages := TList<IAWS4DSQSModelReceiveMessage>.create;
  if not Assigned(FJSON) then
    Exit;

  LJSON := FJSON.GetValue('ReceiveMessageResponse')
                .GetValue<TJSONObject>('ReceiveMessageResult');

  if not LJSON.TryGetValue<TJSONArray>('messages', LJSONArray) then
    Exit;

  for i := 0 to Pred(LJSONArray.Count) do
  begin
    LJSON := LJSONArray.Items[i] as TJSONObject;
    FMessages.Add(TAWS4DSQSModelReceiveMessage.New(LJSON));
  end;
end;

constructor TAWS4DSQSModelReceiveMessageResponse.create;
begin
  FMessages := TList<IAWS4DSQSModelReceiveMessage>.create;
end;

destructor TAWS4DSQSModelReceiveMessageResponse.Destroy;
begin
  FMessages.Free;
  inherited;
end;

function TAWS4DSQSModelReceiveMessageResponse.Messages: TList<IAWS4DSQSModelReceiveMessage>;
begin
  result := FMessages;
end;

class function TAWS4DSQSModelReceiveMessageResponse.New: IAWS4DSQSModelReceiveMessageResponse;
begin
  result := Self.create;
end;

class function TAWS4DSQSModelReceiveMessageResponse.New(JSONString: String): IAWS4DSQSModelReceiveMessageResponse;
begin
  result := Self.create(JSONString);
end;

function TAWS4DSQSModelReceiveMessageResponse.NewMessage: IAWS4DSQSModelReceiveMessage;
begin
  result := TAWS4DSQSModelReceiveMessage.New;
  FMessages.Add(result);
end;

end.
