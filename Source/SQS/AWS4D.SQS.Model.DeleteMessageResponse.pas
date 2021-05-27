unit AWS4D.SQS.Model.DeleteMessageResponse;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSModelDeleteMessageResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelDeleteMessageResponse)

  public
    class function New: IAWS4DSQSModelDeleteMessageResponse; overload;
    class function New(JSONString: String): IAWS4DSQSModelDeleteMessageResponse; overload;
end;

implementation

{ TAWS4DSQSModelDeleteMessageResponse }

class function TAWS4DSQSModelDeleteMessageResponse.New(JSONString: String): IAWS4DSQSModelDeleteMessageResponse;
begin
  result := Self.create(JSONString);
end;

class function TAWS4DSQSModelDeleteMessageResponse.New: IAWS4DSQSModelDeleteMessageResponse;
begin
  result := Self.create;
end;

end.
