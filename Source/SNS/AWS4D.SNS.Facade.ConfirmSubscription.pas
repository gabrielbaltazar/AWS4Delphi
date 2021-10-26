unit AWS4D.SNS.Facade.ConfirmSubscription;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.ConfirmSubscription.Request,
  AWS4D.SNS.Model.ConfirmSubscription.Response;

type TAWS4DSNSFacadeConfirmSubscription = class(TInterfacedObject, IAWS4DSNSFacadeConfirmSubscription)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeConfirmSubscription>;

    FRequest: IAWS4DSNSConfirmSubscriptionRequest<IAWS4DSNSFacadeConfirmSubscription>;
    FResponse: IAWS4DSNSConfirmSubscriptionResponse<IAWS4DSNSFacadeConfirmSubscription>;

  protected
    function Request: IAWS4DSNSConfirmSubscriptionRequest<IAWS4DSNSFacadeConfirmSubscription>;
    function Send: IAWS4DSNSConfirmSubscriptionResponse<IAWS4DSNSFacadeConfirmSubscription>;
    function Response: IAWS4DSNSConfirmSubscriptionResponse<IAWS4DSNSFacadeConfirmSubscription>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeConfirmSubscription>): IAWS4DSNSFacadeConfirmSubscription;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeConfirmSubscription>);

end;

implementation

{ TAWS4DSNSFacadeConfirmSubscription }

constructor TAWS4DSNSFacadeConfirmSubscription.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeConfirmSubscription>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeConfirmSubscription.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeConfirmSubscription>): IAWS4DSNSFacadeConfirmSubscription;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeConfirmSubscription.Request: IAWS4DSNSConfirmSubscriptionRequest<IAWS4DSNSFacadeConfirmSubscription>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelConfirmSubscriptionRequest<IAWS4DSNSFacadeConfirmSubscription>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeConfirmSubscription.Response: IAWS4DSNSConfirmSubscriptionResponse<IAWS4DSNSFacadeConfirmSubscription>;
begin
  result := FResponse;
end;

function TAWS4DSNSFacadeConfirmSubscription.Send: IAWS4DSNSConfirmSubscriptionResponse<IAWS4DSNSFacadeConfirmSubscription>;
begin
  FResponse := nil;
  try
    FResponse := FService.ConfirmSubscription(Request);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
