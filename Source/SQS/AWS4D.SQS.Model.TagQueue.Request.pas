unit AWS4D.SQS.Model.TagQueue.Request;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Model.Classes,
  System.Generics.Collections;

type TAWS4DSQSTagQueueRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSQSTagQueueRequest<I>)

  private
    [Weak]
    FParent: I;
    FQueueUrl: String;
    FTags: TDictionary<string, String>;
    FIteratorTags: IAWS4DIterator<IAWS4DCoreModelAttribute>;

  protected
    function QueueUrl(Value: String): IAWS4DSQSTagQueueRequest<I>; overload;
    function QueueUrl: String; overload;

    function AddTag(Key, Value: String): IAWS4DSQSTagQueueRequest<I>;
    function Tags: IAWS4DIterator<IAWS4DCoreModelAttribute>;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSQSTagQueueRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DSQSTagQueueRequest<I>.AddTag(Key, Value: String): IAWS4DSQSTagQueueRequest<I>;
begin
  result := Self;
  FTags.AddOrSetValue(Key, Value);
end;

constructor TAWS4DSQSTagQueueRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FTags := TDictionary<String, String>.create;
end;

destructor TAWS4DSQSTagQueueRequest<I>.Destroy;
begin
  FTags.Free;
  inherited;
end;

function TAWS4DSQSTagQueueRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSQSTagQueueRequest<I>.New(Parent: I): IAWS4DSQSTagQueueRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSQSTagQueueRequest<I>.QueueUrl: String;
begin
  result := FQueueUrl;
end;

function TAWS4DSQSTagQueueRequest<I>.QueueUrl(Value: String): IAWS4DSQSTagQueueRequest<I>;
begin
  result := Self;
  FQueueUrl := Value;
end;

function TAWS4DSQSTagQueueRequest<I>.Tags: IAWS4DIterator<IAWS4DCoreModelAttribute>;
begin
  if not Assigned(FIteratorTags) then
    FIteratorTags := TAWS4DCoreModelAttribute.NewIterator(FTags);
  result := FIteratorTags;
end;

end.
