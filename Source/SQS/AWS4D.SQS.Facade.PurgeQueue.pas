unit AWS4D.SQS.Facade.PurgeQueue;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.PurgeQueue.Request;

type TAWS4DSQSFacadePurgeQueue = class(TInterfacedObject, IAWS4DSQSFacadePurgeQueue)

  private
    FService: IAWS4DSQSService<IAWS4DSQSFacadePurgeQueue>;

    FRequest: IAWS4DSQSPurgeQueueRequest<IAWS4DSQSFacadePurgeQueue>;

  protected
    function Request: IAWS4DSQSPurgeQueueRequest<IAWS4DSQSFacadePurgeQueue>;
    function Send: IAWS4DSQSFacadePurgeQueue;

  public
    class function New(Service: IAWS4DSQSService<IAWS4DSQSFacadePurgeQueue>): IAWS4DSQSFacadePurgeQueue;
    constructor create(Service: IAWS4DSQSService<IAWS4DSQSFacadePurgeQueue>);

end;

implementation

constructor TAWS4DSQSFacadePurgeQueue.create(Service: IAWS4DSQSService<IAWS4DSQSFacadePurgeQueue>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSQSFacadePurgeQueue.New(Service: IAWS4DSQSService<IAWS4DSQSFacadePurgeQueue>): IAWS4DSQSFacadePurgeQueue;
begin
  result := Self.create(Service);
end;

function TAWS4DSQSFacadePurgeQueue.Request: IAWS4DSQSPurgeQueueRequest<IAWS4DSQSFacadePurgeQueue>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSQSPurgeQueueRequest<IAWS4DSQSFacadePurgeQueue>.New(Self);
  result := FRequest;
end;

function TAWS4DSQSFacadePurgeQueue.Send: IAWS4DSQSFacadePurgeQueue;
begin
  result := Self;
  try
    FService.PurgeQueue(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
