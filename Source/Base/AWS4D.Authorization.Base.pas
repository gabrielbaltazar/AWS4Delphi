unit AWS4D.Authorization.Base;

interface

uses
  AWS4D.Authorization.Interfaces,
  AWS4D.Service.Interfaces,
  System.Classes,
  System.SysUtils,
  System.DateUtils;

type TAWS4DAuthorizationBase = class(TInterfacedObject, IAWS4DAuthorization)

  private
    [Weak]
    FAWSService: IAWS4DService;

  protected
    FURL: string;
    FAction: String;
    FActionQuery: TStrings;
    FQuery: TStrings;

    function URL     (Value: String): IAWS4DAuthorization;
    function Action  (Value: String): IAWS4DAuthorization;
    function AddQuery(Name, Value: String): IAWS4DAuthorization;

    function GenerateSignature(HttpVerb: string; Content: TStream = nil): string; virtual; abstract;

    function GetSignatureMethod: string; virtual;
    function GetSignatureVersion: string; virtual;
    function GetCurrentTime: string; virtual;
    function GetServiceVersion: string; virtual;
    function GetSHAKey: TBytes; virtual;

    procedure BuildQueryParams; virtual;
  public
    constructor create(AWSService: IAWS4DService);
    destructor  Destroy; override;
end;

implementation

{ TAWS4DAuthorizationBase }

function TAWS4DAuthorizationBase.Action(Value: String): IAWS4DAuthorization;
begin
  result := Self;
  FAction := Value;
end;

function TAWS4DAuthorizationBase.AddQuery(Name, Value: String): IAWS4DAuthorization;
begin
  result := Self;
  if not Assigned(FActionQuery) then
    FActionQuery := TStringList.Create;
  FActionQuery.AddPair(Name, Value);
end;

procedure TAWS4DAuthorizationBase.BuildQueryParams;
var
  i: Integer;
begin
  if not Assigned(FQuery) then
    FQuery := TStringList.Create;
  FQuery.Clear;
  FQuery.AddPair('AWSAccessKeyId', FAWSService.AccessKeyID)
        .AddPair('Action', FAction);

  if Assigned(FActionQuery) then
    for i := 0 to Pred(FActionQuery.Count) do
      FQuery.AddPair(FActionQuery.Names[i], FActionQuery.ValueFromIndex[i]);

  FQuery.AddPair('SignatureMethod', GetSignatureMethod)
        .AddPair('SignatureVersion', GetSignatureVersion)
        .AddPair('Timestamp', GetCurrentTime)
        .AddPair('Version', GetServiceVersion);
end;

constructor TAWS4DAuthorizationBase.create(AWSService: IAWS4DService);
begin
  FAWSService := AWSService;
end;

destructor TAWS4DAuthorizationBase.Destroy;
begin
  FQuery.Free;
  FActionQuery.Free;
  inherited;
end;

function TAWS4DAuthorizationBase.GetCurrentTime: string;
begin
  result := FormatDateTime('yyyy-mm-dd"T"hh:nn:ss.zzz"Z"', TTimeZone.Local.ToUniversalTime(Now),
                           TFormatSettings.Create('en-US'));
end;

function TAWS4DAuthorizationBase.GetServiceVersion: string;
begin
  Result := '2012-11-05';
end;

function TAWS4DAuthorizationBase.GetSHAKey: TBytes;
begin
  result := TEncoding.UTF8.GetBytes(FAWSService.SecretKey);
end;

function TAWS4DAuthorizationBase.GetSignatureMethod: string;
begin
  result := 'HmacSHA256';
end;

function TAWS4DAuthorizationBase.GetSignatureVersion: string;
begin
  result := '2';
end;

function TAWS4DAuthorizationBase.URL(Value: String): IAWS4DAuthorization;
begin
  result := Self;
  FURL   := Value.Replace('https://', EmptyStr);

  if FURL.EndsWith('?') then
    FURL := Copy(FURL, 1, FURL.Length - 1);

  if FURL.EndsWith('/') then
    FURL := Copy(FURL, 1, FURL.Length - 1);
end;

end.
