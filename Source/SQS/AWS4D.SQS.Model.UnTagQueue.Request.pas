unit AWS4D.SQS.Model.UnTagQueue.Request;

interface

uses
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.SQS.Model.Interfaces,
  System.Generics.Collections;

type TAWS4DSQSUnTagQueueRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSQSUnTagQueueRequest<I>)

  private
    [Weak]
    FParent: I;
    FQueueUrl: string;
    FTags: TList<string>;
    FIteratorTags: IAWS4DIterator<string>;

  protected
    function QueueUrl(Value: String): IAWS4DSQSUnTagQueueRequest<I>; overload;
    function QueueUrl: String; overload;

    function AddTag(Key: String): IAWS4DSQSUnTagQueueRequest<I>;
    function Tags: IAWS4DIterator<String>;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSQSUnTagQueueRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DSQSUnTagQueueRequest<I>.AddTag(Key: String): IAWS4DSQSUnTagQueueRequest<I>;
begin
  result := Self;
  if not FTags.Contains(Key) then
    FTags.Add(Key);
end;

constructor TAWS4DSQSUnTagQueueRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FTags := TList<String>.create;
  FIteratorTags := TAWS4DCoreModelIterator<String>.New(FTags);
end;

destructor TAWS4DSQSUnTagQueueRequest<I>.Destroy;
begin
  inherited;
end;

function TAWS4DSQSUnTagQueueRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSQSUnTagQueueRequest<I>.New(Parent: I): IAWS4DSQSUnTagQueueRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSQSUnTagQueueRequest<I>.QueueUrl(Value: String): IAWS4DSQSUnTagQueueRequest<I>;
begin
  result := Self;
  FQueueUrl := Value;
end;

function TAWS4DSQSUnTagQueueRequest<I>.QueueUrl: String;
begin
  result := FQueueUrl;
end;

function TAWS4DSQSUnTagQueueRequest<I>.Tags: IAWS4DIterator<String>;
begin
  Result := FIteratorTags;
end;

end.
