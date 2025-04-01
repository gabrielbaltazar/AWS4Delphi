unit AWS4D.SQS.Model.ReceiveMessage;

interface

uses
  System.Generics.Collections,
  System.JSON,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Model.Classes,
  AWS4D.Core.Helper.JSON;

type
  TAWS4SQSReceiveMessage = class(TInterfacedObject, IAWS4DSQSReceiveMessage)
  private
    FBody: string;
    FMD5OfBody: string;
    FMD5OfMessageAttributes: String;
    FMessageId: String;
    FReceiptHandle: string;
    FMessageAttributes: TList<IAWS4DCoreModelAttribute>;
    FIteratorAttributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;
    FIteratorMessageAttributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;

    procedure FromJSON(AValue: TJSONObject);
  protected
    function Attributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;
    function MessageAttribute: IAWS4DIterator<IAWS4DCoreModelAttribute>;
    function Body: string;
    function MD5OfBody: string;
    function MD5OfMessageAttributes: String;
    function MessageId: String;
    function ReceiptHandle: string;
  public
    constructor Create(AJSON: TJSONObject);
    class function New(AJSON: TJSONObject): IAWS4DSQSReceiveMessage;
  end;

implementation

function TAWS4SQSReceiveMessage.Attributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;
begin
  Result := FIteratorAttributes;
end;

function TAWS4SQSReceiveMessage.Body: string;
begin
  Result := FBody;
end;

constructor TAWS4SQSReceiveMessage.create(AJSON: TJSONObject);
begin
  FMessageAttributes := TList<IAWS4DCoreModelAttribute>.create;
  FIteratorMessageAttributes := TAWS4DCoreModelIterator<IAWS4DCoreModelAttribute>
    .New(FMessageAttributes);
  FromJSON(AJSON);
end;

procedure TAWS4SQSReceiveMessage.FromJSON(AValue: TJSONObject);
var
  LJSONAttributes: TJSONObject;
  LJSONValue: TJSONObject;
  LKey: string;
  LValue: string;
  I: Integer;
begin
  inherited;
  if not Assigned(AValue) then
    Exit;

  FBody := AValue.ValueAsString('Body');
  FMD5OfBody := AValue.ValueAsString('MD5OfBody');
  FMessageId := AValue.ValueAsString('MessageId');
  FReceiptHandle := AValue.ValueAsString('ReceiptHandle');
  FMD5OfMessageAttributes := AValue.ValueAsString('MD5OfMessageAttributes');
  FMD5OfBody := AValue.ValueAsString('MD5OfBody');
  FIteratorAttributes := TAWS4DCoreModelAttribute.NewIterator(AValue.ValueAsJSONArray('Attributes'));

  LJSONAttributes := AValue.ValueAsJSONObject('MessageAttributes');
  if not Assigned(LJSONAttributes) then
    Exit;

  for I := 0 to Pred(LJSONAttributes.Count) do
  begin
    FMessageAttributes.Add(TAWS4DCoreModelAttribute.New);
    LKey := LJSONAttributes.GetPair(I).JsonString.Value;
    FMessageAttributes.Last.Key(LKey);
    LJSONValue := TJSONObject(LJSONAttributes.GetPair(I).JsonValue);
    if Assigned(LJSONValue) then
    begin
      LValue := LJSONValue.ValueAsString('StringValue');
      FMessageAttributes.Last.Value(LValue);
    end;
  end;
end;

function TAWS4SQSReceiveMessage.MD5OfBody: string;
begin
  Result := FMD5OfBody;
end;

function TAWS4SQSReceiveMessage.MD5OfMessageAttributes: String;
begin
  Result := FMD5OfMessageAttributes;
end;

function TAWS4SQSReceiveMessage.MessageAttribute: IAWS4DIterator<IAWS4DCoreModelAttribute>;
begin
  Result := FIteratorMessageAttributes;
end;

function TAWS4SQSReceiveMessage.MessageId: String;
begin
  Result := FMessageId;
end;

class function TAWS4SQSReceiveMessage.New(AJSON: TJSONObject): IAWS4DSQSReceiveMessage;
begin
  Result := Self.Create(AJSON);
end;

function TAWS4SQSReceiveMessage.ReceiptHandle: string;
begin
  Result := FReceiptHandle;
end;

end.
