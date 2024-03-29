unit AWS4D.SQS.Service;

interface

uses
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.CreateQueue.Response,
  AWS4D.SQS.Model.ListQueues.Response,
  AWS4D.SQS.Model.ListQueueTags.Response,
  AWS4D.SQS.Model.GetQueueAttributes.Response,
  AWS4D.SQS.Model.GetQueueUrl.Response,
  AWS4D.SQS.Model.ReceiveMessage.Response,
  AWS4D.SQS.Model.SendMessage.Response,
  AWS4D.Core.Model.Types,
  GBClient.Interfaces,
  System.JSON,
  System.SysUtils;

type TAWS4DSQSService<I: IInterface> = class(TInterfacedObject, IAWS4DSQSService<I>)

  private
    [Weak]
    FParent: I;
    FAccessKey: String;
    FSecretKey: String;
    FRegion: TAWS4DRegion;

    function Host: string;
    function NewGETRequest(Action: String): IGBClientRequest; overload;

  protected
    function AccessKey(Value: String): IAWS4DSQSService<I>;
    function SecretKey(Value: String): IAWS4DSQSService<I>;
    function Region(Value: String): IAWS4DSQSService<I>; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSQSService<I>; overload;

    function CreateQueue(Request: IAWS4DSQSCreateQueueRequest<I>): IAWS4DSQSCreateQueueResponse<I>;
    procedure DeleteMessage(Request: IAWS4DSQSDeleteMessageRequest<I>);
    procedure DeleteMessageBatch(Request: IAWS4DSQSDeleteMessageBatchRequest<I>);
    procedure DeleteQueue(Request: IAWS4DSQSDeleteQueueRequest<I>);
    function GetQueueAttributes(Request: IAWS4DSQSGetQueueAttributesRequest<I>): IAWS4DSQSGetQueueAttributesResponse<I>;
    function GetQueueUrl(Request: IAWS4DSQSGetQueueUrlRequest<I>): IAWS4DSQSGetQueueUrlResponse<I>;
    function ListQueues(Request: IAWS4DSQSListQueuesRequest<I>): IAWS4DSQSListQueuesResponse<I>;
    function ListQueueTags(Request: IAWS4DSQSListQueueTagsRequest<I>): IAWS4DSQSListQueueTagsResponse<I>;
    procedure PurgeQueue(Request: IAWS4DSQSPurgeQueueRequest<I>);
    function ReceiveMessage(Request: IAWS4DSQSReceiveMessageRequest<I>): IAWS4DSQSReceiveMessageResponse<I>;
    function SendMessage(Request: IAWS4DSQSSendMessageRequest<I>): IAWS4DSQSSendMessageResponse<I>;
    procedure TagQueue(Request: IAWS4DSQSTagQueueRequest<I>);
    procedure UnTagQueue(Request: IAWS4DSQSUnTagQueueRequest<I>);

    function Parent(Value: I): IAWS4DSQSService<I>;
    function &End: I;

  public
    constructor create;
    class function New: IAWS4DSQSService<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSQSService<I> }

function TAWS4DSQSService<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSQSService<I>.GetQueueAttributes(Request: IAWS4DSQSGetQueueAttributesRequest<I>): IAWS4DSQSGetQueueAttributesResponse<I>;
var
  restRequest: IGBClientRequest;
  json: TJSONObject;
  index: String;
begin
  restRequest := NewGETRequest('GetQueueAttributes');
  restRequest.Resource(Request.QueueUrl);

  while Request.Attributtes.HasNext do
  begin
    index := (Request.Attributtes.Index + 1).ToString;
    restRequest.Params
      .QueryAddOrSet(Format('AttributeName.%s', [index]),
                     Request.Attributtes.Current);
  end;

  json := restRequest.Send.GetJSONObject;
  result := TAWS4SQSGetQueueAttributesResponse<I>.New(FParent, json);
end;

function TAWS4DSQSService<I>.GetQueueUrl(Request: IAWS4DSQSGetQueueUrlRequest<I>): IAWS4DSQSGetQueueUrlResponse<I>;
var
  restRequest: IGBClientRequest;
  json: TJSONObject;
begin
  restRequest := NewGETRequest('GetQueueUrl');
  restRequest.Params.QueryAddOrSet('QueueName', Request.QueueName);

  if Request.QueueOwnerAWSAccountId <> EmptyStr then
    restRequest.Params
      .QueryAddOrSet('QueueOwnerAWSAccountId', Request.QueueOwnerAWSAccountId);

  json := restRequest.Send.GetJSONObject;
  result := TAWS4SQSGetQueueUrlResponse<I>.New(FParent, json);
end;

function TAWS4DSQSService<I>.AccessKey(Value: String): IAWS4DSQSService<I>;
begin
  result := Self;
  FAccessKey := Value;
end;

constructor TAWS4DSQSService<I>.create;
begin
  FRegion := aws4dUSEast1;
end;

function TAWS4DSQSService<I>.CreateQueue(Request: IAWS4DSQSCreateQueueRequest<I>): IAWS4DSQSCreateQueueResponse<I>;
var
  restRequest: IGBClientRequest;
  json: TJSONObject;
  index: String;
begin
  restRequest := NewGETRequest('CreateQueue');
  restRequest
    .Params.QueryAddOrSet('QueueName', Request.QueueName);

  while Request.Attributes.HasNext do
  begin
    index := (Request.Attributes.Index + 1).ToString;
    restRequest.Params.QueryAddOrSet(
      Format('Attribute.%s.Name', [index]),
      Request.Attributes.Current.Key);

    restRequest.Params.QueryAddOrSet(
      Format('Attribute.%s.Value ', [index]),
      Request.Attributes.Current.Value);
  end;

  while Request.Tags.HasNext do
  begin
    index := (Request.Tags.Index + 1).ToString;
    restRequest.Params.QueryAddOrSet(
      Format('Tag.%s.Name', [index]),
      Request.Tags.Current.Key);

    restRequest.Params.QueryAddOrSet(
      Format('Tag.%s.Value ', [index]),
      Request.Tags.Current.Value);
  end;

  json := restRequest.Send.GetJSONObject;
  Result := TAWS4SQSCreateQueueResponse<I>.New(FParent, json);
end;

procedure TAWS4DSQSService<I>.DeleteMessage(Request: IAWS4DSQSDeleteMessageRequest<I>);
var
  restRequest: IGBClientRequest;
begin
  restRequest := NewGETRequest('DeleteMessage');
  restRequest
    .Resource(Request.QueueName)
    .Params
      .QueryAddOrSet('ReceiptHandle', Request.ReceiptHandle);

  restRequest.Send;
end;

procedure TAWS4DSQSService<I>.DeleteMessageBatch(Request: IAWS4DSQSDeleteMessageBatchRequest<I>);
var
  restRequest: IGBClientRequest;
  index: String;
begin
  restRequest := NewGETRequest('DeleteMessageBatch');
  restRequest.Resource(Request.QueueUrl);

  while Request.Messages.HasNext do
  begin
    index := (Request.Messages.Index + 1).ToString;
    restRequest.Params.QueryAddOrSet(
      Format('DeleteMessageBatchRequestEntry.%s.Id', [index]),
      Request.Messages.Current.Key);

    restRequest.Params.QueryAddOrSet(
      Format('DeleteMessageBatchRequestEntry.%s.ReceiptHandle', [index]),
      Request.Messages.Current.Value);
  end;

  restRequest.Send;
end;

procedure TAWS4DSQSService<I>.DeleteQueue(Request: IAWS4DSQSDeleteQueueRequest<I>);
var
  restRequest: IGBClientRequest;
begin
  restRequest := NewGETRequest('DeleteQueue');
  restRequest
    .Resource(Request.QueueUrl);

  restRequest.Send;
end;

destructor TAWS4DSQSService<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSQSService<I>.Host: string;
begin
  Result := Format('https://sqs.%s.amazonaws.com', [FRegion.toString]);
end;

function TAWS4DSQSService<I>.ListQueues(Request: IAWS4DSQSListQueuesRequest<I>): IAWS4DSQSListQueuesResponse<I>;
var
  restRequest: IGBClientRequest;
  json: TJSONObject;
begin
  restRequest := NewGETRequest('ListQueues');

  if Request.MaxResults > 0 then
    restRequest.Params.QueryAddOrSet('MaxResults', Request.MaxResults);

  if Request.NextToken.Trim <> EmptyStr then
    restRequest.Params.QueryAddOrSet('NextToken', Request.NextToken);

  if Request.QueueNamePrefix.Trim <> EmptyStr then
    restRequest.Params.QueryAddOrSet('QueueNamePrefix', Request.NextToken);

  json := restRequest.Send.GetJSONObject;
  result := TAWS4DSQSModelListQueuesResponse<I>.New(FParent, json);
end;

function TAWS4DSQSService<I>.ListQueueTags(Request: IAWS4DSQSListQueueTagsRequest<I>): IAWS4DSQSListQueueTagsResponse<I>;
var
  restRequest: IGBClientRequest;
  json: TJSONObject;
begin
  restRequest := NewGETRequest('ListQueueTags');
  restRequest
    .Resource(Request.QueueUrl);

  json := restRequest.Send.GetJSONObject;
  result := TAWS4DSQSModelListQueueTagsResponse<I>.New(FParent, json);
end;

class function TAWS4DSQSService<I>.New: IAWS4DSQSService<I>;
begin
  result := Self.create;
end;

function TAWS4DSQSService<I>.NewGETRequest(Action: String): IGBClientRequest;
begin
  result := NewClientRequest;
  result
    .GET
    .BaseURL(Host)
    .Accept('application/json')
    .Authorization
      .AWSv4
        .AccessKey(FAccessKey)
        .SecretKey(FSecretKey)
        .Region(FRegion.toString)
        .Service('sqs')
        .HTTPVerb('GET')
    .&End
    .Params
      .QueryAddOrSet('Action', Action);
end;

function TAWS4DSQSService<I>.Parent(Value: I): IAWS4DSQSService<I>;
begin
  result := Self;
  FParent := Value;
end;

procedure TAWS4DSQSService<I>.PurgeQueue(Request: IAWS4DSQSPurgeQueueRequest<I>);
var
  restRequest: IGBClientRequest;
begin
  restRequest := Self.NewGETRequest('PurgeQueue');
  restRequest.Resource(Request.QueueUrl).Send;
end;

function TAWS4DSQSService<I>.Region(Value: String): IAWS4DSQSService<I>;
begin
  result := Self;
  FRegion.fromString(Value);
end;

function TAWS4DSQSService<I>.ReceiveMessage(Request: IAWS4DSQSReceiveMessageRequest<I>): IAWS4DSQSReceiveMessageResponse<I>;
var
  restRequest: IGBClientRequest;
  json: TJSONObject;
  LCount: Integer;
begin
  restRequest := Self.NewGETRequest('ReceiveMessage');
  restRequest
    .Resource(Request.QueueUrl);

  LCount := 0;
  while Request.Attributes.HasNext do
  begin
    Inc(LCount);
    restRequest.Params
      .QueryAddOrSet(Format('AttributeName.%s', [LCount.ToString]),
                     Request.Attributes.Current);
  end;

  if Request.MaxNumberOfMessages > 0 then
    restRequest.Params.QueryAddOrSet('MaxNumberOfMessages', Request.MaxNumberOfMessages);

  LCount := 0;
  while Request.MessageAttributes.HasNext do
  begin
    Inc(LCount);
    restRequest.Params
      .QueryAddOrSet(Format('MessageAttributeName.%s', [LCount.ToString]),
                     Request.MessageAttributes.Current);
  end;

  if Request.ReceiveRequestAttemptId <> EmptyStr then
    restRequest.Params.QueryAddOrSet('ReceiveRequestAttemptId', Request.ReceiveRequestAttemptId);

  if Request.VisibilityTimeout > 0 then
    restRequest.Params.QueryAddOrSet('VisibilityTimeout', Request.VisibilityTimeout);

  if Request.WaitTimeSeconds > 0 then
    restRequest.Params.QueryAddOrSet('WaitTimeSeconds', Request.WaitTimeSeconds);

  json := restRequest.Send.GetJSONObject;
  result := TAWS4SQSReceiveMessageResponse<I>.New(FParent, json);
end;

function TAWS4DSQSService<I>.Region(Value: TAWS4DRegion): IAWS4DSQSService<I>;
begin
  result := Self;
  FRegion := Value;
end;

function TAWS4DSQSService<I>.SecretKey(Value: String): IAWS4DSQSService<I>;
begin
  Result := Self;
  FSecretKey := Value;
end;

function TAWS4DSQSService<I>.SendMessage(Request: IAWS4DSQSSendMessageRequest<I>): IAWS4DSQSSendMessageResponse<I>;
var
  restRequest: IGBClientRequest;
  json: TJSONObject;
  LCount: Integer;
begin
  restRequest := Self.NewGETRequest('SendMessage');
  restRequest
    .Resource(Request.QueueUrl)
    .Params
      .QueryAddOrSet('MessageBody', Request.MessageBody);

  if Request.DelaySeconds > 0 then
    restRequest.Params.QueryAddOrSet('DelaySeconds', Request.DelaySeconds);

  if Request.MessageDeduplicationId <> EmptyStr then
    restRequest.Params.QueryAddOrSet('MessageDeduplicationId', Request.MessageDeduplicationId);

  if Request.MessageGroupId <> EmptyStr then
    restRequest.Params.QueryAddOrSet('MessageGroupId', Request.MessageGroupId);

  LCount := 0;
  while Request.Attributes.HasNext do
  begin
    Inc(LCount);
    restRequest.Params
      .QueryAddOrSet(Format('MessageAttribute.%s.Name', [LCount.ToString]),
                     Request.Attributes.Current.Key);
    restRequest.Params
      .QueryAddOrSet(Format('MessageAttribute.%s.Value.StringValue', [LCount.ToString]),
                     Request.Attributes.Current.Value);
    restRequest.Params
      .QueryAddOrSet(Format('MessageAttribute.%s.Value.DataType', [LCount.ToString]),
                     'String');
  end;

  LCount := 0;
  while Request.MessageSystemAttributes.HasNext do
  begin
    Inc(LCount);
    restRequest.Params
      .QueryAddOrSet(Format('MessageSystemAttribute.%s.Name', [LCount.ToString]),
                     Request.MessageSystemAttributes.Current.Key);
    restRequest.Params
      .QueryAddOrSet(Format('MessageSystemAttribute.%s.Value.StringValue', [LCount.ToString]),
                     Request.MessageSystemAttributes.Current.Value);
    restRequest.Params
      .QueryAddOrSet(Format('MessageAttribute.%s.Value.DataType', [LCount.ToString]),
                     'String');
  end;

  json := restRequest.Send.GetJSONObject;
  result := TAWS4SQSSendMessageResponse<I>.New(FParent, json);
end;

procedure TAWS4DSQSService<I>.TagQueue(Request: IAWS4DSQSTagQueueRequest<I>);
var
  restRequest: IGBClientRequest;
begin
  restRequest := Self.NewGETRequest('TagQueue');
  restRequest.Resource(Request.QueueUrl);

  while Request.Tags.HasNext do
  begin
    restRequest.Params.QueryAddOrSet(
      Format('Tag.%s.Key', [(Request.Tags.Index + 1).ToString]),
      Request.Tags.Current.Key);

    restRequest.Params.QueryAddOrSet(
      Format('Tag.%s.Value', [(Request.Tags.Index + 1).ToString]),
      Request.Tags.Current.Value);
  end;

  restRequest.Send;
end;

procedure TAWS4DSQSService<I>.UnTagQueue(Request: IAWS4DSQSUnTagQueueRequest<I>);
var
  restRequest: IGBClientRequest;
begin
  restRequest := Self.NewGETRequest('UntagQueue');
  restRequest.Resource(Request.QueueUrl);

  while Request.Tags.HasNext do
  begin
    restRequest.Params.QueryAddOrSet(
      Format('TagKey.%s', [(Request.Tags.Index + 1).ToString]),
      Request.Tags.Current);
  end;

  restRequest.Send;
end;

end.
