unit AWS4D.SQS.Facade.ListQueues;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.ListQueues.Request,
  AWS4D.SQS.Model.ListQueues.Response;

type TAWS4DSQSFacadeListQueues = class(TInterfacedObject, IAWS4DSQSFacadeListQueues)

  private
    FService: IAWS4DSQSService<IAWS4DSQSFacadeListQueues>;

    FRequest: IAWS4DSQSListQueuesRequest<IAWS4DSQSFacadeListQueues>;
    FResponse: IAWS4DSQSListQueuesResponse<IAWS4DSQSFacadeListQueues>;

  protected
    function Request: IAWS4DSQSListQueuesRequest<IAWS4DSQSFacadeListQueues>;
    function Send: IAWS4DSQSListQueuesResponse<IAWS4DSQSFacadeListQueues>;
    function Response: IAWS4DSQSListQueuesResponse<IAWS4DSQSFacadeListQueues>;

  public
    class function New(Service: IAWS4DSQSService<IAWS4DSQSFacadeListQueues>): IAWS4DSQSFacadeListQueues;
    constructor create(Service: IAWS4DSQSService<IAWS4DSQSFacadeListQueues>);

end;

implementation

{ TAWS4DSQSFacadeListQueues }

constructor TAWS4DSQSFacadeListQueues.create(Service: IAWS4DSQSService<IAWS4DSQSFacadeListQueues>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSQSFacadeListQueues.New(Service: IAWS4DSQSService<IAWS4DSQSFacadeListQueues>): IAWS4DSQSFacadeListQueues;
begin
  result := Self.create(Service);
end;

function TAWS4DSQSFacadeListQueues.Request: IAWS4DSQSListQueuesRequest<IAWS4DSQSFacadeListQueues>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSQSModelListQueuesRequest<IAWS4DSQSFacadeListQueues>.New(Self);
  result := FRequest;
end;

function TAWS4DSQSFacadeListQueues.Response: IAWS4DSQSListQueuesResponse<IAWS4DSQSFacadeListQueues>;
begin
  result := FResponse;
end;

function TAWS4DSQSFacadeListQueues.Send: IAWS4DSQSListQueuesResponse<IAWS4DSQSFacadeListQueues>;
begin
  FResponse := nil;
  try
    FResponse := FService.ListQueues(FRequest);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
