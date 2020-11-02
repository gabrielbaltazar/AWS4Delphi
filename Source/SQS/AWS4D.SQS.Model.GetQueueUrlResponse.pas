unit AWS4D.SQS.Model.GetQueueUrlResponse;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Model.ResponseMetadata,
  System.JSON,
  System.SysUtils;

type TAWS4DSQSModelGetQueueUrlResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelGetQueueUrlResponse)

  private
    FQueueUrl: String;

  protected
    function QueueUrl: string;

  public
    constructor create(JSONString: String); override;
    class function New(JSONString: String): IAWS4DSQSModelGetQueueUrlResponse;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSQSModelGetQueueUrlResponse }

constructor TAWS4DSQSModelGetQueueUrlResponse.create(JSONString: String);
var
  LJSON: TJSONObject;
begin
  inherited;
  if not Assigned(FJSON) then
    Exit;

  LJSON := FJSON.GetValue('GetQueueUrlResponse')
                .GetValue<TJSONObject>('GetQueueUrlResult');

  if Assigned(LJSON) then
    LJSON.TryGetValue<string>('QueueUrl', FQueueUrl);
end;

destructor TAWS4DSQSModelGetQueueUrlResponse.Destroy;
begin

  inherited;
end;

class function TAWS4DSQSModelGetQueueUrlResponse.New(JSONString: String): IAWS4DSQSModelGetQueueUrlResponse;
begin
  result := Self.create(JSONString);
end;

function TAWS4DSQSModelGetQueueUrlResponse.QueueUrl: string;
begin
  result := FQueueUrl;
end;

end.
