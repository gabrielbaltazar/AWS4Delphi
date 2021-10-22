unit AWS4D.SNS.Facade.SetTopicAttributes;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.SetTopicAttributes.Request;

type TAWS4DSNSFacadeSetTopicAttributes = class(TInterfacedObject, IAWS4DSNSFacadeSetTopicAttributes)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeSetTopicAttributes>;

    FRequest: IAWS4DSNSSetTopicAttributesRequest<IAWS4DSNSFacadeSetTopicAttributes>;

  protected
    function Request: IAWS4DSNSSetTopicAttributesRequest<IAWS4DSNSFacadeSetTopicAttributes>;
    function Send: IAWS4DSNSSetTopicAttributesRequest<IAWS4DSNSFacadeSetTopicAttributes>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetTopicAttributes>): IAWS4DSNSFacadeSetTopicAttributes;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetTopicAttributes>);

end;

implementation

{ TAWS4DSNSFacadeSetTopicAttributes }

constructor TAWS4DSNSFacadeSetTopicAttributes.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetTopicAttributes>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeSetTopicAttributes.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeSetTopicAttributes>): IAWS4DSNSFacadeSetTopicAttributes;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeSetTopicAttributes.Request: IAWS4DSNSSetTopicAttributesRequest<IAWS4DSNSFacadeSetTopicAttributes>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelSetTopicAttributesRequest<IAWS4DSNSFacadeSetTopicAttributes>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeSetTopicAttributes.Send: IAWS4DSNSSetTopicAttributesRequest<IAWS4DSNSFacadeSetTopicAttributes>;
begin
  FService.SetTopicAttributes(Request);
  FRequest := nil;
  result := Request;
end;

end.
