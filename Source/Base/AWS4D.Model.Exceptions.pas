unit AWS4D.Model.Exceptions;

interface

uses
  System.SysUtils,
  System.JSON;

type
  EAWS4DException = class(Exception)
  end;

  EAWS4DHTTPException = class(EAWS4DException)
  private
    FRequestId: String;
    FCode: string;
    FType: string;

  public
    property RequestId: string read FRequestId write FRequestId;
    property Code: String read FCode write FCode;
    property &Type: string read FType write FType;

    constructor create(AJsonString: String);
  end;

implementation

{ EAWS4DHTTPException }

constructor EAWS4DHTTPException.create(AJsonString: String);
var
  json: TJSONObject;
  jsonError: TJSONObject;
begin
  Message := AJsonString;

  json := TJSONObject.ParseJSONValue(AJsonString) as TJSONObject;
  if Assigned(json) then
  try
    json.TryGetValue<string>('RequestId', FRequestId);
    if not json.TryGetValue<TJSONObject>('Error', jsonError) then
      Exit;

    Message := jsonError.GetValue<String>('Message');
    jsonError.TryGetValue<String>('Code', FCode);
    jsonError.TryGetValue<String>('Type', FType);

  finally
    json.Free;
  end;
end;

end.
