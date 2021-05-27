unit AWS4D.SQS.Service.CloudAPI;

interface

uses
  AWS4D.Service.Interfaces,
  AWS4D.SQS.Service.Interfaces,
  AWS4D.Model.Interfaces,
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.Classes,
  AWS4D.SQS.Model.Exceptions,
  AWS4D.Service.Base,
  AWS4D.SQS.Service.Base,
  Data.Cloud.CloudAPI,
  Data.Cloud.AmazonAPI,
  System.Generics.Collections,
  System.SysUtils,
  System.Classes;

type TAWS4DSQSServiceCloudAPI = class(TAWS4DServiceBase, IAWS4DServiceSQS)

  private
    FAmazonConnection: TAmazonConnectionInfo;
    FQueueService: TAmazonQueueService;

    function Decorator: IAWS4DServiceSQS;

    function TagValue(AXml, ATag: String): string;
    function GetReceiptHandle(AXml: String; AIndex: Integer): String;

    function GetURL: string; overload;
    function GetURL(QueueName: String): string; overload;

    function QueueService: TAmazonQueueService;

    procedure PrepareRequest;
    procedure CheckErrorResponse(ResponseInfo: TCloudResponseInfo);
    procedure SetResponseInformations(ResponseInfo: TCloudResponseInfo; SQS: IAWS4DModelResponseMetadata);
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
    constructor create;
    destructor Destroy; override;
    class function New: IAWS4DServiceSQS;
end;

implementation

{ TAWS4DSQSServiceCloudAPI }

procedure TAWS4DSQSServiceCloudAPI.CheckErrorResponse(ResponseInfo: TCloudResponseInfo);
begin
  if ResponseInfo.StatusCode >= 400 then
    raise EAWS4DSQSModelException.Create(ResponseInfo.StatusCode, ResponseInfo.StatusMessage);
end;

constructor TAWS4DSQSServiceCloudAPI.create;
begin
  FAmazonConnection := TAmazonConnectionInfo.Create(nil);
end;

function TAWS4DSQSServiceCloudAPI.QueueService: TAmazonQueueService;
begin
  if not Assigned(FQueueService) then
  begin
    FAmazonConnection.AccountName := Self.AccessKeyID;
    FAmazonConnection.AccountKey  := Self.SecretKey;
    {$IF CompilerVersion >= 33.0}
      FAmazonConnection.Region := GetRegion;
    {$IFEND}

    FQueueService := TAmazonQueueService.Create(FAmazonConnection);
  end;

  result := FQueueService;
end;

function TAWS4DSQSServiceCloudAPI.CreateQueue(Request: IAWS4DSQSModelCreateQueueRequest): IAWS4DSQSModelCreateQueueResponse;
var
  responseInfo: TCloudResponseInfo;
  visibilityTimeout: Integer;
begin
  responseInfo := TCloudResponseInfo.Create;
  try
    visibilityTimeout := -1;
    if Request.VisibilityTimeout > 0 then
      visibilityTimeout := Request.VisibilityTimeout;

    PrepareRequest;
    QueueService.CreateQueue(Request.QueueName, visibilityTimeout, responseInfo);
    CheckErrorResponse(responseInfo);

    result := TAWS4DSQSModelCreateQueueResponse.New;
    Self.SetResponseInformations(responseInfo, result);
  finally
    responseInfo.Free;
  end;
end;

function TAWS4DSQSServiceCloudAPI.Decorator: IAWS4DServiceSQS;
begin
  result := TAWS4DSQSServiceBase.New;
  result
    .AccessKeyID(Self.AccessKeyID)
    .SecretKey(Self.SecretKey)
    .Region(Self.Region);
end;

function TAWS4DSQSServiceCloudAPI.DeleteMessage(Request: IAWS4DSQSModelDeleteMessageRequest): IAWS4DSQSModelDeleteMessageResponse;
var
  responseInfo: TCloudResponseInfo;
begin
  responseInfo := TCloudResponseInfo.Create;
  try
    PrepareRequest;
    QueueService.DeleteMessage(GetURL(Request.QueueUrl), Request.ReceiptHandle, responseInfo);
    CheckErrorResponse(responseInfo);

    result := TAWS4DSQSModelDeleteMessageResponse.New;
    SetResponseInformations(responseInfo, result);
  finally
    responseInfo.Free;
  end;
end;

function TAWS4DSQSServiceCloudAPI.DeleteMessageBatch(Request: IAWS4DSQSModelDeleteMessageBatchRequest): IAWS4DSQSModelDeleteMessageBatchResponse;
var
  responseInfo: TCloudResponseInfo;
  receipts: TArray<string>;
  i: Integer;
begin
  responseInfo := TCloudResponseInfo.Create;
  try
    SetLength(receipts, request.ReceiptHandle.Count);
    for i := 0 to Request.ReceiptHandle.Count - 1 do
      receipts[i] := Request.ReceiptHandle.ToArray[i].Value;

    PrepareRequest;
    QueueService.DeleteMessageBatch(GetURL(Request.QueueUrl), receipts, responseInfo);
    CheckErrorResponse(responseInfo);

    result := TAWS4DSQSModelDeleteMessageBatchResponse.New;
    SetResponseInformations(responseInfo, result);
  finally
    responseInfo.Free;
  end;
end;

function TAWS4DSQSServiceCloudAPI.DeleteQueue(QueueUrl: String): IAWS4DSQSModelDeleteQueueResponse;
var
  responseInfo: TCloudResponseInfo;
begin
  responseInfo := TCloudResponseInfo.Create;
  try
    PrepareRequest;
    QueueService.DeleteQueue(GetURL(QueueUrl), responseInfo);
    CheckErrorResponse(responseInfo);

    result := TAWS4DSQSModelDeleteQueueResponse.New;
    SetResponseInformations(responseInfo, result);
  finally
    responseInfo.Free;
  end;
end;

function TAWS4DSQSServiceCloudAPI.ReceiveMessage(Request: IAWS4DSQSModelReceiveMessageRequest): IAWS4DSQSModelReceiveMessageResponse;
var
  responseInfo: TCloudResponseInfo;
  messages: TArray<TCloudQueueMessageItem>;
  messageResponse: TAWS4DSQSModelReceiveMessage;
  xml: string;
  i: Integer;
  j: Integer;
  visibilityTimeout: Integer;
begin
  responseInfo := TCloudResponseInfo.Create;
  try
    visibilityTimeout := 0;
    if Request.visibilityTimeout > 0 then
      visibilityTimeout := Request.visibilityTimeout;

    PrepareRequest;

    messages := QueueService
                  .ReceiveMessage(
                      GetURL(Request.queueUrl),
                      Request.maxNumberOfMessages,
                      visibilityTimeout,
                      xml,
                      responseInfo);

    CheckErrorResponse(responseInfo);

    result := TAWS4DSQSModelReceiveMessageResponse.New;
    SetResponseInformations(responseInfo, result);

    for i := 0 to Pred(Length(messages)) do
    begin
      messageResponse := TAWS4DSQSModelReceiveMessage( TAWS4DSQSModelReceiveMessageResponse(Result).NewMessage);
      messageResponse
        .MessageId(messages[i].MessageId)
        .ReceiptHandle(GetReceiptHandle(xml, i))
        .Body(messages[i].MessageText);

      for j := 0 to Pred(Length( messages[i].Properties )) do
        messageResponse.AddAttribute(messages[i].Properties[j].Key, messages[i].Properties[j].Value);
    end;
  finally
    responseInfo.Free;
  end;
end;

function TAWS4DSQSServiceCloudAPI.SendMessage(Request: IAWS4DSQSModelSendMessageRequest): IAWS4DSQSModelSendMessageResponse;
var
  responseInfo: TCloudResponseInfo;
  messageId: string;
begin
  responseInfo := TCloudResponseInfo.Create;
  try
    PrepareRequest;
    QueueService.SendMessage(GetURL(Request.QueueUrl), Request.MessageBody, messageId, responseInfo);
    CheckErrorResponse(responseInfo);

    result := TAWS4DSQSModelSendMessageResponse.New;
    SetResponseInformations(responseInfo, result);

    TAWS4DSQSModelSendMessageResponse(result).MessageId(messageId);
  finally
    responseInfo.Free;
  end;
end;

procedure TAWS4DSQSServiceCloudAPI.SetResponseInformations(ResponseInfo: TCloudResponseInfo; SQS: IAWS4DModelResponseMetadata);
var
  responseId: String;
begin
  responseId := ResponseInfo.Headers.Values['RequestId'];
  TAWS4DModelResponseMetadata(SQS)
    .RequestId(responseId);
end;

function TAWS4DSQSServiceCloudAPI.TagQueue(Request: IAWS4DSQSModelTagQueueRequest): IAWS4DSQSModelTagQueueResponse;
begin
  result := Decorator.TagQueue(Request);
end;

function TAWS4DSQSServiceCloudAPI.TagValue(AXml, ATag: String): string;
var
  tagIni : String;
  tagFim : String;
  posIni : Integer;
  posFin : Integer;
begin
  ATag   := ATag.Replace('<', '').Replace('>', '');
  tagIni := '<'  + ATag + '>';
  tagFim := '</' + ATag + '>';

  posIni := Pos(tagIni, AXml) + (tagIni.Length);
  posFin := Pos(tagFim, AXml);

  result := Copy(AXml, posIni, posFin - posIni);
end;

function TAWS4DSQSServiceCloudAPI.UntagQueue(Request: IAWS4DSQSModelUntagQueueRequest): IAWS4DSQSModelUntagQueueResponse;
begin
  result := Decorator.UntagQueue(Request);
end;

destructor TAWS4DSQSServiceCloudAPI.Destroy;
begin
  FAmazonConnection.Free;
  FQueueService.Free;
  inherited;
end;

function TAWS4DSQSServiceCloudAPI.GetQueueAttributes(Request: IAWS4DSQSModelGetQueueAttributesRequest): IAWS4DSQSModelGetQueueAttributesResponse;
begin
  result := Decorator.GetQueueAttributes(Request);
end;

function TAWS4DSQSServiceCloudAPI.GetQueueUrl(QueueName: String): IAWS4DSQSModelGetQueueUrlResponse;
begin
  result := Decorator.GetQueueUrl(QueueName);
end;

function TAWS4DSQSServiceCloudAPI.GetReceiptHandle(AXml: String; AIndex: Integer): String;
var
  xmlMessage: String;
  i: Integer;
begin
  for i := 0 to AIndex do
  begin
    xmlMessage := '<Message>' + TagValue(AXml, 'Message') + '</Message>';
    if i = AIndex then
    begin
      result := TagValue(xmlMessage, 'ReceiptHandle');
      Exit;
    end;

    AXml := AXml.Replace(xmlMessage, EmptyStr);
  end;
end;

function TAWS4DSQSServiceCloudAPI.GetURL(QueueName: String): string;
begin
  result := GetURL;
  if not result.EndsWith('/') then
    result := result + '/';
  result := result + QueueName;
end;

function TAWS4DSQSServiceCloudAPI.ListQueues(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest): IAWS4DSQSModelListQueuesResponse;
var
  params: TStrings;
  queues: TList<TCloudQueue>;
  responseInfo: TCloudResponseInfo;
  i: Integer;
begin
  params := TStringList.Create;
  try
    if ListQueuesRequest.MaxResults > 0 then
      params.AddPair('MaxResults', ListQueuesRequest.MaxResults.ToString);

    if not ListQueuesRequest.NextToken.Trim.IsEmpty then
      params.AddPair('NextToken', ListQueuesRequest.NextToken);

    if not ListQueuesRequest.QueueNamePrefix.Trim.IsEmpty then
      params.AddPair('QueueNamePrefix', ListQueuesRequest.QueueNamePrefix);

    responseInfo:= TCloudResponseInfo.Create;
    try
      PrepareRequest;
      queues := QueueService.ListQueues(params, responseInfo);
      try
        CheckErrorResponse(responseInfo);
        result := TAWS4DSQSModelListQueuesResponse.New;
        SetResponseInformations(responseInfo, result);

        for i := 0 to Pred(queues.Count) do
          TAWS4DSQSModelListQueuesResponse(result).AddQueueUrl(queues[i].URL);
      finally
        queues.Free;
      end;
    finally
      responseInfo.Free;
    end;
  finally
    params.Free;
  end;
end;

function TAWS4DSQSServiceCloudAPI.ListQueueTags(QueueName: String): IAWS4DSQSModelListQueueTagsResponse;
begin
  result := Decorator.ListQueueTags(QueueName);
end;

class function TAWS4DSQSServiceCloudAPI.New: IAWS4DServiceSQS;
begin
  result := Self.Create;
end;

procedure TAWS4DSQSServiceCloudAPI.PrepareRequest;
begin
  FAmazonConnection.UseDefaultEndpoints := False;
  FAmazonConnection.QueueEndpoint := Format('sqs.%s.amazonaws.com', [Self.Region.toString]);

  FreeAndNil(FQueueService);
end;

function TAWS4DSQSServiceCloudAPI.PurgeQueue(QueueUrl: String): IAWS4DSQSModelPurgeQueueResponse;
var
  responseInfo: TCloudResponseInfo;
begin
  responseInfo := TCloudResponseInfo.Create;
  try
    PrepareRequest;
    QueueService.PurgeQueue(GetURL(QueueUrl), responseInfo);
    CheckErrorResponse(responseInfo);

    result := TAWS4DSQSModelPurgeQueueResponse.New;
    SetResponseInformations(responseInfo, result);
  finally
    responseInfo.Free;
  end;
end;

function TAWS4DSQSServiceCloudAPI.GetURL: string;
begin
  result := Format('https://sqs.%s.amazonaws.com', [Self.Region.toString]);
end;

end.

