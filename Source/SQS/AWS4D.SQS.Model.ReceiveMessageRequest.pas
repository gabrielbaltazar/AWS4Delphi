unit AWS4D.SQS.Model.ReceiveMessageRequest;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  System.Generics.Collections;

type TAWS4DSQSModelReceiveMessageRequest = class(TInterfacedObject, IAWS4DSQSModelReceiveMessageRequest)

  private
    FattributeNames: TList<String>;
    FmessageAttributeNames: TList<String>;
    FqueueUrl: string;
    FmaxNumberOfMessages: Integer;
    FvisibilityTimeout: Integer;
    FwaitTimeSeconds: Integer;
    FreceiveRequestAttemptId: Integer;

  protected
    function queueUrl                (Value: String) : IAWS4DSQSModelReceiveMessageRequest; overload;
    function maxNumberOfMessages     (Value: Integer): IAWS4DSQSModelReceiveMessageRequest; overload;
    function visibilityTimeout       (Value: Integer): IAWS4DSQSModelReceiveMessageRequest; overload;
    function waitTimeSeconds         (Value: Integer): IAWS4DSQSModelReceiveMessageRequest; overload;
    function receiveRequestAttemptId (Value: Integer): IAWS4DSQSModelReceiveMessageRequest; overload;

    function queueUrl: string; overload;
    function maxNumberOfMessages: Integer; overload;
    function visibilityTimeout: Integer; overload;
    function waitTimeSeconds: Integer; overload;
    function receiveRequestAttemptId: Integer; overload;

    function attributeNames: TList<String>;
    function messageAttributeNames: TList<String>;

  public
    constructor create;
    destructor  Destroy; override;
    class function New: IAWS4DSQSModelReceiveMessageRequest;
end;

implementation

{ TAWS4DSQSModelReceiveMessageRequest }

function TAWS4DSQSModelReceiveMessageRequest.attributeNames: TList<String>;
begin
  result := FattributeNames;
end;

constructor TAWS4DSQSModelReceiveMessageRequest.create;
begin
  FattributeNames := TList<string>.Create;
  FmessageAttributeNames := TList<String>.create;
  FmaxNumberOfMessages := 0;
  FvisibilityTimeout := -1;
  FattributeNames.Add('All');
end;

destructor TAWS4DSQSModelReceiveMessageRequest.Destroy;
begin
  FmessageAttributeNames.Free;
  FattributeNames.Free;
  inherited;
end;

function TAWS4DSQSModelReceiveMessageRequest.maxNumberOfMessages(Value: Integer): IAWS4DSQSModelReceiveMessageRequest;
begin
  result := Self;
  FmaxNumberOfMessages := Value;
end;

function TAWS4DSQSModelReceiveMessageRequest.maxNumberOfMessages: Integer;
begin
  result := FmaxNumberOfMessages;
end;

function TAWS4DSQSModelReceiveMessageRequest.messageAttributeNames: TList<String>;
begin
  result := FmessageAttributeNames;
end;

class function TAWS4DSQSModelReceiveMessageRequest.New: IAWS4DSQSModelReceiveMessageRequest;
begin
  result := Self.create;
end;

function TAWS4DSQSModelReceiveMessageRequest.queueUrl(Value: String): IAWS4DSQSModelReceiveMessageRequest;
begin
  result := Self;
  FqueueUrl := Value;
end;

function TAWS4DSQSModelReceiveMessageRequest.queueUrl: string;
begin
  result := FqueueUrl;
end;

function TAWS4DSQSModelReceiveMessageRequest.receiveRequestAttemptId(Value: Integer): IAWS4DSQSModelReceiveMessageRequest;
begin
  result := Self;
  FreceiveRequestAttemptId := Value;
end;

function TAWS4DSQSModelReceiveMessageRequest.receiveRequestAttemptId: Integer;
begin
  result := FreceiveRequestAttemptId;
end;

function TAWS4DSQSModelReceiveMessageRequest.visibilityTimeout(Value: Integer): IAWS4DSQSModelReceiveMessageRequest;
begin
  result := Self;
  FvisibilityTimeout := Value;
end;

function TAWS4DSQSModelReceiveMessageRequest.visibilityTimeout: Integer;
begin
  result := FvisibilityTimeout;
end;

function TAWS4DSQSModelReceiveMessageRequest.waitTimeSeconds(Value: Integer): IAWS4DSQSModelReceiveMessageRequest;
begin
  result := Self;
  FwaitTimeSeconds := Value;
end;

function TAWS4DSQSModelReceiveMessageRequest.waitTimeSeconds: Integer;
begin
  result := FwaitTimeSeconds;
end;

end.
