unit AWS4D.SNS.Service;

interface

uses
  AWS4D.SNS.Model.Interfaces,
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

  protected
    function AccessKey(Value: String): IAWS4DSNSService<I>;
    function SecretKey(Value: String): IAWS4DSNSService<I>;
    function Region(Value: String): IAWS4DSNSService<I>; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSNSService<I>; overload;

    function ListSubscriptions(Request: IAWS4DSNSListSubscriptionsRequest<I>): IAWS4DSNSListSubscriptionsResponse<I>;
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

constructor TAWS4DSNSService<I>.create;
begin
  FRegion := aws4dUSEast1;
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
  restRequest := NewGETRequest('ListSubscriptions');

  if Request.NextToken.Trim <> EmptyStr then
    restRequest.Params.QueryAddOrSet('NextToken', Request.NextToken);

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
