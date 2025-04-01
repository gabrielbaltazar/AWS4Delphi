unit AWS4D.SQS.Facade.DeleteMessage;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.DeleteMessage.Request;

type
  TAWS4DSQSFacadeDeleteMessage = class(TInterfacedObject, IAWS4DSQSFacadeDeleteMessage)
  private
    FService: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessage>;
    FRequest: IAWS4DSQSDeleteMessageRequest<IAWS4DSQSFacadeDeleteMessage>;
  protected
    function Request: IAWS4DSQSDeleteMessageRequest<IAWS4DSQSFacadeDeleteMessage>;
    function Send: IAWS4DSQSFacadeDeleteMessage;
  public
    constructor Create(AService: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessage>);
    class function New(AService: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessage>): IAWS4DSQSFacadeDeleteMessage;
  end;

implementation

constructor TAWS4DSQSFacadeDeleteMessage.Create(AService: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessage>);
begin
  FService := AService;
  FService.Parent(Self);
end;

class function TAWS4DSQSFacadeDeleteMessage.New(AService: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessage>): IAWS4DSQSFacadeDeleteMessage;
begin
  Result := Self.Create(AService);
end;

function TAWS4DSQSFacadeDeleteMessage.Request: IAWS4DSQSDeleteMessageRequest<IAWS4DSQSFacadeDeleteMessage>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSQSDeleteMessageRequest<IAWS4DSQSFacadeDeleteMessage>.New(Self);
  Result := FRequest;
end;

function TAWS4DSQSFacadeDeleteMessage.Send: IAWS4DSQSFacadeDeleteMessage;
begin
  Result := Self;
  try
    FService.DeleteMessage(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
