unit AWS4D.SQS.Service.Interfaces;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Service.Interfaces;

type
  IAWS4DServiceSQS = interface(IAWS4DService)
    ['{B653E63D-6BF8-4C53-8B89-6B8A708ED5B3}']
    function ListQueues(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest = nil): IAWS4DSQSModelListQueuesResponse;
    function ListQueueTags(QueueName: String): string;
    function GetQueueUrl(QueueName: String): string;
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
