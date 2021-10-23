unit AWS4D.SNS.Model.CheckIfPhoneNumberIsOptedOut.Response;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  System.JSON,
  AWS4D.Core.Helper.JSON;

type TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSNSCheckIfPhoneNumberIsOptedOutResponse<I>)

  private
    [Weak]
    FParent: I;
    FIsOptedOut: Boolean;

    procedure FromJSON(Value: TJSONObject);

  protected
    function IsOptedOut: Boolean;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSNSCheckIfPhoneNumberIsOptedOutResponse<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutResponse<I> }

constructor TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FromJSON(JSON);
end;

destructor TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutResponse<I>.FromJSON(Value: TJSONObject);
var
  json: TJSONObject;
begin
  inherited;
  if not Assigned(Value) then
    Exit;

  json := Value.ValueAsJSONObject('CheckIfPhoneNumberIsOptedOutResponse')
               .ValueAsJSONObject('CheckIfPhoneNumberIsOptedOutResult');

  FIsOptedOut := json.ValueAsBoolean('isOptedOut', False);

end;

function TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutResponse<I>.IsOptedOut: Boolean;
begin

end;

class function TAWS4DSNSModelCheckIfPhoneNumberIsOptedOutResponse<I>.New(
  Parent: I;
  JSON: TJSONObject): IAWS4DSNSCheckIfPhoneNumberIsOptedOutResponse<I>;
begin

end;

end.
