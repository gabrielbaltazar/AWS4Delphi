unit AWS4D.SNS.Model.DeleteTopic.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces;

type TAWS4DSNSModelDeleteTopicRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSDeleteTopicRequest<I>)

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

{ TAWS4DSNSModelDeleteTopicRequest<I> }

constructor TAWS4DSNSModelDeleteTopicRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelDeleteTopicRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelDeleteTopicRequest<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4DSNSModelDeleteTopicRequest<I>.New(Parent: I): IAWS4DSNSDeleteTopicRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelDeleteTopicRequest<I>.TopicArn(Value: String): IAWS4DSNSDeleteTopicRequest<I>;
begin
  result := Self;
  FTopicArn := Value;
end;

function TAWS4DSNSModelDeleteTopicRequest<I>.TopicArn: string;
begin
  result := FTopicArn;
end;

end.
