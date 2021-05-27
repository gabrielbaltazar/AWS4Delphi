unit AWS4D.SQS.Service.Base;

interface

uses
  AWS4D.Service.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.Classes,
  AWS4D.Service.Base,
  AWS4D.HTTP.Interfaces,
  System.Classes,
  System.DateUtils,
  System.SysUtils;

type TAWS4DSQSServiceBase = class(TAWS4DServiceBase, IAWS4DServiceSQS)

  private
    function GetURL: string; overload;
    function GetURL(QueueName: String): string; overload;

    function PrepareRequest(Request: IAWS4DSQSModelCreateQueueRequest): IAWS4DHTTPRequest; overload;
    function PrepareRequest(Request: IAWS4DSQSModelDeleteMessageRequest): IAWS4DHTTPRequest; overload;
    function PrepareRequest(Request: IAWS4DSQSModelDeleteMessageBatchRequest): IAWS4DHTTPRequest; overload;
    function PrepareRequest(Request: IAWS4DSQSModelGetQueueAttributesRequest): IAWS4DHTTPRequest; overload;
    function PrepareRequest(Request: IAWS4DSQSModelListQueuesRequest): IAWS4DHTTPRequest; overload;
    function PrepareRequest(Request: IAWS4DSQSModelReceiveMessageRequest): IAWS4DHTTPRequest; overload;
    function PrepareRequest(Request: IAWS4DSQSModelSendMessageRequest): IAWS4DHTTPRequest; overload;
    function PrepareRequest(Request: IAWS4DSQSModelTagQueueRequest): IAWS4DHTTPRequest; overload;
    function PrepareRequest(Request: IAWS4DSQSModelUntagQueueRequest): IAWS4DHTTPRequest; overload;

  protected
    function CreateQueue(Request: IAWS4DSQSModelCreateQueueRequest): IAWS4DSQSModelCreateQueueResponse;
    function DeleteMessage(Request: IAWS4DSQSModelDeleteMessageRequest): IAWS4DSQSModelDeleteMessageResponse;
    function DeleteMessageBatch(Request: IAWS4DSQSModelDeleteMessageBatchRequest): IAWS4DSQSModelDeleteMessageBatchResponse;
    function DeleteQueue(QueueUrl: String): IAWS4DSQSModelDeleteQueueResponse;
    function GetQueueAttributes(Request: IAWS4DSQSModelGetQueueAttributesRequest): IAWS4DSQSModelGetQueueAttributesResponse;
    function GetQueueUrl(QueueName: String): IAWS4DSQSModelGetQueueUrlResponse;
    function ListQueues(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest = nil): IAWS4DSQSModelListQueuesResponse;
    function ListQueueTags(QueueName: String): IAWS4DSQSModelListQueueTagsResponse;
    function PurgeQueue(QueueUrl: String): IAWS4DSQSModelPurgeQueueResponse;
    function ReceiveMessage(Request: IAWS4DSQSModelReceiveMessageRequest): IAWS4DSQSModelReceiveMessageResponse;
    function SendMessage(Request: IAWS4DSQSModelSendMessageRequest): IAWS4DSQSModelSendMessageResponse;
    function TagQueue(Request: IAWS4DSQSModelTagQueueRequest): IAWS4DSQSModelTagQueueResponse;
    function UntagQueue(Request: IAWS4DSQSModelUntagQueueRequest): IAWS4DSQSModelUntagQueueResponse;
  public
    class function New: IAWS4DServiceSQS;
end;

implementation

{ TAWS4DSQSServiceBase }

function TAWS4DSQSServiceBase.CreateQueue(Request: IAWS4DSQSModelCreateQueueRequest): IAWS4DSQSModelCreateQueueResponse;
var
  json : String;
begin
  json := PrepareRequest(Request).Execute.Body;
  result := TAWS4DSQSModelCreateQueueResponse.New(json);
end;

function TAWS4DSQSServiceBase.DeleteMessage(Request: IAWS4DSQSModelDeleteMessageRequest): IAWS4DSQSModelDeleteMessageResponse;
var
  json : string;
begin
  json   := PrepareRequest(Request).Execute.Body;
  Result := TAWS4DSQSModelDeleteMessageResponse.New(json);
end;

function TAWS4DSQSServiceBase.DeleteMessageBatch(Request: IAWS4DSQSModelDeleteMessageBatchRequest): IAWS4DSQSModelDeleteMessageBatchResponse;
var
  json : string;
begin
  json := PrepareRequest(Request).Execute.Body;
  result := TAWS4DSQSModelDeleteMessageBatchResponse.New(json);
end;

function TAWS4DSQSServiceBase.DeleteQueue(QueueUrl: String): IAWS4DSQSModelDeleteQueueResponse;
var
  url : string;
  json: string;
begin
  url := GetURL(QueueUrl);
  json := HTTPRequest(Self)
            .GET
            .BaseURL(url)
            .Action('DeleteQueue')
            .Execute
            .Body;

  result := TAWS4DSQSModelDeleteQueueResponse.New(json);
end;

function TAWS4DSQSServiceBase.GetQueueAttributes(Request: IAWS4DSQSModelGetQueueAttributesRequest): IAWS4DSQSModelGetQueueAttributesResponse;
var
  json : string;
begin
  json := PrepareRequest(Request).Execute.Body;
  result := TAWS4DSQSModelGetQueueAttributesResponse.New(json);
end;

function TAWS4DSQSServiceBase.GetQueueUrl(QueueName: String): IAWS4DSQSModelGetQueueUrlResponse;
var
  json : string;
begin
  json := HTTPRequest(Self)
              .GET
              .BaseURL(GetURL)
              .Action('GetQueueUrl')
              .AddQuery('QueueName', QueueName)
              .Execute
              .Body;

  result := TAWS4DSQSModelGetQueueUrlResponse.New(json);
end;

function TAWS4DSQSServiceBase.GetURL(QueueName: String): string;
begin
  result := GetURL;
  if not result.EndsWith('/') then
    result := result + '/';
  result := result + QueueName;
end;

function TAWS4DSQSServiceBase.GetURL: string;
begin
  result := Format('https://sqs.%s.amazonaws.com', [Self.Region.toString]);
end;

function TAWS4DSQSServiceBase.ListQueues(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest = nil): IAWS4DSQSModelListQueuesResponse;
var
  json: string;
begin
  json := PrepareRequest(ListQueuesRequest).Execute.Body;
  result := TAWS4DSQSModelListQueuesResponse.New(json);
end;

function TAWS4DSQSServiceBase.ListQueueTags(QueueName: String): IAWS4DSQSModelListQueueTagsResponse;
var
  url  : String;
  json : string;
begin
  url := GetURL;
  if not url.EndsWith('/') then
    url := url + '/' + QueueName;

  json := HTTPRequest(Self)
              .GET
              .BaseURL(url)
              .Action('ListQueueTags')
              .Execute
              .Body;

  result := TAWS4DSQSModelListQueueTagsResponse.New(json);
end;

class function TAWS4DSQSServiceBase.New: IAWS4DServiceSQS;
begin
  Result := Self.Create;
end;

function TAWS4DSQSServiceBase.PrepareRequest(Request: IAWS4DSQSModelReceiveMessageRequest): IAWS4DHTTPRequest;
var
  url : String;
begin
  url := GetURL(Request.queueUrl);

  result :=
    HTTPRequest(Self)
      .GET
      .BaseURL(url)
      .Action('ReceiveMessage');

  if Request.maxNumberOfMessages > 0 then
    Result.AddQuery('MaxNumberOfMessages', Request.maxNumberOfMessages.ToString);

  if Request.visibilityTimeout > 0 then
    Result.AddQuery('VisibilityTimeout', Request.visibilityTimeout.ToString);

  if Request.attributeNames.Count > 0 then
    Result.AddQuery('AttributeName', Request.attributeNames[0]);
end;

function TAWS4DSQSServiceBase.PrepareRequest(Request: IAWS4DSQSModelListQueuesRequest): IAWS4DHTTPRequest;
begin
  Result := HTTPRequest(Self)
              .GET
              .BaseURL(GetURL)
              .Action('ListQueues');

  if not Assigned( Request ) then
    Exit;

  if Request.MaxResults > 0 then
    Result.AddQuery('MaxResults', Request.MaxResults.ToString);

  if not Request.NextToken.IsEmpty then
    Result.AddQuery('NextToken', Request.NextToken);

  if not Request.QueueNamePrefix.IsEmpty then
    Result.AddQuery('QueueNamePrefix', Request.QueueNamePrefix);

end;

function TAWS4DSQSServiceBase.ReceiveMessage(Request: IAWS4DSQSModelReceiveMessageRequest): IAWS4DSQSModelReceiveMessageResponse;
var
  json: string;
begin
  json := PrepareRequest(Request)
            .Execute
            .Body;

  result := TAWS4DSQSModelReceiveMessageResponse.New(json);
end;

function TAWS4DSQSServiceBase.SendMessage(Request: IAWS4DSQSModelSendMessageRequest): IAWS4DSQSModelSendMessageResponse;
var
  json : string;
begin
  json  := PrepareRequest(Request).Execute.Body;
  result:= TAWS4DSQSModelSendMessageResponse.New(json);
end;

function TAWS4DSQSServiceBase.TagQueue(Request: IAWS4DSQSModelTagQueueRequest): IAWS4DSQSModelTagQueueResponse;
var
  json : string;
begin
  json := PrepareRequest(Request).Execute.Body;
  result := TAWS4DSQSModelTagQueueResponse.New(json);
end;

function TAWS4DSQSServiceBase.UntagQueue(Request: IAWS4DSQSModelUntagQueueRequest): IAWS4DSQSModelUntagQueueResponse;
var
  json : String;
begin
  json   := PrepareRequest(Request).Execute.Body;
  result := TAWS4DSQSModelUntagQueueResponse.New(json);
end;

function TAWS4DSQSServiceBase.PrepareRequest(Request: IAWS4DSQSModelSendMessageRequest): IAWS4DHTTPRequest;
var
  url : String;
begin
  url := GetURL(Request.queueUrl);

  result :=
    HTTPRequest(Self)
      .GET
      .BaseURL(url)
      .Action('SendMessage');

  if not Request.MessageBody.Trim.IsEmpty then
    Result.AddQuery('MessageBody', Request.MessageBody);
end;

function TAWS4DSQSServiceBase.PrepareRequest(Request: IAWS4DSQSModelTagQueueRequest): IAWS4DHTTPRequest;
var
  url: string;
  key: string;
  name: string;
  i: Integer;
begin
  url := GetURL(Request.QueueUrl);
  result :=
    HTTPRequest(Self)
      .GET
      .BaseURL(url)
      .Action('TagQueue');

  i := 0;
  for key in Request.Tags.Keys do
  begin
    Inc(i);
    name := Format('Tag.%s.Key', [i.ToString]);
    result.AddQuery(name, key);
    name := Format('Tag.%s.Value', [i.ToString]);
    result.AddQuery(name, Request.Tags.Items[key]);
  end;
end;

function TAWS4DSQSServiceBase.PurgeQueue(QueueUrl: String): IAWS4DSQSModelPurgeQueueResponse;
var
  url : string;
  json: string;
begin
  url := GetURL(QueueUrl);
  json:= HTTPRequest(Self)
            .BaseURL(url)
            .Action('PurgeQueue')
            .Execute
            .Body;

  result := TAWS4DSQSModelPurgeQueueResponse.New(json);
end;

function TAWS4DSQSServiceBase.PrepareRequest(Request: IAWS4DSQSModelGetQueueAttributesRequest): IAWS4DHTTPRequest;
var
  url : String;
  i: Integer;
begin
  url := GetURL(Request.queueUrl);

  result :=
    HTTPRequest(Self)
      .GET
      .BaseURL(url)
      .Action('GetQueueAttributes');

  if Request.Attributes.Count = 0 then
    result.AddQuery('AttributeName.1', 'All');

  for i := 1 to Request.Attributes.Count do
    result.AddQuery('AttributeName.' + i.ToString, Request.Attributes[i - 1]);
end;

function TAWS4DSQSServiceBase.PrepareRequest(Request: IAWS4DSQSModelDeleteMessageBatchRequest): IAWS4DHTTPRequest;
var
  url : string;
  messageId : string;
  queryName: string;
  queryValue: string;
  i : Integer;
begin
  url := GetURL(Request.QueueUrl);
  result :=
    HTTPRequest(Self)
      .GET
      .BaseURL(url)
      .Action('DeleteMessageBatch');

  i := 0;
  for messageId in Request.ReceiptHandle.Keys do
  begin
    Inc(i);
    queryName := Format('DeleteMessageBatchRequestEntry.%s.Id', [i.ToString]);
    queryValue := messageId;
    Result.AddQuery(queryName, queryValue);

    queryName := Format('DeleteMessageBatchRequestEntry.%s.ReceiptHandle', [i.ToString]);
    queryValue := Request.ReceiptHandle.Items[messageId];
    Result.AddQuery(queryName, queryValue);
  end;
end;

function TAWS4DSQSServiceBase.PrepareRequest(Request: IAWS4DSQSModelDeleteMessageRequest): IAWS4DHTTPRequest;
var
  url : String;
begin
  url := GetURL(Request.QueueUrl);

  result :=
    HTTPRequest(Self)
      .GET
      .BaseURL(url)
      .Action('DeleteMessage')
      .AddQuery('ReceiptHandle', Request.ReceiptHandle);
end;

function TAWS4DSQSServiceBase.PrepareRequest(Request: IAWS4DSQSModelCreateQueueRequest): IAWS4DHTTPRequest;
var
  url: string;
  key: string;
  name: String;
  value: string;
  i  : Integer;
begin
  url := GetURL;
  result :=
    HTTPRequest(Self)
      .GET
      .BaseURL(url)
      .Action('CreateQueue')
      .AddQuery('QueueName', Request.QueueName);

  i := 0;
  for key in Request.Tags.Keys do
  begin
    Inc(i);
    name  := Format('Tag.%s.Key', [i.ToString]);
    value := Format('Tag.%s.Value', [i.ToString]);
    Result.AddQuery(name, key);
    Result.AddQuery(value, Request.Tags.Items[key]);
  end;

  i := 0;
  for key in Request.Attributes.Keys do
  begin
    Inc(i);
    name  := Format('Attribute.%s.Name', [i.ToString]);
    value := Format('Attribute.%s.Value', [i.ToString]);
    Result.AddQuery(name, key);
    Result.AddQuery(value, Request.Attributes.Items[key]);
  end;
end;

function TAWS4DSQSServiceBase.PrepareRequest(Request: IAWS4DSQSModelUntagQueueRequest): IAWS4DHTTPRequest;
var
  url: string;
  tag: string;
//  i : Integer;
begin
  url := GetURL(Request.QueueUrl);
  result :=
    HTTPRequest(Self)
      .GET
      .BaseURL(url)
      .Action('UntagQueue');

//  i := 0;
  for tag in Request.Tags do
  begin
//    Inc(i);
//    Result.AddQuery('TagKey.' + i.ToString, tag);
    Result.AddQuery('TagKey', tag);
  end;
end;

end.
