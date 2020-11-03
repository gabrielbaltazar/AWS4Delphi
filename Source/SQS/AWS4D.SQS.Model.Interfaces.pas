unit AWS4D.SQS.Model.Interfaces;

interface

uses
  AWS4D.Model.Interfaces,
  System.Generics.Collections;

type
  EAWS4DHTTPException = AWS4D.Model.Interfaces.EAWS4DHTTPException;

  IAWS4DSQSModelReceiveMessage = interface;

  IAWS4DSQSModelCreateQueueRequest = interface(IAWS4DModelRequest)
    ['{128E904C-9FDC-41CF-A57C-2DB099FB331A}']
    /// <summary>The name of the new queue. The following limits apply to this name.</summary>
    /// <remarks>
    ///   Queue URLs and names are case-sensitive.
    ///   A queue name can have up to 80 characters.
    ///   Valid values: alphanumeric characters, hyphens (-), and underscores (_).
    ///   A FIFO queue name must end with the .fifo suffix.
    /// </remarks>
    function QueueName(Value: String): IAWS4DSQSModelCreateQueueRequest; overload;
    function QueueName: string; overload;

    /// <summary>Add cost allocation tags to the specified Amazon SQS queue.</summary>
    /// <remarks>
    ///   When you use queue tags, keep the following guidelines in mind:
    ///   Adding more than 50 tags to a queue isn't recommended.
    ///   Tags don't have any semantic meaning. Amazon SQS interprets tags as character strings.
    ///   Tags are case-sensitive.
    ///   A new tag with a key identical to that of an existing tag overwrites the existing tag.
    ///   For a full list of tag restrictions, see https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-quotas.html#limits-queues.
    /// </remarks>
    function AddTag(Key, Value: String): IAWS4DSQSModelCreateQueueRequest;

    /// <summary>A map of attributes with their corresponding values.</summary>
    /// <remarks>
    ///   The following lists the names, descriptions, and values of the special request parameters that the CreateQueue action uses:
    ///   https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_CreateQueue.html
    /// </remarks>
    function AddAttribute(Key, Value: String): IAWS4DSQSModelCreateQueueRequest;

    function Tags: TDictionary<String, String>;
    function Attributes: TDictionary<String, String>;
  end;

  IAWS4DSQSModelCreateQueueResponse = interface(IAWS4DModelResponseMetadata)
    ['{4CB34A5D-C279-4113-A7D9-F470F6277DA0}']
    /// <summary>
    ///   The URL of the created Amazon SQS queue.
    /// </summary>
    function QueueUrl: string;
  end;

  IAWS4DSQSModelDeleteMessageRequest = interface
    ['{02989BF2-A1FB-4F0B-BF1D-52D77321CFA4}']
    /// <summary>The URL of the Amazon SQS queue from which messages are deleted.</summary>
    /// <remarks>Queue URLs and names are case-sensitive.</remarks>
    function QueueUrl(Value: String): IAWS4DSQSModelDeleteMessageRequest; overload;

    /// <summary>The receipt handle associated with the message to delete.</summary>
    function ReceiptHandle(Value: String): IAWS4DSQSModelDeleteMessageRequest; overload;

    /// <summary>The message interface to delete.</summary>
    function Message(Value: IAWS4DSQSModelReceiveMessage): IAWS4DSQSModelDeleteMessageRequest;

    function QueueUrl: string; overload;
    function ReceiptHandle: string; overload;
  end;

  IAWS4DSQSModelDeleteMessageResponse = interface(IAWS4DModelResponseMetadata)
    ['{080D6C3B-71DF-4B44-92B8-01CE7E031F62}']
  end;

  IAWS4DSQSModelDeleteMessageBatchRequest = interface
    ['{3440199B-8B69-4430-A499-5F73157253DA}']
    /// <summary>The URL of the Amazon SQS queue from which messages are deleted.</summary>
    /// <remarks>Queue URLs and names are case-sensitive.</remarks>
    function QueueUrl(Value: String): IAWS4DSQSModelDeleteMessageBatchRequest; overload;

    /// <summary>Add in list of receipt handles for the messages to be deleted.</summary>
    /// <param name="Id">
    ///    An identifier for this particular receipt handle. This is used to communicate the result.
    /// </param>
    /// <param name="ReceiptHandle">
    ///    A receipt handle.
    /// </param>
    function AddReceiptHandle(Id, ReceiptHandle: String): IAWS4DSQSModelDeleteMessageBatchRequest;

    function QueueUrl: string; overload;
    function ReceiptHandle: TDictionary<String, String>;
  end;

  IAWS4DSQSModelDeleteMessageBatchResponse = interface(IAWS4DModelResponseMetadata)
    /// <summary>Message List success delete</summary>
    function Successful: TList<String>;

    /// <summary>Message List with error delete</summary>
    /// <param name="key">MessageId</param>
    /// <param name="Value">Error Message</param>
    function Failed: TDictionary<string, String>;
  end;

  IAWS4DSQSModelGetQueueAttributesRequest = interface
    ['{E5D2B466-9CA2-4442-BF30-61D1A3CCBC36}']
    /// <summary>The URL of the Amazon SQS queue whose attribute information is retrieved.</summary>
    /// <remarks>Queue URLs and names are case-sensitive.</remarks>
    function QueueUrl(Value: String): IAWS4DSQSModelGetQueueAttributesRequest; overload;

    /// <summary>Add attribute in list for which to retrieve information.</summary>
    function AddAttribute(Value: String): IAWS4DSQSModelGetQueueAttributesRequest;

    function Attributes: TList<String>;
    function QueueUrl: string; overload;
  end;

  IAWS4DSQSModelGetQueueAttributesResponse = interface(IAWS4DModelResponseMetadata)
    ['{7993BF5B-1866-4BED-948E-8A1DDC73F4D5}']
    function Attributes: TDictionary<String, String>;
  end;

  IAWS4DSQSModelGetQueueUrlResponse = interface(IAWS4DModelResponseMetadata)
    ['{33764771-FA8E-4472-885D-38E1085AFDC3}']
    /// <summary>The URL of the queue.</summary>
    function QueueUrl: string;
  end;

  IAWS4DSQSModelListQueuesRequest = interface(IAWS4DModelRequest)
    ['{B6162E16-4F71-4830-91D7-8433E64E1172}']
    /// <summary>Maximum number of results to include in the response.</summary>
    /// <remarks>Value range is 1 to 1000. You must set MaxResults to receive a value for NextToken in the response.</remarks>
    function MaxResults(Value: Integer): IAWS4DSQSModelListQueuesRequest; overload;

    /// <summary>Pagination token to request the next set of results.</summary>
    function NextToken(Value: string): IAWS4DSQSModelListQueuesRequest; overload;

    /// <summary>A string to use for filtering the list results. Only those queues whose name begins with the specified string are returned.</summary>
    /// <remarks>Queue URLs and names are case-sensitive.</remarks>
    function QueueNamePrefix(Value: string): IAWS4DSQSModelListQueuesRequest; overload;

    function MaxResults: Integer; overload;
    function NextToken: string; overload;
    function QueueNamePrefix : string; overload;
  end;

  IAWS4DSQSModelListQueuesResponse = interface(IAWS4DModelResponseMetadata)
    ['{3772C8BA-4901-4018-BAFB-37C2C27CB157}']
    /// <summary>
    ///   A list of queue URLs, up to 1,000 entries, or the value of MaxResults that you sent in the request.
    /// </summary>
    function QueuesUrls: TList<String>;

    /// <summary>Pagination token to include in the next request.</summary>
    /// <remarks>Token value is null if there are no additional results to request, or if you did not set MaxResults in the request.</remarks>
    function NextToken: string;
  end;

  IAWS4DSQSModelListQueueTagsResponse = interface(IAWS4DModelResponseMetadata)
    ['{03CA6BFE-4171-4EBC-903A-655E5D5EE3C4}']
    /// <summary>The following element is returned by the service.</summary>
    /// <remarks>The list of all tags added to the specified queue.</remarks>
    function Tags: TDictionary<String, String>;
  end;

  IAWS4DSQSModelPurgeQueueResponse = interface(IAWS4DModelResponseMetadata)
    ['{46A1FCB7-A68C-484A-B388-58F1BD835ADD}']
  end;

  IAWS4DSQSModelReceiveMessageRequest = interface(IAWS4DModelRequest)
    ['{B54C8256-86AE-4619-B7C2-21A44472EEC4}']
    /// <summary>The URL of the Amazon SQS queue from which messages are received.</summary>
    /// <remarks>Queue URLs and names are case-sensitive.</remarks>
    function queueUrl(Value: String): IAWS4DSQSModelReceiveMessageRequest; overload;

    /// <summary>The maximum number of messages to return. Amazon SQS never returns more messages than this value (however, fewer messages might be returned).</summary>
    /// <remarks>Valid values: 1 to 10. Default: 1.</remarks>
    function maxNumberOfMessages(Value: Integer): IAWS4DSQSModelReceiveMessageRequest; overload;

    /// <summary>The duration (in seconds) that the received messages are hidden from subsequent retrieve requests after being retrieved by a ReceiveMessage request.</summary>
    function visibilityTimeout(Value: Integer): IAWS4DSQSModelReceiveMessageRequest; overload;

    /// <summary>The duration (in seconds) for which the call waits for a message to arrive in the queue before returning.</summary>
    /// <remarks>If a message is available, the call returns sooner than WaitTimeSeconds. If no messages are available and the wait time expires, the call returns successfully with an empty list of messages.</remarks>
    function waitTimeSeconds(Value: Integer): IAWS4DSQSModelReceiveMessageRequest; overload;

    /// <summary>This parameter applies only to FIFO (first-in-first-out) queues.</summary>
    /// <remarks>
    ///   The token used for deduplication of ReceiveMessage calls. If a networking issue
    ///   occurs after a ReceiveMessage action, and instead of a response you receive a generic error,
    ///   it is possible to retry the same action with an identical ReceiveRequestAttemptId to retrieve
    ///   the same set of messages, even if their visibility timeout has not yet expired.
    /// </remarks>
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
    /// <summary>The MessageId you received when you sent the message to the queue.</summary>
    function MessageId: String;

    /// <summary>The receipt handle is the identifier you must provide when deleting the message.</summary>
    function ReceiptHandle: string;

    /// <summary>An MD5 digest of the message body.</summary>
    function MD5OfBody: string;

    /// <summary>The message body.</summary>
    function Body: string;

    function Attributes: TDictionary<String, String>;
  end;

  IAWS4DSQSModelReceiveMessageResponse = interface(IAWS4DModelResponseMetadata)
    ['{8484C39F-5D49-49CB-B39B-62E927DFC120}']
    /// <summary>Retrieves one or more messages (up to 10), from the specified queue.</summary>
    function Messages: TList<IAWS4DSQSModelReceiveMessage>;
  end;

  IAWS4DSQSModelSendMessageRequest = interface
    ['{4E07F59F-AF1D-41BC-91FD-D007125E0979}']
    /// <summary>The length of time, in seconds, for which to delay a specific message.</summary>
    /// <remarks>Valid values: 0 to 900. Maximum: 15 minutes. Messages with a positive DelaySeconds
    ///   value become available for processing after the delay period is finished.
    ///   If you don't specify a value, the default value for the queue applies.
    /// </remarks>
    function DelaySeconds(Value: Integer): IAWS4DSQSModelSendMessageRequest; overload;

    /// <summary>The message to send. The minimum size is one character.</summary>
    /// <remarks>The maximum size is 256 KB.</remarks>
    function MessageBody(Value: String): IAWS4DSQSModelSendMessageRequest; overload;

    /// <summary>This parameter applies only to FIFO (first-in-first-out) queues.</summary>
    /// <remarks>The token used for deduplication of sent messages. If a message with a particular
    ///   MessageDeduplicationId is sent successfully, any messages sent with the same
    ///   MessageDeduplicationId are accepted successfully but aren't delivered during the 5-minute
    ///   deduplication interval.
    /// </remarks>
    function MessageDeduplicationId(Value: String): IAWS4DSQSModelSendMessageRequest; overload;

    /// <summary>This parameter applies only to FIFO (first-in-first-out) queues.</summary>
    /// <remarks>The tag that specifies that a message belongs to a specific message group.</remarks>
    function MessageGroupId(Value: String): IAWS4DSQSModelSendMessageRequest; overload;

    /// <summary>The URL of the Amazon SQS queue to which a message is sent.</summary>
    /// <remarks>Queue URLs and names are case-sensitive.</remarks>
    function QueueUrl(Value: String): IAWS4DSQSModelSendMessageRequest; overload;

    function DelaySeconds         : Integer; overload;
    function MessageBody          : String; overload;
    function MessageDeduplicationId : String; overload;
    function MessageGroupId       : String; overload;
    function QueueUrl             : String; overload;

    /// <summary>Each message attribute consists of a Name, Type, and Value.</summary>
    /// <remarks>For more information, see Amazon SQS Message Attributes in the
    ///   Amazon Simple Queue Service Developer Guide.
    ///   https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes
    /// </remarks>
    function AddMessageAttribute(Name, Value: String): IAWS4DSQSModelSendMessageRequest;
    function MessageAttribute: TDictionary<String, String>; overload;

    /// <summary>The message system attribute to send.</summary>
    /// <remarks>Each message system attribute consists of a Name, Type, and Value.</remarks>
    function AddMessageSystemAttribute(Name, Value: String): IAWS4DSQSModelSendMessageRequest;
    function MessageSystemAttribute: TDictionary<String, String>; overload;
  end;

  IAWS4DSQSModelSendMessageResponse = interface(IAWS4DModelResponseMetadata)
    ['{E992340E-3B47-411A-B331-BBD2CF1BD339}']
    /// <summary>An MD5 digest of the non-URL-encoded message attribute string.</summary>
    function MD5OfMessageAttributes: string;

    /// <summary>An MD5 digest of the non-URL-encoded message attribute string.</summary>
    function MD5OfMessageBody: string;

    /// <summary>An MD5 digest of the non-URL-encoded message system attribute string.</summary>
    function MD5OfMessageSystemAttributes: string;

    /// <summary>An attribute containing the MessageId of the message sent to the queue.</summary>
    function MessageId: string;

    /// <summary>This parameter applies only to FIFO (first-in-first-out) queues.</summary>
    function SequenceNumber: string;
  end;

  IAWS4DSQSModelTagQueueRequest = interface(IAWS4DModelRequest)
    ['{A40D8ED7-B878-44DB-8B43-4F47AD7061E7}']
    /// <summary>The URL of the queue.</summary>
    function QueueUrl(Value: String): IAWS4DSQSModelTagQueueRequest; overload;

    /// <summary>Add Tag to the specified queue.</summary>
    function AddTag(Key, Value: string): IAWS4DSQSModelTagQueueRequest;

    function QueueUrl: string; overload;
    function Tags: TDictionary<String, String>;
  end;

  IAWS4DSQSModelTagQueueResponse = interface(IAWS4DModelResponseMetadata)
    ['{9C83C8F1-33A6-472B-A433-F16E763454EB}']
  end;

  IAWS4DSQSModelUntagQueueRequest = interface(IAWS4DModelRequest)
    ['{59675E77-81FC-4650-9FB3-07891E7F31A1}']
    /// <summary>The URL of the queue.</summary>
    function QueueUrl(Value: String): IAWS4DSQSModelUntagQueueRequest; overload;

    /// <summary>Add Tag to the remove.</summary>
    function AddTag(Key: string): IAWS4DSQSModelUntagQueueRequest;

    function QueueUrl: string; overload;
    function Tags: TList<String>;
  end;

  IAWS4DSQSModelUntagQueueResponse = interface(IAWS4DModelResponseMetadata)
    ['{403DF221-FE67-43F7-A275-83F6F36128B2}']
  end;

  IAWS4DSQSModelFactory = interface
    ['{764198C1-DD25-4001-8AA7-1732E3CA3C56}']
    function CreateQueueRequest: IAWS4DSQSModelCreateQueueRequest;
    function DeleteMessageRequest: IAWS4DSQSModelDeleteMessageRequest;
    function DeleteMessageBatchRequest: IAWS4DSQSModelDeleteMessageBatchRequest;
    function GetQueueAttributesRequest: IAWS4DSQSModelGetQueueAttributesRequest;
    function ListQueuesRequest: IAWS4DSQSModelListQueuesRequest;
    function ReceiveMessageRequest: IAWS4DSQSModelReceiveMessageRequest;
    function SendMessageRequest: IAWS4DSQSModelSendMessageRequest;
    function TagQueueRequest: IAWS4DSQSModelTagQueueRequest;
    function UntagQueueRequest: IAWS4DSQSModelUntagQueueRequest;
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
