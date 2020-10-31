unit AWS4D.SQS.Model.ListQueuesRequest;

interface

uses
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSModelListQueuesRequest = class(TInterfacedObject, IAWS4DSQSModelListQueuesRequest)

  private
    FMaxResults      : Integer;
    FNextToken       : string;
    FQueueNamePrefix : string;

  protected
    function MaxResults      (Value: Integer): IAWS4DSQSModelListQueuesRequest; overload;
    function NextToken       (Value: string): IAWS4DSQSModelListQueuesRequest; overload;
    function QueueNamePrefix (Value: string): IAWS4DSQSModelListQueuesRequest; overload;

    function MaxResults      : Integer; overload;
    function NextToken       : string; overload;
    function QueueNamePrefix : string; overload;

  public
    class function New: IAWS4DSQSModelListQueuesRequest;

end;

implementation

{ TAWS4DSQSModelListQueuesRequest }

function TAWS4DSQSModelListQueuesRequest.MaxResults: Integer;
begin
  result := FMaxResults;
end;

function TAWS4DSQSModelListQueuesRequest.MaxResults(Value: Integer): IAWS4DSQSModelListQueuesRequest;
begin
  result := Self;
  FMaxResults := Value;
end;

class function TAWS4DSQSModelListQueuesRequest.New: IAWS4DSQSModelListQueuesRequest;
begin
  result := Self.Create;
end;

function TAWS4DSQSModelListQueuesRequest.NextToken(Value: string): IAWS4DSQSModelListQueuesRequest;
begin
  result := Self;
  FNextToken := Value;
end;

function TAWS4DSQSModelListQueuesRequest.NextToken: string;
begin
  result := FNextToken;
end;

function TAWS4DSQSModelListQueuesRequest.QueueNamePrefix: string;
begin
  result := FQueueNamePrefix;
end;

function TAWS4DSQSModelListQueuesRequest.QueueNamePrefix(Value: string): IAWS4DSQSModelListQueuesRequest;
begin
  result := Self;
  FQueueNamePrefix := Value;
end;

end.
