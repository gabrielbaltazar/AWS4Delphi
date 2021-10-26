unit AWS4D.SNS.Service;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Model.CheckIfPhoneNumberIsOptedOut.Response,
  AWS4D.SNS.Model.ConfirmSubscription.Response,
  AWS4D.SNS.Model.CreateTopic.Response,
  AWS4D.SNS.Model.GetSMSSandboxAccountStatus.Response,
  AWS4D.SNS.Model.GetSubscriptionAttributes.Response,
  AWS4D.SNS.Model.GetTopicAttributes.Response,
  AWS4D.SNS.Model.ListSubscriptions.Response,
  AWS4D.SNS.Model.ListSMSSandboxPhoneNumbers.Response,
  AWS4D.SNS.Model.ListTopics.Request,
  AWS4D.SNS.Model.ListTopics.Response,
  AWS4D.SNS.Model.Publish.Response,
  AWS4D.SNS.Model.Subscribe.Response,
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

    procedure AddPermission(Request: IAWS4DSNSAddPermissionRequest<I>);
    function CheckIfPhoneNumberIsOptedOut(Request: IAWS4DSNSCheckIfPhoneNumberIsOptedOutRequest<I>): IAWS4DSNSCheckIfPhoneNumberIsOptedOutResponse<I>;
    function ConfirmSubscription(Request: IAWS4DSNSConfirmSubscriptionRequest<I>): IAWS4DSNSConfirmSubscriptionResponse<I>;
    procedure CreateSMSSandboxPhoneNumber(Request: IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<I>);
    function CreateTopic(Request: IAWS4DSNSCreateTopicRequest<I>): IAWS4DSNSCreateTopicResponse<I>;
    procedure DeleteTopic(Request: IAWS4DSNSDeleteTopicRequest<I>);
    procedure DeleteSMSSandboxPhoneNumber(Request: IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<I>);
    function GetSMSSandboxAccountStatus: IAWS4DSNSGetSMSSandboxAccountStatusResponse<I>;
    function GetSubscriptionAttributes(Request: IAWS4DSNSGetSubscriptionAttributesRequest<I>): IAWS4DSNSGetSubscriptionAttributesResponse<I>;
    function GetTopicAttributes(Request: IAWS4DSNSGetTopicAttributesRequest<I>): IAWS4DSNSGetTopicAttributesResponse<I>;
    function ListSMSSandboxPhoneNumbers(Request: IAWS4DSNSListSMSSandboxPhoneNumbersRequest<I>): IAWS4DSNSListSMSSandboxPhoneNumbersResponse<I>;
    function ListSubscriptions(Request: IAWS4DSNSListSubscriptionsRequest<I>): IAWS4DSNSListSubscriptionsResponse<I>;
    function ListSubscriptionsByTopic(Request: IAWS4DSNSListSubscriptionsRequest<I>): IAWS4DSNSListSubscriptionsResponse<I>;
    function ListTopics(Request: IAWS4DSNSListTopicsRequest<I>): IAWS4DSNSListTopicsResponse<I>;
    procedure OptInPhoneNumber(Request: IAWS4DSNSOptInPhoneNumberRequest<I>);
    function Publish(Request: IAWS4DSNSPublishRequest<I>): IAWS4DSNSPublishResponse<I>;
    procedure SetEndpointAttributes(Request: IAWS4DSNSSetEndpointAttributesRequest<I>);
    procedure SetPlatformApplicationAttributes(Request: IAWS4DSNSSetPlatformApplicationAttributesRequest<I>);
    procedure SetSubscriptionAttributes(Request: IAWS4DSNSSetSubscriptionAttributesRequest<I>);
    procedure SetTopicAttributes(Request: IAWS4DSNSSetTopicAttributesRequest<I>);
    function Subscribe(Request: IAWS4DSNSSubscribeRequest<I>): IAWS4DSNSSubscribeResponse<I>;
    procedure Unsubscribe(Request: IAWS4DSNSUnsubscribeRequest<I>);

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

function TAWS4DSNSService<I>.GetSMSSandboxAccountStatus: IAWS4DSNSGetSMSSandboxAccountStatusResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJSON: TJSONObject;
begin
  LRestRequest := NewGETRequest('GetSMSSandboxAccountStatus');
  LJSON := LRestRequest.Send.GetJSONObject;
  result := TAWS4DSNSModelGetSMSSandboxAccountStatusResponse<I>.New(FParent, LJSON);
end;

function TAWS4DSNSService<I>.GetSubscriptionAttributes(Request: IAWS4DSNSGetSubscriptionAttributesRequest<I>): IAWS4DSNSGetSubscriptionAttributesResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJSON: TJSONObject;
begin
  LRestRequest := NewGETRequest('GetSubscriptionAttributes');
  LRestRequest.Params.QueryAddOrSet('SubscriptionArn', Request.SubscriptionArn);
  LJSON := LRestRequest.Send.GetJSONObject;
  result :=  TAWS4DSNSModelGetSubscriptionAttributesResponse<I>.New(FParent, LJSON);
end;

function TAWS4DSNSService<I>.GetTopicAttributes(Request: IAWS4DSNSGetTopicAttributesRequest<I>): IAWS4DSNSGetTopicAttributesResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJSON: TJSONObject;
begin
  LRestRequest := NewGETRequest('GetTopicAttributes');
  LRestRequest.Params.QueryAddOrSet('TopicArn', Request.TopicArn);
  LJSON := LRestRequest.Send.GetJSONObject;
  result :=  TAWS4DSNSModelGetTopicAttributesResponse<I>.New(FParent, LJSON);
end;

function TAWS4DSNSService<I>.AccessKey(Value: String): IAWS4DSNSService<I>;
begin
  result := Self;
  FAccessKey := Value;
end;

procedure TAWS4DSNSService<I>.AddPermission(Request: IAWS4DSNSAddPermissionRequest<I>);
var
  LRestRequest: IGBClientRequest;
  LCount: Integer;
begin
  LRestRequest := NewGETRequest('AddPermission');

  LCount := 0;
  while Request.ActionsName.HasNext do
  begin
    Inc(LCount);
    LRestRequest.Params
      .QueryAddOrSet(Format('ActionName.member.%s', [LCount.ToString]), Request.ActionsName.Current);
  end;

  LCount := 0;
  while Request.AWSAccountsId.HasNext do
  begin
    Inc(LCount);
    LRestRequest.Params
      .QueryAddOrSet(Format('AWSAccountId.member.%s', [LCount.ToString]), Request.AWSAccountsId.Current);
  end;

  LRestRequest.Send;
end;

procedure TAWS4DSNSService<I>.AddQueryAttribute(Request: IGBClientRequest; Key, Value: String; var Count: Integer);
begin
  if Value.Trim <> EmptyStr then
  begin
    Request.Params
      .QueryAddOrSet(Format('Attributes.%s.key', [Count.ToString]), Key);
    Request.Params
      .QueryAddOrSet(Format('Attributes.%s.value', [Count.ToString]), Value);

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

function TAWS4DSNSService<I>.CheckIfPhoneNumberIsOptedOut(Request: IAWS4DSNSCheckIfPhoneNumberIsOptedOutRequest<I>): IAWS4DSNSCheckIfPhoneNumberIsOptedOutResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJSON: TJSONObject;
begin
  LRestRequest := NewGETRequest('CheckIfPhoneNumberIsOptedOut');
  LRestRequest.Params.QueryAddOrSet('phoneNumber', Request.PhoneNumber);

  LJSON := LRestRequest.Send.GetJSONObject;
  result := TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutResponse<I>.New(FParent, LJSON);
end;

function TAWS4DSNSService<I>.ConfirmSubscription(Request: IAWS4DSNSConfirmSubscriptionRequest<I>): IAWS4DSNSConfirmSubscriptionResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJson: TJSONObject;
begin
  LRestRequest := NewGETRequest('ConfirmSubscription');
  if Request.AuthenticateOnUnsubscribe then
    LRestRequest.Params.QueryAddOrSet('AuthenticateOnUnsubscribe', 'true');

  LRestRequest.Params.QueryAddOrSet('Token', Request.Token);
  LRestRequest.Params.QueryAddOrSet('TopicArn', Request.TopicArn);

  LJSON := LRestRequest.Send.GetJSONObject;
  result := TAWS4DSNSModelConfirmSubscriptionResponse<I>.New(FParent, LJSON);
end;

constructor TAWS4DSNSService<I>.create;
begin
  FRegion := aws4dUSEast1;
end;

procedure TAWS4DSNSService<I>.CreateSMSSandboxPhoneNumber(Request: IAWS4DSNSCreateSMSSandboxPhoneNumberRequest<I>);
var
  LRestRequest: IGBClientRequest;
  LJson: TJSONObject;
begin
  LRestRequest := NewGETRequest('CreateSMSSandboxPhoneNumber');
  if Request.LanguageCode.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('LanguageCode', Request.LanguageCode);

  LRestRequest.Params.QueryAddOrSet('PhoneNumber', Request.PhoneNumber);
  LRestRequest.Send;
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

procedure TAWS4DSNSService<I>.DeleteSMSSandboxPhoneNumber(Request: IAWS4DSNSDeleteSMSSandboxPhoneNumberRequest<I>);
var
  LRestRequest: IGBClientRequest;
begin
  LRestRequest := NewGETRequest('DeleteSMSSandboxPhoneNumber');
  LRestRequest.Params.QueryAddOrSet('PhoneNumber', Request.PhoneNumber);

  LRestRequest.Send;
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

function TAWS4DSNSService<I>.ListSMSSandboxPhoneNumbers(Request: IAWS4DSNSListSMSSandboxPhoneNumbersRequest<I>): IAWS4DSNSListSMSSandboxPhoneNumbersResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJson: TJSONObject;
begin
  LRestRequest := NewGETRequest('ListSMSSandboxPhoneNumbers');

  if Request.MaxResults > 0 then
    LRestRequest.Params.QueryAddOrSet('MaxResults', Request.MaxResults.ToString);

  if Request.NextToken.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('NextToken', Request.NextToken);

  LJson := LRestRequest.Send.GetJSONObject;
  result := TAWS4DSNSModelListSMSSandboxPhoneNumbersResponse<I>.New(FParent, LJson);
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

procedure TAWS4DSNSService<I>.OptInPhoneNumber(Request: IAWS4DSNSOptInPhoneNumberRequest<I>);
var
  LRestRequest: IGBClientRequest;
begin
  LRestRequest := NewGETRequest('OptInPhoneNumber');
  LRestRequest.Params.QueryAddOrSet('phoneNumber', Request.PhoneNumber);

  LRestRequest.Send;
end;

function TAWS4DSNSService<I>.Parent(Value: I): IAWS4DSNSService<I>;
begin
  result := Self;
  FParent := Value;
end;

function TAWS4DSNSService<I>.Publish(Request: IAWS4DSNSPublishRequest<I>): IAWS4DSNSPublishResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJSON: TJSONObject;
  LCount: Integer;
begin
  LCount := 0;
  LRestRequest := NewGETRequest('Publish');

  LRestRequest.Params.QueryAddOrSet('Message', Request.Message);

  while Request.Attributes.HasNext do
  begin
    Inc(LCount);
    LRestRequest.Params.QueryAddOrSet(Format('MessageAttributes.%s.Name', [LCount.ToString]),
              Request.Attributes.Current.Key);
    LRestRequest.Params.QueryAddOrSet(Format('MessageAttributes.%s.Value', [LCount.ToString]),
              Request.Attributes.Current.Value);
  end;

  if Request.MessageDeduplicationId.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('MessageDeduplicationId', Request.MessageDeduplicationId);

  if Request.MessageGroupId.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('MessageGroupId', Request.MessageGroupId);

  if Request.MessageStructure.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('MessageStructure', Request.MessageStructure);

  if Request.PhoneNumber.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('PhoneNumber', Request.PhoneNumber);

  if Request.Subject.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('Subject', Request.Subject);

  if Request.TargetArn.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('TargetArn', Request.TargetArn);

  if Request.TopicArn.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('TopicArn', Request.TopicArn);

  LJSON := LRestRequest.Send.GetJSONObject;
  Result := TAWS4DSNSModelPublishResponse<I>.New(FParent, LJSON);
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

procedure TAWS4DSNSService<I>.SetEndpointAttributes(Request: IAWS4DSNSSetEndpointAttributesRequest<I>);
var
  LRestRequest: IGBClientRequest;
  LCount: Integer;
begin
  LCount := 0;
  LRestRequest := NewGETRequest('SetEndpointAttributes');

  AddQueryAttribute(LRestRequest, 'CustomUserData', Request.CustomUserData, LCount);
  AddQueryAttribute(LRestRequest, 'Token', Request.Token, LCount);
  if Request.Enabled then
    AddQueryAttribute(LRestRequest, 'Enabled', 'true', LCount);

  LRestRequest.Params.QueryAddOrSet('EndpointArn', Request.EndpointArn);
  LRestRequest.Send;
end;

procedure TAWS4DSNSService<I>.SetPlatformApplicationAttributes(Request: IAWS4DSNSSetPlatformApplicationAttributesRequest<I>);
var
  LRestRequest: IGBClientRequest;
  LCount: Integer;
begin
  LCount := 0;
  LRestRequest := NewGETRequest('SetPlatformApplicationAttributes');

  AddQueryAttribute(LRestRequest, 'PlatformCredential', Request.PlatformCredential, LCount);
  AddQueryAttribute(LRestRequest, 'PlatformPrincipal', Request.PlatformPrincipal, LCount);
  AddQueryAttribute(LRestRequest, 'EventEndpointCreated', Request.EventEndpointCreated, LCount);
  AddQueryAttribute(LRestRequest, 'EventEndpointDeleted', Request.EventEndpointDeleted, LCount);
  AddQueryAttribute(LRestRequest, 'EventEndpointUpdated', Request.EventEndpointUpdated, LCount);
  AddQueryAttribute(LRestRequest, 'EventDeliveryFailure', Request.EventDeliveryFailure, LCount);
  AddQueryAttribute(LRestRequest, 'SuccessFeedbackRoleArn', Request.SuccessFeedbackRoleArn, LCount);
  AddQueryAttribute(LRestRequest, 'FailureFeedbackRoleArn', Request.FailureFeedbackRoleArn, LCount);
  AddQueryAttribute(LRestRequest, 'SuccessFeedbackSampleRate', Request.SuccessFeedbackSampleRate.ToString, LCount);

  LRestRequest.Params
    .QueryAddOrSet('PlatformApplicationArn', Request.PlatformApplicationArn);

  LRestRequest.Send;
end;

procedure TAWS4DSNSService<I>.SetSubscriptionAttributes(Request: IAWS4DSNSSetSubscriptionAttributesRequest<I>);
var
  LRestRequest: IGBClientRequest;
begin
  LRestRequest := NewGETRequest('SetSubscriptionAttributes');
  LRestRequest.Params
    .QueryAddOrSet('AttributeName', Request.AttributeName)
    .QueryAddOrSet('AttributeValue', Request.AttributeValue)
    .QueryAddOrSet('Subscription', Request.SubscriptionArn);

  LRestRequest.Send;
end;

procedure TAWS4DSNSService<I>.SetTopicAttributes(Request: IAWS4DSNSSetTopicAttributesRequest<I>);
var
  LRestRequest: IGBClientRequest;
begin
  LRestRequest := NewGETRequest('SetTopicAttributes');
  LRestRequest.Params
    .QueryAddOrSet('AttributeName', Request.AttributeName)
    .QueryAddOrSet('AttributeValue', Request.AttributeValue)
    .QueryAddOrSet('TopicArn', Request.TopicArn);

  LRestRequest.Send;
end;

function TAWS4DSNSService<I>.Subscribe(Request: IAWS4DSNSSubscribeRequest<I>): IAWS4DSNSSubscribeResponse<I>;
var
  LRestRequest: IGBClientRequest;
  LJson: TJSONObject;
  LCount: Integer;
begin
  LCount := 0;
  LRestRequest := NewGETRequest('Subscribe');

  AddQueryAttribute(LRestRequest, 'DeliveryPolicy', Request.DeliveryPolicy, LCount);
  AddQueryAttribute(LRestRequest, 'FilterPolicy', Request.FilterPolicy, LCount);
  AddQueryAttribute(LRestRequest, 'RawMessageDelivery', Request.RawMessageDelivery, LCount);
  AddQueryAttribute(LRestRequest, 'SubscriptionRoleArn', Request.SubscriptionRoleArn, LCount);
  if Request.RedrivePolicy then
    AddQueryAttribute(LRestRequest, 'RedrivePolicy', 'true', LCount);

  if Request.Endpoint.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('Endpoint', Request.Endpoint);

  if Request.Protocol.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('Protocol', Request.Protocol);

  if Request.ReturnSubscriptionArn then
    LRestRequest.Params.QueryAddOrSet('ReturnSubscriptionArn', 'true');

  if Request.TopicArn.Trim <> EmptyStr then
    LRestRequest.Params.QueryAddOrSet('TopicArn', Request.TopicArn);

  LJson := LRestRequest.Send.GetJSONObject;
  result := TAWS4DSNSModelSubscribeResponse<I>.New(FParent, LJson);
end;

procedure TAWS4DSNSService<I>.Unsubscribe(Request: IAWS4DSNSUnsubscribeRequest<I>);
var
  LRestRequest: IGBClientRequest;
begin
  LRestRequest := NewGETRequest('Unsubscribe');
  LRestRequest.Params
    .QueryAddOrSet('SubscriptionArn', Request.SubscriptionArn);

  LRestRequest.Send;
end;

end.
