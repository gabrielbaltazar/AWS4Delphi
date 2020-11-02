unit AWS4D.SQS.Service.Base;

interface

uses
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

    function PrepareRequest(Request: IAWS4DSQSModelListQueuesRequest): IAWS4DHTTPRequest; overload;
    function PrepareRequest(Request: IAWS4DSQSModelReceiveMessageRequest): IAWS4DHTTPRequest; overload;
    function PrepareRequest(Request: IAWS4DSQSModelSendMessageRequest): IAWS4DHTTPRequest; overload;
    function PrepareRequest(Request: IAWS4DSQSModelDeleteMessageRequest): IAWS4DHTTPRequest; overload;

  protected
    function DeleteMessage(Request: IAWS4DSQSModelDeleteMessageRequest): IAWS4DSQSModelDeleteMessageResponse;
    function GetQueueUrl(QueueName: String): IAWS4DSQSModelGetQueueUrlResponse;
    function ListQueues(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest = nil): IAWS4DSQSModelListQueuesResponse;
    function ListQueueTags(QueueName: String): IAWS4DSQSModelListQueueTagsResponse;
    function ReceiveMessage(Request: IAWS4DSQSModelReceiveMessageRequest): IAWS4DSQSModelReceiveMessageResponse;
    function SendMessage(Request: IAWS4DSQSModelSendMessageRequest): IAWS4DSQSModelSendMessageResponse;

  public
    class function New: IAWS4DServiceSQS;
end;

implementation

{ TAWS4DSQSServiceBase }

function TAWS4DSQSServiceBase.DeleteMessage(Request: IAWS4DSQSModelDeleteMessageRequest): IAWS4DSQSModelDeleteMessageResponse;
var
  json : string;
begin
  json   := PrepareRequest(Request).Execute.Body;
  Result := TAWS4DSQSModelDeleteMessageResponse.New(json);
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
  result := Format('https://sqs.%s.amazonaws.com', [Self.Region]);
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

end.
