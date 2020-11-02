unit AWS4D.SQS.Model.DeleteMessageRequest;

interface

uses
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSModelDeleteMessageRequest = class(TInterfacedObject, IAWS4DSQSModelDeleteMessageRequest)

  private
    FQueueUrl: String;
    FReceiptHandle: string;

  protected
    function QueueUrl: string; overload;
    function ReceiptHandle: string; overload;

    function ReceiptHandle(Value: String): IAWS4DSQSModelDeleteMessageRequest; overload;
    function QueueUrl(Value: String): IAWS4DSQSModelDeleteMessageRequest; overload;
    function Message(Value: IAWS4DSQSModelReceiveMessage): IAWS4DSQSModelDeleteMessageRequest;

  public
    class function New: IAWS4DSQSModelDeleteMessageRequest;
end;

implementation

{ TAWS4DSQSModelDeleteMessageRequest }

function TAWS4DSQSModelDeleteMessageRequest.Message(Value: IAWS4DSQSModelReceiveMessage): IAWS4DSQSModelDeleteMessageRequest;
begin
  result := Self;
  if Assigned(Value) then
    FReceiptHandle := Value.ReceiptHandle;
end;

class function TAWS4DSQSModelDeleteMessageRequest.New: IAWS4DSQSModelDeleteMessageRequest;
begin
  result := Self.Create;
end;

function TAWS4DSQSModelDeleteMessageRequest.QueueUrl: string;
begin
  result := FQueueUrl;
end;

function TAWS4DSQSModelDeleteMessageRequest.QueueUrl(Value: String): IAWS4DSQSModelDeleteMessageRequest;
begin
  result := Self;
  FQueueUrl := Value;
end;

function TAWS4DSQSModelDeleteMessageRequest.ReceiptHandle(Value: String): IAWS4DSQSModelDeleteMessageRequest;
begin
  result := Self;
  FReceiptHandle := Value;
end;

function TAWS4DSQSModelDeleteMessageRequest.ReceiptHandle: string;
begin
  result := FReceiptHandle;
end;

end.
