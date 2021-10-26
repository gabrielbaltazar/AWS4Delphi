unit AWS4D.SNS.Facade.ListTopics;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.ListTopics.Request,
  AWS4D.SNS.Model.ListTopics.Response;

type TAWS4DSNSFacadeListTopics = class(TInterfacedObject, IAWS4DSNSFacadeListTopics)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeListTopics>;

    FRequest: IAWS4DSNSListTopicsRequest<IAWS4DSNSFacadeListTopics>;
    FResponse: IAWS4DSNSListTopicsResponse<IAWS4DSNSFacadeListTopics>;

  protected
    function Request: IAWS4DSNSListTopicsRequest<IAWS4DSNSFacadeListTopics>;
    function Send: IAWS4DSNSListTopicsResponse<IAWS4DSNSFacadeListTopics>;
    function Response: IAWS4DSNSListTopicsResponse<IAWS4DSNSFacadeListTopics>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeListTopics>): IAWS4DSNSFacadeListTopics;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeListTopics>);

end;

implementation

{ TAWS4DSNSFacadeListTopics }

constructor TAWS4DSNSFacadeListTopics.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeListTopics>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeListTopics.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeListTopics>): IAWS4DSNSFacadeListTopics;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeListTopics.Request: IAWS4DSNSListTopicsRequest<IAWS4DSNSFacadeListTopics>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelListTopicsRequest<IAWS4DSNSFacadeListTopics>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeListTopics.Response: IAWS4DSNSListTopicsResponse<IAWS4DSNSFacadeListTopics>;
begin
  result := FResponse;
end;

function TAWS4DSNSFacadeListTopics.Send: IAWS4DSNSListTopicsResponse<IAWS4DSNSFacadeListTopics>;
begin
  FResponse := nil;
  try
    FResponse := FService.ListTopics(Request);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
