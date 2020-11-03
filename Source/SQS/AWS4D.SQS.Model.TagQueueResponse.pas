unit AWS4D.SQS.Model.TagQueueResponse;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSModelTagQueueResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelTagQueueResponse)

  public
    class function New(JSONString: String): IAWS4DSQSModelTagQueueResponse;
end;

implementation

{ TAWS4DSQSModelTagQueueResponse }

class function TAWS4DSQSModelTagQueueResponse.New(JSONString: String): IAWS4DSQSModelTagQueueResponse;
begin
  result := Self.create(JSONString);
end;

end.
