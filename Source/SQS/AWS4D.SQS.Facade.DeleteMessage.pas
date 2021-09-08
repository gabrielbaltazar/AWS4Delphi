unit AWS4D.SQS.Facade.DeleteMessage;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.DeleteMessage.Request;

type TAWS4DSQSFacadeDeleteMessage = class(TInterfacedObject, IAWS4DSQSFacadeDeleteMessage)

  private
    FService: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessage>;
    FRequest: IAWS4DSQSDeleteMessageRequest<IAWS4DSQSFacadeDeleteMessage>;

  protected
    function Request: IAWS4DSQSDeleteMessageRequest<IAWS4DSQSFacadeDeleteMessage>;
    function Send: IAWS4DSQSFacadeDeleteMessage;

  public
    class function New(Service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessage>): IAWS4DSQSFacadeDeleteMessage;
    constructor create(Service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessage>);

end;

implementation

constructor TAWS4DSQSFacadeDeleteMessage.create(Service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessage>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSQSFacadeDeleteMessage.New(Service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessage>): IAWS4DSQSFacadeDeleteMessage;
begin
  result := Self.create(Service);
end;

function TAWS4DSQSFacadeDeleteMessage.Request: IAWS4DSQSDeleteMessageRequest<IAWS4DSQSFacadeDeleteMessage>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSQSDeleteMessageRequest<IAWS4DSQSFacadeDeleteMessage>.New(Self);
  result := FRequest;
end;

function TAWS4DSQSFacadeDeleteMessage.Send: IAWS4DSQSFacadeDeleteMessage;
begin
  result := Self;
  try
    FService.DeleteMessage(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
