unit AWS4D.SQS.Model.GetQueueUrl.Request;

interface

uses
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSGetQueueUrlRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSQSGetQueueUrlRequest<I>)

  private
    [Weak]
    FParent: I;
    FQueueName: string;
    FQueueOwnerAWSAccountId: string;

  protected
    function QueueName(Value: String): IAWS4DSQSGetQueueUrlRequest<I>; overload;
    function QueueOwnerAWSAccountId(Value: String): IAWS4DSQSGetQueueUrlRequest<I>; overload;

    function QueueName: string; overload;
    function QueueOwnerAWSAccountId: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSQSGetQueueUrlRequest<I>;
    destructor Destroy; override;

end;

implementation

constructor TAWS4DSQSGetQueueUrlRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSQSGetQueueUrlRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSQSGetQueueUrlRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSQSGetQueueUrlRequest<I>.New(Parent: I): IAWS4DSQSGetQueueUrlRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSQSGetQueueUrlRequest<I>.QueueName(Value: String): IAWS4DSQSGetQueueUrlRequest<I>;
begin
  result := self;
  FQueueName := Value;
end;

function TAWS4DSQSGetQueueUrlRequest<I>.QueueName: string;
begin
  result := FQueueName;
end;

function TAWS4DSQSGetQueueUrlRequest<I>.QueueOwnerAWSAccountId(Value: String): IAWS4DSQSGetQueueUrlRequest<I>;
begin
  result := Self;
  FQueueOwnerAWSAccountId := Value;
end;

function TAWS4DSQSGetQueueUrlRequest<I>.QueueOwnerAWSAccountId: string;
begin
  Result := FQueueOwnerAWSAccountId;
end;

end.
