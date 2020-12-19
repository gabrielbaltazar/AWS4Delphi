unit AWS4D.Authorization.Sign2HmacSHA256;

interface

uses
  AWS4D.Authorization.Interfaces,
  AWS4D.Authorization.Base,
  AWS4D.Service.Interfaces,
  AWS4D.Utils,
  System.Classes,
  System.SysUtils,
  System.Hash,
  System.NetEncoding;

type TAWS4DAuthorizationSign2HmacSHA256 = class(TAWS4DAuthorizationBase, IAWS4DAuthorization)

  protected
    function GenerateSignature(HttpVerb: string; Content: TStream = nil): string; override;

  public
    class function New(AWSService: IAWS4DService): IAWS4DAuthorization;
end;

implementation

{ TAWS4DAuthorizationSign2HmacSHA256 }

function TAWS4DAuthorizationSign2HmacSHA256.GenerateSignature(HttpVerb: string; Content: TStream): string;
var
  url     : string;
  queries : string;
  sign    : string;
  hashed  : TBytes;
  i       : Integer;
begin
  BuildQueryParams;
  try
    url := BuildPrefix(HttpVerb);
    url := url + BuildURL;
//    url := Format(HttpVerb + #$A + '%s' + #$A + '/' + #$A, [FURL]);

    for i := 0 to Pred(FQuery.Count) do
    begin
      if i > 0 then
        queries := queries + '&';
      queries := queries + FQuery.Names[i] + '=' + URLEncodeValue(FQuery.ValueFromIndex[i]);
    end;

    hashed := THashSHA2.GetHMACAsBytes(url + queries, GetSHAKey);
    sign   := URLEncodeValue( TNetEncoding.Base64.EncodeBytesToString(hashed) );

    result := queries + '&Signature=' + sign;
  finally
    FQuery.Clear;
  end;
end;

class function TAWS4DAuthorizationSign2HmacSHA256.New(AWSService: IAWS4DService): IAWS4DAuthorization;
begin
  result := Self.create(AWSService);
end;

end.
