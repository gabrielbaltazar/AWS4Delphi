unit AWS4D.SNS.Facade;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Facade.CreateTopic,
  AWS4D.SNS.Facade.DeleteTopic,
  AWS4D.SNS.Facade.ListSubscriptions,
  AWS4D.SNS.Facade.ListTopics,
  AWS4D.SNS.Facade.Subscribe,
  AWS4D.SNS.Facade.Unsubscribe,
  AWS4D.SNS.Service,
  AWS4D.Core.Model.Types;

type TAWS4DSNSFacade = class(TInterfacedObject, IAWS4DSNSFacade)

  private
    FAccessKey: String;
    FSecretKey: String;
    FRegion: TAWS4DRegion;

    FCreateTopic: IAWS4DSNSFacadeCreateTopic;
    FDeleteTopic: IAWS4DSNSFacadeDeleteTopic;
    FListSubsctiptions: IAWS4DSNSFacadeListSubscriptions;
    FListTopics: IAWS4DSNSFacadeListTopics;
    FSubscribe: IAWS4DSNSFacadeSubscribe;
    FUnsubscribe: IAWS4DSNSFacadeUnsubscribe;

    function SNSService<I: IInterface>: IAWS4DSNSService<I>;

  protected
    function AccessKey(Value: String): IAWS4DSNSFacade;
    function SecretKey(Value: String): IAWS4DSNSFacade;
    function Region(Value: String): IAWS4DSNSFacade; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSNSFacade; overload;

    function CreateTopic: IAWS4DSNSFacadeCreateTopic;
    function DeleteTopic: IAWS4DSNSFacadeDeleteTopic;
    function ListSubscriptions: IAWS4DSNSFacadeListSubscriptions;
    function ListTopics: IAWS4DSNSFacadeListTopics;
    function Subscribe: IAWS4DSNSFacadeSubscribe;
    function Unsubscribe: IAWS4DSNSFacadeUnsubscribe;

  public
    constructor create;
    class function New: IAWS4DSNSFacade;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSFacade }

function TAWS4DSNSFacade.AccessKey(Value: String): IAWS4DSNSFacade;
begin
  result := Self;
  FAccessKey := Value;
end;

constructor TAWS4DSNSFacade.create;
begin
  FRegion := aws4dUSEast1;
end;

function TAWS4DSNSFacade.CreateTopic: IAWS4DSNSFacadeCreateTopic;
var
  service: IAWS4DSNSService<IAWS4DSNSFacadeCreateTopic>;
begin
  if not Assigned(FCreateTopic) then
  begin
    service := Self.SNSService<IAWS4DSNSFacadeCreateTopic>;
    FCreateTopic := TAWS4DSNSFacadeCreateTopic.New(service);
  end;

  result := FCreateTopic;
end;

function TAWS4DSNSFacade.DeleteTopic: IAWS4DSNSFacadeDeleteTopic;
var
  service: IAWS4DSNSService<IAWS4DSNSFacadeDeleteTopic>;
begin
  if not Assigned(FDeleteTopic) then
  begin
    service := Self.SNSService<IAWS4DSNSFacadeDeleteTopic>;
    FDeleteTopic := TAWS4DSNSFacadeDeleteTopic.New(service);
  end;

  result := FDeleteTopic;
end;

destructor TAWS4DSNSFacade.Destroy;
begin

  inherited;
end;

function TAWS4DSNSFacade.ListSubscriptions: IAWS4DSNSFacadeListSubscriptions;
var
  service: IAWS4DSNSService<IAWS4DSNSFacadeListSubscriptions>;
begin
  if not Assigned(FListSubsctiptions) then
  begin
    service := Self.SNSService<IAWS4DSNSFacadeListSubscriptions>;
    FListSubsctiptions := TAWS4DSNSFacadeListSubscriptions.New(service);
  end;

  result := FListSubsctiptions;
end;

function TAWS4DSNSFacade.ListTopics: IAWS4DSNSFacadeListTopics;
var
  service: IAWS4DSNSService<IAWS4DSNSFacadeListTopics>;
begin
  if not Assigned(FListTopics) then
  begin
    service := Self.SNSService<IAWS4DSNSFacadeListTopics>;
    FListTopics := TAWS4DSNSFacadeListTopics.New(service);
  end;

  result := FListTopics;
end;

class function TAWS4DSNSFacade.New: IAWS4DSNSFacade;
begin
  result := Self.create;
end;

function TAWS4DSNSFacade.Region(Value: String): IAWS4DSNSFacade;
begin
  result := Self;
  FRegion.fromString(Value);
end;

function TAWS4DSNSFacade.Region(Value: TAWS4DRegion): IAWS4DSNSFacade;
begin
  result := Self;
  FRegion := Value;
end;

function TAWS4DSNSFacade.SecretKey(Value: String): IAWS4DSNSFacade;
begin
  result := Self;
  FSecretKey := Value;
end;

function TAWS4DSNSFacade.SNSService<I>: IAWS4DSNSService<I>;
begin
  Result := TAWS4DSNSService<I>.New;
  Result
    .AccessKey(FAccessKey)
    .SecretKey(FSecretKey)
    .Region(FRegion);
end;

function TAWS4DSNSFacade.Subscribe: IAWS4DSNSFacadeSubscribe;
var
  service: IAWS4DSNSService<IAWS4DSNSFacadeSubscribe>;
begin
  if not Assigned(FSubscribe) then
  begin
    service := Self.SNSService<IAWS4DSNSFacadeSubscribe>;
    FSubscribe := TAWS4DSNSFacadeSubscribe.New(service);
  end;

  result := FSubscribe;
end;

function TAWS4DSNSFacade.Unsubscribe: IAWS4DSNSFacadeUnsubscribe;
var
  service: IAWS4DSNSService<IAWS4DSNSFacadeUnsubscribe>;
begin
  if not Assigned(FUnsubscribe) then
  begin
    service := Self.SNSService<IAWS4DSNSFacadeUnsubscribe>;
    FUnsubscribe := TAWS4DSNSFacadeUnsubscribe.New(service);
  end;

  result := FUnsubscribe;
end;

end.
