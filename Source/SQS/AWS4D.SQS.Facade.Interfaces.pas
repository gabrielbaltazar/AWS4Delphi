unit AWS4D.SQS.Facade.Interfaces;

interface

uses
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types;

type
  IAWS4DSQSFacadeGetQueueUrl = interface;
  IAWS4DSQSFacadeListQueues = interface;
  IAWS4DSQSFacadeListQueueTags = interface;
  IAWS4DSQSFacadeSendMessage = interface;

  IAWS4DSQSFacade = interface
    ['{0D47D22F-3793-498D-AAA2-A40D48B72F12}']
    function AccessKey(Value: String): IAWS4DSQSFacade;
    function SecretKey(Value: String): IAWS4DSQSFacade;
    function Region(Value: String): IAWS4DSQSFacade; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSQSFacade; overload;

    function GetQueueUrl: IAWS4DSQSFacadeGetQueueUrl;
    function ListQueues: IAWS4DSQSFacadeListQueues;
    function ListQueueTags: IAWS4DSQSFacadeListQueueTags;
    function SendMessage: IAWS4DSQSFacadeSendMessage;
  end;

  IAWS4DSQSFacadeGetQueueUrl = interface
    ['{AF1CA212-C5FF-43E5-959F-FA67860040B5}']
    function Request: IAWS4DSQSGetQueueUrlRequest<IAWS4DSQSFacadeGetQueueUrl>;
    function Send: IAWS4DSQSGetQueueUrlResponse<IAWS4DSQSFacadeGetQueueUrl>;
    function Response: IAWS4DSQSGetQueueUrlResponse<IAWS4DSQSFacadeGetQueueUrl>;
  end;

  IAWS4DSQSFacadeListQueues = interface
    ['{3D75FFBB-DF0D-461C-AEA0-FFC73C66DA2A}']
    function Request: IAWS4DSQSListQueuesRequest<IAWS4DSQSFacadeListQueues>;
    function Send: IAWS4DSQSListQueuesResponse<IAWS4DSQSFacadeListQueues>;
    function Response: IAWS4DSQSListQueuesResponse<IAWS4DSQSFacadeListQueues>;
  end;

  IAWS4DSQSFacadeListQueueTags = interface
    ['{DEBF7B93-BE82-499D-80F7-61E769510052}']
    function Request: IAWS4DSQSListQueueTagsRequest<IAWS4DSQSFacadeListQueueTags>;
    function Send: IAWS4DSQSListQueueTagsResponse<IAWS4DSQSFacadeListQueueTags>;
    function Response: IAWS4DSQSListQueueTagsResponse<IAWS4DSQSFacadeListQueueTags>;
  end;

  IAWS4DSQSFacadeSendMessage = interface
    ['{DEBF7B93-BE82-499D-80F7-61E769510052}']
    function Request: IAWS4DSQSSendMessageRequest<IAWS4DSQSFacadeSendMessage>;
    function Send: IAWS4DSQSSendMessageResponse<IAWS4DSQSFacadeSendMessage>;
    function Response: IAWS4DSQSSendMessageResponse<IAWS4DSQSFacadeSendMessage>;
  end;

implementation

end.
