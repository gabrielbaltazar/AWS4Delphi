unit AWS4D.HTTP.RestClient;

interface

uses
  AWS4D.Service.Interfaces,
  AWS4D.Model.Interfaces,
  AWS4D.HTTP.Interfaces,
  AWS4D.HTTP.Base,
  REST.Client,
  REST.Types,
  IPPeerClient,
  IPPeerCommon,
  Web.HTTPApp,
  System.SysUtils,
  System.Classes,
  System.DateUtils,
  AWS4D.Authorization.Interfaces,
  AWS4D.Authorization.Sign2HmacSHA256;

type TAWS4DHTTPRestClient = class(TAWS4DHTTPBase, IAWS4DHTTPRequest,
                                                  IAWS4DHTTPResponse)
  private
    FRestClient   : TRESTClient;
    FRestRequest  : TRESTRequest;
    FRestResponse : TRESTResponse;

    FAction : string;
    FHeaders: TStrings;
    FQueries: TStrings;

    function GetHTTPVerb: string;

    procedure PrepareRequest;
  protected
    // IAWS4DHTTPRequest
    function GET: IAWS4DHTTPRequest;
    function POST: IAWS4DHTTPRequest;
    function Action (Value: string): IAWS4DHTTPRequest;
    function BaseURL(Value: string): IAWS4DHTTPRequest;
    function Resource(Value: string): IAWS4DHTTPRequest;
    function AddHeader(Name, Value: String): IAWS4DHTTPRequest;
    function AddQuery(Name, Value: String): IAWS4DHTTPRequest;
    function Execute: IAWS4DHTTPResponse;

    function StatusCode: Integer;
    function StatusText: string;
    function Body: string;

  public
    constructor create(AWSService: IAWS4DService); override;
    class function New(AWSService: IAWS4DService): IAWS4DHTTPRequest;
    destructor Destroy; override;
end;

implementation

uses
  System.NetEncoding;

{ TAWS4DHTTPRestClient }

function TAWS4DHTTPRestClient.Action(Value: string): IAWS4DHTTPRequest;
begin
  result := Self;
  FAction := Value;
end;

function TAWS4DHTTPRestClient.AddHeader(Name, Value: String): IAWS4DHTTPRequest;
begin
  result := Self;
  FHeaders.Values[Name] := Value;
end;

function TAWS4DHTTPRestClient.AddQuery(Name, Value: String): IAWS4DHTTPRequest;
begin
  result := Self;
  FQueries.Values[Name] := Value;
end;

function TAWS4DHTTPRestClient.BaseURL(Value: string): IAWS4DHTTPRequest;
begin
  result := Self;
  FRestClient.BaseURL := Value;
end;

function TAWS4DHTTPRestClient.Body: string;
begin
  Result := FRestResponse.Content;
end;

constructor TAWS4DHTTPRestClient.create(AWSService: IAWS4DService);
begin
  inherited;
  FRestClient   := TRESTClient.Create(nil);
  FRestRequest  := TRESTRequest.Create(nil);
  FRestResponse := TRESTResponse.Create(nil);

  FRestRequest.Client   := FRestClient;
  FRestRequest.Response := FRestResponse;
  FRestClient.RaiseExceptionOn500 := True;

  FHeaders := TStringList.Create;
  FQueries := TStringList.Create;
end;

destructor TAWS4DHTTPRestClient.Destroy;
begin
  FRestClient.Free;
  FRestRequest.Free;
  FRestResponse.Free;
  FQueries.Free;
  FHeaders.Free;
  inherited;
end;

function TAWS4DHTTPRestClient.Execute: IAWS4DHTTPResponse;
begin
  result := Self;
  PrepareRequest;

  FRestRequest.Execute;
  if Self.StatusCode >= 400 then
    raise EAWS4DHTTPException.Create(Body);
end;

function TAWS4DHTTPRestClient.GET: IAWS4DHTTPRequest;
begin
  result := Self;
  FRestRequest.Method := rmGET;
end;

function TAWS4DHTTPRestClient.GetHTTPVerb: string;
begin
  case FRestRequest.Method of
    rmPOST   : result := 'POST';
    rmPUT    : result := 'PUT';
    rmGET    : result := 'GET';
    rmDELETE : result := 'DELETE';
    rmPATCH  : result := 'PATCH';
  end;
end;

class function TAWS4DHTTPRestClient.New(AWSService: IAWS4DService): IAWS4DHTTPRequest;
begin
  result := Self.create(AWSService);
end;

function TAWS4DHTTPRestClient.POST: IAWS4DHTTPRequest;
begin
  result := Self;
  FRestRequest.Method := rmPOST;
end;

procedure TAWS4DHTTPRestClient.PrepareRequest;
var
  i       : Integer;
  queries : string;
  value   : string;
  auth    : IAWS4DAuthorization;
begin
  auth := TAWS4DAuthorizationSign2HmacSHA256.New(Self.FAWSService);
  auth.URL(FRestClient.BaseURL)
      .Action(FAction);

  for i := 0 to Pred(FQueries.Count) do
    auth.AddQuery(FQueries.Names[i], FQueries.ValueFromIndex[i]);

  queries := auth.GenerateSignature(GetHTTPVerb);
  FQueries.Clear;
  FQueries.Delimiter       := '&';
  FQueries.StrictDelimiter := True;
  FQueries.DelimitedText   := queries;

  for i := 0 to Pred(FQueries.Count) do
  begin
    value := TNetEncoding.URL.Decode(FQueries.ValueFromIndex[i]);
    FRestRequest.AddParameter(FQueries.Names[i], value, pkGETorPOST);
  end;
end;

function TAWS4DHTTPRestClient.Resource(Value: string): IAWS4DHTTPRequest;
begin
  result := Self;
  FRestRequest.Resource := Value;
end;

function TAWS4DHTTPRestClient.StatusCode: Integer;
begin
  Result := FRestResponse.StatusCode;
end;

function TAWS4DHTTPRestClient.StatusText: string;
begin
  Result := FRestResponse.StatusText;
end;

end.
