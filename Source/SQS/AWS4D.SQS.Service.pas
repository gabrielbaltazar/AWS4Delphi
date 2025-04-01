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

type
  TAWS4DSQSService<I: IInterface> = class(TInterfacedObject, IAWS4DSQSService<I>)
  private
    [Weak]
    FParent: I;
    FAccessKey: string;
    FSecretKey: string;
    FRegion: TAWS4DRegion;

    function Host: string;
    function NewGETRequest(AAction: string): IGBClientRequest; overload;
    function NewPOSTRequest(ATarget: string): IGBClientRequest; overload;
  protected
    function AccessKey(AValue: string): IAWS4DSQSService<I>;
    function SecretKey(AValue: string): IAWS4DSQSService<I>;
    function Region(AValue: string): IAWS4DSQSService<I>; overload;
    function Region(AValue: TAWS4DRegion): IAWS4DSQSService<I>; overload;

    function CreateQueue(ARequest: IAWS4DSQSCreateQueueRequest<I>): IAWS4DSQSCreateQueueResponse<I>;
    procedure DeleteMessage(ARequest: IAWS4DSQSDeleteMessageRequest<I>);
    procedure DeleteMessageBatch(ARequest: IAWS4DSQSDeleteMessageBatchRequest<I>);
    procedure DeleteQueue(ARequest: IAWS4DSQSDeleteQueueRequest<I>);
    function GetQueueAttributes(ARequest: IAWS4DSQSGetQueueAttributesRequest<I>): IAWS4DSQSGetQueueAttributesResponse<I>;
    function GetQueueUrl(ARequest: IAWS4DSQSGetQueueUrlRequest<I>): IAWS4DSQSGetQueueUrlResponse<I>;
    function ListQueues(ARequest: IAWS4DSQSListQueuesRequest<I>): IAWS4DSQSListQueuesResponse<I>;
    function ListQueueTags(ARequest: IAWS4DSQSListQueueTagsRequest<I>): IAWS4DSQSListQueueTagsResponse<I>;
    procedure PurgeQueue(ARequest: IAWS4DSQSPurgeQueueRequest<I>);
    function ReceiveMessage(ARequest: IAWS4DSQSReceiveMessageRequest<I>): IAWS4DSQSReceiveMessageResponse<I>;
    function SendMessage(ARequest: IAWS4DSQSSendMessageRequest<I>): IAWS4DSQSSendMessageResponse<I>;
    procedure TagQueue(ARequest: IAWS4DSQSTagQueueRequest<I>);
    procedure UnTagQueue(ARequest: IAWS4DSQSUnTagQueueRequest<I>);

    function Parent(AValue: I): IAWS4DSQSService<I>;
    function &End: I;
  public
    constructor Create;
    class function New: IAWS4DSQSService<I>;
  end;

implementation

{ TAWS4DSQSService<I> }

function TAWS4DSQSService<I>.&End: I;
begin
  Result := FParent;
end;

function TAWS4DSQSService<I>.GetQueueAttributes(ARequest: IAWS4DSQSGetQueueAttributesRequest<I>): IAWS4DSQSGetQueueAttributesResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJSON: TJSONObject;
  LIndex: string;
begin
  LRestRequest := NewGETRequest('GetQueueAttributes');
  LRestRequest.Resource(ARequest.QueueUrl);

  while ARequest.Attributtes.HasNext do
  begin
    LIndex := (ARequest.Attributtes.Index + 1).ToString;
    LRestRequest.Params
      .QueryAddOrSet(Format('AttributeName.%s', [LIndex]),
        ARequest.Attributtes.Current);
  end;

  LJSON := LRestRequest.Send.GetJSONObject;
  Result := TAWS4SQSGetQueueAttributesResponse<I>.New(FParent, LJSON);
end;

function TAWS4DSQSService<I>.GetQueueUrl(ARequest: IAWS4DSQSGetQueueUrlRequest<I>): IAWS4DSQSGetQueueUrlResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJSON: TJSONObject;
begin
  LRestRequest := NewGETRequest('GetQueueUrl');
  LRestRequest.Params.QueryAddOrSet('QueueName', ARequest.QueueName);

  if ARequest.QueueOwnerAWSAccountId <> EmptyStr then
    LRestRequest.Params
      .QueryAddOrSet('QueueOwnerAWSAccountId', ARequest.QueueOwnerAWSAccountId);

  LJSON := LRestRequest.Send.GetJSONObject;
  Result := TAWS4SQSGetQueueUrlResponse<I>.New(FParent, LJSON);
end;

function TAWS4DSQSService<I>.AccessKey(AValue: string): IAWS4DSQSService<I>;
begin
  Result := Self;
  FAccessKey := AValue;
end;

constructor TAWS4DSQSService<I>.Create;
begin
  FRegion := aws4dUSEast1;
end;

function TAWS4DSQSService<I>.CreateQueue(ARequest: IAWS4DSQSCreateQueueRequest<I>): IAWS4DSQSCreateQueueResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJSON: TJSONObject;
  LIndex: string;
begin
  LRestRequest := NewGETRequest('CreateQueue');
  LRestRequest
    .Params.QueryAddOrSet('QueueName', ARequest.QueueName);

  while ARequest.Attributes.HasNext do
  begin
    LIndex := (ARequest.Attributes.Index + 1).ToString;
    LRestRequest.Params.QueryAddOrSet(
      Format('Attribute.%s.Name', [LIndex]),
      ARequest.Attributes.Current.Key);

    LRestRequest.Params.QueryAddOrSet(
      Format('Attribute.%s.Value ', [LIndex]),
      ARequest.Attributes.Current.Value);
  end;

  while ARequest.Tags.HasNext do
  begin
    LIndex := (ARequest.Tags.Index + 1).ToString;
    LRestRequest.Params.QueryAddOrSet(
      Format('Tag.%s.Name', [LIndex]),
      ARequest.Tags.Current.Key);

    LRestRequest.Params.QueryAddOrSet(
      Format('Tag.%s.Value ', [LIndex]),
      ARequest.Tags.Current.Value);
  end;

  LJSON := LRestRequest.Send.GetJSONObject;
  Result := TAWS4SQSCreateQueueResponse<I>.New(FParent, LJSON);
end;

procedure TAWS4DSQSService<I>.DeleteMessage(ARequest: IAWS4DSQSDeleteMessageRequest<I>);
var
  LRestRequest: IGBClientRequest;
  LPayload: string;
begin
  LPayload := Format('{"QueueUrl":"%s","ReceiptHandle":"%s"}', [ARequest.QueueName,
    ARequest.ReceiptHandle]);
  LRestRequest := NewPOSTRequest('AmazonSQS.DeleteMessage');
  LRestRequest.Params
      .BodyAddOrSet(LPayload);

  LRestRequest.Send;
end;

procedure TAWS4DSQSService<I>.DeleteMessageBatch(ARequest: IAWS4DSQSDeleteMessageBatchRequest<I>);
var
  LRestRequest: IGBClientRequest;
  LIndex: string;
begin
  LRestRequest := NewGETRequest('DeleteMessageBatch');
  LRestRequest.Resource(ARequest.QueueUrl);

  while ARequest.Messages.HasNext do
  begin
    LIndex := (ARequest.Messages.Index + 1).ToString;
    LRestRequest.Params.QueryAddOrSet(
      Format('DeleteMessageBatchRequestEntry.%s.Id', [LIndex]),
      ARequest.Messages.Current.Key);

    LRestRequest.Params.QueryAddOrSet(
      Format('DeleteMessageBatchRequestEntry.%s.ReceiptHandle', [LIndex]),
      ARequest.Messages.Current.Value);
  end;

  LRestRequest.Send;
end;

procedure TAWS4DSQSService<I>.DeleteQueue(ARequest: IAWS4DSQSDeleteQueueRequest<I>);
var
  LRestRequest: IGBClientRequest;
begin
  LRestRequest := NewGETRequest('DeleteQueue');
  LRestRequest.Resource(ARequest.QueueUrl);
  LRestRequest.Send;
end;

function TAWS4DSQSService<I>.Host: string;
begin
  Result := Format('https://sqs.%s.amazonaws.com', [FRegion.ToString]);
end;

function TAWS4DSQSService<I>.ListQueues(ARequest: IAWS4DSQSListQueuesRequest<I>): IAWS4DSQSListQueuesResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJSON: TJSONObject;
begin
  LRestRequest := NewGETRequest('ListQueues');

  if ARequest.MaxResults > 0 then
    LRestRequest.Params.QueryAddOrSet('MaxResults', ARequest.MaxResults);

  if ARequest.NextToken.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('NextToken', ARequest.NextToken);

  if ARequest.QueueNamePrefix.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('QueueNamePrefix', ARequest.NextToken);

  LJSON := LRestRequest.Send.GetJSONObject;
  Result := TAWS4DSQSModelListQueuesResponse<I>.New(FParent, LJSON);
end;

function TAWS4DSQSService<I>.ListQueueTags(ARequest: IAWS4DSQSListQueueTagsRequest<I>): IAWS4DSQSListQueueTagsResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJSON: TJSONObject;
begin
  LRestRequest := NewGETRequest('ListQueueTags');
  LRestRequest.Resource(ARequest.QueueUrl);
  LJSON := LRestRequest.Send.GetJSONObject;
  Result := TAWS4DSQSModelListQueueTagsResponse<I>.New(FParent, LJSON);
end;

class function TAWS4DSQSService<I>.New: IAWS4DSQSService<I>;
begin
  Result := Self.Create;
end;

function TAWS4DSQSService<I>.NewGETRequest(AAction: string): IGBClientRequest;
begin
  Result := NewClientRequest;
  Result.GET
    .BaseURL(Host)
    .Accept('application/json')
    .Authorization
      .AWSv4
        .AccessKey(FAccessKey)
        .SecretKey(FSecretKey)
        .Region(FRegion.ToString)
        .Service('sqs')
        .HTTPVerb('GET')
    .&End
    .Params
      .QueryAddOrSet('Action', AAction);
end;

function TAWS4DSQSService<I>.NewPOSTRequest(ATarget: string): IGBClientRequest;
begin
  Result := NewClientRequest;
  Result.POST
    .BaseURL(Host)
    .Accept('application/json')
    .ContentType('application/x-amz-json-1.0')
    .Authorization
      .AWSv4
        .AccessKey(FAccessKey)
        .SecretKey(FSecretKey)
        .Region(FRegion.ToString)
        .Service('sqs')
        .HTTPVerb('POST')
    .&End
    .Params
      .HeaderAddOrSet('X-Amz-Target', ATarget, False);
end;

function TAWS4DSQSService<I>.Parent(AValue: I): IAWS4DSQSService<I>;
begin
  Result := Self;
  FParent := AValue;
end;

procedure TAWS4DSQSService<I>.PurgeQueue(ARequest: IAWS4DSQSPurgeQueueRequest<I>);
var
  LRestRequest: IGBClientRequest;
begin
  LRestRequest := Self.NewGETRequest('PurgeQueue');
  LRestRequest.Resource(ARequest.QueueUrl).Send;
end;

function TAWS4DSQSService<I>.Region(AValue: string): IAWS4DSQSService<I>;
begin
  Result := Self;
  FRegion.FromString(AValue);
end;

function TAWS4DSQSService<I>.ReceiveMessage(ARequest: IAWS4DSQSReceiveMessageRequest<I>): IAWS4DSQSReceiveMessageResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJSON: TJSONObject;
  LJSONAttributes: TJSONArray;
  LAttribute: string;
begin
  LRestRequest := Self.NewPOSTRequest('AmazonSQS.ReceiveMessage');

  LJSON := TJSONObject.Create.AddPair('QueueUrl', ARequest.QueueUrl);
  LJSONAttributes := nil;
  while ARequest.Attributes.HasNext do
  begin
    if not Assigned(LJSONAttributes) then
      LJSONAttributes := TJSONArray.Create;

    LAttribute := ARequest.Attributes.Current;
    LJSONAttributes.Add(LAttribute);
  end;
  if Assigned(LJSONAttributes) then
    LJSON.AddPair('AttributeNames', LJSONAttributes);

  if ARequest.MaxNumberOfMessages > 0 then
    LJSON.AddPair('MaxNumberOfMessages', TJSONNumber.Create(ARequest.MaxNumberOfMessages));

  LJSONAttributes := nil;
  while ARequest.MessageAttributes.HasNext do
  begin
    if not Assigned(LJSONAttributes) then
      LJSONAttributes := TJSONArray.Create;

    LAttribute := ARequest.MessageAttributes.Current;
    LJSONAttributes.Add(LAttribute);
  end;
  if Assigned(LJSONAttributes) then
    LJSON.AddPair('MessageAttributeNames', LJSONAttributes);

  if ARequest.ReceiveRequestAttemptId <> EmptyStr then
    LJSON.AddPair('ReceiveRequestAttemptId', ARequest.ReceiveRequestAttemptId);

  if ARequest.VisibilityTimeout > 0 then
    LJSON.AddPair('VisibilityTimeout', TJSONNumber.Create(ARequest.VisibilityTimeout));

  if ARequest.WaitTimeSeconds > 0 then
    LJSON.AddPair('WaitTimeSeconds', TJSONNumber.Create(ARequest.WaitTimeSeconds));

  LRestRequest.Params.BodyAddOrSet(LJSON.ToJSON);
  FreeAndNil(LJSON);
  LJSON := LRestRequest.Send.GetJSONObject;
  Result := TAWS4SQSReceiveMessageResponse<I>.New(FParent, LJSON);
end;

function TAWS4DSQSService<I>.Region(AValue: TAWS4DRegion): IAWS4DSQSService<I>;
begin
  Result := Self;
  FRegion := AValue;
end;

function TAWS4DSQSService<I>.SecretKey(AValue: string): IAWS4DSQSService<I>;
begin
  Result := Self;
  FSecretKey := AValue;
end;

function TAWS4DSQSService<I>.SendMessage(ARequest: IAWS4DSQSSendMessageRequest<I>): IAWS4DSQSSendMessageResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJSON: TJSONObject;
  LJSONAttributes: TJSONObject;
  LParamName: string;
  LParamValue: string;
begin
  LRestRequest := Self.NewPOSTRequest('AmazonSQS.SendMessage');

  LJSON := TJSONObject.Create;
  LJSON.AddPair('QueueUrl', ARequest.QueueUrl)
    .AddPair('MessageBody', ARequest.MessageBody);

  if ARequest.DelaySeconds > 0 then
    LJSON.AddPair('DelaySeconds', TJSONNumber.Create(ARequest.DelaySeconds));

  if ARequest.MessageDeduplicationId <> EmptyStr then
    LJSON.AddPair('MessageDeduplicationId', ARequest.MessageDeduplicationId);

  if ARequest.MessageGroupId <> EmptyStr then
    LJSON.AddPair('MessageGroupId', ARequest.MessageGroupId);

  LJSONAttributes := nil;
  while ARequest.Attributes.HasNext do
  begin
    if not Assigned(LJSONAttributes) then
      LJSONAttributes := TJSONObject.Create;

    LParamName := ARequest.Attributes.Current.Key;
    LParamValue := ARequest.Attributes.Current.Value;
    LJSONAttributes.AddPair(LParamName, TJSONObject.Create
      .AddPair('DataType', 'String')
      .AddPair('StringValue', LParamValue));
  end;
  if Assigned(LJSONAttributes) then
    LJSON.AddPair('MessageAttributes', LJSONAttributes);

  LJSONAttributes := nil;
  while ARequest.MessageSystemAttributes.HasNext do
  begin
    if not Assigned(LJSONAttributes) then
      LJSONAttributes := TJSONObject.Create;

    LParamName := ARequest.MessageSystemAttributes.Current.Key;
    LParamValue := ARequest.MessageSystemAttributes.Current.Value;
    LJSONAttributes.AddPair(LParamName, TJSONObject.Create
      .AddPair('DataType', 'String')
      .AddPair('StringValue', LParamValue));
  end;
  if Assigned(LJSONAttributes) then
    LJSON.AddPair('MessageSystemAttributes', LJSONAttributes);

  LRestRequest.Params.BodyAddOrSet(LJSON.ToJSON);
  FreeAndNil(LJSON);
  LJSON := LRestRequest.Send.GetJSONObject;
  Result := TAWS4SQSSendMessageResponse<I>.New(FParent, LJSON);
end;

procedure TAWS4DSQSService<I>.TagQueue(ARequest: IAWS4DSQSTagQueueRequest<I>);
var
  LRestRequest: IGBClientRequest;
begin
  LRestRequest := Self.NewGETRequest('TagQueue');
  LRestRequest.Resource(ARequest.QueueUrl);

  while ARequest.Tags.HasNext do
  begin
    LRestRequest.Params.QueryAddOrSet(
      Format('Tag.%s.Key', [(ARequest.Tags.Index + 1).ToString]),
      ARequest.Tags.Current.Key);

    LRestRequest.Params.QueryAddOrSet(
      Format('Tag.%s.Value', [(ARequest.Tags.Index + 1).ToString]),
      ARequest.Tags.Current.Value);
  end;

  LRestRequest.Send;
end;

procedure TAWS4DSQSService<I>.UnTagQueue(ARequest: IAWS4DSQSUnTagQueueRequest<I>);
var
  LRestRequest: IGBClientRequest;
begin
  LRestRequest := Self.NewGETRequest('UntagQueue');
  LRestRequest.Resource(ARequest.QueueUrl);

  while ARequest.Tags.HasNext do
  begin
    LRestRequest.Params.QueryAddOrSet(
      Format('TagKey.%s', [(ARequest.Tags.Index + 1).ToString]),
      ARequest.Tags.Current);
  end;

  LRestRequest.Send;
end;

end.
