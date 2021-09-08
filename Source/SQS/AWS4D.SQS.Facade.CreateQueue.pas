unit AWS4D.SQS.Facade.CreateQueue;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.CreateQueue.Request,
  AWS4D.SQS.Model.CreateQueue.Response;

type TAWS4DSQSFacadeCreateQueue = class(TInterfacedObject, IAWS4DSQSFacadeCreateQueue)

  private
    FService: IAWS4DSQSService<IAWS4DSQSFacadeCreateQueue>;

    FRequest: IAWS4DSQSCreateQueueRequest<IAWS4DSQSFacadeCreateQueue>;
    FResponse: IAWS4DSQSCreateQueueResponse<IAWS4DSQSFacadeCreateQueue>;

  protected
    function Request: IAWS4DSQSCreateQueueRequest<IAWS4DSQSFacadeCreateQueue>;
    function Send: IAWS4DSQSCreateQueueResponse<IAWS4DSQSFacadeCreateQueue>;
    function Response: IAWS4DSQSCreateQueueResponse<IAWS4DSQSFacadeCreateQueue>;

  public
    class function New(Service: IAWS4DSQSService<IAWS4DSQSFacadeCreateQueue>): IAWS4DSQSFacadeCreateQueue;
    constructor create(Service: IAWS4DSQSService<IAWS4DSQSFacadeCreateQueue>);

end;

implementation

constructor TAWS4DSQSFacadeCreateQueue.create(Service: IAWS4DSQSService<IAWS4DSQSFacadeCreateQueue>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSQSFacadeCreateQueue.New(Service: IAWS4DSQSService<IAWS4DSQSFacadeCreateQueue>): IAWS4DSQSFacadeCreateQueue;
begin
  result := Self.create(Service);
end;

function TAWS4DSQSFacadeCreateQueue.Request: IAWS4DSQSCreateQueueRequest<IAWS4DSQSFacadeCreateQueue>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSQSCreateQueueRequest<IAWS4DSQSFacadeCreateQueue>.New(Self);
  result := FRequest;
end;

function TAWS4DSQSFacadeCreateQueue.Response: IAWS4DSQSCreateQueueResponse<IAWS4DSQSFacadeCreateQueue>;
begin
  result := FResponse;
end;

function TAWS4DSQSFacadeCreateQueue.Send: IAWS4DSQSCreateQueueResponse<IAWS4DSQSFacadeCreateQueue>;
begin
  FResponse := nil;
  try
    FResponse := FService.CreateQueue(FRequest);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
