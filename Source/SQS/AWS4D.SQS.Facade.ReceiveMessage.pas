unit AWS4D.SQS.Facade.ReceiveMessage;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.ReceiveMessage.Request,
  AWS4D.SQS.Model.ReceiveMessage.Response;

type TAWS4DSQSFacadeReceiveMessage = class(TInterfacedObject, IAWS4DSQSFacadeReceiveMessage)

  private
    FService: IAWS4DSQSService<IAWS4DSQSFacadeReceiveMessage>;

    FRequest: IAWS4DSQSReceiveMessageRequest<IAWS4DSQSFacadeReceiveMessage>;
    FResponse: IAWS4DSQSReceiveMessageResponse<IAWS4DSQSFacadeReceiveMessage>;

  protected
    function Request: IAWS4DSQSReceiveMessageRequest<IAWS4DSQSFacadeReceiveMessage>;
    function Send: IAWS4DSQSReceiveMessageResponse<IAWS4DSQSFacadeReceiveMessage>;
    function Response: IAWS4DSQSReceiveMessageResponse<IAWS4DSQSFacadeReceiveMessage>;

  public
    class function New(Service: IAWS4DSQSService<IAWS4DSQSFacadeReceiveMessage>): IAWS4DSQSFacadeReceiveMessage;
    constructor create(Service: IAWS4DSQSService<IAWS4DSQSFacadeReceiveMessage>);

end;

implementation

constructor TAWS4DSQSFacadeReceiveMessage.create(Service: IAWS4DSQSService<IAWS4DSQSFacadeReceiveMessage>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSQSFacadeReceiveMessage.New(Service: IAWS4DSQSService<IAWS4DSQSFacadeReceiveMessage>): IAWS4DSQSFacadeReceiveMessage;
begin
  result := Self.create(Service);
end;

function TAWS4DSQSFacadeReceiveMessage.Request: IAWS4DSQSReceiveMessageRequest<IAWS4DSQSFacadeReceiveMessage>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSQSReceiveMessageRequest<IAWS4DSQSFacadeReceiveMessage>.New(Self);
  result := FRequest;
end;

function TAWS4DSQSFacadeReceiveMessage.Response: IAWS4DSQSReceiveMessageResponse<IAWS4DSQSFacadeReceiveMessage>;
begin
  result := FResponse;
end;

function TAWS4DSQSFacadeReceiveMessage.Send: IAWS4DSQSReceiveMessageResponse<IAWS4DSQSFacadeReceiveMessage>;
begin
  FResponse := nil;
  try
    FResponse := FService.ReceiveMessage(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
