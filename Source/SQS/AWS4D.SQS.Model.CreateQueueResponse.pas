unit AWS4D.SQS.Model.CreateQueueResponse;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces,
  System.JSON;

type TAWS4DSQSModelCreateQueueResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelCreateQueueResponse)

  private
    FQueueUrl: string;

  protected
    function QueueUrl: string;

  public
    constructor create(AJSONString: string); override;
    class function New(AJSONString: string): IAWS4DSQSModelCreateQueueResponse;
end;

implementation

{ TAWS4DSQSModelCreateQueueResponse }

constructor TAWS4DSQSModelCreateQueueResponse.create(AJSONString: string);
begin
  inherited;
  if not Assigned(FJSON) then
    Exit;
end;

class function TAWS4DSQSModelCreateQueueResponse.New(AJSONString: string): IAWS4DSQSModelCreateQueueResponse;
begin
  Result := Self.create(AJSONString);
end;

function TAWS4DSQSModelCreateQueueResponse.QueueUrl: string;
begin
  result := FQueueUrl;
end;

end.
