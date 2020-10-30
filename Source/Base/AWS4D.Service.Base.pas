unit AWS4D.Service.Base;

interface

uses
  AWS4D.Service.Interfaces;

type TAWS4DServiceBase = class(TInterfacedObject, IAWS4DService)

  private
    FRegion      : string;
    FAccessKeyID : string;
    FSecretKey   : string;

  protected
    function Region      (Value: String): IAWS4DService; overload;
    function AccessKeyID (Value: String): IAWS4DService; overload;
    function SecretKey   (Value: String): IAWS4DService; overload;

    function Region      : String; overload;
    function AccessKeyID : string; overload;
    function SecretKey   : string; overload;
end;

implementation

{ TAWS4DServiceBase }

function TAWS4DServiceBase.AccessKeyID(Value: String): IAWS4DService;
begin
  result := Self;
  FAccessKeyID := Value;
end;

function TAWS4DServiceBase.AccessKeyID: string;
begin
  result := FAccessKeyID;
end;

function TAWS4DServiceBase.Region: String;
begin
  result := FRegion;
end;

function TAWS4DServiceBase.Region(Value: String): IAWS4DService;
begin
  result := Self;
  FRegion := Value;
end;

function TAWS4DServiceBase.SecretKey(Value: String): IAWS4DService;
begin
  FSecretKey := Value;
  Result := Self;
end;

function TAWS4DServiceBase.SecretKey: string;
begin
  result := FSecretKey;
end;

end.
