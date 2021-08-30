unit AWS4D.SQS.Facade;

interface

uses
  AWS4D.SQS.Facade.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Facade.DeleteMessage,
  AWS4D.SQS.Facade.DeleteMessageBatch,
  AWS4D.SQS.Facade.DeleteQueue,
  AWS4D.SQS.Facade.GetQueueAttributes,
  AWS4D.SQS.Facade.GetQueueUrl,
  AWS4D.SQS.Facade.ListQueues,
  AWS4D.SQS.Facade.ListQueueTags,
  AWS4D.SQS.Facade.PurgeQueue,
  AWS4D.SQS.Facade.ReceiveMessage,
  AWS4D.SQS.Facade.SendMessage,
  AWS4D.SQS.Facade.TagQueue,
  AWS4D.SQS.Facade.UnTagQueue,
  AWS4D.SQS.Service,
  AWS4D.Core.Model.Types;

type TAWS4DSQSFacade = class(TInterfacedObject, IAWS4DSQSFacade)

  private
    FQueue: string;
    FAccessKey: String;
    FSecretKey: String;
    FRegion: TAWS4DRegion;

    FDeleteMessage: IAWS4DSQSFacadeDeleteMessage;
    FDeleteMessageBatch: IAWS4DSQSFacadeDeleteMessageBatch;
    FDeleteQueue: IAWS4DSQSFacadeDeleteQueue;
    FGetQueueAttributes: IAWS4DSQSFacadeGetQueueAttributes;
    FGetQueueUrl: IAWS4DSQSFacadeGetQueueUrl;
    FListQueues: IAWS4DSQSFacadeListQueues;
    FListQueueTags: IAWS4DSQSFacadeListQueueTags;
    FPurgeQueue: IAWS4DSQSFacadePurgeQueue;
    FReceiveMessage: IAWS4DSQSFacadeReceiveMessage;
    FSendMessage: IAWS4DSQSFacadeSendMessage;
    FTagQueue: IAWS4DSQSFacadeTagQueue;
    FUnTagQueue: IAWS4DSQSFacadeUnTagQueue;

    function SQSService<I: IInterface>: IAWS4DSQSService<I>;

  protected
    function AccessKey(Value: String): IAWS4DSQSFacade;
    function SecretKey(Value: String): IAWS4DSQSFacade;
    function Region(Value: String): IAWS4DSQSFacade; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSQSFacade; overload;
    function Queue(Value: String): IAWS4DSQSFacade;

    function DeleteMessage: IAWS4DSQSFacadeDeleteMessage;
    function DeleteMessageBatch: IAWS4DSQSFacadeDeleteMessageBatch;
    function DeleteQueue: IAWS4DSQSFacadeDeleteQueue;
    function GetQueueAttributes: IAWS4DSQSFacadeGetQueueAttributes;
    function GetQueueUrl: IAWS4DSQSFacadeGetQueueUrl;
    function ListQueues: IAWS4DSQSFacadeListQueues;
    function ListQueueTags: IAWS4DSQSFacadeListQueueTags;
    function PurgeQueue: IAWS4DSQSFacadePurgeQueue;
    function ReceiveMessage: IAWS4DSQSFacadeReceiveMessage;
    function SendMessage: IAWS4DSQSFacadeSendMessage;
    function TagQueue: IAWS4DSQSFacadeTagQueue;
    function UnTagQueue: IAWS4DSQSFacadeUnTagQueue;

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

function TAWS4DSQSFacade.DeleteMessage: IAWS4DSQSFacadeDeleteMessage;
var
  service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessage>;
begin
  if not Assigned(FDeleteMessage) then
  begin
    service := Self.SQSService<IAWS4DSQSFacadeDeleteMessage>;
    FDeleteMessage := TAWS4DSQSFacadeDeleteMessage.New(service);
    FDeleteMessage.Request.QueueName(FQueue)
  end;

  result := FDeleteMessage;
end;

function TAWS4DSQSFacade.DeleteMessageBatch: IAWS4DSQSFacadeDeleteMessageBatch;
var
  service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteMessageBatch>;
begin
  if not Assigned(FDeleteMessageBatch) then
  begin
    service := Self.SQSService<IAWS4DSQSFacadeDeleteMessageBatch>;
    FDeleteMessageBatch := TAWS4DSQSFacadeDeleteMessageBatch.New(service);
    FDeleteMessageBatch.Request.QueueUrl(FQueue);
  end;

  result := FDeleteMessageBatch;
end;

function TAWS4DSQSFacade.DeleteQueue: IAWS4DSQSFacadeDeleteQueue;
var
  service: IAWS4DSQSService<IAWS4DSQSFacadeDeleteQueue>;
begin
  if not Assigned(FDeleteQueue) then
  begin
    service := Self.SQSService<IAWS4DSQSFacadeDeleteQueue>;
    FDeleteQueue := TAWS4DSQSFacadeDeleteQueue.New(service);
    FDeleteQueue.Request.QueueUrl(FQueue);
  end;

  result := FDeleteQueue;
end;

function TAWS4DSQSFacade.GetQueueAttributes: IAWS4DSQSFacadeGetQueueAttributes;
var
  service: IAWS4DSQSService<IAWS4DSQSFacadeGetQueueAttributes>;
begin
  if not Assigned(FGetQueueAttributes) then
  begin
    service := Self.SQSService<IAWS4DSQSFacadeGetQueueAttributes>;
    FGetQueueAttributes := TAWS4DSQSFacadeGetQueueAttributes.New(service);
    FGetQueueAttributes.Request.QueueUrl(FQueue);
  end;

  result := FGetQueueAttributes;
end;

function TAWS4DSQSFacade.GetQueueUrl: IAWS4DSQSFacadeGetQueueUrl;
var
  service: IAWS4DSQSService<IAWS4DSQSFacadeGetQueueUrl>;
begin
  if not Assigned(FGetQueueUrl) then
  begin
    service := Self.SQSService<IAWS4DSQSFacadeGetQueueUrl>;
    FGetQueueUrl := TAWS4DSQSFacadeGetQueueUrl.New(service);
    FGetQueueUrl.Request.QueueName(FQueue);
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
    FListQueueTags.Request.QueueUrl(FQueue);
  end;

  result := FListQueueTags;
end;

class function TAWS4DSQSFacade.New: IAWS4DSQSFacade;
begin
  result := Self.create;
end;

function TAWS4DSQSFacade.PurgeQueue: IAWS4DSQSFacadePurgeQueue;
var
  service: IAWS4DSQSService<IAWS4DSQSFacadePurgeQueue>;
begin
  if not Assigned(FPurgeQueue) then
  begin
    service := Self.SQSService<IAWS4DSQSFacadePurgeQueue>;
    FPurgeQueue := TAWS4DSQSFacadePurgeQueue.New(service);
    FPurgeQueue.Request.QueueUrl(FQueue);
  end;

  result := FPurgeQueue;
end;

function TAWS4DSQSFacade.Queue(Value: String): IAWS4DSQSFacade;
begin
  result := Self;
  FQueue := Value;
end;

function TAWS4DSQSFacade.ReceiveMessage: IAWS4DSQSFacadeReceiveMessage;
var
  service: IAWS4DSQSService<IAWS4DSQSFacadeReceiveMessage>;
begin
  if not Assigned(FReceiveMessage) then
  begin
    service := Self.SQSService<IAWS4DSQSFacadeReceiveMessage>;
    FReceiveMessage := TAWS4DSQSFacadeReceiveMessage.New(service);
    FReceiveMessage.Request.QueueUrl(FQueue);
  end;

  result := FReceiveMessage;
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
    FSendMessage.Request.QueueUrl(FQueue);
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

function TAWS4DSQSFacade.TagQueue: IAWS4DSQSFacadeTagQueue;
var
  service: IAWS4DSQSService<IAWS4DSQSFacadeTagQueue>;
begin
  if not Assigned(FTagQueue) then
  begin
    service := Self.SQSService<IAWS4DSQSFacadeTagQueue>;
    FTagQueue := TAWS4DSQSFacadeTagQueue.New(service);
    FTagQueue.Request.QueueUrl(FQueue);
  end;

  result := FTagQueue;
end;

function TAWS4DSQSFacade.UnTagQueue: IAWS4DSQSFacadeUnTagQueue;
var
  service: IAWS4DSQSService<IAWS4DSQSFacadeUnTagQueue>;
begin
  if not Assigned(FUnTagQueue) then
  begin
    service := Self.SQSService<IAWS4DSQSFacadeUnTagQueue>;
    FUnTagQueue := TAWS4DSQSFacadeUnTagQueue.New(service);
    FUnTagQueue.Request.QueueUrl(FQueue);
  end;

  result := FUnTagQueue;
end;

end.
