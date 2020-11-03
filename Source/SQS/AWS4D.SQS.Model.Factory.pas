unit AWS4D.SQS.Model.Factory;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.Classes,
  System.SysUtils;

type TAWS4DSQSModelFactory = class(TInterfacedObject, IAWS4DSQSModelFactory)

  private
    class var FInstance: IAWS4DSQSModelFactory;

    constructor createPrivate;

  protected
    function CreateQueueRequest: IAWS4DSQSModelCreateQueueRequest;
    function DeleteMessageRequest: IAWS4DSQSModelDeleteMessageRequest;
    function DeleteMessageBatchRequest: IAWS4DSQSModelDeleteMessageBatchRequest;
    function GetQueueAttributesRequest: IAWS4DSQSModelGetQueueAttributesRequest;
    function ListQueuesRequest: IAWS4DSQSModelListQueuesRequest;
    function ReceiveMessageRequest: IAWS4DSQSModelReceiveMessageRequest;
    function SendMessageRequest: IAWS4DSQSModelSendMessageRequest;
    function TagQueueRequest: IAWS4DSQSModelTagQueueRequest;
    function UntagQueueRequest: IAWS4DSQSModelUntagQueueRequest;

  public
    constructor create;
    class function GetInstance: IAWS4DSQSModelFactory;
end;

implementation

{ TAWS4DSQSModelFactory }

constructor TAWS4DSQSModelFactory.create;
begin
  raise Exception.CreateFmt('Use the class function GetInstance.', []);
end;

constructor TAWS4DSQSModelFactory.createPrivate;
begin
end;

function TAWS4DSQSModelFactory.CreateQueueRequest: IAWS4DSQSModelCreateQueueRequest;
begin
  result := TAWS4DSQSModelCreateQueueRequest.New;
end;

function TAWS4DSQSModelFactory.DeleteMessageBatchRequest: IAWS4DSQSModelDeleteMessageBatchRequest;
begin
  result := TAWS4DSQSModelDeleteMessageBatchRequest.New;
end;

function TAWS4DSQSModelFactory.DeleteMessageRequest: IAWS4DSQSModelDeleteMessageRequest;
begin
  result := TAWS4DSQSModelDeleteMessageRequest.New;
end;

function TAWS4DSQSModelFactory.ListQueuesRequest: IAWS4DSQSModelListQueuesRequest;
begin
  result := TAWS4DSQSModelListQueuesRequest.New;
end;

function TAWS4DSQSModelFactory.ReceiveMessageRequest: IAWS4DSQSModelReceiveMessageRequest;
begin
  Result := TAWS4DSQSModelReceiveMessageRequest.New;
end;

function TAWS4DSQSModelFactory.SendMessageRequest: IAWS4DSQSModelSendMessageRequest;
begin
  Result := TAWS4DSQSModelSendMessageRequest.New;
end;

function TAWS4DSQSModelFactory.TagQueueRequest: IAWS4DSQSModelTagQueueRequest;
begin
  result := TAWS4DSQSModelTagQueueRequest.New;
end;

function TAWS4DSQSModelFactory.UntagQueueRequest: IAWS4DSQSModelUntagQueueRequest;
begin
  Result := TAWS4DSQSModelUntagQueueRequest.New;
end;

class function TAWS4DSQSModelFactory.GetInstance: IAWS4DSQSModelFactory;
begin
  if not Assigned(FInstance) then
    FInstance := TAWS4DSQSModelFactory.createPrivate;
  result := FInstance;

end;

function TAWS4DSQSModelFactory.GetQueueAttributesRequest: IAWS4DSQSModelGetQueueAttributesRequest;
begin
  result := TAWS4DSQSModelGetQueueAttributesRequest.New;
end;

end.
