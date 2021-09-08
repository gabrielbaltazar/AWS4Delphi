unit AWS4D.S3.Model.GetObjectProperties.Response;

interface

uses
  AWS4D.S3.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Model.Tag,
  System.Classes,
  System.SysUtils,
  System.Generics.Collections;

type TAWS4S3GetObjectPropertiesResponse<I: IInterface> = class(TInterfacedObject, IAWS4DS3GetObjectPropertiesResponse<I>)

  private
    [Weak]
    FParent: I;
    FProperties: IAWS4DIterator<IAWS4DCoreModelAttribute>;
    FMetaData: IAWS4DIterator<IAWS4DCoreModelAttribute>;

    function GetIteratorValue(AIterator: IAWS4DIterator<IAWS4DCoreModelAttribute>; Key: string): string;
  protected
    function Properties: IAWS4DIterator<IAWS4DCoreModelAttribute>;
    function MetaData: IAWS4DIterator<IAWS4DCoreModelAttribute>;

    function MetaDataValue(Key: String): string;
    function PropertyValue(Key: String): string;

    function &End: I;

  public
    constructor create(Parent: I; AProperties, AMetaData: TStrings);
    class function New(Parent: I; AProperties, AMetaData: TStrings): IAWS4DS3GetObjectPropertiesResponse<I>;
    destructor Destroy; override;

end;

implementation

constructor TAWS4S3GetObjectPropertiesResponse<I>.create(Parent: I; AProperties, AMetaData: TStrings);
begin
  FParent := Parent;
  FProperties := TAWS4DCoreModelAttribute.NewIterator(AProperties);
  FMetaData := TAWS4DCoreModelAttribute.NewIterator(AMetaData);
end;

destructor TAWS4S3GetObjectPropertiesResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4S3GetObjectPropertiesResponse<I>.&End: I;
begin
  result := FParent;
end;

function TAWS4S3GetObjectPropertiesResponse<I>.GetIteratorValue(AIterator: IAWS4DIterator<IAWS4DCoreModelAttribute>; Key: string): string;
var
  currentIndex: Integer;
begin
  Result := EmptyStr;
  currentIndex := AIterator.Index;
  try
    AIterator.First;
    while AIterator.HasNext do
    begin
      if AIterator.Current.Key = Key then
        Exit(AIterator.Current.Value);
    end;
  finally
    AIterator.First;
    if currentIndex > 0 then
    begin
      repeat
        AIterator.HasNext;
      until (AIterator.Index = currentIndex);
    end;
  end;
end;

function TAWS4S3GetObjectPropertiesResponse<I>.MetaData: IAWS4DIterator<IAWS4DCoreModelAttribute>;
begin
  result := FMetaData;
end;

function TAWS4S3GetObjectPropertiesResponse<I>.MetaDataValue(Key: String): string;
begin
  result := GetIteratorValue(FMetaData, Key);
end;

class function TAWS4S3GetObjectPropertiesResponse<I>.New(Parent: I; AProperties, AMetaData: TStrings): IAWS4DS3GetObjectPropertiesResponse<I>;
begin
  result := Self.create(Parent, AProperties, AMetaData);
end;

function TAWS4S3GetObjectPropertiesResponse<I>.Properties: IAWS4DIterator<IAWS4DCoreModelAttribute>;
begin
  result := FProperties;
end;

function TAWS4S3GetObjectPropertiesResponse<I>.PropertyValue(Key: String): string;
begin
  result := GetIteratorValue(FProperties, Key);
end;

end.
