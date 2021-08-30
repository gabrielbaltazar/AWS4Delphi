unit AWS4D.SQS.Model.ListQueues.Request;

interface

uses
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSModelListQueuesRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSQSListQueuesRequest<I>)

  private
    [Weak]
    FParent: I;
    FMaxResults: Integer;
    FNextToken: string;
    FQueueNamePrefix: string;

  protected
    function MaxResults(Value: Integer): IAWS4DSQSListQueuesRequest<I>; overload;
    function NextToken(Value: String): IAWS4DSQSListQueuesRequest<I>; overload;
    function QueueNamePrefix(Value: String): IAWS4DSQSListQueuesRequest<I>; overload;

    function MaxResults: Integer; overload;
    function NextToken: String; overload;
    function QueueNamePrefix: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSQSListQueuesRequest<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSQSModelListQueuesRequest<I> }

constructor TAWS4DSQSModelListQueuesRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSQSModelListQueuesRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSQSModelListQueuesRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSQSModelListQueuesRequest<I>.MaxResults: Integer;
begin
  result := FMaxResults;
end;

function TAWS4DSQSModelListQueuesRequest<I>.MaxResults(Value: Integer): IAWS4DSQSListQueuesRequest<I>;
begin
  result := Self;
  FMaxResults := Value;
end;

class function TAWS4DSQSModelListQueuesRequest<I>.New(Parent: I): IAWS4DSQSListQueuesRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSQSModelListQueuesRequest<I>.NextToken: String;
begin
  result := FNextToken;
end;

function TAWS4DSQSModelListQueuesRequest<I>.NextToken(Value: String): IAWS4DSQSListQueuesRequest<I>;
begin
  result := Self;
  FNextToken := Value;
end;

function TAWS4DSQSModelListQueuesRequest<I>.QueueNamePrefix: string;
begin
  result := FQueueNamePrefix;
end;

function TAWS4DSQSModelListQueuesRequest<I>.QueueNamePrefix(Value: String): IAWS4DSQSListQueuesRequest<I>;
begin
  result := Self;
  FQueueNamePrefix := Value;
end;

end.
