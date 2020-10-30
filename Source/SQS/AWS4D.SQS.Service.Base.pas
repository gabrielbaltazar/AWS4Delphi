unit AWS4D.SQS.Service.Base;

interface

uses
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Service.Base,
  System.SysUtils;

type TAWS4DSQSServiceBase = class(TAWS4DServiceBase, IAWS4DServiceSQS)

  protected
    function ListQueues(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest = nil): string;
end;

implementation

{ TAWS4DSQSServiceBase }

function TAWS4DSQSServiceBase.ListQueues(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest): string;
begin

end;

end.
