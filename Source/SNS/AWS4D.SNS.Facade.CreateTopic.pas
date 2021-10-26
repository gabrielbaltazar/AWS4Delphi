unit AWS4D.SNS.Facade.CreateTopic;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.CreateTopic.Request,
  AWS4D.SNS.Model.CreateTopic.Response;

type TAWS4DSNSFacadeCreateTopic = class(TInterfacedObject, IAWS4DSNSFacadeCreateTopic)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeCreateTopic>;

    FRequest: IAWS4DSNSCreateTopicRequest<IAWS4DSNSFacadeCreateTopic>;
    FResponse: IAWS4DSNSCreateTopicResponse<IAWS4DSNSFacadeCreateTopic>;

  protected
    function Request: IAWS4DSNSCreateTopicRequest<IAWS4DSNSFacadeCreateTopic>;
    function Send: IAWS4DSNSCreateTopicResponse<IAWS4DSNSFacadeCreateTopic>;
    function Response: IAWS4DSNSCreateTopicResponse<IAWS4DSNSFacadeCreateTopic>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeCreateTopic>): IAWS4DSNSFacadeCreateTopic;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeCreateTopic>);

end;

implementation

{ TAWS4DSNSFacadeCreateTopic }

constructor TAWS4DSNSFacadeCreateTopic.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeCreateTopic>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeCreateTopic.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeCreateTopic>): IAWS4DSNSFacadeCreateTopic;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeCreateTopic.Request: IAWS4DSNSCreateTopicRequest<IAWS4DSNSFacadeCreateTopic>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelCreateTopicRequest<IAWS4DSNSFacadeCreateTopic>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeCreateTopic.Response: IAWS4DSNSCreateTopicResponse<IAWS4DSNSFacadeCreateTopic>;
begin
  result := FResponse;
end;

function TAWS4DSNSFacadeCreateTopic.Send: IAWS4DSNSCreateTopicResponse<IAWS4DSNSFacadeCreateTopic>;
begin
  FResponse := nil;
  try
    FResponse := FService.CreateTopic(Request);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
