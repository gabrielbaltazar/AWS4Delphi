unit AWS4D.SNS.Facade.GetTopicAttributes;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.GetTopicAttributes.Request,
  AWS4D.SNS.Model.GetTopicAttributes.Response;

type TAWS4DSNSFacadeGetTopicAttributes = class(TInterfacedObject, IAWS4DSNSFacadeGetTopicAttributes)

  private
    FService: IAWS4DSNSService<IAWS4DSNSFacadeGetTopicAttributes>;

    FRequest: IAWS4DSNSGetTopicAttributesRequest<IAWS4DSNSFacadeGetTopicAttributes>;
    FResponse: IAWS4DSNSGetTopicAttributesResponse<IAWS4DSNSFacadeGetTopicAttributes>;

  protected
    function Request: IAWS4DSNSGetTopicAttributesRequest<IAWS4DSNSFacadeGetTopicAttributes>;
    function Send: IAWS4DSNSGetTopicAttributesResponse<IAWS4DSNSFacadeGetTopicAttributes>;
    function Response: IAWS4DSNSGetTopicAttributesResponse<IAWS4DSNSFacadeGetTopicAttributes>;

  public
    class function New(Service: IAWS4DSNSService<IAWS4DSNSFacadeGetTopicAttributes>): IAWS4DSNSFacadeGetTopicAttributes;
    constructor create(Service: IAWS4DSNSService<IAWS4DSNSFacadeGetTopicAttributes>);

end;

implementation

{ TAWS4DSNSFacadeGetTopicAttributes }

constructor TAWS4DSNSFacadeGetTopicAttributes.create(Service: IAWS4DSNSService<IAWS4DSNSFacadeGetTopicAttributes>);
begin
  FService := Service;
  FService.Parent(Self);
end;

class function TAWS4DSNSFacadeGetTopicAttributes.New(Service: IAWS4DSNSService<IAWS4DSNSFacadeGetTopicAttributes>): IAWS4DSNSFacadeGetTopicAttributes;
begin
  result := Self.create(Service);
end;

function TAWS4DSNSFacadeGetTopicAttributes.Request: IAWS4DSNSGetTopicAttributesRequest<IAWS4DSNSFacadeGetTopicAttributes>;
begin
  if not Assigned(FRequest) then
    FRequest := TAWS4DSNSModelGetTopicAttributesRequest<IAWS4DSNSFacadeGetTopicAttributes>.New(Self);
  result := FRequest;
end;

function TAWS4DSNSFacadeGetTopicAttributes.Response: IAWS4DSNSGetTopicAttributesResponse<IAWS4DSNSFacadeGetTopicAttributes>;
begin
  result := FResponse;
end;

function TAWS4DSNSFacadeGetTopicAttributes.Send: IAWS4DSNSGetTopicAttributesResponse<IAWS4DSNSFacadeGetTopicAttributes>;
begin
  FResponse := nil;
  try
    FResponse := FService.GetTopicAttributes(Request);
    result := FResponse;
  finally
    FRequest := nil;
  end;
end;

end.
