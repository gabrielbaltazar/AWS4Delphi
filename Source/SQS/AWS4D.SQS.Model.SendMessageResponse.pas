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
    function MD5OfMessageAttributes: string;
    function MD5OfMessageBody: string;
    function MD5OfMessageSystemAttributes: string;
    function MessageId: string;
    function SequenceNumber: string;

  public
    constructor create(JSONString: String); override;
    class function New(JSONString: String): IAWS4DSQSModelSendMessageResponse;
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

class function TAWS4DSQSModelSendMessageResponse.New(JSONString: String): IAWS4DSQSModelSendMessageResponse;
begin
  result := Self.create(JSONString);
end;

function TAWS4DSQSModelSendMessageResponse.SequenceNumber: string;
begin
  result := FSequenceNumber;
end;

end.
