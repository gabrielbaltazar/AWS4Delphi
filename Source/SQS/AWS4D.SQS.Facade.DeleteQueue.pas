unit AWS4D.SQS.Facade.DeleteQueue;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.DeleteQueue.Request;

type TAWS4DSQSFacadeDeleteQueue = class(TInterfacedObject, IAWS4DSQSFacadeDeleteQueue)

  private
    FService: IAWS4DSQSService<IAWS4DSQSFacadeDeleteQueue>;

    FRequest: IAWS4DSQSDeleteQueueRequest<IAWS4DSQSFacadeDeleteQueue>;

  protected
    function Request: IAWS4DSQSDeleteQueueRequest<IAWS4DSQSFacadeDeleteQueue>;
    function Send: IAWS4DSQSFacadeDeleteQueue;

  public
    class function New(Service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteQueue>): IAWS4DSQSFacadeDeleteQueue;
    constructor create(Service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteQueue>);

end;

implementation

constructor TAWS4DSQSFacadeDeleteQueue.create(Service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteQueue>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSQSFacadeDeleteQueue.New(Service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteQueue>): IAWS4DSQSFacadeDeleteQueue;
begin
  result := Self.create(Service);
end;

function TAWS4DSQSFacadeDeleteQueue.Request: IAWS4DSQSDeleteQueueRequest<IAWS4DSQSFacadeDeleteQueue>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSQSDeleteQueueRequest<IAWS4DSQSFacadeDeleteQueue>.New(Self);
  result := FRequest;
end;

function TAWS4DSQSFacadeDeleteQueue.Send: IAWS4DSQSFacadeDeleteQueue;
begin
  result := Self;
  try
    FService.DeleteQueue(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
