unit AWS4D.S3.Model.DownloadObject.Response;

interface

uses
  AWS4D.S3.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,
  System.NetEncoding;

type TAWS4S3DownloadObjectResponse<I: IInterface> = class(TInterfacedObject, IAWS4DS3DownloadObjectResponse<I>)

  private
    [Weak]
    FParent: I;
    FStream: TMemoryStream;

  protected
    function Stream: TMemoryStream;
    function Base64: string;
    procedure SaveToFile(AFileName: String);

    function &End: I;

  public
    constructor create(Parent: I; AStream: TMemoryStream);
    class function New(Parent: I; AStream: TMemoryStream): IAWS4DS3DownloadObjectResponse<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4S3DownloadObjectResponse<I>.Base64: string;
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

constructor TAWS4S3DownloadObjectResponse<I>.create(Parent: I; AStream: TMemoryStream);
begin
  FParent := Parent;
  FStream := TMemoryStream.Create;
  try
    FStream.LoadFromStream(AStream);
  except
    FStream.Free;
    raise;
  end;
end;

destructor TAWS4S3DownloadObjectResponse<I>.Destroy;
begin
  FStream.Free;
  inherited;
end;

function TAWS4S3DownloadObjectResponse<I>.&End: I;
begin
  result := FParent;
end;

class function TAWS4S3DownloadObjectResponse<I>.New(Parent: I; AStream: TMemoryStream): IAWS4DS3DownloadObjectResponse<I>;
begin
  result := Self.create(Parent, AStream);
end;

procedure TAWS4S3DownloadObjectResponse<I>.SaveToFile(AFileName: String);
begin
  FStream.SaveToFile(AFileName);
end;

function TAWS4S3DownloadObjectResponse<I>.Stream: TMemoryStream;
begin
  Result := TMemoryStream.Create;
  try
    Result.LoadFromStream(FStream);
  except
    Result.Free;
    raise;
  end;
end;

end.
