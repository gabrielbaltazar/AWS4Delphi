unit AWS4D.S3.Model.CreateObject.Request;

interface

uses
  AWS4D.S3.Model.Interfaces,
  AWS4D.Core.Model.Types,
  System.SysUtils,
  System.Classes;

type TAWS4DS3CreateObjectRequest<I: IInterface> = class(TInterfacedObject, IAWS4DS3CreateObjectRequest<I>)

  private
    [Weak]
    FParent: I;
    FOwnerStream: Boolean;
    FMetaInfo: TStrings;
    FBucketName: string;
    FContentType: string;
    FFileName: String;
    FFileStream: TStream;
    FACLType: TAWS4DACLType;
    FObjectName: string;
  protected
    function BucketName(Value: String): IAWS4DS3CreateObjectRequest<I>; overload;
    function ContentType(Value: string): IAWS4DS3CreateObjectRequest<I>; overload;
    function FileName(Value: String): IAWS4DS3CreateObjectRequest<I>; overload;
    function FileStream(Value: TStream): IAWS4DS3CreateObjectRequest<I>; overload;
    function ObjectName(Value: String): IAWS4DS3CreateObjectRequest<I>; overload;
    function ACLType(AValue: TAWS4DACLType): IAWS4DS3CreateObjectRequest<I>; overload;

    function AddMetaInfo(Key, Value: String): IAWS4DS3CreateObjectRequest<I>;

    function BucketName: string; overload;
    function ContentType: string; overload;
    function FileName: string; overload;
    function ObjectName: String; overload;
    function ACLType: TAWS4DACLType; overload;
    function FileStream: TStream; overload;
    function MetaInfo: TStrings;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DS3CreateObjectRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DS3CreateObjectRequest<I>.ACLType: TAWS4DACLType;
begin
  Result := FACLType;
end;

function TAWS4DS3CreateObjectRequest<I>.ACLType(AValue: TAWS4DACLType): IAWS4DS3CreateObjectRequest<I>;
begin
  Result := Self;
  FACLType := AValue;
end;

function TAWS4DS3CreateObjectRequest<I>.AddMetaInfo(Key, Value: String): IAWS4DS3CreateObjectRequest<I>;
begin
  result := Self;
  FMetaInfo.Values[Key] := Value;
end;

function TAWS4DS3CreateObjectRequest<I>.BucketName(Value: String): IAWS4DS3CreateObjectRequest<I>;
begin
  result := Self;
  FBucketName := Value;
end;

function TAWS4DS3CreateObjectRequest<I>.BucketName: string;
begin
  Result := FBucketName;
end;

function TAWS4DS3CreateObjectRequest<I>.ContentType: string;
begin
  Result := FContentType;
end;

function TAWS4DS3CreateObjectRequest<I>.ContentType(Value: string): IAWS4DS3CreateObjectRequest<I>;
begin
  Result := Self;
  FContentType := Value;
end;

constructor TAWS4DS3CreateObjectRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FACLType := aws4dPrivate;
  FOwnerStream := False;
  FMetaInfo := TStringList.Create;
  FContentType := 'text/xml';
//  FMetaInfo.Values['Content-type'] := FContentType;
end;

destructor TAWS4DS3CreateObjectRequest<I>.Destroy;
begin
  FMetaInfo.Free;
  if FOwnerStream then
    FFileStream.Free;
  inherited;
end;

function TAWS4DS3CreateObjectRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DS3CreateObjectRequest<I>.FileName(Value: String): IAWS4DS3CreateObjectRequest<I>;
begin
  result := Self;
  FFileName := Value;

  if FOwnerStream then
    FreeAndNil(FFileStream);

  FOwnerStream := True;
  FFileStream := TMemoryStream.Create;
  try
    TMemoryStream(FFileStream).LoadFromFile(Value);
    FFileStream.Position := 0;
  except
    FFileStream.Free;
    raise;
  end;
end;

function TAWS4DS3CreateObjectRequest<I>.FileName: string;
begin
  result := FFileName;
end;

function TAWS4DS3CreateObjectRequest<I>.FileStream(Value: TStream): IAWS4DS3CreateObjectRequest<I>;
begin
  result := Self;
  FreeAndNil(FFileStream);
  FOwnerStream := False;
  FFileStream  := Value;
end;

function TAWS4DS3CreateObjectRequest<I>.FileStream: TStream;
begin
  result := FFileStream;
end;

function TAWS4DS3CreateObjectRequest<I>.MetaInfo: TStrings;
begin
  Result := FMetaInfo;
end;

class function TAWS4DS3CreateObjectRequest<I>.New(Parent: I): IAWS4DS3CreateObjectRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DS3CreateObjectRequest<I>.ObjectName(Value: String): IAWS4DS3CreateObjectRequest<I>;
begin
  result := Self;
  FObjectName := Value;
end;

function TAWS4DS3CreateObjectRequest<I>.ObjectName: String;
begin
  result := FObjectName;
end;

end.
