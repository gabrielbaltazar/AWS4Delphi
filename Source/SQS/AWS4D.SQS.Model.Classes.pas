unit AWS4D.SQS.Model.Classes;

interface

uses
  AWS4D.SQS.Model.CreateQueueRequest,
  AWS4D.SQS.Model.DeleteMessageRequest,
  AWS4D.SQS.Model.DeleteMessageBatchRequest,
  AWS4D.SQS.Model.ListQueuesRequest,
  AWS4D.SQS.Model.ReceiveMessageRequest,
  AWS4D.SQS.Model.SendMessageRequest,

  AWS4D.SQS.Model.CreateQueueResponse,
  AWS4D.SQS.Model.DeleteMessageResponse,
  AWS4D.SQS.Model.DeleteMessageBatchResponse,
  AWS4D.SQS.Model.GetQueueUrlResponse,
  AWS4D.SQS.Model.ListQueuesResponse,
  AWS4D.SQS.Model.ListQueueTagsResponse,
  AWS4D.SQS.Model.ReceiveMessage,
  AWS4D.SQS.Model.ReceiveMessageResponse,
  AWS4D.SQS.Model.SendMessageResponse;

type
  TAWS4DSQSModelCreateQueueRequest    = AWS4D.SQS.Model.CreateQueueRequest.TAWS4DSQSModelCreateQueueRequest;
  TAWS4DSQSModelDeleteMessageRequest  = AWS4D.SQS.Model.DeleteMessageRequest.TAWS4DSQSModelDeleteMessageRequest;
  TAWS4DSQSModelDeleteMessageBatchRequest = AWS4D.SQS.Model.DeleteMessageBatchRequest.TAWS4DSQSModelDeleteMessageBatchRequest;
  TAWS4DSQSModelListQueuesRequest     = AWS4D.SQS.Model.ListQueuesRequest.TAWS4DSQSModelListQueuesRequest;
  TAWS4DSQSModelReceiveMessageRequest = AWS4D.SQS.Model.ReceiveMessageRequest.TAWS4DSQSModelReceiveMessageRequest;
  TAWS4DSQSModelSendMessageRequest    = AWS4D.SQS.Model.SendMessageRequest.TAWS4DSQSModelSendMessageRequest;

  TAWS4DSQSModelCreateQueueResponse    = AWS4D.SQS.Model.CreateQueueResponse.TAWS4DSQSModelCreateQueueResponse;
  TAWS4DSQSModelDeleteMessageResponse  = AWS4D.SQS.Model.DeleteMessageResponse.TAWS4DSQSModelDeleteMessageResponse;
  TAWS4DSQSModelDeleteMessageBatchResponse = AWS4D.SQS.Model.DeleteMessageBatchResponse.TAWS4DSQSModelDeleteMessageBatchResponse;
  TAWS4DSQSModelGetQueueUrlResponse    = AWS4D.SQS.Model.GetQueueUrlResponse.TAWS4DSQSModelGetQueueUrlResponse;
  TAWS4DSQSModelListQueuesResponse     = AWS4D.SQS.Model.ListQueuesResponse.TAWS4DSQSModelListQueuesResponse;
  TAWS4DSQSModelListQueueTagsResponse  = AWS4D.SQS.Model.ListQueueTagsResponse.TAWS4DSQSModelListQueueTagsResponse;
  TAWS4DSQSModelReceiveMessage         = AWS4D.SQS.Model.ReceiveMessage.TAWS4DSQSModelReceiveMessage;
  TAWS4DSQSModelReceiveMessageResponse = AWS4D.SQS.Model.ReceiveMessageResponse.TAWS4DSQSModelReceiveMessageResponse;
  TAWS4DSQSModelSendMessageResponse    = AWS4D.SQS.Model.SendMessageResponse.TAWS4DSQSModelSendMessageResponse;

implementation

end.
