unit AWS4D.S3.Model.GetObjectProperties.Response;

interface

uses
  AWS4D.Model.ResponseMetadata,
  AWS4D.S3.Model.Interfaces,
  System.Classes,
  System.SysUtils;

type TAWS4DS3ModelGetObjectPropertiesResponse = class(TAWS4DModelResponseMetadata, IAWS4DS3ModelGetObjectPropertiesResponse)

  private
    FMetaData: TStrings;
    FProperties: TStrings;

  protected
    function PropertyValue(Key: String): string; overload;
    function PropertyValue(Index: Integer): string; overload;
    function PropertyKey(Index: Integer): string;
    function MetaDataValue(Key: String): string; overload;
    function MetaDataValue(Index: Integer): string; overload;
    function MetaDataKey(Index: Integer): string;

    function PropertyCount: Integer;
    function MetaDataCount: Integer;

  public
    constructor create(MetaData, Properties: TStrings);
    class function New(MetaData, Properties: TStrings): IAWS4DS3ModelGetObjectPropertiesResponse;
    destructor Destroy; override;
end;

implementation

{ TAWS4DS3ModelGetObjectPropertiesResponse }

constructor TAWS4DS3ModelGetObjectPropertiesResponse.create(MetaData, Properties: TStrings);
begin
  FProperties := TStringList.Create;
  FMetaData := TStringList.Create;

  FProperties.Text := Properties.Text;
  FMetaData.Text := MetaData.Text;
end;

destructor TAWS4DS3ModelGetObjectPropertiesResponse.Destroy;
begin
  FProperties.Free;
  FMetaData.Free;
  inherited;
end;

function TAWS4DS3ModelGetObjectPropertiesResponse.MetaDataValue(Index: Integer): string;
begin
  result := FMetaData[Index];
end;

function TAWS4DS3ModelGetObjectPropertiesResponse.MetaDataValue(Key: String): string;
begin
  result := FMetaData.Values[Key];
end;

class function TAWS4DS3ModelGetObjectPropertiesResponse.New(MetaData, Properties: TStrings): IAWS4DS3ModelGetObjectPropertiesResponse;
begin
  result := Self.create(MetaData, Properties);
end;

function TAWS4DS3ModelGetObjectPropertiesResponse.PropertyValue(Index: Integer): string;
begin
  result := FProperties[Index];
end;

function TAWS4DS3ModelGetObjectPropertiesResponse.PropertyValue(Key: String): string;
begin
  result := FProperties.Values[Key];
end;

function TAWS4DS3ModelGetObjectPropertiesResponse.MetaDataCount: Integer;
begin
  result := FMetaData.Count;
end;

function TAWS4DS3ModelGetObjectPropertiesResponse.MetaDataKey(Index: Integer): string;
begin
  result := FMetaData.Names[Index];
end;

function TAWS4DS3ModelGetObjectPropertiesResponse.PropertyCount: Integer;
begin
  result := FProperties.Count;
end;

function TAWS4DS3ModelGetObjectPropertiesResponse.PropertyKey(Index: Integer): string;
begin
  result := FProperties.Names[Index];
end;

end.
