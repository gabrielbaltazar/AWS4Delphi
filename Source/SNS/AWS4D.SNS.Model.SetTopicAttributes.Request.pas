unit AWS4D.SNS.Model.SetTopicAttributes.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces;

type TAWS4DSNSModelSetTopicAttributesRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSSetTopicAttributesRequest<I>)

  private
    [Weak]
    FParent: I;
    FAttributeName: String;
    FAttributeValue: String;
    FTopicArn: string;

  protected
    function AttributeName(Value: string): IAWS4DSNSSetTopicAttributesRequest<I>; overload;
    function AttributeName: String; overload;

    function AttributeValue(Value: string): IAWS4DSNSSetTopicAttributesRequest<I>; overload;
    function AttributeValue: String; overload;

    function TopicArn(Value: String): IAWS4DSNSSetTopicAttributesRequest<I>; overload;
    function TopicArn: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSSetTopicAttributesRequest<I>;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSNSModelSetTopicAttributesRequest<I> }

function TAWS4DSNSModelSetTopicAttributesRequest<I>.AttributeName: String;
begin
  result := FAttributeName;
end;

function TAWS4DSNSModelSetTopicAttributesRequest<I>.AttributeName(Value: string): IAWS4DSNSSetTopicAttributesRequest<I>;
begin
  result := Self;
  FAttributeName := Value;
end;

function TAWS4DSNSModelSetTopicAttributesRequest<I>.AttributeValue(Value: string): IAWS4DSNSSetTopicAttributesRequest<I>;
begin
  result := Self;
  FAttributeValue := Value;
end;

function TAWS4DSNSModelSetTopicAttributesRequest<I>.AttributeValue: String;
begin
  result := FAttributeValue;
end;

constructor TAWS4DSNSModelSetTopicAttributesRequest<I>.create(Parent: I);
begin
  FParent := Parent;
end;

destructor TAWS4DSNSModelSetTopicAttributesRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelSetTopicAttributesRequest<I>.&End: I;
begin
  Result := FParent;
end;

class function TAWS4DSNSModelSetTopicAttributesRequest<I>.New(Parent: I): IAWS4DSNSSetTopicAttributesRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelSetTopicAttributesRequest<I>.TopicArn(Value: String): IAWS4DSNSSetTopicAttributesRequest<I>;
begin
  result := Self;
  FTopicArn := Value;
end;

function TAWS4DSNSModelSetTopicAttributesRequest<I>.TopicArn: string;
begin
  result := FTopicArn;
end;

end.
