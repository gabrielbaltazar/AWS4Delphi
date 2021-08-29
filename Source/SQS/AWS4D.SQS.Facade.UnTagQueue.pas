unit AWS4D.SQS.Facade.UnTagQueue;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.UnTagQueue.Request;

type TAWS4DSQSFacadeUnTagQueue = class(TInterfacedObject, IAWS4DSQSFacadeUnTagQueue)

  private
    FService: IAWS4DSQSService<IAWS4DSQSFacadeUnTagQueue>;

    FRequest: IAWS4DSQSUnTagQueueRequest<IAWS4DSQSFacadeUnTagQueue>;

  protected
    function Request: IAWS4DSQSUnTagQueueRequest<IAWS4DSQSFacadeUnTagQueue>;
    function Send: IAWS4DSQSFacadeUnTagQueue;

  public
    class function New(Service: IAWS4DSQSService<IAWS4DSQSFacadeUnTagQueue>): IAWS4DSQSFacadeUnTagQueue;
    constructor create(Service: IAWS4DSQSService<IAWS4DSQSFacadeUnTagQueue>);

end;

implementation

constructor TAWS4DSQSFacadeUnTagQueue.create(Service: IAWS4DSQSService<IAWS4DSQSFacadeUnTagQueue>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSQSFacadeUnTagQueue.New(Service: IAWS4DSQSService<IAWS4DSQSFacadeUnTagQueue>): IAWS4DSQSFacadeUnTagQueue;
begin
  result := Self.create(Service);
end;

function TAWS4DSQSFacadeUnTagQueue.Request: IAWS4DSQSUnTagQueueRequest<IAWS4DSQSFacadeUnTagQueue>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSQSUnTagQueueRequest<IAWS4DSQSFacadeUnTagQueue>.New(Self);
  result := FRequest;
end;

function TAWS4DSQSFacadeUnTagQueue.Send: IAWS4DSQSFacadeUnTagQueue;
begin
  result := Self;
  try
    FService.UnTagQueue(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
