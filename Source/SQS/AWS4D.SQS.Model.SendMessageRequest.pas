unit AWS4D.SQS.Model.SendMessageRequest;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  System.Generics.Collections;

type TAWS4DSQSModelSendMessageRequest = class(TInterfacedObject, IAWS4DSQSModelSendMessageRequest)

  private
    FDelaySeconds: Integer;
    FMessageBody : string;
    FMessageDeduplicationId : String;
    FMessageGroupId : string;
    FQueueUrl: String;
    FMessageAttribute: TDictionary<String, String>;
    FMessageSystemAttribute: TDictionary<String, String>;

  protected
    function DelaySeconds (Value: Integer): IAWS4DSQSModelSendMessageRequest; overload;
    function MessageBody  (Value: String): IAWS4DSQSModelSendMessageRequest; overload;
    function MessageDeduplicationId(Value: String): IAWS4DSQSModelSendMessageRequest; overload;
    function MessageGroupId(Value: String): IAWS4DSQSModelSendMessageRequest; overload;
    function QueueUrl(Value: String): IAWS4DSQSModelSendMessageRequest; overload;

    function DelaySeconds         : Integer; overload;
    function MessageBody          : String; overload;
    function MessageDeduplicationId : String; overload;
    function MessageGroupId       : String; overload;
    function QueueUrl             : String; overload;

    function AddMessageAttribute(Name, Value: String): IAWS4DSQSModelSendMessageRequest;
    function MessageAttribute: TDictionary<String, String>; overload;

    function AddMessageSystemAttribute(Name, Value: String): IAWS4DSQSModelSendMessageRequest;
    function MessageSystemAttribute: TDictionary<String, String>; overload;

  public
    constructor create;
    destructor  Destroy; override;
    class function New: IAWS4DSQSModelSendMessageRequest;
end;

implementation

{ TAWS4DSQSModelSendMessageRequest }

function TAWS4DSQSModelSendMessageRequest.AddMessageAttribute(Name, Value: String): IAWS4DSQSModelSendMessageRequest;
begin
  result := Self;
  FMessageAttribute.AddOrSetValue(Name, Value);
end;

function TAWS4DSQSModelSendMessageRequest.AddMessageSystemAttribute(Name, Value: String): IAWS4DSQSModelSendMessageRequest;
begin
  result := Self;
  FMessageSystemAttribute.AddOrSetValue(Name, Value);
end;

constructor TAWS4DSQSModelSendMessageRequest.create;
begin
  FMessageAttribute := TDictionary<String, String>.create;
  FMessageSystemAttribute := TDictionary<String, String>.create;
end;

function TAWS4DSQSModelSendMessageRequest.DelaySeconds(Value: Integer): IAWS4DSQSModelSendMessageRequest;
begin
  result := Self;
  FDelaySeconds := Value;
end;

function TAWS4DSQSModelSendMessageRequest.DelaySeconds: Integer;
begin
  result := FDelaySeconds;
end;

destructor TAWS4DSQSModelSendMessageRequest.Destroy;
begin
  FMessageAttribute.Free;
  FMessageSystemAttribute.Free;
  inherited;
end;

function TAWS4DSQSModelSendMessageRequest.MessageAttribute: TDictionary<String, String>;
begin
  result := FMessageAttribute;
end;

function TAWS4DSQSModelSendMessageRequest.MessageBody: String;
begin
  result := FMessageBody;
end;

function TAWS4DSQSModelSendMessageRequest.MessageBody(Value: String): IAWS4DSQSModelSendMessageRequest;
begin
  result := Self;
  FMessageBody := Value;
end;

function TAWS4DSQSModelSendMessageRequest.MessageDeduplicationId(Value: String): IAWS4DSQSModelSendMessageRequest;
begin
  result := Self;
  FMessageDeduplicationId := Value;
end;

function TAWS4DSQSModelSendMessageRequest.MessageGroupId(Value: String): IAWS4DSQSModelSendMessageRequest;
begin
  result := Self;
  FMessageGroupId := Value;
end;

function TAWS4DSQSModelSendMessageRequest.MessageSystemAttribute: TDictionary<String, String>;
begin
  result := FMessageSystemAttribute;
end;

class function TAWS4DSQSModelSendMessageRequest.New: IAWS4DSQSModelSendMessageRequest;
begin
  result := Self.create;
end;

function TAWS4DSQSModelSendMessageRequest.QueueUrl: String;
begin
  result := FQueueUrl;
end;

function TAWS4DSQSModelSendMessageRequest.QueueUrl(Value: String): IAWS4DSQSModelSendMessageRequest;
begin
  result := Self;
  FQueueUrl := Value;
end;

function TAWS4DSQSModelSendMessageRequest.MessageDeduplicationId: String;
begin
  result := FMessageDeduplicationId;
end;

function TAWS4DSQSModelSendMessageRequest.MessageGroupId: String;
begin
  result := FMessageGroupId;
end;

end.
