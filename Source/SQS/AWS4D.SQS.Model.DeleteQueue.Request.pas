unit AWS4D.SQS.Model.DeleteQueue.Request;

interface

uses
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSDeleteQueueRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSQSDeleteQueueRequest<I>)

  private
    [Weak]
    FParent: I;
    FQueueUrl: string;

  protected
    function QueueUrl(Value: String): IAWS4DSQSDeleteQueueRequest<I>; overload;
    function QueueUrl: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSQSDeleteQueueRequest<I>;
    destructor Destroy; override;

end;

implementation

constructor TAWS4DSQSDeleteQueueRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSQSDeleteQueueRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSQSDeleteQueueRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSQSDeleteQueueRequest<I>.New(Parent: I): IAWS4DSQSDeleteQueueRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSQSDeleteQueueRequest<I>.QueueUrl: string;
begin
  result := FQueueUrl;
end;

function TAWS4DSQSDeleteQueueRequest<I>.QueueUrl(Value: String): IAWS4DSQSDeleteQueueRequest<I>;
begin
  result := Self;
  FQueueUrl := Value;
end;

end.
