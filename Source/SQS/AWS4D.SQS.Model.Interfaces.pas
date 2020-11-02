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

  IAWS4DSQSModelReceiveMessageResponse = interface(IAWS4DModelResponseMetadata)
    ['{9EA58D01-46E0-4B81-96A4-A01361C20EC9}']
    function MessageId: String;
    function ReceiptHandle: string;
    function MD5OfBody: string;
    function Body: string;
    function Attributes: TDictionary<String, String>;
  end;

  IAWS4DSQSModelListQueueTagsResponse = interface(IAWS4DModelResponseMetadata)
    ['{03CA6BFE-4171-4EBC-903A-655E5D5EE3C4}']
    function Tags: TDictionary<String, String>;
  end;

  IAWS4DSQSModelFactory = interface
    ['{764198C1-DD25-4001-8AA7-1732E3CA3C56}']
    function ListQueuesRequest: IAWS4DSQSModelListQueuesRequest;
    function ReceiveMessageRequest: IAWS4DSQSModelReceiveMessageRequest;
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
