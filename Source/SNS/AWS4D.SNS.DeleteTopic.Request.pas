unit AWS4D.SNS.DeleteTopic.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces;

type TAWS4DSNSDeleteTopicRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSDeleteTopicRequest<I>)

  private
    [Weak]
    FParent: I;
    FTopicArn: string;

  protected
    function TopicArn(Value: String): IAWS4DSNSDeleteTopicRequest<I>; overload;
    function TopicArn: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSDeleteTopicRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSDeleteTopicRequest<I> }

constructor TAWS4DSNSDeleteTopicRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSDeleteTopicRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSDeleteTopicRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSNSDeleteTopicRequest<I>.New(Parent: I): IAWS4DSNSDeleteTopicRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSDeleteTopicRequest<I>.TopicArn(Value: String): IAWS4DSNSDeleteTopicRequest<I>;
begin
  result := Self;
  FTopicArn := Value;
end;

function TAWS4DSNSDeleteTopicRequest<I>.TopicArn: string;
begin
  result := FTopicArn;
end;

end.
