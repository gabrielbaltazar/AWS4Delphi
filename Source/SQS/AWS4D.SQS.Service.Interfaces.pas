unit AWS4D.SQS.Service.Interfaces;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Service.Interfaces;

type
  IAWS4DServiceSQS = interface(IAWS4DService)
    ['{B653E63D-6BF8-4C53-8B89-6B8A708ED5B3}']
    /// <summary> Creates a new standard or FIFO queue </summary>
    /// <remarks>https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_CreateQueue.html</remarks>
    function CreateQueue(Request: IAWS4DSQSModelCreateQueueRequest): IAWS4DSQSModelCreateQueueResponse;

    /// <summary>Deletes the specified message from the specified queue.</summary>
    /// <remarks>To select the message to delete, use the ReceiptHandle of the message (not the MessageId which you receive when you send the message)
    ///   https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_DeleteMessage.html
    /// </remarks>
    function DeleteMessage(Request: IAWS4DSQSModelDeleteMessageRequest): IAWS4DSQSModelDeleteMessageResponse;

    /// <summary>Returns the URL of an existing Amazon SQS queue.</summary>
    /// <remarks>
    ///    To access a queue that belongs to another AWS account, use the QueueOwnerAWSAccountId parameter to specify the account ID of the queue's owner.
    ///    https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_GetQueueUrl.html
    /// </remarks>
    function GetQueueUrl(QueueName: String): IAWS4DSQSModelGetQueueUrlResponse;

    /// <summary>Returns a list of your queues in the current region. The response includes a maximum of 1,000 results.</summary>
    /// <remarks>
    ///   If you specify a value for the optional QueueNamePrefix parameter, only queues with a name that begins with the specified value are returned.
    ///   The listQueues methods supports pagination. Set parameter MaxResults in the request to specify the maximum number of results to be returned in the response.
    ///   https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_ListQueues.html
    /// </remarks>
    function ListQueues(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest = nil): IAWS4DSQSModelListQueuesResponse;

    /// <summary>List all cost allocation tags added to the specified Amazon SQS queue.</summary>
    /// <remarks>
    ///   For an overview, see Tagging Your Amazon SQS Queues in the Amazon Simple Queue Service Developer Guide.
    ///   https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-tags.html
    /// </remarks>
    function ListQueueTags(QueueName: String): IAWS4DSQSModelListQueueTagsResponse;

    /// <summary>Retrieves one or more messages (up to 10), from the specified queue.</summary>
    /// <remarks>Using the WaitTimeSeconds parameter enables long-poll support. For more information, see Amazon SQS Long Polling in the Amazon Simple Queue Service Developer Guide.</remarks>
    function ReceiveMessage(Request: IAWS4DSQSModelReceiveMessageRequest): IAWS4DSQSModelReceiveMessageResponse;

    /// <summary>Delivers a message to the specified queue.</summary>
    /// <remarks>https://docs.aws.amazon.com/AWSSimpleQueueService/latest/APIReference/API_SendMessage.html</remarks>
    function SendMessage(Request: IAWS4DSQSModelSendMessageRequest): IAWS4DSQSModelSendMessageResponse;
  end;

function SQSService: IAWS4DServiceSQS;

implementation

uses
  AWS4D.SQS.Service.Base;

function SQSService: IAWS4DServiceSQS;
begin
  result := TAWS4DSQSServiceBase.New;
end;

end.
