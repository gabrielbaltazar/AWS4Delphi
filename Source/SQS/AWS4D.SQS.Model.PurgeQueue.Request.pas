unit AWS4D.SQS.Model.PurgeQueue.Request;

interface

uses
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSPurgeQueueRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSQSPurgeQueueRequest<I>)

  private
    [Weak]
    FParent: I;
    FQueueUrl: String;

  protected
    function QueueUrl(Value: String): IAWS4DSQSPurgeQueueRequest<I>; overload;
    function QueueUrl: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSQSPurgeQueueRequest<I>;
    destructor Destroy; override;

end;

implementation

constructor TAWS4DSQSPurgeQueueRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSQSPurgeQueueRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSQSPurgeQueueRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSQSPurgeQueueRequest<I>.New(Parent: I): IAWS4DSQSPurgeQueueRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSQSPurgeQueueRequest<I>.QueueUrl: String;
begin
  result := FQueueUrl;
end;

function TAWS4DSQSPurgeQueueRequest<I>.QueueUrl(Value: String): IAWS4DSQSPurgeQueueRequest<I>;
begin
  result := Self;
  FQueueUrl := Value;
end;

end.
