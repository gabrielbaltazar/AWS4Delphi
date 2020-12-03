unit AWS4D.S3.Model.DownloadObject.Response;

interface

uses
  AWS4D.Model.ResponseMetadata,
  AWS4D.S3.Model.Interfaces,
  System.Classes,
  System.SysUtils,
  System.NetEncoding;

type TAWS4DS3ModelDownloadObjectResponse = class(TAWS4DModelResponseMetadata, IAWS4DS3ModelDownloadObjectResponse)

  private
    FStream: TMemoryStream;

  protected
    function Stream: TMemoryStream;
    function Base64: string;
    procedure SaveToFile(AFileName: String);

  public
    constructor create(AStream: TMemoryStream);
    class function New(AStream: TMemoryStream): IAWS4DS3ModelDownloadObjectResponse;
    destructor Destroy; override;
end;

implementation

{ TAWS4DS3ModelDownloadObjectResponse }

function TAWS4DS3ModelDownloadObjectResponse.Base64: string;
var
  stringStream: TStringStream;
begin
  stringStream := TStringStream.Create;
  try
    TNetEncoding.Base64.Encode(FStream, stringStream);
    result := stringStream.DataString
                .Replace(#$A, EmptyStr)
                .Replace(#$D, EmptyStr);
  finally
    stringStream.Free;
  end;
end;

constructor TAWS4DS3ModelDownloadObjectResponse.create(AStream: TMemoryStream);
begin
  FStream := AStream;
end;

destructor TAWS4DS3ModelDownloadObjectResponse.Destroy;
begin
  FStream.Free;
  inherited;
end;

class function TAWS4DS3ModelDownloadObjectResponse.New(AStream: TMemoryStream): IAWS4DS3ModelDownloadObjectResponse;
begin
  result := Self.create(AStream);
end;

procedure TAWS4DS3ModelDownloadObjectResponse.SaveToFile(AFileName: String);
begin
  FStream.SaveToFile(AFileName);
end;

function TAWS4DS3ModelDownloadObjectResponse.Stream: TMemoryStream;
begin
  result := FStream;
end;

end.
