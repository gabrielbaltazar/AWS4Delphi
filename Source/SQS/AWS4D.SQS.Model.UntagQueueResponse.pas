unit AWS4D.SQS.Model.UntagQueueResponse;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSModelUntagQueueResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelUntagQueueResponse)

  public
    class function New(JSONString: String): IAWS4DSQSModelUntagQueueResponse;
end;

implementation

{ TAWS4DSQSModelUntagQueueResponse }

class function TAWS4DSQSModelUntagQueueResponse.New(JSONString: String): IAWS4DSQSModelUntagQueueResponse;
begin
  result := Self.create(JSONString);
end;

end.
