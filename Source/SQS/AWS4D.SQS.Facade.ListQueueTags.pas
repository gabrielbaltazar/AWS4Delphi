unit AWS4D.SQS.Facade.ListQueueTags;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.ListQueueTags.Request,
  AWS4D.SQS.Model.ListQueueTags.Response;

type TAWS4DSQSFacadeListQueueTags = class(TInterfacedObject, IAWS4DSQSFacadeListQueueTags)

  private
    FService: IAWS4DSQSService<IAWS4DSQSFacadeListQueueTags>;

    FRequest: IAWS4DSQSListQueueTagsRequest<IAWS4DSQSFacadeListQueueTags>;
    FResponse: IAWS4DSQSListQueueTagsResponse<IAWS4DSQSFacadeListQueueTags>;

  protected
    function Request: IAWS4DSQSListQueueTagsRequest<IAWS4DSQSFacadeListQueueTags>;
    function Send: IAWS4DSQSListQueueTagsResponse<IAWS4DSQSFacadeListQueueTags>;
    function Response: IAWS4DSQSListQueueTagsResponse<IAWS4DSQSFacadeListQueueTags>;

  public
    class function New(Service: IAWS4DSQSService<IAWS4DSQSFacadeListQueueTags>): IAWS4DSQSFacadeListQueueTags;
    constructor create(Service: IAWS4DSQSService<IAWS4DSQSFacadeListQueueTags>);

end;

implementation

{ TAWS4DSQSFacadeListQueueTags }

constructor TAWS4DSQSFacadeListQueueTags.create(Service: IAWS4DSQSService<IAWS4DSQSFacadeListQueueTags>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSQSFacadeListQueueTags.New(Service: IAWS4DSQSService<IAWS4DSQSFacadeListQueueTags>): IAWS4DSQSFacadeListQueueTags;
begin
  result := Self.create(Service);
end;

function TAWS4DSQSFacadeListQueueTags.Request: IAWS4DSQSListQueueTagsRequest<IAWS4DSQSFacadeListQueueTags>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSQSModelListQueueTagsRequest<IAWS4DSQSFacadeListQueueTags>.New(Self);
  result := FRequest;
end;

function TAWS4DSQSFacadeListQueueTags.Response: IAWS4DSQSListQueueTagsResponse<IAWS4DSQSFacadeListQueueTags>;
begin
  result := FResponse;
end;

function TAWS4DSQSFacadeListQueueTags.Send: IAWS4DSQSListQueueTagsResponse<IAWS4DSQSFacadeListQueueTags>;
begin
  FResponse := nil;
  try
    FResponse := FService.ListQueueTags(FRequest);
  finally
    FRequest := nil;
  end;
end;

end.
