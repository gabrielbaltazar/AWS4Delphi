unit AWS4D.SQS.Model.Interfaces;

interface

uses
  AWS4D.Core.Model.Types;

type
  IAWS4DSQSDeleteMessageRequest<I: IInterface> = interface
    ['{14908AEE-2924-49A4-8D71-6369C339EE76}']
    function QueueName(Value: String): IAWS4DSQSDeleteMessageRequest<I>; overload;
    function ReceiptHandle(Value: String): IAWS4DSQSDeleteMessageRequest<I>; overload;

    function QueueName: string; overload;
    function ReceiptHandle: string; overload;

    function &End: I;
  end;

  IAWS4DSQSGetQueueUrlRequest<I: IInterface> = interface
    ['{DD921743-06EE-43D4-926A-C20199517337}']
    function QueueName(Value: String): IAWS4DSQSGetQueueUrlRequest<I>; overload;
    function QueueOwnerAWSAccountId(Value: String): IAWS4DSQSGetQueueUrlRequest<I>; overload;

    function QueueName: string; overload;
    function QueueOwnerAWSAccountId: string; overload;

    function &End: I;
  end;

  IAWS4DSQSGetQueueUrlResponse<I: IInterface> = interface
    ['{F55B3832-DF1A-4BD3-830F-CD00875238C5}']
    function QueueUrl: string;
  end;

  IAWS4DSQSListQueuesRequest<I: IInterface> = interface
    ['{09C8F4FF-3C61-4416-951B-136C9A27EFD4}']
    function MaxResults(Value: Integer): IAWS4DSQSListQueuesRequest<I>; overload;
    function NextToken(Value: String): IAWS4DSQSListQueuesRequest<I>; overload;
    function QueueNamePrefix(Value: String): IAWS4DSQSListQueuesRequest<I>; overload;

    function MaxResults: Integer; overload;
    function NextToken: String; overload;
    function QueueNamePrefix: String; overload;

    function &End: I;
  end;

  IAWS4DSQSListQueuesResponse<I: IInterface> = interface
    ['{C403BDD3-0A89-4658-BFD8-F2B84EE92D00}']
    function NextToken: string;
    function QueueUrls: IAWS4DIterator<String>;

    function &End: I;
  end;

  IAWS4DSQSListQueueTagsRequest<I: IInterface> = interface
    ['{EC9ADDAA-4DCB-49CD-8353-48A204E88951}']
    function QueueUrl(Value: String): IAWS4DSQSListQueueTagsRequest<I>; overload;
    function QueueUrl: string; overload;

    function &End: I;
  end;

  IAWS4DSQSListQueueTagsResponse<I: IInterface> = interface
    ['{1D2DA9FB-7D73-4646-A108-506736ADB9F5}']
    function Tags: IAWS4DIterator<IAWS4DCoreModelTag>;

    function &End: I;
  end;

  IAWS4DSQSReceiveMessageRequest<I: IInterface> = interface
    ['{E960D790-4503-4BFD-A2E4-DFADF2A7CAF8}']
    function MaxNumberOfMessages(Value: Integer): IAWS4DSQSReceiveMessageRequest<I>; overload;
    function QueueUrl(Value: String): IAWS4DSQSReceiveMessageRequest<I>; overload;
    function ReceiveRequestAttemptId(Value: String): IAWS4DSQSReceiveMessageRequest<I>; overload;
    function VisibilityTimeout(Value: Integer): IAWS4DSQSReceiveMessageRequest<I>; overload;
    function WaitTimeSeconds(Value: Integer): IAWS4DSQSReceiveMessageRequest<I>; overload;
    function AddAttribute(Value: String): IAWS4DSQSReceiveMessageRequest<I>;
    function AddMessageAttribute(Value: String): IAWS4DSQSReceiveMessageRequest<I>;

    function MaxNumberOfMessages: Integer; overload;
    function QueueUrl: String; overload;
    function ReceiveRequestAttemptId: String; overload;
    function VisibilityTimeout: Integer; overload;
    function WaitTimeSeconds: Integer; overload;

    function Attributes: IAWS4DIterator<String>;
    function MessageAttributes: IAWS4DIterator<String>;

    function &End: I;
  end;

  IAWS4DSQSReceiveMessage = interface
    ['{047DE96B-0588-469A-8DD1-D4D4E6862E82}']
    function Attributes: IAWS4DIterator<IAWS4DCoreModelTag>;
    function MessageAttribute: IAWS4DIterator<IAWS4DCoreModelTag>;
    function Body: string;
    function MD5OfBody: string;
    function MD5OfMessageAttributes: String;
    function MessageId: String;
    function ReceiptHandle: string;
  end;

  IAWS4DSQSReceiveMessageResponse<I: IInterface> = interface
    ['{EB5286FB-97FF-45A3-9D9C-73F33FF232B9}']
    function Messages: IAWS4DIterator<IAWS4DSQSReceiveMessage>;
  end;

  IAWS4DSQSSendMessageRequest<I: IInterface> = interface
    ['{F5FC9F83-DFCE-4CAD-B244-A631F7F9F4E4}']
    function AddAttribute(Key, Value: String): IAWS4DSQSSendMessageRequest<I>;
    function AddSystemAttribute(Key, Value: String): IAWS4DSQSSendMessageRequest<I>;
    function DelaySeconds(Value: Integer): IAWS4DSQSSendMessageRequest<I>; overload;
    function MessageBody(Value: String): IAWS4DSQSSendMessageRequest<I>; overload;
    function MessageDeduplicationId(Value: String): IAWS4DSQSSendMessageRequest<I>; overload;
    function MessageGroupId(Value: String): IAWS4DSQSSendMessageRequest<I>; overload;
    function QueueUrl(Value: String): IAWS4DSQSSendMessageRequest<I>; overload;

    function DelaySeconds: Integer; overload;
    function MessageBody: String; overload;
    function MessageDeduplicationId: String; overload;
    function MessageGroupId: String; overload;
    function QueueUrl: String; overload;

    function Attributes: IAWS4DIterator<IAWS4DCoreModelTag>;
    function MessageSystemAttributes: IAWS4DIterator<IAWS4DCoreModelTag>;

    function &End: I;
  end;

  IAWS4DSQSSendMessageResponse<I: IInterface> = interface
    ['{2F9E34FB-3207-4EDF-A5F2-0A5E2DCFE1B2}']
    function MD5OfMessageAttributes: string;
    function MD5OfMessageBody: string;
    function MD5OfMessageSystemAttributes: string;
    function MessageId: string;
    function SequenceNumber: string;

    function &End: I;
  end;

implementation

end.
