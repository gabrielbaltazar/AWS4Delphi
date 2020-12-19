unit AWS4D.HTTP.Interfaces;

interface

uses
  AWS4D.Service.Interfaces,
  System.Classes,
  System.SysUtils;

type
  IAWS4DHTTPResponse = interface;

  IAWS4DHTTPRequest = interface
    ['{9DF105AD-F4E5-4CA8-9FD1-925300C99014}']
    function Action (Value: string): IAWS4DHTTPRequest;
    function BaseURL(Value: string): IAWS4DHTTPRequest;
    function Resource(Value: string): IAWS4DHTTPRequest;
    function GET: IAWS4DHTTPRequest;
    function POST: IAWS4DHTTPRequest;

    function AddHeader(Name, Value: String): IAWS4DHTTPRequest;
    function AddQuery(Name, Value: String): IAWS4DHTTPRequest;

    function Execute: IAWS4DHTTPResponse;
  end;

  IAWS4DHTTPResponse = interface
    ['{98E7583C-EB58-4287-AB0F-2A93499B74F1}']
    function StatusCode: Integer;
    function StatusText: string;
    function Body: string;
  end;

function HTTPRequest(AWSService: IAWS4DService): IAWS4DHTTPRequest;

implementation

uses
  AWS4D.HTTP.RestClient;

function HTTPRequest(AWSService: IAWS4DService): IAWS4DHTTPRequest;
begin
  result := TAWS4DHTTPRestClient.New(AWSService);
end;

end.
