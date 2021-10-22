unit AWS4D.SNS.Facade.DeleteTopic;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.DeleteTopic.Request;

type TAWS4DSNSFacadeDeleteTopic = class(TInterfacedObject, IAWS4DSNSFacadeDeleteTopic)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeDeleteTopic>;

    FRequest: IAWS4DSNSDeleteTopicRequest<IAWS4DSNSFacadeDeleteTopic>;

  protected
    function Request: IAWS4DSNSDeleteTopicRequest<IAWS4DSNSFacadeDeleteTopic>;
    function Send: IAWS4DSNSDeleteTopicRequest<IAWS4DSNSFacadeDeleteTopic>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeDeleteTopic>): IAWS4DSNSFacadeDeleteTopic;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeDeleteTopic>);

end;

implementation

{ TAWS4DSNSFacadeDeleteTopic }

constructor TAWS4DSNSFacadeDeleteTopic.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeDeleteTopic>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeDeleteTopic.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeDeleteTopic>): IAWS4DSNSFacadeDeleteTopic;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeDeleteTopic.Request: IAWS4DSNSDeleteTopicRequest<IAWS4DSNSFacadeDeleteTopic>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelDeleteTopicRequest<IAWS4DSNSFacadeDeleteTopic>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeDeleteTopic.Send: IAWS4DSNSDeleteTopicRequest<IAWS4DSNSFacadeDeleteTopic>;
begin
  FService.DeleteTopic(Request);
  FRequest := nil;
  result := Request;
end;

end.
