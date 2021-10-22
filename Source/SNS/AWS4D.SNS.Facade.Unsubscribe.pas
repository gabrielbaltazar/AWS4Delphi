unit AWS4D.SNS.Facade.Unsubscribe;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.Unsubscribe.Request;

type TAWS4DSNSFacadeUnsubscribe = class(TInterfacedObject, IAWS4DSNSFacadeUnsubscribe)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeUnsubscribe>;

    FRequest: IAWS4DSNSUnsubscribeRequest<IAWS4DSNSFacadeUnsubscribe>;

  protected
    function Request: IAWS4DSNSUnsubscribeRequest<IAWS4DSNSFacadeUnsubscribe>;
    function Send: IAWS4DSNSUnsubscribeRequest<IAWS4DSNSFacadeUnsubscribe>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeUnsubscribe>): IAWS4DSNSFacadeUnsubscribe;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeUnsubscribe>);

end;

implementation

{ TAWS4DSNSFacadeUnsubscribe }

constructor TAWS4DSNSFacadeUnsubscribe.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeUnsubscribe>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeUnsubscribe.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeUnsubscribe>): IAWS4DSNSFacadeUnsubscribe;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeUnsubscribe.Request: IAWS4DSNSUnsubscribeRequest<IAWS4DSNSFacadeUnsubscribe>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelUnsubscribeRequest<IAWS4DSNSFacadeUnsubscribe>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeUnsubscribe.Send: IAWS4DSNSUnsubscribeRequest<IAWS4DSNSFacadeUnsubscribe>;
begin
  FService.Unsubscribe(Request);
  FRequest := nil;
  result := Request;
end;

end.
