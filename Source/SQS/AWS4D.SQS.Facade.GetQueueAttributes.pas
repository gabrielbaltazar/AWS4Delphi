unit AWS4D.SQS.Facade.GetQueueAttributes;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.GetQueueAttributes.Request,
  AWS4D.SQS.Model.GetQueueAttributes.Response;

type TAWS4DSQSFacadeGetQueueAttributes = class(TInterfacedObject, IAWS4DSQSFacadeGetQueueAttributes)

  private
    FService: IAWS4DSQSService<IAWS4DSQSFacadeGetQueueAttributes>;

    FRequest: IAWS4DSQSGetQueueAttributesRequest<IAWS4DSQSFacadeGetQueueAttributes>;
    FResponse: IAWS4DSQSGetQueueAttributesResponse<IAWS4DSQSFacadeGetQueueAttributes>;

  protected
    function Request: IAWS4DSQSGetQueueAttributesRequest<IAWS4DSQSFacadeGetQueueAttributes>;
    function Send: IAWS4DSQSGetQueueAttributesResponse<IAWS4DSQSFacadeGetQueueAttributes>;
    function Response: IAWS4DSQSGetQueueAttributesResponse<IAWS4DSQSFacadeGetQueueAttributes>;

  public
    class function New(Service: IAWS4DSQSService<IAWS4DSQSFacadeGetQueueAttributes>): IAWS4DSQSFacadeGetQueueAttributes;
    constructor create(Service: IAWS4DSQSService<IAWS4DSQSFacadeGetQueueAttributes>);

end;

implementation

constructor TAWS4DSQSFacadeGetQueueAttributes.create(Service: IAWS4DSQSService<IAWS4DSQSFacadeGetQueueAttributes>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSQSFacadeGetQueueAttributes.New(Service: IAWS4DSQSService<IAWS4DSQSFacadeGetQueueAttributes>): IAWS4DSQSFacadeGetQueueAttributes;
begin
  result := Self.create(Service);
end;

function TAWS4DSQSFacadeGetQueueAttributes.Request: IAWS4DSQSGetQueueAttributesRequest<IAWS4DSQSFacadeGetQueueAttributes>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSQSGetQueueAttributesRequest<IAWS4DSQSFacadeGetQueueAttributes>.New(Self);
  result := FRequest;
end;

function TAWS4DSQSFacadeGetQueueAttributes.Response: IAWS4DSQSGetQueueAttributesResponse<IAWS4DSQSFacadeGetQueueAttributes>;
begin
  result := FResponse;
end;

function TAWS4DSQSFacadeGetQueueAttributes.Send: IAWS4DSQSGetQueueAttributesResponse<IAWS4DSQSFacadeGetQueueAttributes>;
begin
  FResponse := nil;
  try
    FResponse := FService.GetQueueAttributes(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
