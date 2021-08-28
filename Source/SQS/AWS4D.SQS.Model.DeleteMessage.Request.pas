unit AWS4D.SQS.Model.DeleteMessage.Request;

interface

uses
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSDeleteMessageRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSQSDeleteMessageRequest<I>)

  private
    [Weak]
    FParent: I;
    FQueueName: String;
    FReceiptHandle: string;

  protected
    function QueueName(Value: String): IAWS4DSQSDeleteMessageRequest<I>; overload;
    function ReceiptHandle(Value: String): IAWS4DSQSDeleteMessageRequest<I>; overload;

    function QueueName: string; overload;
    function ReceiptHandle: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSQSDeleteMessageRequest<I>;
    destructor Destroy; override;

end;

implementation

constructor TAWS4DSQSDeleteMessageRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSQSDeleteMessageRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSQSDeleteMessageRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSQSDeleteMessageRequest<I>.New(Parent: I): IAWS4DSQSDeleteMessageRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSQSDeleteMessageRequest<I>.QueueName(Value: String): IAWS4DSQSDeleteMessageRequest<I>;
begin
  result := Self;
  FQueueName := Value;
end;

function TAWS4DSQSDeleteMessageRequest<I>.QueueName: string;
begin
  result := FQueueName;
end;

function TAWS4DSQSDeleteMessageRequest<I>.ReceiptHandle(Value: String): IAWS4DSQSDeleteMessageRequest<I>;
begin
  result := Self;
  FReceiptHandle := Value;
end;

function TAWS4DSQSDeleteMessageRequest<I>.ReceiptHandle: string;
begin
  result := FReceiptHandle;
end;

end.
