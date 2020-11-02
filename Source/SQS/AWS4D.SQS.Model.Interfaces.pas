unit AWS4D.SQS.Model.Interfaces;

interface

uses
  AWS4D.Model.Interfaces,
  System.Generics.Collections;

type
  EAWS4DHTTPException = AWS4D.Model.Interfaces.EAWS4DHTTPException;

  IAWS4DSQSModelListQueuesRequest = interface(IAWS4DModelRequest)
    ['{B6162E16-4F71-4830-91D7-8433E64E1172}']
    function MaxResults      (Value: Integer): IAWS4DSQSModelListQueuesRequest; overload;
    function NextToken       (Value: string): IAWS4DSQSModelListQueuesRequest; overload;
    function QueueNamePrefix (Value: string): IAWS4DSQSModelListQueuesRequest; overload;

    function MaxResults      : Integer; overload;
    function NextToken       : string; overload;
    function QueueNamePrefix : string; overload;
  end;

  IAWS4DSQSModelListQueuesResponse = interface(IAWS4DModelResponseMetadata)
    ['{3772C8BA-4901-4018-BAFB-37C2C27CB157}']
    function QueuesUrls: TList<String>;
    function NextToken: string;
  end;

  IAWS4DSQSModelReceiveMessageRequest = interface(IAWS4DModelRequest)
    ['{B54C8256-86AE-4619-B7C2-21A44472EEC4}']
    function queueUrl                (Value: String) : IAWS4DSQSModelReceiveMessageRequest; overload;
    function maxNumberOfMessages     (Value: Integer): IAWS4DSQSModelReceiveMessageRequest; overload;
    function visibilityTimeout       (Value: Integer): IAWS4DSQSModelReceiveMessageRequest; overload;
    function waitTimeSeconds         (Value: Integer): IAWS4DSQSModelReceiveMessageRequest; overload;
    function receiveRequestAttemptId (Value: Integer): IAWS4DSQSModelReceiveMessageRequest; overload;

    function queueUrl: string; overload;
    function maxNumberOfMessages: Integer; overload;
    function visibilityTimeout: Integer; overload;
    function waitTimeSeconds: Integer; overload;
    function receiveRequestAttemptId: Integer; overload;

    function attributeNames: TList<String>;
    function messageAttributeNames: TList<String>;
  end;

  IAWS4DSQSModelReceiveMessage = interface
    ['{9EA58D01-46E0-4B81-96A4-A01361C20EC9}']
    function MessageId: String;
    function ReceiptHandle: string;
    function MD5OfBody: string;
    function Body: string;
    function Attributes: TDictionary<String, String>;
  end;

  IAWS4DSQSModelReceiveMessageResponse = interface(IAWS4DModelResponseMetadata)
    ['{8484C39F-5D49-49CB-B39B-62E927DFC120}']
    function Messages: TList<IAWS4DSQSModelReceiveMessage>;
  end;

  IAWS4DSQSModelSendMessageRequest = interface
    ['{4E07F59F-AF1D-41BC-91FD-D007125E0979}']
    function DelaySeconds         (Value: Integer): IAWS4DSQSModelSendMessageRequest; overload;
    function MessageBody          (Value: String): IAWS4DSQSModelSendMessageRequest; overload;
    function MessageDuplicationId (Value: String): IAWS4DSQSModelSendMessageRequest; overload;
    function MessageGroupId       (Value: String): IAWS4DSQSModelSendMessageRequest; overload;
    function QueueUrl             (Value: String): IAWS4DSQSModelSendMessageRequest; overload;

    function DelaySeconds         : Integer; overload;
    function MessageBody          : String; overload;
    function MessageDuplicationId : String; overload;
    function MessageGroupId       : String; overload;
    function QueueUrl             : String; overload;

    function AddMessageAttribute(Name, Value: String): IAWS4DSQSModelSendMessageRequest;
    function MessageAttribute: TDictionary<String, String>; overload;

    function AddMessageSystemAttribute(Name, Value: String): IAWS4DSQSModelSendMessageRequest;
    function MessageSystemAttribute: TDictionary<String, String>; overload;
  end;

  IAWS4DSQSModelSendMessageResponse = interface(IAWS4DModelResponseMetadata)
    ['{E992340E-3B47-411A-B331-BBD2CF1BD339}']
    function MD5OfMessageAttributes: string;
    function MD5OfMessageBody: string;
    function MD5OfMessageSystemAttributes: string;
    function MessageId: string;
    function SequenceNumber: string;
  end;

  IAWS4DSQSModelDeleteMessageRequest = interface
    ['{02989BF2-A1FB-4F0B-BF1D-52D77321CFA4}']
    function QueueUrl: string; overload;
    function ReceiptHandle: string; overload;

    function ReceiptHandle(Value: String): IAWS4DSQSModelDeleteMessageRequest; overload;
    function QueueUrl(Value: String): IAWS4DSQSModelDeleteMessageRequest; overload;
    function Message(Value: IAWS4DSQSModelReceiveMessage): IAWS4DSQSModelDeleteMessageRequest;
  end;

  IAWS4DSQSModelDeleteMessageResponse = interface(IAWS4DModelResponseMetadata)
    ['{080D6C3B-71DF-4B44-92B8-01CE7E031F62}']
  end;

  IAWS4DSQSModelListQueueTagsResponse = interface(IAWS4DModelResponseMetadata)
    ['{03CA6BFE-4171-4EBC-903A-655E5D5EE3C4}']
    function Tags: TDictionary<String, String>;
  end;

  IAWS4DSQSModelGetQueueUrlResponse = interface(IAWS4DModelResponseMetadata)
    ['{33764771-FA8E-4472-885D-38E1085AFDC3}']
    function QueueUrl: string;
  end;

  IAWS4DSQSModelFactory = interface
    ['{764198C1-DD25-4001-8AA7-1732E3CA3C56}']
    function DeleteMessageRequest: IAWS4DSQSModelDeleteMessageRequest;
    function ListQueuesRequest: IAWS4DSQSModelListQueuesRequest;
    function ReceiveMessageRequest: IAWS4DSQSModelReceiveMessageRequest;
    function SendMessageRequest: IAWS4DSQSModelSendMessageRequest;
  end;

function SQSModelFactory: IAWS4DSQSModelFactory;

implementation

uses
  AWS4D.SQS.Model.Factory;

function SQSModelFactory: IAWS4DSQSModelFactory;
begin
  result := TAWS4DSQSModelFactory.GetInstance;
end;

end.
