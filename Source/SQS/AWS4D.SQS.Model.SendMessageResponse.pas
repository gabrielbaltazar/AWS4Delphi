unit AWS4D.SQS.Model.SendMessageResponse;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces,
  System.JSON,
  System.Generics.Collections;

type TAWS4DSQSModelSendMessageResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelSendMessageResponse)

  private
    FMD5OfMessageAttributes: string;
    FMD5OfMessageBody: string;
    FMD5OfMessageSystemAttributes: string;
    FMessageId: string;
    FSequenceNumber: string;

  protected
    function MD5OfMessageAttributes: string; overload;
    function MD5OfMessageBody: string; overload;
    function MD5OfMessageSystemAttributes: string; overload;
    function MessageId: string; overload;
    function SequenceNumber: string; overload;

  public
    function MD5OfMessageAttributes(Value: string): TAWS4DSQSModelSendMessageResponse; overload;
    function MD5OfMessageBody(Value: string): TAWS4DSQSModelSendMessageResponse; overload;
    function MD5OfMessageSystemAttributes(Value: string): TAWS4DSQSModelSendMessageResponse; overload;
    function MessageId(Value: string): TAWS4DSQSModelSendMessageResponse; overload;
    function SequenceNumber(Value: string): TAWS4DSQSModelSendMessageResponse; overload;

    constructor create; overload; override;
    class function New: IAWS4DSQSModelSendMessageResponse; overload;

    constructor create(JSONString: String); overload; override;
    class function New(JSONString: String): IAWS4DSQSModelSendMessageResponse; overload;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSQSModelSendMessageResponse }

constructor TAWS4DSQSModelSendMessageResponse.create(JSONString: String);
var
  LJSON : TJSONObject;
begin
  inherited;
  if not Assigned(FJSON) then
    Exit;

  LJSON := FJSON.GetValue('SendMessageResponse')
                .GetValue<TJSONObject>('SendMessageResult');

  if not Assigned(LJSON) then
    Exit;

  LJSON.TryGetValue<String>('MD5OfMessageBody', FMD5OfMessageBody);
  LJSON.TryGetValue<String>('MessageId', FMessageId);
  LJSON.TryGetValue<String>('SequenceNumber', FSequenceNumber);
end;

constructor TAWS4DSQSModelSendMessageResponse.create;
begin
  inherited;
end;

destructor TAWS4DSQSModelSendMessageResponse.Destroy;
begin

  inherited;
end;

function TAWS4DSQSModelSendMessageResponse.MD5OfMessageAttributes: string;
begin
  result := FMD5OfMessageAttributes;
end;

function TAWS4DSQSModelSendMessageResponse.MD5OfMessageBody: string;
begin
  result := FMD5OfMessageBody;
end;

function TAWS4DSQSModelSendMessageResponse.MD5OfMessageSystemAttributes: string;
begin
  result := FMD5OfMessageSystemAttributes;
end;

function TAWS4DSQSModelSendMessageResponse.MessageId: string;
begin
  result := FMessageId;
end;

class function TAWS4DSQSModelSendMessageResponse.New: IAWS4DSQSModelSendMessageResponse;
begin
  result := Self.create;
end;

class function TAWS4DSQSModelSendMessageResponse.New(JSONString: String): IAWS4DSQSModelSendMessageResponse;
begin
  result := Self.create(JSONString);
end;

function TAWS4DSQSModelSendMessageResponse.SequenceNumber(Value: string): TAWS4DSQSModelSendMessageResponse;
begin
  result := Self;
  FSequenceNumber := Value;
end;

function TAWS4DSQSModelSendMessageResponse.SequenceNumber: string;
begin
  result := FSequenceNumber;
end;

function TAWS4DSQSModelSendMessageResponse.MD5OfMessageAttributes(Value: string): TAWS4DSQSModelSendMessageResponse;
begin
  result := Self;
  FMD5OfMessageAttributes := Value;
end;

function TAWS4DSQSModelSendMessageResponse.MD5OfMessageBody(Value: string): TAWS4DSQSModelSendMessageResponse;
begin
  result := Self;
  FMD5OfMessageBody := Value;
end;

function TAWS4DSQSModelSendMessageResponse.MD5OfMessageSystemAttributes(Value: string): TAWS4DSQSModelSendMessageResponse;
begin
  result := Self;
  FMD5OfMessageSystemAttributes := Value;
end;

function TAWS4DSQSModelSendMessageResponse.MessageId(Value: string): TAWS4DSQSModelSendMessageResponse;
begin
  result := Self;
  FMessageId := Value;
end;

end.
