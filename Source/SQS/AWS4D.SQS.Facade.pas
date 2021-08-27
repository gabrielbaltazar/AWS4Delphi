unit AWS4D.SQS.Facade;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Facade.GetQueueUrl,
  AWS4D.SQS.Facade.ListQueues,
  AWS4D.SQS.Facade.ListQueueTags,
  AWS4D.SQS.Facade.SendMessage,
  AWS4D.SQS.Service,
  AWS4D.Core.Model.Types;

type TAWS4DSQSFacade = class(TInterfacedObject, IAWS4DSQSFacade)

  private
    FGetQueueUrl: IAWS4DSQSFacadeGetQueueUrl;
    FListQueues: IAWS4DSQSFacadeListQueues;
    FListQueueTags: IAWS4DSQSFacadeListQueueTags;
    FSendMessage: IAWS4DSQSFacadeSendMessage;

    FAccessKey: String;
    FSecretKey: String;
    FRegion: TAWS4DRegion;

    function SQSService<I: IInterface>: IAWS4DSQSService<I>;

  protected
    function AccessKey(Value: String): IAWS4DSQSFacade;
    function SecretKey(Value: String): IAWS4DSQSFacade;
    function Region(Value: String): IAWS4DSQSFacade; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSQSFacade; overload;

    function GetQueueUrl: IAWS4DSQSFacadeGetQueueUrl;
    function ListQueues: IAWS4DSQSFacadeListQueues;
    function ListQueueTags: IAWS4DSQSFacadeListQueueTags;
    function SendMessage: IAWS4DSQSFacadeSendMessage;

  public
    constructor create;
    class function New: IAWS4DSQSFacade;

end;

implementation

{ TAWS4DSQSFacade }

function TAWS4DSQSFacade.AccessKey(Value: String): IAWS4DSQSFacade;
begin
  result := Self;
  FAccessKey := Value;
end;

constructor TAWS4DSQSFacade.create;
begin

end;

function TAWS4DSQSFacade.GetQueueUrl: IAWS4DSQSFacadeGetQueueUrl;
var
  service: IAWS4DSQSService<IAWS4DSQSFacadeGetQueueUrl>;
begin
  if not Assigned(FGetQueueUrl) then
  begin
    service := Self.SQSService<IAWS4DSQSFacadeGetQueueUrl>;
    FGetQueueUrl := TAWS4DSQSFacadeGetQueueUrl.New(service);
  end;

  result := FGetQueueUrl;
end;

function TAWS4DSQSFacade.ListQueues: IAWS4DSQSFacadeListQueues;
var
  service: IAWS4DSQSService<IAWS4DSQSFacadeListQueues>;
begin
  if not Assigned(FListQueues) then
  begin
    service := Self.SQSService<IAWS4DSQSFacadeListQueues>;
    FListQueues := TAWS4DSQSFacadeListQueues.New(service);
  end;

  result := FListQueues;
end;

function TAWS4DSQSFacade.ListQueueTags: IAWS4DSQSFacadeListQueueTags;
var
  service: IAWS4DSQSService<IAWS4DSQSFacadeListQueueTags>;
begin
  if not Assigned(FListQueueTags) then
  begin
    service := Self.SQSService<IAWS4DSQSFacadeListQueueTags>;
    FListQueueTags := TAWS4DSQSFacadeListQueueTags.New(service);
  end;

  result := FListQueueTags;
end;

class function TAWS4DSQSFacade.New: IAWS4DSQSFacade;
begin
  result := Self.create;
end;

function TAWS4DSQSFacade.Region(Value: TAWS4DRegion): IAWS4DSQSFacade;
begin
  result := Self;
  FRegion := Value;
end;

function TAWS4DSQSFacade.Region(Value: String): IAWS4DSQSFacade;
begin
  result := Self;
  FRegion.fromString(Value);
end;

function TAWS4DSQSFacade.SecretKey(Value: String): IAWS4DSQSFacade;
begin
  result := Self;
  FSecretKey := Value;
end;

function TAWS4DSQSFacade.SendMessage: IAWS4DSQSFacadeSendMessage;
var
  service: IAWS4DSQSService<IAWS4DSQSFacadeSendMessage>;
begin
  if not Assigned(FSendMessage) then
  begin
    service := Self.SQSService<IAWS4DSQSFacadeSendMessage>;
    FSendMessage := TAWS4DSQSFacadeSendMessage.New(service);
  end;

  result := FSendMessage;
end;

function TAWS4DSQSFacade.SQSService<I>: IAWS4DSQSService<I>;
begin
  Result := TAWS4DSQSService<I>.New;
  Result
    .AccessKey(FAccessKey)
    .SecretKey(FSecretKey)
    .Region(FRegion);
end;

end.
