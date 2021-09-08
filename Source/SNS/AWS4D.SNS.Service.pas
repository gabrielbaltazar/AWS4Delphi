unit AWS4D.SNS.Service;

interface

uses
  AWS4D.SNS.Service.Interfaces,
  AWS4D.Core.Model.Types,
  GBClient.Interfaces,
  System.Classes,
  System.SysUtils,
  System.JSON;

type TAWS4DSNSService = class(TInterfacedObject, IAWS4DServiceSNS)

  private
    FService: string;
    FAccessKey: String;
    FSecretKey: String;
    FRegion: TAWS4DRegion;

    function Host: string;

  protected
    function AccessKey(Value: String): IAWS4DServiceSNS;
    function SecretKey(Value: String): IAWS4DServiceSNS;
    function Region(Value: String): IAWS4DServiceSNS; overload;
    function Region(Value: TAWS4DRegion): IAWS4DServiceSNS; overload;

    function ListSubscriptions: IAWS4DServiceSNS;

  public
    constructor create;
    class function New: IAWS4DServiceSNS;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSService }

function TAWS4DSNSService.AccessKey(Value: String): IAWS4DServiceSNS;
begin
  result := Self;
  FAccessKey := Value;
end;

constructor TAWS4DSNSService.create;
begin
  FService := 'sns';
  FRegion := aws4dUSEast1;
end;

destructor TAWS4DSNSService.Destroy;
begin

  inherited;
end;

function TAWS4DSNSService.Host: string;
begin
  Result := Format('https://sns.%s.amazonaws.com', [FRegion.toString]);
end;

function TAWS4DSNSService.ListSubscriptions: IAWS4DServiceSNS;
var
  request: IGBClientRequest;
  json: string;
begin
  result := Self;
  request := NewClientRequest;
  request
    .GET
    .BaseURL(Host)
    .Accept('application/json')
    .Authorization
      .AWSv4
        .AccessKey(FAccessKey)
        .SecretKey(FSecretKey)
        .Region(FRegion.toString)
        .Service(FService)
    .&End
    .Params
      .QueryAddOrSet('Action', 'ListSubscriptions')
      .HeaderAddOrSet('Accept', 'application/json', False)
    .&End
    .Send;

  json := request.Response.GetText;
  with TStringList.Create do
  try
    Text := json;
    SaveToFile('test.json');
  finally
    Free;
  end;
end;

class function TAWS4DSNSService.New: IAWS4DServiceSNS;
begin
  result := Self.create;
end;

function TAWS4DSNSService.Region(Value: String): IAWS4DServiceSNS;
begin
  result := Self;
  FRegion.fromString(Value);
end;

function TAWS4DSNSService.Region(Value: TAWS4DRegion): IAWS4DServiceSNS;
begin
  result := Self;
  FRegion := Value;
end;

function TAWS4DSNSService.SecretKey(Value: String): IAWS4DServiceSNS;
begin
  result := Self;
  FSecretKey := Value;
end;

end.
