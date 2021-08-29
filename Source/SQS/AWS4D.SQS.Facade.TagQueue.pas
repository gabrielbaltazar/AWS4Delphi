unit AWS4D.SQS.Facade.TagQueue;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.TagQueue.Request;

type TAWS4DSQSFacadeTagQueue = class(TInterfacedObject, IAWS4DSQSFacadeTagQueue)

  private
    FService: IAWS4DSQSService<IAWS4DSQSFacadeTagQueue>;

    FRequest: IAWS4DSQSTagQueueRequest<IAWS4DSQSFacadeTagQueue>;

  protected
    function Request: IAWS4DSQSTagQueueRequest<IAWS4DSQSFacadeTagQueue>;
    function Send: IAWS4DSQSFacadeTagQueue;

  public
    class function New(Service: IAWS4DSQSService<IAWS4DSQSFacadeTagQueue>): IAWS4DSQSFacadeTagQueue;
    constructor create(Service: IAWS4DSQSService<IAWS4DSQSFacadeTagQueue>);

end;

implementation

constructor TAWS4DSQSFacadeTagQueue.create(Service: IAWS4DSQSService<IAWS4DSQSFacadeTagQueue>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSQSFacadeTagQueue.New(Service: IAWS4DSQSService<IAWS4DSQSFacadeTagQueue>): IAWS4DSQSFacadeTagQueue;
begin
  result := Self.create(Service);
end;

function TAWS4DSQSFacadeTagQueue.Request: IAWS4DSQSTagQueueRequest<IAWS4DSQSFacadeTagQueue>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSQSTagQueueRequest<IAWS4DSQSFacadeTagQueue>.New(Self);
  result := FRequest;
end;

function TAWS4DSQSFacadeTagQueue.Send: IAWS4DSQSFacadeTagQueue;
begin
  result := Self;
  try
    FService.TagQueue(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
