unit AWS4D.SQS.Model.CreateQueue.Request;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Model.Attribute,
  System.Generics.Collections;

type TAWS4DSQSCreateQueueRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSQSCreateQueueRequest<I>)

  private
    [Weak]
    FParent: I;
    FQueueName: string;
    FAttributes: TList<IAWS4DCoreModelAttribute>;
    FTags: TList<IAWS4DCoreModelAttribute>;
    FIteratorAttributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;
    FIteratorTags: IAWS4DIterator<IAWS4DCoreModelAttribute>;

  protected
    function QueueName(Value: String): IAWS4DSQSCreateQueueRequest<I>; overload;
    function QueueName: string; overload;
    function Attributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;
    function Tags: IAWS4DIterator<IAWS4DCoreModelAttribute>;

    function AddAttribute(Key, Value: String): IAWS4DSQSCreateQueueRequest<I>;
    function AddTag(Key, Value: String): IAWS4DSQSCreateQueueRequest<I>;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSQSCreateQueueRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DSQSCreateQueueRequest<I>.AddAttribute(Key, Value: String): IAWS4DSQSCreateQueueRequest<I>;
begin
  result := Self;
  FAttributes.Add(TAWS4DCoreModelAttribute.New);
  FAttributes.Last
    .Key(Key)
    .Value(Value);
end;

function TAWS4DSQSCreateQueueRequest<I>.AddTag(Key, Value: String): IAWS4DSQSCreateQueueRequest<I>;
begin
  result := Self;
  FTags.Add(TAWS4DCoreModelAttribute.New);
  FTags.Last
    .Key(Key)
    .Value(Value);
end;

function TAWS4DSQSCreateQueueRequest<I>.Attributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;
begin
  result := FIteratorAttributes;
end;

constructor TAWS4DSQSCreateQueueRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FTags := TList<IAWS4DCoreModelAttribute>.create;
  FAttributes := TList<IAWS4DCoreModelAttribute>.create;

  FIteratorTags := TAWS4DCoreModelIterator<IAWS4DCoreModelAttribute>.New(FTags);
  FIteratorAttributes := TAWS4DCoreModelIterator<IAWS4DCoreModelAttribute>.New(FAttributes);
end;

destructor TAWS4DSQSCreateQueueRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSQSCreateQueueRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSQSCreateQueueRequest<I>.New(Parent: I): IAWS4DSQSCreateQueueRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSQSCreateQueueRequest<I>.QueueName(Value: String): IAWS4DSQSCreateQueueRequest<I>;
begin
  result := Self;
  FQueueName := Value;
end;

function TAWS4DSQSCreateQueueRequest<I>.QueueName: string;
begin
  result := FQueueName;
end;

function TAWS4DSQSCreateQueueRequest<I>.Tags: IAWS4DIterator<IAWS4DCoreModelAttribute>;
begin
  result := FIteratorTags;
end;

end.
