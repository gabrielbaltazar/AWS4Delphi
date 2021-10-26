unit AWS4D.SNS.Model.GetTopicAttributes.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces;

type TAWS4DSNSModelGetTopicAttributesRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSGetTopicAttributesRequest<I>)

  private
    [Weak]
    FParent: I;
    FTopicArn: string;

  protected
    function TopicArn(Value: String): IAWS4DSNSGetTopicAttributesRequest<I>; overload;
    function TopicArn: String; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSGetTopicAttributesRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSModelGetTopicAttributesRequest<I> }

constructor TAWS4DSNSModelGetTopicAttributesRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelGetTopicAttributesRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelGetTopicAttributesRequest<I>.&End: I;
begin
  Result := FParent;
end;

class function TAWS4DSNSModelGetTopicAttributesRequest<I>.New(Parent: I): IAWS4DSNSGetTopicAttributesRequest<I>;
begin
  Result := Self.create(Parent);
end;

function TAWS4DSNSModelGetTopicAttributesRequest<I>.TopicArn(Value: String): IAWS4DSNSGetTopicAttributesRequest<I>;
begin
  result := Self;
  FTopicArn := Value;
end;

function TAWS4DSNSModelGetTopicAttributesRequest<I>.TopicArn: String;
begin
  result := FTopicArn;
end;

end.
