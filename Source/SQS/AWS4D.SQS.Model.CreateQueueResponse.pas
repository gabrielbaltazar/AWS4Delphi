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
    function QueueUrl: string; overload;

  public
    function QueueUrl(Value: String): TAWS4DSQSModelCreateQueueResponse; overload;

    constructor create; overload; override;
    class function New: IAWS4DSQSModelCreateQueueResponse; overload;

    constructor create(AJSONString: string); overload; override;
    class function New(AJSONString: string): IAWS4DSQSModelCreateQueueResponse; overload;
end;

implementation

{ TAWS4DSQSModelCreateQueueResponse }

constructor TAWS4DSQSModelCreateQueueResponse.create(AJSONString: string);
begin
  inherited;
  if not Assigned(FJSON) then
    Exit;
end;

constructor TAWS4DSQSModelCreateQueueResponse.create;
begin
  inherited;
end;

class function TAWS4DSQSModelCreateQueueResponse.New(AJSONString: string): IAWS4DSQSModelCreateQueueResponse;
begin
  Result := Self.create(AJSONString);
end;

function TAWS4DSQSModelCreateQueueResponse.QueueUrl(Value: String): TAWS4DSQSModelCreateQueueResponse;
begin
  result := Self;
  FQueueUrl := Value;
end;

function TAWS4DSQSModelCreateQueueResponse.QueueUrl: string;
begin
  result := FQueueUrl;
end;

class function TAWS4DSQSModelCreateQueueResponse.New: IAWS4DSQSModelCreateQueueResponse;
begin
  result := Self.create;
end;

end.
