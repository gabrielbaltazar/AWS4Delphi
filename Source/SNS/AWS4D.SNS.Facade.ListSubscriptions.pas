unit AWS4D.SNS.Facade.ListSubscriptions;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.ListSubscriptions.Request,
  AWS4D.SNS.Model.ListSubscriptions.Response;

type TAWS4DSNSFacadeListSubscriptions = class(TInterfacedObject, IAWS4DSNSFacadeListSubscriptions)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeListSubscriptions>;

    FRequest: IAWS4DSNSListSubscriptionsRequest<IAWS4DSNSFacadeListSubscriptions>;
    FResponse: IAWS4DSNSListSubscriptionsResponse<IAWS4DSNSFacadeListSubscriptions>;

  protected
    function Request: IAWS4DSNSListSubscriptionsRequest<IAWS4DSNSFacadeListSubscriptions>;
    function Send: IAWS4DSNSListSubscriptionsResponse<IAWS4DSNSFacadeListSubscriptions>;
    function Response: IAWS4DSNSListSubscriptionsResponse<IAWS4DSNSFacadeListSubscriptions>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeListSubscriptions>): IAWS4DSNSFacadeListSubscriptions;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeListSubscriptions>);

end;

implementation

{ TAWS4DSNSFacadeListSubscriptions }

constructor TAWS4DSNSFacadeListSubscriptions.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeListSubscriptions>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeListSubscriptions.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeListSubscriptions>): IAWS4DSNSFacadeListSubscriptions;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeListSubscriptions.Request: IAWS4DSNSListSubscriptionsRequest<IAWS4DSNSFacadeListSubscriptions>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelListSubscriptionsRequest<IAWS4DSNSFacadeListSubscriptions>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeListSubscriptions.Response: IAWS4DSNSListSubscriptionsResponse<IAWS4DSNSFacadeListSubscriptions>;
begin
  result := FResponse;
end;

function TAWS4DSNSFacadeListSubscriptions.Send: IAWS4DSNSListSubscriptionsResponse<IAWS4DSNSFacadeListSubscriptions>;
begin
  FResponse := nil;
  try
    FResponse := FService.ListSubscriptions(Request);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
