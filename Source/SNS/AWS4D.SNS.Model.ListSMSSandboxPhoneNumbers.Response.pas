unit AWS4D.SNS.Model.ListSMSSandboxPhoneNumbers.Response;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  System.Generics.Collections,
  System.JSON,
  AWS4D.Core.Helper.JSON,
  System.SysUtils;

type
  TAWS4DSNSModelSMSSandboxPhoneNumber = class(TInterfacedObject, IAWS4DSNSSMSSandboxPhoneNumber)
  private
    FPhoneNumber: String;
    FStatus: String;

  protected
    function PhoneNumber: string; overload;
    function Status: string; overload;

  public
    constructor create(JSON: TJSONObject);
    class function New(JSON: TJSONObject): IAWS4DSNSSMSSandboxPhoneNumber;
  end;

  TAWS4DSNSModelListSMSSandboxPhoneNumbersResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSNSListSMSSandboxPhoneNumbersResponse<I>)
  private
    [Weak]
    FParent: I;
    FNextToken: string;
    FPhoneNumbers: IAWS4DIterator<IAWS4DSNSSMSSandboxPhoneNumber>;

    procedure FromJSON(Value: TJSONObject);

  protected
    function NextToken: string;
    function PhoneNumbers: IAWS4DIterator<IAWS4DSNSSMSSandboxPhoneNumber>;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSNSListSMSSandboxPhoneNumbersResponse<I>;
    destructor Destroy; override;
  end;

implementation

{ TAWS4DSNSModelSMSSandboxPhoneNumber }

constructor TAWS4DSNSModelSMSSandboxPhoneNumber.create(JSON: TJSONObject);
begin
  if not Assigned(JSON) then
    Exit;

  FPhoneNumber := JSON.ValueAsString('PhoneNumber');
  FStatus := JSON.ValueAsString('Status');
end;

class function TAWS4DSNSModelSMSSandboxPhoneNumber.New(JSON: TJSONObject): IAWS4DSNSSMSSandboxPhoneNumber;
begin
  result := Self.create(JSON);
end;

function TAWS4DSNSModelSMSSandboxPhoneNumber.PhoneNumber: string;
begin
  result := FPhoneNumber;
end;

function TAWS4DSNSModelSMSSandboxPhoneNumber.Status: string;
begin
  result := FStatus;
end;

{ TAWS4DSNSModelListSMSSandboxPhoneNumbersResponse<I> }

constructor TAWS4DSNSModelListSMSSandboxPhoneNumbersResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FromJSON(JSON);
end;

destructor TAWS4DSNSModelListSMSSandboxPhoneNumbersResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelListSMSSandboxPhoneNumbersResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4DSNSModelListSMSSandboxPhoneNumbersResponse<I>.FromJSON(Value: TJSONObject);
var
  LJSON: TJSONObject;
  LJSONPhones: TJSONArray;
  phones: TList<IAWS4DSNSSMSSandboxPhoneNumber>;
  i: Integer;
begin
  inherited;
  if not Assigned(Value) then
    Exit;

  LJSON := Value.ValueAsJSONObject('ListSMSSandboxPhoneNumbersResponse')
                .ValueAsJSONObject('ListSMSSandboxPhoneNumbersResult');

  FNextToken := LJSON.ValueAsString('NextToken');
  phones := TList<IAWS4DSNSSMSSandboxPhoneNumber>.Create;
  try
    LJSONPhones := LJSON.ValueAsJSONArray('PhoneNumbers');
    if Assigned(LJSONPhones) then
    begin
      for i := 0 to Pred(LJSONPhones.Count) do
        phones.Add(TAWS4DSNSModelSMSSandboxPhoneNumber.New(LJSONPhones.ItemAsJSONObject(i)));
    end;
  except
    phones.Free;
    raise;
  end;

  FPhoneNumbers := TAWS4DCoreModelIterator<IAWS4DSNSSMSSandboxPhoneNumber>.New(phones);
end;

class function TAWS4DSNSModelListSMSSandboxPhoneNumbersResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSNSListSMSSandboxPhoneNumbersResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

function TAWS4DSNSModelListSMSSandboxPhoneNumbersResponse<I>.NextToken: string;
begin
  result := FNextToken;
end;

function TAWS4DSNSModelListSMSSandboxPhoneNumbersResponse<I>.PhoneNumbers: IAWS4DIterator<IAWS4DSNSSMSSandboxPhoneNumber>;
begin
  result := FPhoneNumbers;
end;

end.
