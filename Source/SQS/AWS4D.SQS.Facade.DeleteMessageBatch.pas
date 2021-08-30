unit AWS4D.SQS.Facade.DeleteMessageBatch;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.DeleteMessageBatch.Request;

type TAWS4DSQSFacadeDeleteMessageBatch = class(TInterfacedObject, IAWS4DSQSFacadeDeleteMessageBatch)

  private
    FService: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessageBatch>;

    FRequest: IAWS4DSQSDeleteMessageBatchRequest<IAWS4DSQSFacadeDeleteMessageBatch>;

  protected
    function Request: IAWS4DSQSDeleteMessageBatchRequest<IAWS4DSQSFacadeDeleteMessageBatch>;
    function Send: IAWS4DSQSFacadeDeleteMessageBatch;

  public
    class function New(Service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessageBatch>): IAWS4DSQSFacadeDeleteMessageBatch;
    constructor create(Service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessageBatch>);

end;

implementation

constructor TAWS4DSQSFacadeDeleteMessageBatch.create(Service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessageBatch>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSQSFacadeDeleteMessageBatch.New(Service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessageBatch>): IAWS4DSQSFacadeDeleteMessageBatch;
begin
  result := Self.create(Service);
end;

function TAWS4DSQSFacadeDeleteMessageBatch.Request: IAWS4DSQSDeleteMessageBatchRequest<IAWS4DSQSFacadeDeleteMessageBatch>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSQSDeleteMessageBatchRequest<IAWS4DSQSFacadeDeleteMessageBatch>.New(Self);
  result := FRequest;
end;

function TAWS4DSQSFacadeDeleteMessageBatch.Send: IAWS4DSQSFacadeDeleteMessageBatch;
begin
  result := Self;
  try
    FService.DeleteMessageBatch(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
