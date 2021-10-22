unit AWS4D.SNS.Service;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.CreateTopic.Response,
  AWS4D.SNS.Model.ListSubscriptions.Response,
  AWS4D.SNS.Model.ListTopics.Request,
  AWS4D.SNS.Model.ListTopics.Response,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.Core.Model.Types,
  GBClient.Interfaces,
  System.Classes,
  System.SysUtils,
  System.JSON;

type TAWS4DSNSService<I: IInterface> = class(TInterfacedObject, IAWS4DSNSService<I>)

  private
    [Weak]
    FParent: I;
    FAccessKey: String;
    FSecretKey: String;
    FRegion: TAWS4DRegion;

    function Host: string;
    function NewGETRequest(Action: String): IGBClientRequest;

    procedure AddQueryAttribute(Request: IGBClientRequest; Key, Value: String; var Count: Integer);
    procedure AddTagAttribute(Request: IGBClientRequest; Key, Value: String; var Count: Integer);

  protected
    function AccessKey(Value: String): IAWS4DSNSService<I>;
    function SecretKey(Value: String): IAWS4DSNSService<I>;
    function Region(Value: String): IAWS4DSNSService<I>; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSNSService<I>; overload;

    function CreateTopic(Request: IAWS4DSNSCreateTopicRequest<I>): IAWS4DSNSCreateTopicResponse<I>;
    procedure DeleteTopic(Request: IAWS4DSNSDeleteTopicRequest<I>);
    function ListSubscriptions(Request: IAWS4DSNSListSubscriptionsRequest<I>): IAWS4DSNSListSubscriptionsResponse<I>;
    function ListSubscriptionsByTopic(Request: IAWS4DSNSListSubscriptionsRequest<I>): IAWS4DSNSListSubscriptionsResponse<I>;
    function ListTopics(Request: IAWS4DSNSListTopicsRequest<I>): IAWS4DSNSListTopicsResponse<I>;

    function Parent(Value: I): IAWS4DSNSService<I>;
    function &End: I;
  public
    constructor create;
    class function New: IAWS4DSNSService<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSService }

function TAWS4DSNSService<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DSNSService<I>.AccessKey(Value: String): IAWS4DSNSService<I>;
begin
  result := Self;
  FAccessKey := Value;
end;

procedure TAWS4DSNSService<I>.AddQueryAttribute(Request: IGBClientRequest; Key, Value: String; var Count: Integer);
begin
  if Value.Trim <> EmptyStr then
  begin
    Request.Params
      .QueryAddOrSet(Format('Attributes.entry.%s.key', [Count.ToString]), Key);
    Request.Params
      .QueryAddOrSet(Format('Attributes.entry.%s.value', [Count.ToString]), Value);

    Inc(Count);
  end;
end;

procedure TAWS4DSNSService<I>.AddTagAttribute(Request: IGBClientRequest; Key, Value: String; var Count: Integer);
begin
  if Value.Trim <> EmptyStr then
  begin
    Request.Params
      .QueryAddOrSet(Format('Tag.%s.Name', [Count.ToString]), Key);
    Request.Params
      .QueryAddOrSet(Format('Tag.%s.value', [Count.ToString]), Value);

    Inc(Count);
  end;
end;

constructor TAWS4DSNSService<I>.create;
begin
  FRegion := aws4dUSEast1;
end;

function TAWS4DSNSService<I>.CreateTopic(Request: IAWS4DSNSCreateTopicRequest<I>): IAWS4DSNSCreateTopicResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJson: TJSONObject;
  LCount: Integer;
begin
  LCount := 0;
  LRestRequest := NewGETRequest('CreateTopic');

  AddQueryAttribute(LRestRequest, 'DeliveryPolicy', Request.DeliveryPolicy, LCount);
  AddQueryAttribute(LRestRequest, 'DisplayName', Request.DisplayName, LCount);
  AddQueryAttribute(LRestRequest, 'DeliveryPolicy', Request.DeliveryPolicy, LCount);

  if Request.FifoTopic then
  begin
    AddQueryAttribute(LRestRequest, 'FifoTopic', 'true', LCount);
    if Request.ContentBasedDeduplication then
      AddQueryAttribute(LRestRequest, 'ContentBasedDeduplication', 'true', LCount);
  end;

  AddQueryAttribute(LRestRequest, 'Policy', Request.Policy, LCount);
  AddQueryAttribute(LRestRequest, 'KmsMasterKeyId', Request.KmsMasterKeyId, LCount);

  if Request.Name.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('Name', Request.Name);

  LCount := 0;
  while Request.Tags.HasNext do
    AddTagAttribute(LRestRequest, Request.Tags.Current.Key, Request.Tags.Current.Value, LCount);

  LJson := LRestRequest.Send.GetJSONObject;
  result := TAWS4DSNSModelCreateTopicResponse<I>.New(FParent, LJson);
end;

procedure TAWS4DSNSService<I>.DeleteTopic(Request: IAWS4DSNSDeleteTopicRequest<I>);
var
  LRestRequest: IGBClientRequest;
begin
  LRestRequest := NewGETRequest('DeleteTopic');
  LRestRequest.Params.QueryAddOrSet('TopicArn', Request.TopicArn);

  LRestRequest.Send;
end;

destructor TAWS4DSNSService<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSService<I>.Host: string;
begin
  Result := Format('https://sns.%s.amazonaws.com', [FRegion.toString]);
end;

function TAWS4DSNSService<I>.ListSubscriptions(Request: IAWS4DSNSListSubscriptionsRequest<I>): IAWS4DSNSListSubscriptionsResponse<I>;
var
  restRequest: IGBClientRequest;
  json: TJSONObject;
begin
  if Request.TopicArn.Trim <> EmptyStr then
  begin
    result := ListSubscriptionsByTopic(Request);
    exit;
  end;

  restRequest := NewGETRequest('ListSubscriptions');

  if Request.NextToken.Trim <> EmptyStr then
    restRequest.Params.QueryAddOrSet('NextToken', Request.NextToken);

  json := restRequest.Send.GetJSONObject;
  result := TAWS4DSNSModelListSubscriptionsResponse<I>.New(FParent, json);
end;

function TAWS4DSNSService<I>.ListSubscriptionsByTopic(Request: IAWS4DSNSListSubscriptionsRequest<I>): IAWS4DSNSListSubscriptionsResponse<I>;
var
  restRequest: IGBClientRequest;
  json: TJSONObject;
begin
  restRequest := NewGETRequest('ListSubscriptionsByTopic');

  if Request.NextToken.Trim <> EmptyStr then
    restRequest.Params.QueryAddOrSet('NextToken', Request.NextToken);

  if Request.TopicArn.Trim <> EmptyStr then
    restRequest.Params.QueryAddOrSet('TopicArn', Request.TopicArn);

  json := restRequest.Send.GetJSONObject;
  result := TAWS4DSNSModelListSubscriptionsResponse<I>.New(FParent, json);
end;

function TAWS4DSNSService<I>.ListTopics(Request: IAWS4DSNSListTopicsRequest<I>): IAWS4DSNSListTopicsResponse<I>;
var
  restRequest: IGBClientRequest;
  json: TJSONObject;
begin
  restRequest := NewGETRequest('ListTopics');

  if Request.NextToken.Trim <> EmptyStr then
    restRequest.Params.QueryAddOrSet('NextToken', Request.NextToken);

  json := restRequest.Send.GetJSONObject;
  result := TAWS4DSNSModelListTopicsResponse<I>.New(FParent, json);
end;

//function TAWS4DSNSService<I>.ListSubscriptions: IAWS4DServiceSNS<I>;
//var
//  request: IGBClientRequest;
//  json: string;
//begin
//  result := Self;
//  request := NewClientRequest;
//  request
//    .GET
//    .BaseURL(Host)
//    .Accept('application/json')
//    .Authorization
//      .AWSv4
//        .AccessKey(FAccessKey)
//        .SecretKey(FSecretKey)
//        .Region(FRegion.toString)
//        .Service(FService)
//    .&End
//    .Params
//      .QueryAddOrSet('Action', 'ListSubscriptions')
//      .HeaderAddOrSet('Accept', 'application/json', False)
//    .&End
//    .Send;
//
//  json := request.Response.GetText;
//  with TStringList.Create do
//  try
//    Text := json;
//    SaveToFile('test.json');
//  finally
//    Free;
//  end;
//end;

class function TAWS4DSNSService<I>.New: IAWS4DSNSService<I>;
begin
  result := Self.create;
end;

function TAWS4DSNSService<I>.NewGETRequest(Action: String): IGBClientRequest;
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
        .Service('sns')
        .HTTPVerb('GET')
    .&End
    .Params
      .QueryAddOrSet('Action', Action);
end;

function TAWS4DSNSService<I>.Parent(Value: I): IAWS4DSNSService<I>;
begin
  result := Self;
  FParent := Value;
end;

function TAWS4DSNSService<I>.Region(Value: String): IAWS4DSNSService<I>;
begin
  result := Self;
  FRegion.fromString(Value);
end;

function TAWS4DSNSService<I>.Region(Value: TAWS4DRegion): IAWS4DSNSService<I>;
begin
  result := Self;
  FRegion := Value;
end;

function TAWS4DSNSService<I>.SecretKey(Value: String): IAWS4DSNSService<I>;
begin
  result := Self;
  FSecretKey := Value;
end;

end.
