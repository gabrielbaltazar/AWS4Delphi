unit AWS4D.SQS.Model.DeleteMessageBatch.Request;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Classes,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  System.Generics.Collections;

type TAWS4DSQSDeleteMessageBatchRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSQSDeleteMessageBatchRequest<I>)

  private
    [Weak]
    FParent: I;
    FQueueUrl: String;
    FMessages: TList<IAWS4DCoreModelAttribute>;
    FIteratorMessages: IAWS4DIterator<IAWS4DCoreModelAttribute>;

  protected
    function QueueUrl(Value: String): IAWS4DSQSDeleteMessageBatchRequest<I>; overload;
    function QueueUrl: string; overload;
    function AddMessage(Id, ReceiptHandle: String): IAWS4DSQSDeleteMessageBatchRequest<I>;
    function Messages: IAWS4DIterator<IAWS4DCoreModelAttribute>;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSQSDeleteMessageBatchRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DSQSDeleteMessageBatchRequest<I>.AddMessage(Id, ReceiptHandle: String): IAWS4DSQSDeleteMessageBatchRequest<I>;
begin
  result := Self;
  FMessages.Add(TAWS4DCoreModelAttribute.New);
  FMessages.Last
    .Key(Id)
    .Value(ReceiptHandle);
end;

constructor TAWS4DSQSDeleteMessageBatchRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FMessages := TList<IAWS4DCoreModelAttribute>.Create;
  FIteratorMessages := TAWS4DCoreModelIterator<IAWS4DCoreModelAttribute>.New(FMessages);
end;

destructor TAWS4DSQSDeleteMessageBatchRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSQSDeleteMessageBatchRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSQSDeleteMessageBatchRequest<I>.Messages: IAWS4DIterator<IAWS4DCoreModelAttribute>;
begin
  Result := FIteratorMessages;
end;

class function TAWS4DSQSDeleteMessageBatchRequest<I>.New(Parent: I): IAWS4DSQSDeleteMessageBatchRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSQSDeleteMessageBatchRequest<I>.QueueUrl: string;
begin
  Result := FQueueUrl;
end;

function TAWS4DSQSDeleteMessageBatchRequest<I>.QueueUrl(Value: String): IAWS4DSQSDeleteMessageBatchRequest<I>;
begin
  result := Self;
  FQueueUrl := Value;
end;

end.
