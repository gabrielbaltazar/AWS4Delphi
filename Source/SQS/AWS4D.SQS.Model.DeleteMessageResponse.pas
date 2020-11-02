unit AWS4D.SQS.Model.DeleteMessageResponse;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSModelDeleteMessageResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelDeleteMessageResponse)

  public
    class function New(JSONString: String): IAWS4DSQSModelDeleteMessageResponse;
end;

implementation

{ TAWS4DSQSModelDeleteMessageResponse }

class function TAWS4DSQSModelDeleteMessageResponse.New(JSONString: String): IAWS4DSQSModelDeleteMessageResponse;
begin
  result := Self.create(JSONString);
end;

end.
