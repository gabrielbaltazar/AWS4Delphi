unit AWS4D.SQS.Facade.GetQueueUrl;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.GetQueueUrl.Request,
  AWS4D.SQS.Model.GetQueueUrl.Response;

type TAWS4DSQSFacadeGetQueueUrl = class(TInterfacedObject, IAWS4DSQSFacadeGetQueueUrl)

  private
    FService: IAWS4DSQSService<IAWS4DSQSFacadeGetQueueUrl>;

    FRequest: IAWS4DSQSGetQueueUrlRequest<IAWS4DSQSFacadeGetQueueUrl>;
    FResponse: IAWS4DSQSGetQueueUrlResponse<IAWS4DSQSFacadeGetQueueUrl>;

  protected
    function Request: IAWS4DSQSGetQueueUrlRequest<IAWS4DSQSFacadeGetQueueUrl>;
    function Send: IAWS4DSQSGetQueueUrlResponse<IAWS4DSQSFacadeGetQueueUrl>;
    function Response: IAWS4DSQSGetQueueUrlResponse<IAWS4DSQSFacadeGetQueueUrl>;

  public
    class function New(Service: IAWS4DSQSService<IAWS4DSQSFacadeGetQueueUrl>): IAWS4DSQSFacadeGetQueueUrl;
    constructor create(Service: IAWS4DSQSService<IAWS4DSQSFacadeGetQueueUrl>);

end;

implementation

constructor TAWS4DSQSFacadeGetQueueUrl.create(Service: IAWS4DSQSService<IAWS4DSQSFacadeGetQueueUrl>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSQSFacadeGetQueueUrl.New(Service: IAWS4DSQSService<IAWS4DSQSFacadeGetQueueUrl>): IAWS4DSQSFacadeGetQueueUrl;
begin
  result := Self.create(Service);
end;

function TAWS4DSQSFacadeGetQueueUrl.Request: IAWS4DSQSGetQueueUrlRequest<IAWS4DSQSFacadeGetQueueUrl>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSQSGetQueueUrlRequest<IAWS4DSQSFacadeGetQueueUrl>.New(Self);
  result := FRequest;
end;

function TAWS4DSQSFacadeGetQueueUrl.Response: IAWS4DSQSGetQueueUrlResponse<IAWS4DSQSFacadeGetQueueUrl>;
begin
  result := FResponse;
end;

function TAWS4DSQSFacadeGetQueueUrl.Send: IAWS4DSQSGetQueueUrlResponse<IAWS4DSQSFacadeGetQueueUrl>;
begin
  FResponse := nil;
  try
    FResponse := FService.GetQueueUrl(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
