unit AWS4D.SNS.Model.Publish.Request;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  AWS4D.Core.Helper.JSON,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Model.Attribute,
  System.Generics.Collections,
  System.SysUtils,
  System.JSON;

type TAWS4DSNSModelPublishRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSNSPublishRequest<I>)

  private
    [Weak]
    FParent: I;
    FJSON: TJSONObject;
    FMessage: string;
    FMessageGroupId: String;
    FMessageDefault: String;
    FMessageEmail: String;
    FMessageSqs: String;
    FMessageLambda: String;
    FMessageHttp: String;
    FMessageHttps: String;
    FMessageSms: String;
    FMessageFirehouse: String;
    FMessageDeduplicationId: String;
    FMessageStructure: String;
    FPhoneNumber: String;
    FSubject: String;
    FTargetArn: String;
    FTopicArn: String;
    FAttributes: TList<IAWS4DCoreModelAttribute>;
    FIteratorAttributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;

    procedure SetJSONValue(Name, Value: String);

  protected
    function Message(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function Message: String; overload;

    function MessageDefault(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function MessageDefault: String; overload;

    function MessageEmail(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function MessageEmail: String; overload;

    function MessageSqs(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function MessageSqs: String; overload;

    function MessageLambda(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function MessageLambda: String; overload;

    function MessageHttp(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function MessageHttp: String; overload;

    function MessageHttps(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function MessageHttps: String; overload;

    function MessageSms(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function MessageSms: String; overload;

    function MessageFirehouse(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function MessageFirehouse: String; overload;

    function MessageDeduplicationId(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function MessageDeduplicationId: String; overload;

    function MessageGroupId(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function MessageGroupId: String; overload;

    function MessageStructure(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function MessageStructure: String; overload;

    function PhoneNumber(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function PhoneNumber: String; overload;

    function Subject(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function Subject: String; overload;

    function TargetArn(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function TargetArn: String; overload;

    function TopicArn(Value: String): IAWS4DSNSPublishRequest<I>; overload;
    function TopicArn: String; overload;

    function Attributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;
    function AddAttribute(Key, Value: String): IAWS4DSNSPublishRequest<I>;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSNSPublishRequest<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelPublishRequest<I> }

function TAWS4DSNSModelPublishRequest<I>.AddAttribute(Key, Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FAttributes.Add(TAWS4DCoreModelAttribute.New);
  FAttributes.Last
    .Key(Key)
    .Value(Value);
end;

function TAWS4DSNSModelPublishRequest<I>.Attributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;
begin
  result := FIteratorAttributes;
end;

constructor TAWS4DSNSModelPublishRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FJSON := TJSONObject.create;
  FAttributes := TList<IAWS4DCoreModelAttribute>.create;
  FIteratorAttributes := TAWS4DCoreModelIterator<IAWS4DCoreModelAttribute>.New(FAttributes);
end;

destructor TAWS4DSNSModelPublishRequest<I>.Destroy;
begin
  FJSON.Free;
  inherited;
end;

function TAWS4DSNSModelPublishRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSNSModelPublishRequest<I>.Message(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FMessage := Value;
  MessageStructure(EmptyStr);
end;

function TAWS4DSNSModelPublishRequest<I>.Message: String;
begin
  result := FMessage;
  if FMessageStructure = 'json' then
    Result := FJSON.ToString;
end;

function TAWS4DSNSModelPublishRequest<I>.MessageDeduplicationId: String;
begin
  result := FMessageDeduplicationId;
end;

function TAWS4DSNSModelPublishRequest<I>.MessageDefault: String;
begin
  result := FMessageDefault;
end;

function TAWS4DSNSModelPublishRequest<I>.MessageDefault(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FMessageDefault := Value;
  SetJSONValue('default', FMessageDefault);
end;

function TAWS4DSNSModelPublishRequest<I>.MessageEmail(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FMessageEmail := Value;
  SetJSONValue('email', FMessageEmail);
end;

function TAWS4DSNSModelPublishRequest<I>.MessageEmail: String;
begin
  result := FMessageEmail;
end;

function TAWS4DSNSModelPublishRequest<I>.MessageFirehouse(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FMessageFirehouse := Value;
  SetJSONValue('firehose', FMessageFirehouse);
end;

function TAWS4DSNSModelPublishRequest<I>.MessageFirehouse: String;
begin
  result := FMessageFirehouse;
end;

function TAWS4DSNSModelPublishRequest<I>.MessageDeduplicationId(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FMessageDeduplicationId := Value;
end;

function TAWS4DSNSModelPublishRequest<I>.MessageGroupId(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FMessageGroupId := Value;
end;

function TAWS4DSNSModelPublishRequest<I>.MessageGroupId: String;
begin
  result := FMessageGroupId;
end;

function TAWS4DSNSModelPublishRequest<I>.MessageHttp: String;
begin
  result := FMessageHttp;
end;

function TAWS4DSNSModelPublishRequest<I>.MessageHttp(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FMessageHttp := Value;
  SetJSONValue('http', FMessageHttp);
end;

function TAWS4DSNSModelPublishRequest<I>.MessageHttps: String;
begin
  result := FMessageHttps;
end;

function TAWS4DSNSModelPublishRequest<I>.MessageHttps(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FMessageHttps := Value;
  SetJSONValue('https', FMessageHttps);
end;

function TAWS4DSNSModelPublishRequest<I>.MessageLambda(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FMessageLambda := Value;
  SetJSONValue('lambda', FMessageLambda);
end;

function TAWS4DSNSModelPublishRequest<I>.MessageLambda: String;
begin
  result := FMessageLambda;
end;

function TAWS4DSNSModelPublishRequest<I>.MessageStructure(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FMessageStructure := Value;
end;

function TAWS4DSNSModelPublishRequest<I>.MessageSms: String;
begin
  result := FMessageSms;
end;

function TAWS4DSNSModelPublishRequest<I>.MessageSms(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FMessageSms := Value;
  SetJSONValue('sms', FMessageSms);
end;

function TAWS4DSNSModelPublishRequest<I>.MessageSqs: String;
begin
  result := FMessageSqs;
end;

function TAWS4DSNSModelPublishRequest<I>.MessageSqs(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FMessageSqs := Value;
  SetJSONValue('sqs', FMessageSqs);
end;

function TAWS4DSNSModelPublishRequest<I>.MessageStructure: String;
begin
  result := FMessageStructure;
end;

class function TAWS4DSNSModelPublishRequest<I>.New(Parent: I): IAWS4DSNSPublishRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DSNSModelPublishRequest<I>.PhoneNumber(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FPhoneNumber := Value;
end;

function TAWS4DSNSModelPublishRequest<I>.PhoneNumber: String;
begin
  result := FPhoneNumber;
end;

function TAWS4DSNSModelPublishRequest<I>.Subject(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FSubject := Value;
end;

procedure TAWS4DSNSModelPublishRequest<I>.SetJSONValue(Name, Value: String);
begin
  if Value.Trim <> EmptyStr then
  begin
    FJSON.SetValue(Name, Value);
    FMessageStructure := 'json';
  end;
end;

function TAWS4DSNSModelPublishRequest<I>.Subject: String;
begin
  result := FSubject;
end;

function TAWS4DSNSModelPublishRequest<I>.TargetArn(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FTargetArn := Value;
end;

function TAWS4DSNSModelPublishRequest<I>.TargetArn: String;
begin
  result := FTargetArn;
end;

function TAWS4DSNSModelPublishRequest<I>.TopicArn: String;
begin
  result := FTopicArn;
end;

function TAWS4DSNSModelPublishRequest<I>.TopicArn(Value: String): IAWS4DSNSPublishRequest<I>;
begin
  result := Self;
  FTopicArn := Value;
end;

end.
