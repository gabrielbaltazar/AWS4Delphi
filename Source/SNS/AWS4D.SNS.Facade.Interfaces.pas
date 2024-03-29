unit AWS4D.SNS.Facade.Interfaces;

interface

uses
  AWS4D.Core.Model.Types,
  AWS4D.SNS.Model.Interfaces;

type
  IAWS4DSNSFacadeAddPermission = interface;
  IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut = interface;
  IAWS4DSNSFacadeConfirmSubscription = interface;
  IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber = interface;
  IAWS4DSNSFacadeCreateTopic = interface;
  IAWS4DSNSFacadeDeleteTopic = interface;
  IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber = interface;
  IAWS4DSNSFacadeGetSMSSandboxAccountStatus = interface;
  IAWS4DSNSFacadeGetSubscriptionAttributes = interface;
  IAWS4DSNSFacadeGetTopicAttributes = interface;
  IAWS4DSNSFacadeListSMSSandboxPhoneNumbers = interface;
  IAWS4DSNSFacadeListSubscriptions = interface;
  IAWS4DSNSFacadeListTopics = interface;
  IAWS4DSNSFacadeOptInPhoneNumber = interface;
  IAWS4DSNSFacadePublish = interface;
  IAWS4DSNSFacadeRemovePermission = interface;
  IAWS4DSNSFacadeSetEndpointAttributes = interface;
  IAWS4DSNSFacadeSetPlatformApplicationAttributes = interface;
  IAWS4DSNSFacadeSetSubscriptionAttributes = interface;
  IAWS4DSNSFacadeSetTopicAttributes = interface;
  IAWS4DSNSFacadeSubscribe = interface;
  IAWS4DSNSFacadeUnsubscribe = interface;
  IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber = interface;

  IAWS4DSNSFacade = interface
    ['{0D47D22F-3793-498D-AAA2-A40D48B72F12}']
    function AccessKey(Value: String): IAWS4DSNSFacade;
    function SecretKey(Value: String): IAWS4DSNSFacade;
    function Region(Value: String): IAWS4DSNSFacade; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSNSFacade; overload;

    function AddPermission: IAWS4DSNSFacadeAddPermission;
    function CheckIfPhoneNumberIsOptedOut: IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut;
    function ConfirmSubscription: IAWS4DSNSFacadeConfirmSubscription;
    function CreateSMSSandboxPhoneNumber: IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber;
    function CreateTopic: IAWS4DSNSFacadeCreateTopic;
    function DeleteTopic: IAWS4DSNSFacadeDeleteTopic;
    function DeleteSMSSandboxPhoneNumber: IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber;
    function GetSMSSandboxAccountStatus: IAWS4DSNSFacadeGetSMSSandboxAccountStatus;
    function GetSubscriptionAttributes: IAWS4DSNSFacadeGetSubscriptionAttributes;
    function GetTopicAttributes: IAWS4DSNSFacadeGetTopicAttributes;
    function ListSMSSandboxPhoneNumbers: IAWS4DSNSFacadeListSMSSandboxPhoneNumbers;
    function ListSubscriptions: IAWS4DSNSFacadeListSubscriptions;
    function ListTopics: IAWS4DSNSFacadeListTopics;
    function OptInPhoneNumber: IAWS4DSNSFacadeOptInPhoneNumber;
    function Publish: IAWS4DSNSFacadePublish;
    function RemovePersmission: IAWS4DSNSFacadeRemovePermission;
    function SetEndpointAttributes: IAWS4DSNSFacadeSetEndpointAttributes;
    function SetPlatformApplicationAttributes: IAWS4DSNSFacadeSetPlatformApplicationAttributes;
    function SetSubscriptionsAttributes: IAWS4DSNSFacadeSetSubscriptionAttributes;
    function SetTopicAttributes: IAWS4DSNSFacadeSetTopicAttributes;
    function Subscribe: IAWS4DSNSFacadeSubscribe;
    function Unsubscribe: IAWS4DSNSFacadeUnsubscribe;
    function VerifySMSSandboxPhoneNumber: IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber;
  end;

  IAWS4DSNSFacadeAddPermission = interface
    ['{56C85C18-5210-4918-A3C8-E62552BC7821}']
    function Request: IAWS4DSNSAddPermissionRequest<IAWS4DSNSFacadeAddPermission>;
    function Send: IAWS4DSNSAddPermissionRequest<IAWS4DSNSFacadeAddPermission>;
  end;

  IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut = interface
    ['{AC81E4B0-BB37-45A4-9773-360CFFA8E879}']
    function Request: IAWS4DSNSCheckIfPhoneNumberIsOptedOutRequest<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>;
    function Send: IAWS4DSNSCheckIfPhoneNumberIsOptedOutResponse<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>;
    function Response: IAWS4DSNSCheckIfPhoneNumberIsOptedOutResponse<IAWS4DSNSFacadeCheckIfPhoneNumberIsOptedOut>;
  end;

  IAWS4DSNSFacadeConfirmSubscription = interface
    ['{5FC46D3C-1237-4BDE-8D81-0C18B3A6CC34}']
    function Request: IAWS4DSNSConfirmSubscriptionRequest<IAWS4DSNSFacadeConfirmSubscription>;
    function Send: IAWS4DSNSConfirmSubscriptionResponse<IAWS4DSNSFacadeConfirmSubscription>;
    function Response: IAWS4DSNSConfirmSubscriptionResponse<IAWS4DSNSFacadeConfirmSubscription>;
  end;

  IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber = interface
    ['{1265DAEA-59F1-4650-9AE8-C99CC26E79F5}']
    function Request: IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber>;
    function Send: IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeCreateSMSSandboxPhoneNumber>;
  end;

  IAWS4DSNSFacadeCreateTopic = interface
    ['{E9CE8CFB-4E07-44D8-B6CB-30E2D2B1FCF1}']
    function Request: IAWS4DSNSCreateTopicRequest<IAWS4DSNSFacadeCreateTopic>;
    function Send: IAWS4DSNSCreateTopicResponse<IAWS4DSNSFacadeCreateTopic>;
    function Response: IAWS4DSNSCreateTopicResponse<IAWS4DSNSFacadeCreateTopic>;
  end;

  IAWS4DSNSFacadeDeleteTopic = interface
    ['{8FDFEDB8-4180-4867-8C45-35F25AE3F0A4}']
    function Request: IAWS4DSNSDeleteTopicRequest<IAWS4DSNSFacadeDeleteTopic>;
    function Send: IAWS4DSNSDeleteTopicRequest<IAWS4DSNSFacadeDeleteTopic>;
  end;

  IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber = interface
    ['{671E971F-ECC8-4920-ADC6-079C580C3FF3}']
    function Request: IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber>;
    function Send: IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeDeleteSMSSandboxPhoneNumber>;
  end;

  IAWS4DSNSFacadeGetSMSSandboxAccountStatus = interface
    ['{C680D2CA-E2F0-4D4D-B4FA-78F05FB27B48}']
    function Send: IAWS4DSNSGetSMSSandboxAccountStatusResponse<IAWS4DSNSFacadeGetSMSSandboxAccountStatus>;
    function Response: IAWS4DSNSGetSMSSandboxAccountStatusResponse<IAWS4DSNSFacadeGetSMSSandboxAccountStatus>;
  end;

  IAWS4DSNSFacadeGetSubscriptionAttributes = interface
    ['{A0D08D30-2E9A-45E9-9DDF-10E865B5B34D}']
    function Request: IAWS4DSNSGetSubscriptionAttributesRequest<IAWS4DSNSFacadeGetSubscriptionAttributes>;
    function Send: IAWS4DSNSGetSubscriptionAttributesResponse<IAWS4DSNSFacadeGetSubscriptionAttributes>;
    function Response: IAWS4DSNSGetSubscriptionAttributesResponse<IAWS4DSNSFacadeGetSubscriptionAttributes>;
  end;

  IAWS4DSNSFacadeGetTopicAttributes = interface
    ['{7334D6A6-AED3-4B50-B6D5-1973F80AE767}']
    function Request: IAWS4DSNSGetTopicAttributesRequest<IAWS4DSNSFacadeGetTopicAttributes>;
    function Send: IAWS4DSNSGetTopicAttributesResponse<IAWS4DSNSFacadeGetTopicAttributes>;
    function Response: IAWS4DSNSGetTopicAttributesResponse<IAWS4DSNSFacadeGetTopicAttributes>;
  end;

  IAWS4DSNSFacadeListSMSSandboxPhoneNumbers = interface
    ['{FA93BFC1-EF96-47A7-9922-A45700809840}']
    function Request: IAWS4DSNSListSMSSandboxPhoneNumbersRequest<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>;
    function Send: IAWS4DSNSListSMSSandboxPhoneNumbersResponse<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>;
    function Response: IAWS4DSNSListSMSSandboxPhoneNumbersResponse<IAWS4DSNSFacadeListSMSSandboxPhoneNumbers>;
  end;

  IAWS4DSNSFacadeListSubscriptions = interface
    ['{AC9CDB74-81FE-4149-81D3-1C41771C39CC}']
    function Request: IAWS4DSNSListSubscriptionsRequest<IAWS4DSNSFacadeListSubscriptions>;
    function Send: IAWS4DSNSListSubscriptionsResponse<IAWS4DSNSFacadeListSubscriptions>;
    function Response: IAWS4DSNSListSubscriptionsResponse<IAWS4DSNSFacadeListSubscriptions>;
  end;

  IAWS4DSNSFacadeListTopics = interface
    ['{6D5472E6-773E-4E99-BBD9-A7AA70D3ED85}']
    function Request: IAWS4DSNSListTopicsRequest<IAWS4DSNSFacadeListTopics>;
    function Send: IAWS4DSNSListTopicsResponse<IAWS4DSNSFacadeListTopics>;
    function Response: IAWS4DSNSListTopicsResponse<IAWS4DSNSFacadeListTopics>;
  end;

  IAWS4DSNSFacadeOptInPhoneNumber = interface
    ['{9EC43CC1-268E-43C5-81E8-10E1675BACBD}']
    function Request: IAWS4DSNSOptInPhoneNumberRequest<IAWS4DSNSFacadeOptInPhoneNumber>;
    function Send: IAWS4DSNSOptInPhoneNumberRequest<IAWS4DSNSFacadeOptInPhoneNumber>;
  end;

  IAWS4DSNSFacadePublish = interface
    ['{27E3BD64-F2E1-4ABE-9D5D-B378929107FB}']
    function Request: IAWS4DSNSPublishRequest<IAWS4DSNSFacadePublish>;
    function Send: IAWS4DSNSPublishResponse<IAWS4DSNSFacadePublish>;
    function Response: IAWS4DSNSPublishResponse<IAWS4DSNSFacadePublish>;
  end;

  IAWS4DSNSFacadeRemovePermission = interface
    ['{6EF74451-B164-4A27-AC05-B240C1CCC8E7}']
    function Request: IAWS4DSNSRemovePermissionRequest<IAWS4DSNSFacadeRemovePermission>;
    function Send: IAWS4DSNSRemovePermissionRequest<IAWS4DSNSFacadeRemovePermission>;
  end;

  IAWS4DSNSFacadeSetEndpointAttributes = interface
    ['{AA296D4E-F321-4E76-8FF8-A45080AA509F}']
    function Request: IAWS4DSNSSetEndpointAttributesRequest<IAWS4DSNSFacadeSetEndpointAttributes>;
    function Send: IAWS4DSNSSetEndpointAttributesRequest<IAWS4DSNSFacadeSetEndpointAttributes>;
  end;

  IAWS4DSNSFacadeSetPlatformApplicationAttributes = interface
    ['{BB74A2AD-2733-4D80-B54E-11ED84B370E6}']
    function Request: IAWS4DSNSSetPlatformApplicationAttributesRequest<IAWS4DSNSFacadeSetPlatformApplicationAttributes>;
    function Send: IAWS4DSNSSetPlatformApplicationAttributesRequest<IAWS4DSNSFacadeSetPlatformApplicationAttributes>;
  end;

  IAWS4DSNSFacadeSetSubscriptionAttributes = interface
    ['{9AD81947-C339-459D-AD49-EBFEB2776890}']
    function Request: IAWS4DSNSSetSubscriptionAttributesRequest<IAWS4DSNSFacadeSetSubscriptionAttributes>;
    function Send: IAWS4DSNSSetSubscriptionAttributesRequest<IAWS4DSNSFacadeSetSubscriptionAttributes>;
  end;

  IAWS4DSNSFacadeSetTopicAttributes = interface
    ['{9AD81947-C339-459D-AD49-EBFEB2776890}']
    function Request: IAWS4DSNSSetTopicAttributesRequest<IAWS4DSNSFacadeSetTopicAttributes>;
    function Send: IAWS4DSNSSetTopicAttributesRequest<IAWS4DSNSFacadeSetTopicAttributes>;
  end;

  IAWS4DSNSFacadeSubscribe = interface
    ['{FA56F0A4-D7B7-4F3B-BAAC-1F01BB08A307}']
    function Request: IAWS4DSNSSubscribeRequest<IAWS4DSNSFacadeSubscribe>;
    function Send: IAWS4DSNSSubscribeResponse<IAWS4DSNSFacadeSubscribe>;
    function Response: IAWS4DSNSSubscribeResponse<IAWS4DSNSFacadeSubscribe>;
  end;

  IAWS4DSNSFacadeUnsubscribe = interface
    ['{8FDFEDB8-4180-4867-8C45-35F25AE3F0A4}']
    function Request: IAWS4DSNSUnsubscribeRequest<IAWS4DSNSFacadeUnsubscribe>;
    function Send: IAWS4DSNSUnsubscribeRequest<IAWS4DSNSFacadeUnsubscribe>;
  end;

  IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber = interface
    ['{63165F25-B6F3-4345-861D-7EDE1CAE7F87}']
    function Request: IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber>;
    function Send: IAWS4DSNSVerifySMSSandboxPhoneNumberRequest<IAWS4DSNSFacadeVerifySMSSandboxPhoneNumber>;
  end;

function NewSNSFacade: IAWS4DSNSFacade;

implementation

uses
  AWS4D.SNS.Facade;

function NewSNSFacade: IAWS4DSNSFacade;
begin
  result := TAWS4DSNSFacade.New;
end;

end.
