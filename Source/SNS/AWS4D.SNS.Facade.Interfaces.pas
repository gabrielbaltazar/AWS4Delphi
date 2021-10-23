unit AWS4D.SNS.Facade.Interfaces;

interface

uses
  AWS4D.Core.Model.Types,
  AWS4D.SNS.Model.Interfaces;

type
  IAWS4DSNSFacadeAddPermission = interface;
  IAWS4DSNSFacadeCreateTopic = interface;
  IAWS4DSNSFacadeDeleteTopic = interface;
  IAWS4DSNSFacadeListSubscriptions = interface;
  IAWS4DSNSFacadeListTopics = interface;
  IAWS4DSNSFacadePublish = interface;
  IAWS4DSNSFacadeSetEndpointAttributes = interface;
  IAWS4DSNSFacadeSetPlatformApplicationAttributes = interface;
  IAWS4DSNSFacadeSetSubscriptionAttributes = interface;
  IAWS4DSNSFacadeSetTopicAttributes = interface;
  IAWS4DSNSFacadeSubscribe = interface;
  IAWS4DSNSFacadeUnsubscribe = interface;

  IAWS4DSNSFacade = interface
    ['{0D47D22F-3793-498D-AAA2-A40D48B72F12}']
    function AccessKey(Value: String): IAWS4DSNSFacade;
    function SecretKey(Value: String): IAWS4DSNSFacade;
    function Region(Value: String): IAWS4DSNSFacade; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSNSFacade; overload;

    function AddPermission: IAWS4DSNSFacadeAddPermission;
    function CreateTopic: IAWS4DSNSFacadeCreateTopic;
    function DeleteTopic: IAWS4DSNSFacadeDeleteTopic;
    function ListSubscriptions: IAWS4DSNSFacadeListSubscriptions;
    function ListTopics: IAWS4DSNSFacadeListTopics;
    function Publish: IAWS4DSNSFacadePublish;
    function SetEndpointAttributes: IAWS4DSNSFacadeSetEndpointAttributes;
    function SetPlatformApplicationAttributes: IAWS4DSNSFacadeSetPlatformApplicationAttributes;
    function SetSubscriptionsAttributes: IAWS4DSNSFacadeSetSubscriptionAttributes;
    function SetTopicAttributes: IAWS4DSNSFacadeSetTopicAttributes;
    function Subscribe: IAWS4DSNSFacadeSubscribe;
    function Unsubscribe: IAWS4DSNSFacadeUnsubscribe;
  end;

  IAWS4DSNSFacadeAddPermission = interface
    ['{56C85C18-5210-4918-A3C8-E62552BC7821}']
    function Request: IAWS4DSNSAddPermissionRequest<IAWS4DSNSFacadeAddPermission>;
    function Send: IAWS4DSNSAddPermissionRequest<IAWS4DSNSFacadeAddPermission>;
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

  IAWS4DSNSFacadePublish = interface
    ['{27E3BD64-F2E1-4ABE-9D5D-B378929107FB}']
    function Request: IAWS4DSNSPublishRequest<IAWS4DSNSFacadePublish>;
    function Send: IAWS4DSNSPublishResponse<IAWS4DSNSFacadePublish>;
    function Response: IAWS4DSNSPublishResponse<IAWS4DSNSFacadePublish>;
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

function NewSNSFacade: IAWS4DSNSFacade;

implementation

uses
  AWS4D.SNS.Facade;

function NewSNSFacade: IAWS4DSNSFacade;
begin
  result := TAWS4DSNSFacade.New;
end;

end.
