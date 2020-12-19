unit AWS4D.SQS.Model.PurgeQueueResponse;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSModelPurgeQueueResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelPurgeQueueResponse)

  public
    class function New(JSONString: String): IAWS4DSQSModelPurgeQueueResponse;
end;

implementation

{ TAWS4DSQSModelPurgeQueueResponse }

class function TAWS4DSQSModelPurgeQueueResponse.New(JSONString: String): IAWS4DSQSModelPurgeQueueResponse;
begin
  result := Self.create(JSONString);
end;

end.
