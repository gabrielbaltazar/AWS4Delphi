unit AWS4D.Core.Model.Types;

interface

uses
  System.SysUtils;

type
  IAWS4DIterator<T> = interface
    ['{9D00D1BF-8A07-46DC-BD14-AC7D08662EE1}']
    function First: IAWS4DIterator<T>;
    function HasNext: Boolean;
    function Index: Integer; overload;
    function Current: T;
    function Last: T;
    function Count: Integer;

    function Index(AValue: Integer): IAWS4DIterator<T>; overload;
  end;

  IAWS4DCoreModelAttribute = interface
    ['{8891CDBC-D18C-4763-AFDB-BCA67859C833}']
    function Key: string; overload;
    function Value: string; overload;

    function Key(AValue: string): IAWS4DCoreModelAttribute; overload;
    function Value(AValue: string): IAWS4DCoreModelAttribute; overload;
  end;

  TAWS4DACLType = (aws4dNotSpecified, aws4dPrivate, aws4dPublicRead,
    aws4dPublicReadWrite, aws4dAuthenticatedRead, aws4dBucketOwnerRead,
    aws4dBucketOwnerFullControl, aws4dAWSExecRead, aws4dLogDeliveryWrite);

  /// <summary>Regions which can be used with Amazon Services.</summary>
  TAWS4DRegion = (aws4dNotEspecified, aws4dEUWest1, aws4dEUCentral1,
    aws4dUSEast1, aws4dUSWest1, aws4dUSWest2, aws4dAPSoutheast1,
    aws4dAPSoutheast2, aws4dAPNortheast1, aws4dAPNortheast2,
    aws4dSAEast1, aws4dUSClassic, aws4dEU);

  TAWS4DRegionHelper = record helper for TAWS4DRegion
  public
    function ToString: string;
    procedure FromString(AValue: string);
  end;

implementation

{ TAWS4DRegionHelper }

procedure TAWS4DRegionHelper.FromString(AValue: string);
var
  LRegion: string;
begin
  LRegion := AValue.ToLower;
  if LRegion.Equals(aws4dEUWest1.ToString) then
  begin
    Self := aws4dEUWest1;
    Exit;
  end;

  if LRegion.Equals(aws4dEUCentral1.ToString) then
  begin
    Self := aws4dEUCentral1;
    Exit;
  end;

  if LRegion.Equals(aws4dUSEast1.ToString) then
  begin
    Self := aws4dUSEast1;
    Exit;
  end;

  if LRegion.Equals(aws4dUSWest1.ToString) then
  begin
    Self := aws4dUSWest1;
    Exit;
  end;

  if LRegion.Equals(aws4dUSWest2.ToString) then
  begin
    Self := aws4dUSWest2;
    Exit;
  end;

  if LRegion.Equals(aws4dAPSoutheast1.ToString) then
  begin
    Self := aws4dAPSoutheast1;
    Exit;
  end;

  if LRegion.Equals(aws4dAPSoutheast2.ToString) then
  begin
    Self := aws4dAPSoutheast2;
    Exit;
  end;

  if LRegion.Equals(aws4dAPNortheast1.ToString) then
  begin
    Self := aws4dAPNortheast1;
    Exit;
  end;

  if LRegion.Equals(aws4dAPNortheast2.ToString) then
  begin
    Self := aws4dAPNortheast2;
    Exit;
  end;

  if LRegion.Equals(aws4dSAEast1.ToString) then
  begin
    Self := aws4dSAEast1;
    Exit;
  end;
end;

function TAWS4DRegionHelper.ToString: string;
begin
  Result := 'us-east-1';
  case Self of
    aws4dEUWest1:
      Result := 'eu-west-1';
    aws4dEUCentral1:
      Result := 'eu-central-1';
    aws4dUSEast1:
      Result := 'us-east-1';
    aws4dUSWest1:
      Result := 'us-west-1';
    aws4dUSWest2:
      Result := 'us-west-2';
    aws4dAPSoutheast1:
      Result := 'ap-southeast-1';
    aws4dAPSoutheast2:
      Result := 'ap-southeast-2';
    aws4dAPNortheast1:
      Result := 'ap-northeast-1';
    aws4dAPNortheast2:
      Result := 'ap-northeast-2';
    aws4dSAEast1:
      Result := 'sa-east-1';
  end;
end;

end.
