unit AWS4D.S3.Model.ObjectCreate.Request;

interface

uses
  AWS4D.S3.Model.Interfaces,
  System.SysUtils,
  System.Classes;

type TAWS4DS3ObjectCreateRequest<I: IInterface> = class(TInterfacedObject, IAWS4DS3ObjectCreateRequest<I>)

  private
    [Weak]
    FParent: I;
    FOwnerStream: Boolean;
    FMetaInfo: TStrings;
    FBucketName: string;
    FFileName: String;
    FFileStream: TStream;
    FObjectName: string;


  protected
    function BucketName(Value: String): IAWS4DS3ObjectCreateRequest<I>; overload;
    function FileName(Value: String): IAWS4DS3ObjectCreateRequest<I>; overload;
    function FileStream(Value: TStream): IAWS4DS3ObjectCreateRequest<I>; overload;
    function ObjectName(Value: String): IAWS4DS3ObjectCreateRequest<I>; overload;

    function AddMetaInfo(Key, Value: String): IAWS4DS3ObjectCreateRequest<I>;

    function BucketName: string; overload;
    function FileName: string; overload;
    function ObjectName: String; overload;
    function FileStream: TStream; overload;
    function MetaInfo: TStrings;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DS3ObjectCreateRequest<I>;
    destructor Destroy; override;

end;

implementation

function TAWS4DS3ObjectCreateRequest<I>.AddMetaInfo(Key, Value: String): IAWS4DS3ObjectCreateRequest<I>;
begin
  result := Self;
  FMetaInfo.Values[Key] := Value;
end;

function TAWS4DS3ObjectCreateRequest<I>.BucketName(Value: String): IAWS4DS3ObjectCreateRequest<I>;
begin
  result := Self;
  FBucketName := Value;
end;

function TAWS4DS3ObjectCreateRequest<I>.BucketName: string;
begin
  Result := FBucketName;
end;

constructor TAWS4DS3ObjectCreateRequest<I>.create(Parent: I);
begin
  FParent := Parent;
  FOwnerStream := False;
  FMetaInfo := TStringList.Create;
  FMetaInfo.Values['Content-type'] := 'text/xml';
end;

destructor TAWS4DS3ObjectCreateRequest<I>.Destroy;
begin
  FMetaInfo.Free;
  if FOwnerStream then
    FFileStream.Free;
  inherited;
end;

function TAWS4DS3ObjectCreateRequest<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4DS3ObjectCreateRequest<I>.FileName(Value: String): IAWS4DS3ObjectCreateRequest<I>;
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

function TAWS4DS3ObjectCreateRequest<I>.FileName: string;
begin
  result := FFileName;
end;

function TAWS4DS3ObjectCreateRequest<I>.FileStream(Value: TStream): IAWS4DS3ObjectCreateRequest<I>;
begin
  result := Self;
  FreeAndNil(FFileStream);
  FOwnerStream := False;
  FFileStream  := Value;
end;

function TAWS4DS3ObjectCreateRequest<I>.FileStream: TStream;
begin
  result := FFileStream;
end;

function TAWS4DS3ObjectCreateRequest<I>.MetaInfo: TStrings;
begin
  Result := FMetaInfo;
end;

class function TAWS4DS3ObjectCreateRequest<I>.New(Parent: I): IAWS4DS3ObjectCreateRequest<I>;
begin
  result := Self.create(Parent);
end;

function TAWS4DS3ObjectCreateRequest<I>.ObjectName(Value: String): IAWS4DS3ObjectCreateRequest<I>;
begin
  result := Self;
  FObjectName := Value;
end;

function TAWS4DS3ObjectCreateRequest<I>.ObjectName: String;
begin
  result := FObjectName;
end;

end.
