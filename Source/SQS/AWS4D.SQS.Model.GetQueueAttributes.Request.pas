unit AWS4D.SQS.Model.GetQueueAttributes.Request;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Classes,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Model.Types,
  System.Generics.Collections;

type TAWS4DSQSGetQueueAttributesRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSQSGetQueueAttributesRequest<I>)

  private
    [Weak]
    FParent: I;
    FQueueUrl: string;
    FAttributes: TList<String>;
    FIteratorAttributes: IAWS4DIterator<String>;

  protected
    function QueueUrl(Value: String): IAWS4DSQSGetQueueAttributesRequest<I>; overload;
    function QueueUrl: string; overload;
    function Attributtes: IAWS4DIterator<String>;

    function AddAttribute(Value: String): IAWS4DSQSGetQueueAttributesRequest<I>;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSQSGetQueueAttributesRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DSQSGetQueueAttributesRequest<I>.AddAttribute(Value: String): IAWS4DSQSGetQueueAttributesRequest<I>;
begin
  result := Self;
  if not FAttributes.Contains(Value) then
    FAttributes.Add(Value);
end;

function TAWS4DSQSGetQueueAttributesRequest<I>.Attributtes: IAWS4DIterator<String>;
begin
  result := FIteratorAttributes;
end;

constructor TAWS4DSQSGetQueueAttributesRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FAttributes := TList<String>.create;
  FIteratorAttributes := TAWS4DCoreModelIterator<String>.New(FAttributes);
end;

destructor TAWS4DSQSGetQueueAttributesRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSQSGetQueueAttributesRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSQSGetQueueAttributesRequest<I>.New(Parent: I): IAWS4DSQSGetQueueAttributesRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSQSGetQueueAttributesRequest<I>.QueueUrl(Value: String): IAWS4DSQSGetQueueAttributesRequest<I>;
begin
  result := Self;
  FQueueUrl := Value;
end;

function TAWS4DSQSGetQueueAttributesRequest<I>.QueueUrl: string;
begin
  result := FQueueUrl;
end;

end.
