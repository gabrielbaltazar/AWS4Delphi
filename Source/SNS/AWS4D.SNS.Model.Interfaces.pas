unit AWS4D.SNS.Model.Interfaces;

interface

uses
  System.JSON,
  AWS4D.Core.Model.Types,
  AWS4D.SNS.Model.Types;

type
  IAWS4DSNSListSubscriptionsResponse<I: IInterface> = interface;

  TAWS4DSNSProtocol = AWS4D.SNS.Model.Types.TAWS4DSNSProtocol;

  IAWS4DSNSCreateTopicRequest<I: IInterface> = interface
    ['{503C3822-F05A-4DF3-B765-846E1D8F5651}']
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
  end;

  IAWS4DSNSDeleteTopicRequest<I: IInterface> = interface
    ['{AC92EF1C-EBAD-4172-9B63-C9571D8CB289}']
    function TopicArn(Value: String): IAWS4DSNSDeleteTopicRequest<I>; overload;
    function TopicArn: string; overload;

    function &End: I;
  end;

  IAWS4DSNSCreateTopicResponse<I: IInterface> = interface
    ['{4D50A95F-74D7-4539-951B-ABFAC0964827}']
    function TopicArn: string;
  end;

  IAWS4DSNSListSubscriptionsRequest<I: IInterface> = interface
    ['{3BCC7E93-2749-4B9B-8147-06EFC5EC5EDB}']
    function NextToken(Value: String): IAWS4DSNSListSubscriptionsRequest<I>; overload;
    function NextToken: String; overload;

    function TopicArn(Value: String): IAWS4DSNSListSubscriptionsRequest<I>; overload;
    function TopicArn: String; overload;

    function &End: I;
  end;

  IAWS4DSNSPublishRequest<I: IInterface> = interface
    ['{36BF1D73-D01C-4EB3-9F82-4C3AB83CC662}']
    function JSON(Value: TJSONObject): IAWS4DSNSListSubscriptionsRequest<I>; overload;
    function JSON: TJSONObject; overload;

    function MessageDeduplicationId(Value: String): IAWS4DSNSListSubscriptionsRequest<I>; overload;
    function MessageDeduplicationId: String; overload;

    function MessageGroupId(Value: String): IAWS4DSNSListSubscriptionsRequest<I>; overload;
    function MessageGroupId: String; overload;

    function PhoneNumber(Value: String): IAWS4DSNSListSubscriptionsRequest<I>; overload;
    function PhoneNumber: String; overload;

    function Subject(Value: String): IAWS4DSNSListSubscriptionsRequest<I>; overload;
    function Subject: String; overload;

    function TargetArn(Value: String): IAWS4DSNSListSubscriptionsRequest<I>; overload;
    function TargetArn: String; overload;

    function TopicArn(Value: String): IAWS4DSNSListSubscriptionsRequest<I>; overload;
    function TopicArn: String; overload;

    function Attributes: IAWS4DIterator<IAWS4DCoreModelAttribute>;
    function AddAttributes(Key, Value: String): IAWS4DSNSListSubscriptionsRequest<I>;

    function &End: I;
  end;

  IAWS4DSNSSubscription = interface
    ['{54A16395-9D34-4B7A-A710-B650BC2446C8}']
    function Endpoint: String;
    function Owner: string;
    function Protocol: String;
    function SubscriptionArn: String;
    function TopicArn: string;
  end;

  IAWS4DSNSListSubscriptionsResponse<I: IInterface> = interface
    ['{C17BDB10-C92B-41FF-BD83-6869669BF4D9}']
    function NextToken: string;
    function Subscriptions: IAWS4DIterator<IAWS4DSNSSubscription>;

    function &End: I;
  end;

  IAWS4DSNSListTopicsRequest<I: IInterface> = interface
    ['{E011D208-1C63-4DC0-96DF-78EE8BA4C92A}']
    function NextToken(Value: String): IAWS4DSNSListTopicsRequest<I>; overload;
    function NextToken: String; overload;

    function &End: I;
  end;

  IAWS4DSNSListTopicsResponse<I> = interface
    ['{A44CCB8A-FBDA-448F-BF34-6F9D7256FCF4}']
    function NextToken: String;
    function Topics: IAWS4DIterator<String>;
  end;

  IAWS4DSNSSetTopicAttributesRequest<I> = interface
    ['{2D0EED3C-7B71-4775-AB72-07AD9C68EC5E}']
    function AttributeName(Value: string): IAWS4DSNSSetTopicAttributesRequest<I>; overload;
    function AttributeName: String; overload;

    function AttributeValue(Value: string): IAWS4DSNSSetTopicAttributesRequest<I>; overload;
    function AttributeValue: String; overload;

    function TopicArn(Value: String): IAWS4DSNSSetTopicAttributesRequest<I>; overload;
    function TopicArn: String; overload;

    function &End: I;
  end;

  IAWS4DSNSSubscribeRequest<I: IInterface> = interface
    ['{6DD4277E-B605-45D3-870B-854A60B2D80D}']
    function DeliveryPolicy(Value: String): IAWS4DSNSSubscribeRequest<I>; overload;
    function DeliveryPolicy: String; overload;

    function FilterPolicy(Value: String): IAWS4DSNSSubscribeRequest<I>; overload;
    function FilterPolicy: String; overload;

    function RawMessageDelivery(Value: String): IAWS4DSNSSubscribeRequest<I>; overload;
    function RawMessageDelivery: String; overload;

    function RedrivePolicy(Value: Boolean): IAWS4DSNSSubscribeRequest<I>; overload;
    function RedrivePolicy: Boolean; overload;

    function SubscriptionRoleArn(Value: String): IAWS4DSNSSubscribeRequest<I>; overload;
    function SubscriptionRoleArn: String; overload;

    function Endpoint(Value: String): IAWS4DSNSSubscribeRequest<I>; overload;
    function Endpoint: String; overload;

    function Protocol(Value: String): IAWS4DSNSSubscribeRequest<I>; overload;
    function Protocol(Value: TAWS4DSNSProtocol): IAWS4DSNSSubscribeRequest<I>; overload;
    function Protocol: String; overload;

    function ReturnSubscriptionArn(Value: Boolean): IAWS4DSNSSubscribeRequest<I>; overload;
    function ReturnSubscriptionArn: Boolean; overload;

    function TopicArn(Value: String): IAWS4DSNSSubscribeRequest<I>; overload;
    function TopicArn: String; overload;

    function &End: I;
  end;

  IAWS4DSNSSubscribeResponse<I: IInterface> = interface
    ['{9719EFE8-D0C1-4274-8978-4066BEEDFD28}']
    function SubscriptionArn: String;

    function &End: I;
  end;

  IAWS4DSNSUnsubscribeRequest<I: IInterface> = interface
    ['{BD8B2FAF-4EC6-4FA1-8D16-B306B57C0C7D}']
    function SubscriptionArn(Value: string): IAWS4DSNSUnsubscribeRequest<I>; overload;
    function SubscriptionArn: string; overload;

    function &End: I;
  end;

implementation

end.
