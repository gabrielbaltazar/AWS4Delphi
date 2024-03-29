unit AWS4D.SQS.Service.Interfaces;

interface

uses
  AWS4D.Core.Model.Types,
  AWS4D.SQS.Model.Interfaces;

type
  IAWS4DSQSService<I: IInterface> = interface
    ['{D7028158-A96E-4C0F-8A99-4756BECE476E}']
    function AccessKey(Value: String): IAWS4DSQSService<I>;
    function SecretKey(Value: String): IAWS4DSQSService<I>;
    function Region(Value: String): IAWS4DSQSService<I>; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSQSService<I>; overload;

    function CreateQueue(Request: IAWS4DSQSCreateQueueRequest<I>): IAWS4DSQSCreateQueueResponse<I>;
    procedure DeleteMessage(Request: IAWS4DSQSDeleteMessageRequest<I>);
    procedure DeleteMessageBatch(Request: IAWS4DSQSDeleteMessageBatchRequest<I>);
    procedure DeleteQueue(Request: IAWS4DSQSDeleteQueueRequest<I>);
    function GetQueueAttributes(Request: IAWS4DSQSGetQueueAttributesRequest<I>): IAWS4DSQSGetQueueAttributesResponse<I>;
    function GetQueueUrl(Request: IAWS4DSQSGetQueueUrlRequest<I>): IAWS4DSQSGetQueueUrlResponse<I>;
    function ListQueues(Request: IAWS4DSQSListQueuesRequest<I>): IAWS4DSQSListQueuesResponse<I>;
    function ListQueueTags(Request: IAWS4DSQSListQueueTagsRequest<I>): IAWS4DSQSListQueueTagsResponse<I>;
    procedure PurgeQueue(Request: IAWS4DSQSPurgeQueueRequest<I>);
    function ReceiveMessage(Request: IAWS4DSQSReceiveMessageRequest<I>): IAWS4DSQSReceiveMessageResponse<I>;
    function SendMessage(Request: IAWS4DSQSSendMessageRequest<I>): IAWS4DSQSSendMessageResponse<I>;
    procedure TagQueue(Request: IAWS4DSQSTagQueueRequest<I>);
    procedure UnTagQueue(Request: IAWS4DSQSUnTagQueueRequest<I>);

    function Parent(Value: I): IAWS4DSQSService<I>;
    function &End: I;
  end;

implementation

end.
