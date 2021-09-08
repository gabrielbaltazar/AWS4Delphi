unit AWS4D.SQS.Facade.SendMessage;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.SendMessage.Request,
  AWS4D.SQS.Model.SendMessage.Response;

type TAWS4DSQSFacadeSendMessage = class(TInterfacedObject, IAWS4DSQSFacadeSendMessage)

  private
    FService: IAWS4DSQSService<IAWS4DSQSFacadeSendMessage>;

    FRequest: IAWS4DSQSSendMessageRequest<IAWS4DSQSFacadeSendMessage>;
    FResponse: IAWS4DSQSSendMessageResponse<IAWS4DSQSFacadeSendMessage>;

  protected
    function Request: IAWS4DSQSSendMessageRequest<IAWS4DSQSFacadeSendMessage>;
    function Send: IAWS4DSQSSendMessageResponse<IAWS4DSQSFacadeSendMessage>;
    function Response: IAWS4DSQSSendMessageResponse<IAWS4DSQSFacadeSendMessage>;

  public
    class function New(Service: IAWS4DSQSService<IAWS4DSQSFacadeSendMessage>): IAWS4DSQSFacadeSendMessage;
    constructor create(Service: IAWS4DSQSService<IAWS4DSQSFacadeSendMessage>);

end;

implementation

constructor TAWS4DSQSFacadeSendMessage.create(Service: IAWS4DSQSService<IAWS4DSQSFacadeSendMessage>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSQSFacadeSendMessage.New(Service: IAWS4DSQSService<IAWS4DSQSFacadeSendMessage>): IAWS4DSQSFacadeSendMessage;
begin
  result := Self.create(Service);
end;

function TAWS4DSQSFacadeSendMessage.Request: IAWS4DSQSSendMessageRequest<IAWS4DSQSFacadeSendMessage>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSQSSendMessageRequest<IAWS4DSQSFacadeSendMessage>.New(Self);
  result := FRequest;
end;

function TAWS4DSQSFacadeSendMessage.Response: IAWS4DSQSSendMessageResponse<IAWS4DSQSFacadeSendMessage>;
begin
  result := FResponse;
end;

function TAWS4DSQSFacadeSendMessage.Send: IAWS4DSQSSendMessageResponse<IAWS4DSQSFacadeSendMessage>;
begin
  FResponse := nil;
  try
    FResponse := FService.SendMessage(FRequest);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
