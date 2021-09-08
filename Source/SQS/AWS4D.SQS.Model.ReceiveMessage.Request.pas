unit AWS4D.SQS.Model.ReceiveMessage.Request;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Model.Classes,
  System.Generics.Collections;

type TAWS4DSQSReceiveMessageRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSQSReceiveMessageRequest<I>)

  private
    [Weak]
    FParent: I;
    FMaxNumberOfMessages: Integer;
    FQueueUrl: String;
    FReceiveRequestAttemptId: String;
    FVisibilityTimeout: Integer;
    FWaitTimeSeconds: Integer;
    FAttributes: TList<string>;
    FMessgeAttributes: TList<string>;
    FIteratorAttributes: IAWS4DIterator<String>;
    FIteratorMessageAttributes: IAWS4DIterator<String>;

  protected
    function MaxNumberOfMessages(Value: Integer): IAWS4DSQSReceiveMessageRequest<I>; overload;
    function QueueUrl(Value: String): IAWS4DSQSReceiveMessageRequest<I>; overload;
    function ReceiveRequestAttemptId(Value: String): IAWS4DSQSReceiveMessageRequest<I>; overload;
    function VisibilityTimeout(Value: Integer): IAWS4DSQSReceiveMessageRequest<I>; overload;
    function WaitTimeSeconds(Value: Integer): IAWS4DSQSReceiveMessageRequest<I>; overload;
    function AddAttribute(Value: String): IAWS4DSQSReceiveMessageRequest<I>;
    function AddMessageAttribute(Value: String): IAWS4DSQSReceiveMessageRequest<I>;

    function MaxNumberOfMessages: Integer; overload;
    function QueueUrl: String; overload;
    function ReceiveRequestAttemptId: String; overload;
    function VisibilityTimeout: Integer; overload;
    function WaitTimeSeconds: Integer; overload;

    function Attributes: IAWS4DIterator<String>;
    function MessageAttributes: IAWS4DIterator<String>;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSQSReceiveMessageRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DSQSReceiveMessageRequest<I>.AddAttribute(Value: String): IAWS4DSQSReceiveMessageRequest<I>;
begin
  result := Self;
  if not FAttributes.Contains(Value) then
    FAttributes.Add(Value);
end;

function TAWS4DSQSReceiveMessageRequest<I>.AddMessageAttribute(Value: String): IAWS4DSQSReceiveMessageRequest<I>;
begin
  result := Self;
  if not FMessgeAttributes.Contains(Value) then
    FMessgeAttributes.Add(Value);
end;

function TAWS4DSQSReceiveMessageRequest<I>.Attributes: IAWS4DIterator<String>;
begin
  Result := FIteratorAttributes;
end;

constructor TAWS4DSQSReceiveMessageRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FAttributes := TList<String>.create;
  FMessgeAttributes := TList<String>.create;
  FIteratorAttributes := TAWS4DCoreModelIterator<string>.New(FAttributes);
  FIteratorMessageAttributes := TAWS4DCoreModelIterator<string>.New(FMessgeAttributes);
end;

destructor TAWS4DSQSReceiveMessageRequest<I>.Destroy;
begin
  inherited;
end;

function TAWS4DSQSReceiveMessageRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSQSReceiveMessageRequest<I>.MaxNumberOfMessages(Value: Integer): IAWS4DSQSReceiveMessageRequest<I>;
begin
  result := Self;
  FMaxNumberOfMessages := Value;
end;

function TAWS4DSQSReceiveMessageRequest<I>.MaxNumberOfMessages: Integer;
begin
  result := FMaxNumberOfMessages;
end;

function TAWS4DSQSReceiveMessageRequest<I>.MessageAttributes: IAWS4DIterator<String>;
begin
  result := FIteratorMessageAttributes;
end;

class function TAWS4DSQSReceiveMessageRequest<I>.New(Parent: I): IAWS4DSQSReceiveMessageRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSQSReceiveMessageRequest<I>.QueueUrl(Value: String): IAWS4DSQSReceiveMessageRequest<I>;
begin
  result := Self;
  FQueueUrl := Value;
end;

function TAWS4DSQSReceiveMessageRequest<I>.QueueUrl: String;
begin
  result := FQueueUrl;
end;

function TAWS4DSQSReceiveMessageRequest<I>.ReceiveRequestAttemptId: String;
begin
  result := FReceiveRequestAttemptId;
end;

function TAWS4DSQSReceiveMessageRequest<I>.ReceiveRequestAttemptId(Value: String): IAWS4DSQSReceiveMessageRequest<I>;
begin
  result := Self;
  FReceiveRequestAttemptId := Value;
end;

function TAWS4DSQSReceiveMessageRequest<I>.VisibilityTimeout: Integer;
begin
  result := FVisibilityTimeout;
end;

function TAWS4DSQSReceiveMessageRequest<I>.VisibilityTimeout(Value: Integer): IAWS4DSQSReceiveMessageRequest<I>;
begin
  result := Self;
  FVisibilityTimeout := Value;
end;

function TAWS4DSQSReceiveMessageRequest<I>.WaitTimeSeconds(Value: Integer): IAWS4DSQSReceiveMessageRequest<I>;
begin
  result := Self;
  FWaitTimeSeconds := Value;
end;

function TAWS4DSQSReceiveMessageRequest<I>.WaitTimeSeconds: Integer;
begin
  result := FWaitTimeSeconds;
end;

end.
