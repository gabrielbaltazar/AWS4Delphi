unit AWS4D.SNS.Model.CreateTopic.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Model.Attribute,
  System.Generics.Collections;

type TAWS4DSNSModelCreateTopicRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSCreateTopicRequest<I>)

  private
    [Weak]
    FParent: I;
    FName: String;
    FDeliveryPolicy: String;
    FDisplayName: String;
    FFifoTopic: Boolean;
    FPolicy: string;
    FKmsMasterKeyId: string;
    FContentBasedDeduplication: Boolean;
    FTags: TList<IAWS4DCoreModelAttribute>;
    FIteratorTags: IAWS4DIterator<IAWS4DCoreModelAttribute>;

  protected
    function Name(Value: String): IAWS4DSNSCreateTopicRequest<I>; overload;
    function Name: String; overload;

    function DeliveryPolicy(Value: String): IAWS4DSNSCreateTopicRequest<I>; overload;
    function DeliveryPolicy: String; overload;

    function DisplayName(Value: String): IAWS4DSNSCreateTopicRequest<I>; overload;
    function DisplayName: String; overload;

    function FifoTopic(Value: Boolean): IAWS4DSNSCreateTopicRequest<I>; overload;
    function FifoTopic: Boolean; overload;

    function Policy(Value: String): IAWS4DSNSCreateTopicRequest<I>; overload;
    function Policy: String; overload;

    function KmsMasterKeyId(Value: String): IAWS4DSNSCreateTopicRequest<I>; overload;
    function KmsMasterKeyId: String; overload;

    function ContentBasedDeduplication(Value: Boolean): IAWS4DSNSCreateTopicRequest<I>; overload;
    function ContentBasedDeduplication: Boolean; overload;

    function Tags: IAWS4DIterator<IAWS4DCoreModelAttribute>;
    function AddTag(Key, Value: String): IAWS4DSNSCreateTopicRequest<I>;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSCreateTopicRequest<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelCreateTopicRequest<I> }

function TAWS4DSNSModelCreateTopicRequest<I>.AddTag(Key, Value: String): IAWS4DSNSCreateTopicRequest<I>;
begin
  result := Self;
  FTags.Add(TAWS4DCoreModelAttribute.New);
  FTags.Last
    .Key(Key)
    .Value(Value);
end;

function TAWS4DSNSModelCreateTopicRequest<I>.ContentBasedDeduplication(Value: Boolean): IAWS4DSNSCreateTopicRequest<I>;
begin
  Result := Self;
  FContentBasedDeduplication := Value;
end;

function TAWS4DSNSModelCreateTopicRequest<I>.ContentBasedDeduplication: Boolean;
begin
  result := FContentBasedDeduplication;
end;

constructor TAWS4DSNSModelCreateTopicRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FTags := TList<IAWS4DCoreModelAttribute>.create;
  FIteratorTags := TAWS4DCoreModelIterator<IAWS4DCoreModelAttribute>.New(FTags);
end;

function TAWS4DSNSModelCreateTopicRequest<I>.DeliveryPolicy: String;
begin
  result := FDeliveryPolicy;
end;

function TAWS4DSNSModelCreateTopicRequest<I>.DeliveryPolicy(Value: String): IAWS4DSNSCreateTopicRequest<I>;
begin
  result := Self;
  FDeliveryPolicy := Value;
end;

destructor TAWS4DSNSModelCreateTopicRequest<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelCreateTopicRequest<I>.DisplayName: String;
begin
  result := FDisplayName;
end;

function TAWS4DSNSModelCreateTopicRequest<I>.DisplayName(Value: String): IAWS4DSNSCreateTopicRequest<I>;
begin
  result := Self;
  FDisplayName := Value;
end;

function TAWS4DSNSModelCreateTopicRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSNSModelCreateTopicRequest<I>.FifoTopic(Value: Boolean): IAWS4DSNSCreateTopicRequest<I>;
begin
  result := Self;
  FFifoTopic := Value;
end;

function TAWS4DSNSModelCreateTopicRequest<I>.FifoTopic: Boolean;
begin
  Result := FFifoTopic;
end;

function TAWS4DSNSModelCreateTopicRequest<I>.KmsMasterKeyId(Value: String): IAWS4DSNSCreateTopicRequest<I>;
begin
  result := Self;
  FKmsMasterKeyId := Value;
end;

function TAWS4DSNSModelCreateTopicRequest<I>.KmsMasterKeyId: String;
begin
  result := FKmsMasterKeyId;
end;

function TAWS4DSNSModelCreateTopicRequest<I>.Name(Value: String): IAWS4DSNSCreateTopicRequest<I>;
begin
  result := Self;
  FName := Value;
end;

function TAWS4DSNSModelCreateTopicRequest<I>.Name: String;
begin
  result := FName;
end;

class function TAWS4DSNSModelCreateTopicRequest<I>.New(Parent: I): IAWS4DSNSCreateTopicRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelCreateTopicRequest<I>.Policy(Value: String): IAWS4DSNSCreateTopicRequest<I>;
begin
  result := Self;
  FPolicy := Value;
end;

function TAWS4DSNSModelCreateTopicRequest<I>.Policy: String;
begin
  result := FPolicy;
end;

function TAWS4DSNSModelCreateTopicRequest<I>.Tags: IAWS4DIterator<IAWS4DCoreModelAttribute>;
begin
  result := FIteratorTags;
end;

end.
