unit AWS4D.SQS.Model.DeleteQueueResponse;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSModelDeleteQueueResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelDeleteQueueResponse)

  public
    class function New(JSONString: String): IAWS4DSQSModelDeleteQueueResponse;
end;

implementation

{ TAWS4DSQSModelDeleteQueueResponse }

class function TAWS4DSQSModelDeleteQueueResponse.New(JSONString: String): IAWS4DSQSModelDeleteQueueResponse;
begin
  Result := Self.create(JSONString);
end;

end.
