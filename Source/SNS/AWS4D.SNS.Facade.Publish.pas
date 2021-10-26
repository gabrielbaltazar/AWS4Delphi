unit AWS4D.SNS.Facade.Publish;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.Publish.Request,
  AWS4D.SNS.Model.Publish.Response;

type TAWS4DSNSFacadePublish = class(TInterfacedObject, IAWS4DSNSFacadePublish)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadePublish>;

    FRequest: IAWS4DSNSPublishRequest<IAWS4DSNSFacadePublish>;
    FResponse: IAWS4DSNSPublishResponse<IAWS4DSNSFacadePublish>;

  protected
    function Request: IAWS4DSNSPublishRequest<IAWS4DSNSFacadePublish>;
    function Send: IAWS4DSNSPublishResponse<IAWS4DSNSFacadePublish>;
    function Response: IAWS4DSNSPublishResponse<IAWS4DSNSFacadePublish>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadePublish>): IAWS4DSNSFacadePublish;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadePublish>);

end;

implementation

{ TAWS4DSNSFacadePublish }

constructor TAWS4DSNSFacadePublish.create(Service: IAWS4DSNSService<IAWS4DSNSFacadePublish>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadePublish.New(Service: IAWS4DSNSService<IAWS4DSNSFacadePublish>): IAWS4DSNSFacadePublish;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadePublish.Request: IAWS4DSNSPublishRequest<IAWS4DSNSFacadePublish>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelPublishRequest<IAWS4DSNSFacadePublish>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadePublish.Response: IAWS4DSNSPublishResponse<IAWS4DSNSFacadePublish>;
begin
  result := FResponse;
end;

function TAWS4DSNSFacadePublish.Send: IAWS4DSNSPublishResponse<IAWS4DSNSFacadePublish>;
begin
  FResponse := nil;
  try
    FResponse := FService.Publish(Request);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
