unit AWS4D.SQS.Model.DeleteMessageBatchResponse;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces,
  System.JSON,
  System.Generics.Collections;

type TAWS4DSQSModelDeleteMessageBatchResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelDeleteMessageBatchResponse)

  private
    FSuccessful: TList<String>;
    FFailed: TDictionary<String, String>;

    procedure readSuccessful;
    procedure readFailed;
  protected
    function Successful: TList<String>;
    function Failed: TDictionary<string, String>;

  public
    constructor create(JSONString: String); override;
    class function New(JSONString: String): IAWS4DSQSModelDeleteMessageBatchResponse;
    destructor  Destroy; override;
end;

implementation

{ TAWS4DSQSModelDeleteMessageBatchResponse }

constructor TAWS4DSQSModelDeleteMessageBatchResponse.create(JSONString: String);
begin
  inherited;
  FSuccessful := TList<String>.create;
  FFailed     := TDictionary<string, string>.create;

  if not Assigned(FJSON) then
    Exit;

  readSuccessful;
  readFailed;
end;

destructor TAWS4DSQSModelDeleteMessageBatchResponse.Destroy;
begin
  FSuccessful.Free;
  FFailed.Free;
  inherited;
end;

function TAWS4DSQSModelDeleteMessageBatchResponse.Failed: TDictionary<string, String>;
begin
  result := Failed;
end;

class function TAWS4DSQSModelDeleteMessageBatchResponse.New(JSONString: String): IAWS4DSQSModelDeleteMessageBatchResponse;
begin
  Result := Self.create(JSONString);
end;

procedure TAWS4DSQSModelDeleteMessageBatchResponse.readFailed;
begin
  {TODO -oGabriel -cTask : See example with failed}
end;

procedure TAWS4DSQSModelDeleteMessageBatchResponse.readSuccessful;
var
  LJSON: TJSONObject;
  LJSONArray: TJSONArray;
  i: Integer;
  id: String;
begin
  LJSON := FJSON.GetValue('DeleteMessageBatchResponse')
                .GetValue<TJSONObject>('DeleteMessageBatchResult');

  if not Assigned(LJSON) then
    exit;

  if not LJSON.TryGetValue<TJSONArray>('Successful', LJSONArray) then
    exit;

  for i := 0 to Pred(LJSONArray.Count) do
  begin
    LJSON := LJSONArray.Items[i] as TJSONObject;
    if LJSON.TryGetValue<string>('Id', id) then
      FSuccessful.Add(id);
  end;
end;

function TAWS4DSQSModelDeleteMessageBatchResponse.Successful: TList<String>;
begin
  result := FSuccessful;
end;

end.
