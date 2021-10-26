unit AWS4D.SNS.Model.GetSMSSandboxAccountStatus.Response;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  System.JSON,
  AWS4D.Core.Helper.JSON;

type TAWS4DSNSModelGetSMSSandboxAccountStatusResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSNSGetSMSSandboxAccountStatusResponse<I>)

  private
    [Weak]
    FParent: I;
    FIsInSandbox: Boolean;

    procedure FromJSON(Value: TJSONObject);

  protected
    function IsInSandbox: Boolean;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSNSGetSMSSandboxAccountStatusResponse<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelGetSMSSandboxAccountStatusResponse<I> }

constructor TAWS4DSNSModelGetSMSSandboxAccountStatusResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FIsInSandbox := False;

  FromJSON(JSON);
end;

destructor TAWS4DSNSModelGetSMSSandboxAccountStatusResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelGetSMSSandboxAccountStatusResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4DSNSModelGetSMSSandboxAccountStatusResponse<I>.FromJSON(Value: TJSONObject);
var
  LJSON: TJSONObject;
begin
  inherited;
  if not Assigned(Value) then
    Exit;

  LJSON := Value.ValueAsJSONObject('GetSMSSandboxAccountStatusResponse')
               .ValueAsJSONObject('GetSMSSandboxAccountStatusResult');

  FIsInSandbox := LJSON.ValueAsBoolean('IsInSandbox', False);

end;

function TAWS4DSNSModelGetSMSSandboxAccountStatusResponse<I>.IsInSandbox: Boolean;
begin
  result := FIsInSandbox;
end;

class function TAWS4DSNSModelGetSMSSandboxAccountStatusResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSNSGetSMSSandboxAccountStatusResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

end.
