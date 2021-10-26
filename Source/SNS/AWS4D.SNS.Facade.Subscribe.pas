unit AWS4D.SNS.Facade.Subscribe;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.Subscribe.Request,
  AWS4D.SNS.Model.Subscribe.Response;

type TAWS4DSNSFacadeSubscribe = class(TInterfacedObject, IAWS4DSNSFacadeSubscribe)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeSubscribe>;

    FRequest: IAWS4DSNSSubscribeRequest<IAWS4DSNSFacadeSubscribe>;
    FResponse: IAWS4DSNSSubscribeResponse<IAWS4DSNSFacadeSubscribe>;

  protected
    function Request: IAWS4DSNSSubscribeRequest<IAWS4DSNSFacadeSubscribe>;
    function Send: IAWS4DSNSSubscribeResponse<IAWS4DSNSFacadeSubscribe>;
    function Response: IAWS4DSNSSubscribeResponse<IAWS4DSNSFacadeSubscribe>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeSubscribe>): IAWS4DSNSFacadeSubscribe;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeSubscribe>);

end;

implementation

{ TAWS4DSNSFacadeSubscribe }

constructor TAWS4DSNSFacadeSubscribe.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeSubscribe>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeSubscribe.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeSubscribe>): IAWS4DSNSFacadeSubscribe;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeSubscribe.Request: IAWS4DSNSSubscribeRequest<IAWS4DSNSFacadeSubscribe>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelSubscribeRequest<IAWS4DSNSFacadeSubscribe>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeSubscribe.Response: IAWS4DSNSSubscribeResponse<IAWS4DSNSFacadeSubscribe>;
begin
  result := FResponse;
end;

function TAWS4DSNSFacadeSubscribe.Send: IAWS4DSNSSubscribeResponse<IAWS4DSNSFacadeSubscribe>;
begin
  FResponse := nil;
  try
    FResponse := FService.Subscribe(Request);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
