unit AWS4D.SNS.Facade.Interfaces;

interface

uses
  AWS4D.Core.Model.Types,
  AWS4D.SNS.Model.Interfaces;

type
  IAWS4DSNSFacadeCreateTopic = interface;
  IAWS4DSNSFacadeListSubscriptions = interface;
  IAWS4DSNSFacadeListTopics = interface;

  IAWS4DSNSFacade = interface
    ['{0D47D22F-3793-498D-AAA2-A40D48B72F12}']
    function AccessKey(Value: String): IAWS4DSNSFacade;
    function SecretKey(Value: String): IAWS4DSNSFacade;
    function Region(Value: String): IAWS4DSNSFacade; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSNSFacade; overload;

    function CreateTopic: IAWS4DSNSFacadeCreateTopic;
    function ListSubscriptions: IAWS4DSNSFacadeListSubscriptions;
    function ListTopics: IAWS4DSNSFacadeListTopics;
  end;

  IAWS4DSNSFacadeCreateTopic = interface
    ['{E9CE8CFB-4E07-44D8-B6CB-30E2D2B1FCF1}']
    function Request: IAWS4DSNSCreateTopicRequest<IAWS4DSNSFacadeCreateTopic>;
    function Send: IAWS4DSNSCreateTopicResponse<IAWS4DSNSFacadeCreateTopic>;
    function Response: IAWS4DSNSCreateTopicResponse<IAWS4DSNSFacadeCreateTopic>;
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

function NewSNSFacade: IAWS4DSNSFacade;

implementation

uses
  AWS4D.SNS.Facade;

function NewSNSFacade: IAWS4DSNSFacade;
begin
  result := TAWS4DSNSFacade.New;
end;

end.
