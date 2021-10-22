unit AWS4D.SNS.Model.ListSubscriptions.Response;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  System.Generics.Collections,
  System.JSON,
  AWS4D.Core.Helper.JSON,
  System.SysUtils;

type
  TAWS4DSNSModelSubscriptions = class(TInterfacedObject, IAWS4DSNSSubscription)
  private
    FEndpoint: String;
    FOwner: String;
    FProtocol: string;
    FSubsctiptionArn: string;
    FTopicArn: String;

  protected
    function Endpoint: String;
    function Owner: string;
    function Protocol: String;
    function SubscriptionArn: String;
    function TopicArn: string;

  public
    constructor create(JSON: TJSONObject);
    class function New(JSON: TJSONObject): IAWS4DSNSSubscription;
  end;

  TAWS4DSNSModelListSubscriptionsResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSNSListSubscriptionsResponse<I>)
  private
    [Weak]
    FParent: I;
    FNextToken: string;
    FSubscriptions: IAWS4DIterator<IAWS4DSNSSubscription>;

    procedure FromJSON(Value: TJSONObject);

  protected
    function NextToken: string;
    function Subscriptions: IAWS4DIterator<IAWS4DSNSSubscription>;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSNSListSubscriptionsResponse<I>;
    destructor Destroy; override;
  end;

implementation

{ TAWS4DSNSModelSubscriptions }

constructor TAWS4DSNSModelSubscriptions.create(JSON: TJSONObject);
begin
  if not Assigned(JSON) then
    Exit;

  FEndpoint := JSON.ValueAsString('Endpoint');
  FOwner := JSON.ValueAsString('Owner');
  FProtocol := JSON.ValueAsString('Protocol');
  FSubsctiptionArn := JSON.ValueAsString('SubscriptionArn');
  FTopicArn := JSON.ValueAsString('TopicArn');
end;

function TAWS4DSNSModelSubscriptions.Endpoint: String;
begin
  result := FEndpoint;
end;

class function TAWS4DSNSModelSubscriptions.New(JSON: TJSONObject): IAWS4DSNSSubscription;
begin
  result := Self.create(JSON);
end;

function TAWS4DSNSModelSubscriptions.Owner: string;
begin
  result := FOwner;
end;

function TAWS4DSNSModelSubscriptions.Protocol: String;
begin
  result := FProtocol;
end;

function TAWS4DSNSModelSubscriptions.SubscriptionArn: String;
begin
  result := FSubsctiptionArn;
end;

function TAWS4DSNSModelSubscriptions.TopicArn: string;
begin
  result := FTopicArn;
end;

{ TAWS4DSNSModelListSubscriptionsResponse<I> }

constructor TAWS4DSNSModelListSubscriptionsResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  if not Assigned(JSON) then
    Exit;

  FromJSON(JSON);
end;

destructor TAWS4DSNSModelListSubscriptionsResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelListSubscriptionsResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4DSNSModelListSubscriptionsResponse<I>.FromJSON(Value: TJSONObject);
var
  json: TJSONObject;
  jsonSubscriptions: TJSONArray;
  subscriptions: TList<IAWS4DSNSSubscription>;
  i: Integer;
begin
  inherited;
  if not Assigned(Value) then
    Exit;

  json := Value.ValueAsJSONObject('ListSubscriptionsResponse')
               .ValueAsJSONObject('ListSubscriptionsResult');

  FNextToken := json.ValueAsString('NextToken');
  subscriptions := TList<IAWS4DSNSSubscription>.Create;
  try
    jsonSubscriptions := json.ValueAsJSONArray('Subscriptions');
    if Assigned(jsonSubscriptions) then
    begin
      for i := 0 to Pred(jsonSubscriptions.Count) do
        subscriptions.Add(TAWS4DSNSModelSubscriptions.New(jsonSubscriptions.ItemAsJSONObject(i)));
    end;
  except
    subscriptions.Free;
    raise;
  end;

  FSubscriptions := TAWS4DCoreModelIterator<IAWS4DSNSSubscription>.New(subscriptions);
end;

class function TAWS4DSNSModelListSubscriptionsResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSNSListSubscriptionsResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

function TAWS4DSNSModelListSubscriptionsResponse<I>.NextToken: string;
begin
  result := FNextToken;
end;

function TAWS4DSNSModelListSubscriptionsResponse<I>.Subscriptions: IAWS4DIterator<IAWS4DSNSSubscription>;
begin
  result := FSubscriptions;
end;

end.
