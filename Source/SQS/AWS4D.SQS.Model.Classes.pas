unit AWS4D.SQS.Model.Classes;

interface

uses
  AWS4D.SQS.Model.ListQueuesRequest,
  AWS4D.SQS.Model.ReceiveMessageRequest,

  AWS4D.SQS.Model.GetQueueUrlResponse,
  AWS4D.SQS.Model.ListQueuesResponse,
  AWS4D.SQS.Model.ListQueueTagsResponse,
  AWS4D.SQS.Model.ReceiveMessageResponse;

type
  TAWS4DSQSModelListQueuesRequest = AWS4D.SQS.Model.ListQueuesRequest.TAWS4DSQSModelListQueuesRequest;
  TAWS4DSQSModelReceiveMessageRequest = AWS4D.SQS.Model.ReceiveMessageRequest.TAWS4DSQSModelReceiveMessageRequest;

  TAWS4DSQSModelGetQueueUrlResponse    = AWS4D.SQS.Model.GetQueueUrlResponse.TAWS4DSQSModelGetQueueUrlResponse;
  TAWS4DSQSModelListQueuesResponse     = AWS4D.SQS.Model.ListQueuesResponse.TAWS4DSQSModelListQueuesResponse;
  TAWS4DSQSModelListQueueTagsResponse  = AWS4D.SQS.Model.ListQueueTagsResponse.TAWS4DSQSModelListQueueTagsResponse;
  TAWS4DSQSModelReceiveMessageResponse = AWS4D.SQS.Model.ReceiveMessageResponse.TAWS4DSQSModelReceiveMessageResponse;

implementation

end.
