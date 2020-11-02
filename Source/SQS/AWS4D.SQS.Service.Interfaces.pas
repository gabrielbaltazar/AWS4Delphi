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
    function DeleteMessage(Request: IAWS4DSQSModelDeleteMessageRequest): IAWS4DSQSModelDeleteMessageResponse;
    function ListQueues(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest = nil): IAWS4DSQSModelListQueuesResponse;
    function ListQueueTags(QueueName: String): IAWS4DSQSModelListQueueTagsResponse;
    function GetQueueUrl(QueueName: String): IAWS4DSQSModelGetQueueUrlResponse;
    function ReceiveMessage(Request: IAWS4DSQSModelReceiveMessageRequest): IAWS4DSQSModelReceiveMessageResponse;
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
