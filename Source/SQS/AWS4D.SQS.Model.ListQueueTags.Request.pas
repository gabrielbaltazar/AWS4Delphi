unit AWS4D.SQS.Model.ListQueueTags.Request;

interface

uses
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSModelListQueueTagsRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSQSListQueueTagsRequest<I>)

  private
    [Weak]
    FParent: I;
    FQueueUrl: string;

  protected
    function QueueUrl(Value: String): IAWS4DSQSListQueueTagsRequest<I>; overload;
    function QueueUrl: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSQSListQueueTagsRequest<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSQSModelListQueueTagsRequest<I> }

constructor TAWS4DSQSModelListQueueTagsRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSQSModelListQueueTagsRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSQSModelListQueueTagsRequest<I>.&End: I;
begin
  Result := FParent;
end;

class function TAWS4DSQSModelListQueueTagsRequest<I>.New(Parent: I): IAWS4DSQSListQueueTagsRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSQSModelListQueueTagsRequest<I>.QueueUrl(Value: String): IAWS4DSQSListQueueTagsRequest<I>;
begin
  result := Self;
  FQueueUrl := Value;
end;

function TAWS4DSQSModelListQueueTagsRequest<I>.QueueUrl: string;
begin
  result := FQueueUrl;
end;

end.
