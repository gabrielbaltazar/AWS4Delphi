unit AWS4D.SQS.Model.ReceiveMessage;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Model.Tag,
  AWS4D.Core.Helper.JSON,
  System.Generics.Collections,
  System.JSON;

type TAWS4SQSReceiveMessage = class(TInterfacedObject, IAWS4DSQSReceiveMessage)

  private
    FBody: string;
    FMD5OfBody: string;
    FMD5OfMessageAttributes: String;
    FMessageId: String;
    FReceiptHandle: string;
    FMessageAttributes: TList<IAWS4DCoreModelTag>;
    FIteratorAttributes: IAWS4DIterator<IAWS4DCoreModelTag>;
    FIteratorMessageAttributes: IAWS4DIterator<IAWS4DCoreModelTag>;

    procedure FromJSON(Value: TJSONObject);

  protected
    function Attributes: IAWS4DIterator<IAWS4DCoreModelTag>;
    function MessageAttribute: IAWS4DIterator<IAWS4DCoreModelTag>;
    function Body: string;
    function MD5OfBody: string;
    function MD5OfMessageAttributes: String;
    function MessageId: String;
    function ReceiptHandle: string;

  public
    constructor create(JSON: TJSONObject);
    class function New(JSON: TJSONObject): IAWS4DSQSReceiveMessage;
    destructor Destroy; override;

end;

implementation

function TAWS4SQSReceiveMessage.Attributes: IAWS4DIterator<IAWS4DCoreModelTag>;
begin
  result := FIteratorAttributes;
end;

function TAWS4SQSReceiveMessage.Body: string;
begin
  result := FBody;
end;

constructor TAWS4SQSReceiveMessage.create(JSON: TJSONObject);
begin
  FMessageAttributes := TList<IAWS4DCoreModelTag>.create;
  FIteratorMessageAttributes := TAWS4DCoreModelIterator<IAWS4DCoreModelTag>.New(FMessageAttributes);

  FromJSON(JSON);
end;

destructor TAWS4SQSReceiveMessage.Destroy;
begin
  inherited;
end;

procedure TAWS4SQSReceiveMessage.FromJSON(Value: TJSONObject);
var
  jsonAttributes: TJSONArray;
  jsonValue: TJSONObject;
  i: Integer;
begin
  inherited;
  if not Assigned(Value) then
    Exit;

  FBody := Value.ValueAsString('Body');
  FMD5OfBody := Value.ValueAsString('MD5OfBody');
  FMessageId := Value.ValueAsString('MessageId');
  FReceiptHandle := Value.ValueAsString('ReceiptHandle');
  FMD5OfMessageAttributes := Value.ValueAsString('MD5OfMessageAttributes');
  FMD5OfBody := Value.ValueAsString('MD5OfBody');
  FIteratorAttributes := TAWS4DCoreModelTag.NewIterator(Value.ValueAsJSONArray('Attributes'));

  jsonAttributes := Value.ValueAsJSONArray('MessageAttributes');
  if not Assigned(jsonAttributes) then
    Exit;

  for i := 0 to Pred(jsonAttributes.Count) do
  begin
    FMessageAttributes.Add(TAWS4DCoreModelTag.New);
    FMessageAttributes.Last.Key(jsonAttributes.ItemAsString(i, 'Name'));
    jsonValue := jsonAttributes.ItemAsJSONObject(i);
    if Assigned(jsonValue) then
      FMessageAttributes.Last.Value(jsonValue.ValueAsString('StringValue'));
  end;

end;

function TAWS4SQSReceiveMessage.MD5OfBody: string;
begin
  result := FMD5OfBody;
end;

function TAWS4SQSReceiveMessage.MD5OfMessageAttributes: String;
begin
  result := FMD5OfMessageAttributes;
end;

function TAWS4SQSReceiveMessage.MessageAttribute: IAWS4DIterator<IAWS4DCoreModelTag>;
begin
  result := FIteratorMessageAttributes;
end;

function TAWS4SQSReceiveMessage.MessageId: String;
begin
  result := FMessageId;
end;

class function TAWS4SQSReceiveMessage.New(JSON: TJSONObject): IAWS4DSQSReceiveMessage;
begin
  result := Self.create(JSON);
end;

function TAWS4SQSReceiveMessage.ReceiptHandle: string;
begin
  result := FReceiptHandle;
end;

end.
