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
    function GetURL: string;

    function PrepareRequest(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest): IAWS4DHTTPRequest; overload;
    function PrepareRequest(Request: IAWS4DSQSModelReceiveMessageRequest): IAWS4DHTTPRequest; overload;

  protected
    function ListQueues(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest = nil): IAWS4DSQSModelListQueuesResponse;
    function ListQueueTags(QueueName: String): IAWS4DSQSModelListQueueTagsResponse;
    function GetQueueUrl(QueueName: String): string;
    function ReceiveMessage(Request: IAWS4DSQSModelReceiveMessageRequest): IAWS4DSQSModelReceiveMessageResponse;

  public
    class function New: IAWS4DServiceSQS;
end;

implementation

{ TAWS4DSQSServiceBase }

function TAWS4DSQSServiceBase.GetQueueUrl(QueueName: String): string;
begin
  Result := HTTPRequest(Self)
              .GET
              .BaseURL(GetURL)
              .Action('GetQueueUrl')
              .AddQuery('QueueName', QueueName)
              .Execute
              .Body;

  result := Result + Result;
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
              .BaseURL(url + '/')
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
  url := GetURL;
  if not url.EndsWith('/') then
    url := url + '/';
  url := url + Request.queueUrl;
  if not url.EndsWith('/') then
    url := url + '/';

  result :=
    HTTPRequest(Self)
      .GET
      .BaseURL(url)
      .Action('ReceiveMessage')
end;

function TAWS4DSQSServiceBase.PrepareRequest(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest): IAWS4DHTTPRequest;
begin
  Result := HTTPRequest(Self)
              .GET
              .BaseURL(GetURL)
              .Action('ListQueues');

  if not Assigned( ListQueuesRequest ) then
    Exit;

  if ListQueuesRequest.MaxResults > 0 then
    Result.AddQuery('MaxResults', ListQueuesRequest.MaxResults.ToString);

  if not ListQueuesRequest.NextToken.IsEmpty then
    Result.AddQuery('NextToken', ListQueuesRequest.NextToken);

  if not ListQueuesRequest.QueueNamePrefix.IsEmpty then
    Result.AddQuery('QueueNamePrefix', ListQueuesRequest.QueueNamePrefix);

end;

function TAWS4DSQSServiceBase.ReceiveMessage(Request: IAWS4DSQSModelReceiveMessageRequest): IAWS4DSQSModelReceiveMessageResponse;
var
  url: string;
begin
  url := GetURL;
  if not url.EndsWith('/') then
    url := url + '/';
  url := url + Request.queueUrl;
  if not url.EndsWith('/') then
    url := url + '/';

end;

end.
