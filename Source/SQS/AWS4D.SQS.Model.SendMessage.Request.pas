unit AWS4D.SQS.Model.SendMessage.Request;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Model.Attribute,
  System.Generics.Collections;

type TAWS4DSQSSendMessageRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSQSSendMessageRequest<I>)

  private
    [Weak]
    FParent: I;
    FAttributes: TDictionary<String, String>;
    FSystemAttribute: TDictionary<String, String>;
    FIteratorAttributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;
    FIteratorSystemAttributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;

    FDelaySeconds: Integer;
    FMessageBody: String;
    FMessageDeduplicationId: String;
    FMessageGroupId: string;
    FQueueUrl: String;

  protected
    function AddAttribute(Key, Value: String): IAWS4DSQSSendMessageRequest<I>;
    function AddSystemAttribute(Key, Value: String): IAWS4DSQSSendMessageRequest<I>;
    function DelaySeconds(Value: Integer): IAWS4DSQSSendMessageRequest<I>; overload;
    function MessageBody(Value: String): IAWS4DSQSSendMessageRequest<I>; overload;
    function MessageDeduplicationId(Value: String): IAWS4DSQSSendMessageRequest<I>; overload;
    function MessageGroupId(Value: String): IAWS4DSQSSendMessageRequest<I>; overload;
    function QueueUrl(Value: String): IAWS4DSQSSendMessageRequest<I>; overload;

    function DelaySeconds: Integer; overload;
    function MessageBody: String; overload;
    function MessageDeduplicationId: String; overload;
    function MessageGroupId: String; overload;
    function QueueUrl: String; overload;

    function Attributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;
    function MessageSystemAttributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSQSSendMessageRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DSQSSendMessageRequest<I>.AddAttribute(Key, Value: String): IAWS4DSQSSendMessageRequest<I>;
begin
  Result := Self;
  FAttributes.AddOrSetValue(Key, Value);
end;

function TAWS4DSQSSendMessageRequest<I>.AddSystemAttribute(Key, Value: String): IAWS4DSQSSendMessageRequest<I>;
begin
  result := Self;
  FSystemAttribute.AddOrSetValue(Key, Value);
end;

function TAWS4DSQSSendMessageRequest<I>.Attributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;
begin
  if not Assigned(FIteratorAttributes) then
    FIteratorAttributes := TAWS4DCoreModelAttribute.NewIterator(FAttributes);
  Result := FIteratorAttributes;
end;

constructor TAWS4DSQSSendMessageRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FAttributes := TDictionary<string, String>.create;
  FSystemAttribute := TDictionary<string, String>.create;
end;

function TAWS4DSQSSendMessageRequest<I>.DelaySeconds: Integer;
begin
  result := FDelaySeconds;
end;

function TAWS4DSQSSendMessageRequest<I>.DelaySeconds(Value: Integer): IAWS4DSQSSendMessageRequest<I>;
begin
  result := Self;
  FDelaySeconds := Value;
end;

destructor TAWS4DSQSSendMessageRequest<I>.Destroy;
begin
  FAttributes.Free;
  FSystemAttribute.Free;
  inherited;
end;

function TAWS4DSQSSendMessageRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSQSSendMessageRequest<I>.MessageBody(Value: String): IAWS4DSQSSendMessageRequest<I>;
begin
  result := Self;
  FMessageBody := Value;
end;

function TAWS4DSQSSendMessageRequest<I>.MessageBody: String;
begin
  result := FMessageBody;
end;

function TAWS4DSQSSendMessageRequest<I>.MessageDeduplicationId(Value: String): IAWS4DSQSSendMessageRequest<I>;
begin
  result := Self;
  FMessageDeduplicationId := Value;
end;

function TAWS4DSQSSendMessageRequest<I>.MessageDeduplicationId: String;
begin
  result := FMessageDeduplicationId;
end;

function TAWS4DSQSSendMessageRequest<I>.MessageGroupId: String;
begin
  Result := FMessageGroupId;
end;

function TAWS4DSQSSendMessageRequest<I>.MessageGroupId(Value: String): IAWS4DSQSSendMessageRequest<I>;
begin
  result := Self;
  FMessageGroupId := Value;
end;

function TAWS4DSQSSendMessageRequest<I>.MessageSystemAttributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;
begin
  if not Assigned(FIteratorSystemAttributes) then
    FIteratorSystemAttributes := TAWS4DCoreModelAttribute.NewIterator(FSystemAttribute);
  Result := FIteratorSystemAttributes;
end;

class function TAWS4DSQSSendMessageRequest<I>.New(Parent: I): IAWS4DSQSSendMessageRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSQSSendMessageRequest<I>.QueueUrl: String;
begin
  result := FQueueUrl;
end;

function TAWS4DSQSSendMessageRequest<I>.QueueUrl(Value: String): IAWS4DSQSSendMessageRequest<I>;
begin
  result := Self;
  FQueueUrl := Value;
end;

end.
