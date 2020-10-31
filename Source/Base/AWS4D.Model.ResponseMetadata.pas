unit AWS4D.Model.ResponseMetadata;

interface

uses
  AWS4D.Model.Interfaces,
  System.JSON;

type TAWS4DModelResponseMetadata = class(TInterfacedObject, IAWS4DModelResponseMetadata)

  private
    FRequestId: String;

  protected
    FJSON: TJSONObject;

    function RequestId: string; overload;

  public
    function RequestId(Value: String): TAWS4DModelResponseMetadata; overload;

    constructor create; overload; virtual;
    constructor create(JSONString: String); overload; virtual;
    destructor Destroy; override;
end;

implementation

{ TAWS4DModelResponseMetadata }

constructor TAWS4DModelResponseMetadata.create;
begin

end;

constructor TAWS4DModelResponseMetadata.create(JSONString: String);
var
  LJSON: TJSONObject;
begin
  create;
  FJSON := TJSONObject.ParseJSONValue(JSONString) as TJSONObject;

  LJSON := FJSON.Pairs[0].JsonValue as TJSONObject;
  if Assigned(LJSON) then
  begin
    LJSON := LJSON.GetValue('ResponseMetadata') as TJSONObject;
    LJSON.TryGetValue<String>('RequestId', FRequestId);
  end;
end;

destructor TAWS4DModelResponseMetadata.Destroy;
begin
  FJSON.Free;
  inherited;
end;

function TAWS4DModelResponseMetadata.RequestId(Value: String): TAWS4DModelResponseMetadata;
begin
  result := Self;
  FRequestId := Value;
end;

function TAWS4DModelResponseMetadata.RequestId: string;
begin
  result := FRequestId;
end;

end.
