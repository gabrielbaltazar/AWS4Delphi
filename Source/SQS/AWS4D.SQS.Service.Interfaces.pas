unit AWS4D.SQS.Service.Interfaces;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Service.Interfaces;

type
  IAWS4DServiceSQS = interface(IAWS4DService)
    ['{B653E63D-6BF8-4C53-8B89-6B8A708ED5B3}']
    function ListQueues(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest = nil): string;
  end;

implementation

end.
