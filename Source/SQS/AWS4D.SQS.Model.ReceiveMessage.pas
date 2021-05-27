unit AWS4D.SQS.Model.ReceiveMessage;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  System.JSON,
  System.Generics.Collections;

type TAWS4DSQSModelReceiveMessage = class(TInterfacedObject, IAWS4DSQSModelReceiveMessage)

  private
    FMessageId: string;
    FReceiptHandle: string;
    FMD5OfBody: string;
    FBody: string;
    FAttributes: TDictionary<String, String>;

  protected
    function MessageId: String; overload;
    function ReceiptHandle: string; overload;
    function MD5OfBody: string; overload;
    function Body: string; overload;
    function Attributes: TDictionary<String, String>; overload;

  public
    function MessageId(Value: String): TAWS4DSQSModelReceiveMessage; overload;
    function ReceiptHandle(Value: string): TAWS4DSQSModelReceiveMessage; overload;
    function MD5OfBody(Value: string): TAWS4DSQSModelReceiveMessage; overload;
    function Body(Value: string): TAWS4DSQSModelReceiveMessage; overload;
    function AddAttribute(Key, Value: string): TAWS4DSQSModelReceiveMessage;

    constructor create; overload;
    class function New: IAWS4DSQSModelReceiveMessage; overload;

    constructor create(JSONObject: TJSONObject); overload;
    class function New(JSONObject: TJSONObject): IAWS4DSQSModelReceiveMessage; overload;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSQSModelReceiveMessage }

function TAWS4DSQSModelReceiveMessage.AddAttribute(Key, Value: string): TAWS4DSQSModelReceiveMessage;
begin
  result := Self;
  FAttributes.AddOrSetValue(Key, Value);
end;

function TAWS4DSQSModelReceiveMessage.Attributes: TDictionary<String, String>;
begin
  result := FAttributes;
end;

function TAWS4DSQSModelReceiveMessage.Body: string;
begin
  result := FBody;
end;

constructor TAWS4DSQSModelReceiveMessage.create;
begin
  FAttributes := TDictionary<String, String>.create;
end;

function TAWS4DSQSModelReceiveMessage.Body(Value: string): TAWS4DSQSModelReceiveMessage;
begin
  result := Self;
  FBody := Value;
end;

constructor TAWS4DSQSModelReceiveMessage.create(JSONObject: TJSONObject);
var
  i          : Integer;
  Name       : String;
  Value      : String;
  LJSON      : TJSONObject;
  LJSONArray : TJSONArray;
begin
  FAttributes := TDictionary<String, String>.create;
  if not Assigned(JSONObject) then
    exit;

  JSONObject.TryGetValue<String>('Body', Self.FBody);
  JSONObject.TryGetValue<String>('MD5OfBody', Self.FMD5OfBody);
  JSONObject.TryGetValue<String>('MessageId', Self.FMessageId);
  JSONObject.TryGetValue<String>('ReceiptHandle', Self.FReceiptHandle);

  LJSONArray := JSONObject.GetValue('Attributes') as TJSONArray;
  if not Assigned(LJSONArray) then
    exit;

  for i := 0 to Pred(LJSONArray.Count) do
  begin
    LJSON := LJSONArray.Items[i] as TJSONObject;
    LJSON.TryGetValue('Name', Name);
    LJSON.TryGetValue('Value', Value);

    FAttributes.Add(Name, Value);
  end;
end;

destructor TAWS4DSQSModelReceiveMessage.Destroy;
begin
  FAttributes.Free;
  inherited;
end;

function TAWS4DSQSModelReceiveMessage.MD5OfBody: string;
begin
  Result := FMD5OfBody;
end;

function TAWS4DSQSModelReceiveMessage.MessageId: String;
begin
  result := FMessageId;
end;

class function TAWS4DSQSModelReceiveMessage.New: IAWS4DSQSModelReceiveMessage;
begin
  result := Self.create;
end;

class function TAWS4DSQSModelReceiveMessage.New(JSONObject: TJSONObject): IAWS4DSQSModelReceiveMessage;
begin
  result := Self.create(JSONObject);
end;

function TAWS4DSQSModelReceiveMessage.ReceiptHandle(Value: string): TAWS4DSQSModelReceiveMessage;
begin
  result := Self;
  FReceiptHandle := Value;
end;

function TAWS4DSQSModelReceiveMessage.ReceiptHandle: string;
begin
  result := FReceiptHandle;
end;

function TAWS4DSQSModelReceiveMessage.MD5OfBody(Value: string): TAWS4DSQSModelReceiveMessage;
begin
  result := Self;
  FMD5OfBody := Value;
end;

function TAWS4DSQSModelReceiveMessage.MessageId(Value: String): TAWS4DSQSModelReceiveMessage;
begin
  result := Self;
  FMessageId := Value;
end;

end.
