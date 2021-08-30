unit AWS4D.SQS.Facade.Interfaces;

interface

uses
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types;

type
  IAWS4DSQSFacadeDeleteMessage = interface;
  IAWS4DSQSFacadeDeleteMessageBatch = interface;
  IAWS4DSQSFacadeDeleteQueue = interface;
  IAWS4DSQSFacadeGetQueueAttributes = interface;
  IAWS4DSQSFacadeGetQueueUrl = interface;
  IAWS4DSQSFacadeListQueues = interface;
  IAWS4DSQSFacadeListQueueTags = interface;
  IAWS4DSQSFacadePurgeQueue = interface;
  IAWS4DSQSFacadeReceiveMessage = interface;
  IAWS4DSQSFacadeSendMessage = interface;
  IAWS4DSQSFacadeTagQueue = interface;
  IAWS4DSQSFacadeUnTagQueue = interface;

  IAWS4DSQSFacade = interface
    ['{0D47D22F-3793-498D-AAA2-A40D48B72F12}']
    function AccessKey(Value: String): IAWS4DSQSFacade;
    function SecretKey(Value: String): IAWS4DSQSFacade;
    function Region(Value: String): IAWS4DSQSFacade; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSQSFacade; overload;
    function Queue(Value: String): IAWS4DSQSFacade;

    function DeleteMessage: IAWS4DSQSFacadeDeleteMessage;
    function DeleteMessageBatch: IAWS4DSQSFacadeDeleteMessageBatch;
    function DeleteQueue: IAWS4DSQSFacadeDeleteQueue;
    function GetQueueAttributes: IAWS4DSQSFacadeGetQueueAttributes;
    function GetQueueUrl: IAWS4DSQSFacadeGetQueueUrl;
    function ListQueues: IAWS4DSQSFacadeListQueues;
    function ListQueueTags: IAWS4DSQSFacadeListQueueTags;
    function PurgeQueue: IAWS4DSQSFacadePurgeQueue;
    function ReceiveMessage: IAWS4DSQSFacadeReceiveMessage;
    function SendMessage: IAWS4DSQSFacadeSendMessage;
    function TagQueue: IAWS4DSQSFacadeTagQueue;
    function UnTagQueue: IAWS4DSQSFacadeUnTagQueue;
  end;

  IAWS4DSQSFacadeDeleteMessage = interface
    ['{AF249379-9F6F-42A5-9E50-BC007E815282}']
    function Request: IAWS4DSQSDeleteMessageRequest<IAWS4DSQSFacadeDeleteMessage>;
    function Send: IAWS4DSQSFacadeDeleteMessage;
  end;

  IAWS4DSQSFacadeDeleteMessageBatch = interface
    ['{3A905727-1841-4921-8AF3-7C5E61064490}']
    function Request: IAWS4DSQSDeleteMessageBatchRequest<IAWS4DSQSFacadeDeleteMessageBatch>;
    function Send: IAWS4DSQSFacadeDeleteMessageBatch;
  end;

  IAWS4DSQSFacadeDeleteQueue = interface
    ['{DACCF0CE-9923-4045-80F9-B0D49ABB68A5}']
    function Request: IAWS4DSQSDeleteQueueRequest<IAWS4DSQSFacadeDeleteQueue>;
    function Send: IAWS4DSQSFacadeDeleteQueue;
  end;

  IAWS4DSQSFacadeGetQueueAttributes = interface
    ['{78529DE6-F4BA-457B-A6DE-BD08A04506B7}']
    function Request: IAWS4DSQSGetQueueAttributesRequest<IAWS4DSQSFacadeGetQueueAttributes>;
    function Send: IAWS4DSQSGetQueueAttributesResponse<IAWS4DSQSFacadeGetQueueAttributes>;
    function Response: IAWS4DSQSGetQueueAttributesResponse<IAWS4DSQSFacadeGetQueueAttributes>;
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

  IAWS4DSQSFacadePurgeQueue = interface
    ['{F9C5E189-7346-48B0-AFCF-9A1E1EBA765C}']
    function Request: IAWS4DSQSPurgeQueueRequest<IAWS4DSQSFacadePurgeQueue>;
    function Send: IAWS4DSQSFacadePurgeQueue;
  end;

  IAWS4DSQSFacadeReceiveMessage = interface
    ['{8BEDCCBF-82B0-4FC8-A4E6-EE4BBF245F87}']
    function Request: IAWS4DSQSReceiveMessageRequest<IAWS4DSQSFacadeReceiveMessage>;
    function Send: IAWS4DSQSReceiveMessageResponse<IAWS4DSQSFacadeReceiveMessage>;
    function Response: IAWS4DSQSReceiveMessageResponse<IAWS4DSQSFacadeReceiveMessage>;
  end;

  IAWS4DSQSFacadeSendMessage = interface
    ['{DEBF7B93-BE82-499D-80F7-61E769510052}']
    function Request: IAWS4DSQSSendMessageRequest<IAWS4DSQSFacadeSendMessage>;
    function Send: IAWS4DSQSSendMessageResponse<IAWS4DSQSFacadeSendMessage>;
    function Response: IAWS4DSQSSendMessageResponse<IAWS4DSQSFacadeSendMessage>;
  end;

  IAWS4DSQSFacadeTagQueue = interface
    ['{66B3E18B-F166-4D11-97B9-F59FCA0EB303}']
    function Request: IAWS4DSQSTagQueueRequest<IAWS4DSQSFacadeTagQueue>;
    function Send: IAWS4DSQSFacadeTagQueue;
  end;

  IAWS4DSQSFacadeUnTagQueue = interface
    ['{365605D5-D6E6-4416-B169-7BAD920112CF}']
    function Request: IAWS4DSQSUnTagQueueRequest<IAWS4DSQSFacadeUnTagQueue>;
    function Send: IAWS4DSQSFacadeUnTagQueue;
  end;

implementation

end.
