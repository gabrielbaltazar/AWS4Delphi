unit AWS4D.SQS.Model.Interfaces;

interface

uses
  AWS4D.Core.Model.Types;

type
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
    ['{EC9ADDAA-4DCB-49CD-8353-48A204E88951}']
    function Tags: IAWS4DIterator<IAWS4DCoreModelTag>;

    function &End: I;
  end;

implementation

end.
