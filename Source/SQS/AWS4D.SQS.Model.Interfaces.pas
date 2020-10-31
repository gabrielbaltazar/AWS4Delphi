unit AWS4D.SQS.Model.Interfaces;

interface

uses
  AWS4D.Model.Interfaces,
  System.Generics.Collections;

type
  EAWS4DHTTPException = AWS4D.Model.Interfaces.EAWS4DHTTPException;

  IAWS4DSQSModelListQueuesRequest = interface(IAWS4DModelRequest)
    ['{B6162E16-4F71-4830-91D7-8433E64E1172}']
    function MaxResults      (Value: Integer): IAWS4DSQSModelListQueuesRequest; overload;
    function NextToken       (Value: string): IAWS4DSQSModelListQueuesRequest; overload;
    function QueueNamePrefix (Value: string): IAWS4DSQSModelListQueuesRequest; overload;

    function MaxResults      : Integer; overload;
    function NextToken       : string; overload;
    function QueueNamePrefix : string; overload;
  end;

  IAWS4DSQSModelListQueuesResponse = interface(IAWS4DModelResponseMetadata)
    ['{3772C8BA-4901-4018-BAFB-37C2C27CB157}']
    function QueuesUrls: TList<String>;
    function NextToken: string;
  end;

  IAWS4DSQSModelListQueueTagsResponse = interface(IAWS4DModelResponseMetadata)
    ['{03CA6BFE-4171-4EBC-903A-655E5D5EE3C4}']
    function Tags: TDictionary<String, String>;
  end;

  IAWS4DSQSModelFactory = interface
    ['{764198C1-DD25-4001-8AA7-1732E3CA3C56}']
    function ListQueuesRequest: IAWS4DSQSModelListQueuesRequest;
  end;

function SQSModelFactory: IAWS4DSQSModelFactory;

implementation

uses
  AWS4D.SQS.Model.Factory;

function SQSModelFactory: IAWS4DSQSModelFactory;
begin
  result := TAWS4DSQSModelFactory.GetInstance;
end;

end.
