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

    function Index(Value: Integer): IAWS4DIterator<T>; overload;
  end;

  IAWS4DCoreModelAttribute = interface
    ['{8891CDBC-D18C-4763-AFDB-BCA67859C833}']
    function Key: String; overload;
    function Value: string; overload;

    function Key(Value: String): IAWS4DCoreModelAttribute; overload;
    function Value(AValue: string): IAWS4DCoreModelAttribute; overload;
  end;

  /// <summary>Regions which can be used with Amazon Services.</summary>
  TAWS4DRegion = (aws4dEUWest1,
                  aws4dEUCentral1,
                  aws4dUSEast1,
                  aws4dUSWest1,
                  aws4dUSWest2,
                  aws4dAPSoutheast1,
                  aws4dAPSoutheast2,
                  aws4dAPNortheast1,
                  aws4dAPNortheast2,
                  aws4dSAEast1);

  TAWS4DRegionHelper = record helper for TAWS4DRegion
  public
    function toString: string;
    procedure fromString(Value: String);
  end;

implementation

{ TAWS4DRegionHelper }

procedure TAWS4DRegionHelper.fromString(Value: String);
var
  region: string;
begin
  region := Value.ToLower;
  if region.Equals(aws4dEUWest1.toString) then
  begin
    Self := aws4dEUWest1;
    Exit;
  end;

  if region.Equals(aws4dEUCentral1.toString) then
  begin
    Self := aws4dEUCentral1;
    Exit;
  end;

  if region.Equals(aws4dUSEast1.toString) then
  begin
    Self := aws4dUSEast1;
    Exit;
  end;

  if region.Equals(aws4dUSWest1.toString) then
  begin
    Self := aws4dUSWest1;
    Exit;
  end;

  if region.Equals(aws4dUSWest2.toString) then
  begin
    Self := aws4dUSWest2;
    Exit;
  end;

  if region.Equals(aws4dAPSoutheast1.toString) then
  begin
    Self := aws4dAPSoutheast1;
    Exit;
  end;

  if region.Equals(aws4dAPSoutheast2.toString) then
  begin
    Self := aws4dAPSoutheast2;
    Exit;
  end;

  if region.Equals(aws4dAPNortheast1.toString) then
  begin
    Self := aws4dAPNortheast1;
    Exit;
  end;

  if region.Equals(aws4dAPNortheast2.toString) then
  begin
    Self := aws4dAPNortheast2;
    Exit;
  end;

  if region.Equals(aws4dSAEast1.toString) then
  begin
    Self := aws4dSAEast1;
    Exit;
  end;
end;

function TAWS4DRegionHelper.toString: string;
begin
  result := 'us-east-1';
  case Self of
    aws4dEUWest1      : result := 'eu-west-1';
    aws4dEUCentral1   : result := 'eu-central-1';
    aws4dUSEast1      : result := 'us-east-1';
    aws4dUSWest1      : result := 'us-west-1';
    aws4dUSWest2      : result := 'us-west-2';
    aws4dAPSoutheast1 : result := 'ap-southeast-1';
    aws4dAPSoutheast2 : result := 'ap-southeast-2';
    aws4dAPNortheast1 : result := 'ap-northeast-1';
    aws4dAPNortheast2 : result := 'ap-northeast-2';
    aws4dSAEast1      : result := 'sa-east-1';
  end;
end;

end.
