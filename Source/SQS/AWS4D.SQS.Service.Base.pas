unit AWS4D.SQS.Service.Base;

interface

uses
  AWS4D.SQS.Service.Interfaces,
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.Classes,
  AWS4D.Service.Base,
  AWS4D.HTTP.Interfaces,
  System.Classes,
  System.SysUtils;

type TAWS4DSQSServiceBase = class(TAWS4DServiceBase, IAWS4DServiceSQS)

  private
    function GetURL: string;

    function PrepareRequest(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest): IAWS4DHTTPRequest;

  protected
    function ListQueues(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest = nil): IAWS4DSQSModelListQueuesResponse;

  public
    class function New: IAWS4DServiceSQS;
end;

implementation

{ TAWS4DSQSServiceBase }

function TAWS4DSQSServiceBase.GetURL: string;
begin
  result := Format('https://sqs.%s.amazonaws.com', [Self.Region]);
end;

function TAWS4DSQSServiceBase.ListQueues(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest = nil): IAWS4DSQSModelListQueuesResponse;
var
  json: string;
begin
  json := PrepareRequest(ListQueuesRequest).Execute.Body;
  result := TAWS4DSQSModelListQueuesResponse.New(json);
end;

class function TAWS4DSQSServiceBase.New: IAWS4DServiceSQS;
begin
  Result := Self.Create;
end;

function TAWS4DSQSServiceBase.PrepareRequest(ListQueuesRequest: IAWS4DSQSModelListQueuesRequest): IAWS4DHTTPRequest;
begin
  Result := HTTPRequest(Self)
              .GET
              .BaseURL(GetURL)
              .Action('ListQueues');

  if not Assigned( ListQueuesRequest ) then
    Exit;

  if ListQueuesRequest.MaxResults > 0 then
    Result.AddQuery('MaxResults', ListQueuesRequest.MaxResults.ToString);

  if not ListQueuesRequest.NextToken.IsEmpty then
    Result.AddQuery('NextToken', ListQueuesRequest.NextToken);

  if not ListQueuesRequest.QueueNamePrefix.IsEmpty then
    Result.AddQuery('QueueNamePrefix', ListQueuesRequest.QueueNamePrefix);

end;

end.
