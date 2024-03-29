unit AWS4D.SNS.Model.Interfaces;

interface

uses
  System.JSON,
  AWS4D.Core.Model.Types,
  AWS4D.SNS.Model.Types;

type
  IAWS4DSNSListSubscriptionsResponse<I: IInterface> = interface;

  TAWS4DSNSProtocol = AWS4D.SNS.Model.Types.TAWS4DSNSProtocol;

  IAWS4DSNSAddPermissionRequest<I: IInterface> = interface
    ['{E3B463CD-78DA-4F73-8891-BACFF4C06BD5}']
    function AddActionName(Value: String): IAWS4DSNSAddPermissionRequest<I>;
    function AWSAccountId(Value: String): IAWS4DSNSAddPermissionRequest<I>;

    function &Label(Value: String): IAWS4DSNSAddPermissionRequest<I>; overload;
    function &Label: String; overload;

    function TopicArn(Value: String): IAWS4DSNSAddPermissionRequest<I>; overload;
    function TopicArn: String; overload;

    function ActionsName: IAWS4DIterator<String>;
    function AWSAccountsId: IAWS4DIterator<String>;

    function &End: I;
  end;

  IAWS4DSNSCheckIfPhoneNumberIsOptedOutRequest<I: IInterface> = interface
    ['{27D2F895-91B6-4925-BB6C-63348A976B4E}']
    function PhoneNumber(Value: String): IAWS4DSNSCheckIfPhoneNumberIsOptedOutRequest<I>; overload;
    function PhoneNumber: String; overload;

    function &End: I;
  end;

  IAWS4DSNSCheckIfPhoneNumberIsOptedOutResponse<I: IInterface> = interface
    ['{70D1CBB8-7B61-40D0-B8F5-8E19B05E97EF}']
    function IsOptedOut: Boolean;

    function &End: I;
  end;

  IAWS4DSNSConfirmSubscriptionRequest<I: IInterface> = interface
    ['{B24B5329-8006-4BCD-B71A-777365B0BFAB}']
    function AuthenticateOnUnsubscribe(Value: Boolean): IAWS4DSNSConfirmSubscriptionRequest<I>; overload;
    function AuthenticateOnUnsubscribe: Boolean; overload;

    function Token(Value: String): IAWS4DSNSConfirmSubscriptionRequest<I>; overload;
    function Token: string; overload;

    function TopicArn(Value: String): IAWS4DSNSConfirmSubscriptionRequest<I>; overload;
    function TopicArn: string; overload;

    function &End: I;
  end;

  IAWS4DSNSConfirmSubscriptionResponse<I: IInterface> = interface
    ['{B24B5329-8006-4BCD-B71A-777365B0BFAB}']
    function SubscriptionArn: string;

    function &End: I;
  end;

  IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<I: IInterface> = interface
    ['{F001803F-69F1-470D-A53E-7FBF01DD92AE}']
    function LanguageCode(Value: String): IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<I>; overload;
    function LanguageCode: String; overload;

    function PhoneNumber(Value: String): IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<I>; overload;
    function PhoneNumber: String; overload;

    function &End: I;
  end;

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

  IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<I: IInterface> = interface
    ['{A4C115A9-6DA2-40A8-8EBE-244EC4929795}']
    function PhoneNumber(Value: String): IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<I>; overload;
    function PhoneNumber: String; overload;

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

  IAWS4DSNSGetSMSSandboxAccountStatusResponse<I: IInterface> = interface
    ['{C3823EAA-821E-4F9D-B8B3-A43551AEFBEF}']
    function IsInSandbox: Boolean; overload;

    function &End: I;
  end;

  IAWS4DSNSGetSubscriptionAttributesRequest<I: IInterface> = interface
    ['{23923B5B-1CEE-484A-8807-A8B1BBD147F1}']
    function SubscriptionArn(Value: String): IAWS4DSNSGetSubscriptionAttributesRequest<I>; overload;
    function SubscriptionArn: string; overload;

    function &End: I;
  end;

  IAWS4DSNSGetSubscriptionAttributesResponse<I: IInterface> = interface
    ['{45C68FB1-5DED-45C5-A7AA-032C4BE6D89A}']
    function ConfirmationWasAuthenticated(Value: Boolean): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function ConfirmationWasAuthenticated: Boolean; overload;

    function Endpoint(Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function Endpoint: string; overload;

    function Owner(Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function Owner: string; overload;

    function PendingConfirmation(Value: Boolean): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function PendingConfirmation: Boolean; overload;

    function Protocol(Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function Protocol: string; overload;

    function RawMessageDelivery(Value: Boolean): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function RawMessageDelivery: Boolean; overload;

    function SubscriptionArn(Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function SubscriptionArn: string; overload;

    function TopicArn(Value: String): IAWS4DSNSGetSubscriptionAttributesResponse<I>; overload;
    function TopicArn: string; overload;

    function &End: I;
  end;

  IAWS4DSNSGetTopicAttributesRequest<I: IInterface> = interface
    ['{0F79D547-E232-4262-A83F-CB43377599A5}']
    function TopicArn(Value: String): IAWS4DSNSGetTopicAttributesRequest<I>; overload;
    function TopicArn: String; overload;

    function &End: I;
  end;

  IAWS4DSNSGetTopicAttributesResponse<I: IInterface> = interface
    ['{0F79D547-E232-4262-A83F-CB43377599A5}']
    function DisplayName(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function DisplayName: String; overload;

    function EffectiveDeliveryPolicy(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function EffectiveDeliveryPolicy: String; overload;

    function Owner(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function Owner: String; overload;

    function Policy(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function Policy: String; overload;

    function SubscriptionsConfirmed(Value: Integer): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function SubscriptionsConfirmed: Integer; overload;

    function SubscriptionsDeleted(Value: Integer): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function SubscriptionsDeleted: Integer; overload;

    function SubscriptionsPending(Value: Integer): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function SubscriptionsPending: Integer; overload;

    function TopicArn(Value: String): IAWS4DSNSGetTopicAttributesResponse<I>; overload;
    function TopicArn: String; overload;

    function &End: I;
  end;

  IAWS4DSNSSMSSandboxPhoneNumber = interface
    ['{A35603EB-B743-42C7-B22A-E3BE71C06D7C}']
    function PhoneNumber: string; overload;
    function Status: string; overload;
  end;

  IAWS4DSNSListSMSSandboxPhoneNumbersRequest<I: IInterface> = interface
    ['{815CDFEA-9503-4847-978D-23631A0B6667}']
    function MaxResults(Value: Integer): IAWS4DSNSListSMSSandboxPhoneNumbersRequest<I>; overload;
    function MaxResults: Integer; overload;

    function NextToken(Value: String): IAWS4DSNSListSMSSandboxPhoneNumbersRequest<I>; overload;
    function NextToken: String; overload;

    function &End: I;
  end;

  IAWS4DSNSListSMSSandboxPhoneNumbersResponse<I: IInterface> = interface
    ['{547450B1-5F3B-43B3-AAC2-93DEAC538C26}']
    function NextToken: String; overload;
    function PhoneNumbers: IAWS4DIterator<IAWS4DSNSSMSSandboxPhoneNumber>;

    function &End: I;
  end;

  IAWS4DSNSOptInPhoneNumberRequest<I: IInterface> = interface
    ['{48AF0844-2B05-429C-BA72-ED0A2E3A01E5}']
    function PhoneNumber(Value: String): IAWS4DSNSOptInPhoneNumberRequest<I>; overload;
    function PhoneNumber: string; overload;

    function &End: I;
  end;

  IAWS4DSNSPublishRequest<I: IInterface> = interface
    ['{36BF1D73-D01C-4EB3-9F82-4C3AB83CC662}']
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
  end;

  IAWS4DSNSPublishResponse<I: IInterface> = interface
    ['{4A568410-B4A4-443E-A3AA-1AA35E49E72E}']
    function MessageId: String;
    function SequenceNumber: String;

    function &End: I;
  end;

  IAWS4DSNSRemovePermissionRequest<I: IInterface> = interface
    ['{AD7A7ADD-131A-46A4-A66D-6B368669DC1A}']
    function &Label(Value: String): IAWS4DSNSRemovePermissionRequest<I>; overload;
    function &Label: String; overload;

    function TopicArn(Value: String): IAWS4DSNSRemovePermissionRequest<I>; overload;
    function TopicArn: String; overload;

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

  IAWS4DSNSSetEndpointAttributesRequest<I: IInterface> = interface
    ['{584B4BA4-B993-475D-84D3-FE5AD7A29DC3}']
    function CustomUserData(Value: string): IAWS4DSNSSetEndpointAttributesRequest<I>; overload;
    function CustomUserData: string; overload;

    function Enabled(Value: Boolean): IAWS4DSNSSetEndpointAttributesRequest<I>; overload;
    function Enabled: Boolean; overload;

    function Token(Value: string): IAWS4DSNSSetEndpointAttributesRequest<I>; overload;
    function Token: string; overload;

    function EndpointArn(Value: string): IAWS4DSNSSetEndpointAttributesRequest<I>; overload;
    function EndpointArn: string; overload;

    function &End: I;
  end;

  IAWS4DSNSSetPlatformApplicationAttributesRequest<I> = interface
    ['{4E8C5E0B-6881-4FC5-879E-B8DBE3D94456}']
    function PlatformCredential(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function PlatformCredential: String; overload;

    function PlatformPrincipal(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function PlatformPrincipal: String; overload;

    function EventEndpointCreated(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function EventEndpointCreated: String; overload;

    function EventEndpointDeleted(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function EventEndpointDeleted: String; overload;

    function EventEndpointUpdated(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function EventEndpointUpdated: String; overload;

    function EventDeliveryFailure(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function EventDeliveryFailure: String; overload;

    function SuccessFeedbackRoleArn(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function SuccessFeedbackRoleArn: String; overload;

    function FailureFeedbackRoleArn(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function FailureFeedbackRoleArn: String; overload;

    function SuccessFeedbackSampleRate(Value: Integer): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function SuccessFeedbackSampleRate: Integer; overload;

    function PlatformApplicationArn(Value: String): IAWS4DSNSSetPlatformApplicationAttributesRequest<I>; overload;
    function PlatformApplicationArn: String; overload;

    function &End: I;
  end;

  IAWS4DSNSSetSubscriptionAttributesRequest<I> = interface
    ['{0D212BB5-2A52-4FE7-98A1-DF338BDAD796}']
    function AttributeName(Value: string): IAWS4DSNSSetSubscriptionAttributesRequest<I>; overload;
    function AttributeName: String; overload;

    function AttributeValue(Value: string): IAWS4DSNSSetSubscriptionAttributesRequest<I>; overload;
    function AttributeValue: String; overload;

    function SubscriptionArn(Value: String): IAWS4DSNSSetSubscriptionAttributesRequest<I>; overload;
    function SubscriptionArn: String; overload;

    function &End: I;
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

  IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<I: IInterface> = interface
    ['{4B0B15D7-40D7-44E0-A9C8-783C93044E5B}']
    function OneTimePassword(Value: string): IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<I>; overload;
    function OneTimePassword: string; overload;

    function PhoneNumber(Value: string): IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<I>; overload;
    function PhoneNumber: string; overload;

    function &End: I;
  end;

implementation

end.
