unit AWS4D.SQS.Model.Interfaces;

interface

uses
  AWS4D.Model.Interfaces,
  System.Generics.Collections;

type
  IAWS4DSQSModelListQueuesRequest = interface(IAWS4DModelRequest)
    ['{B6162E16-4F71-4830-91D7-8433E64E1172}']
    function MaxResults      (Value: Integer): IAWS4DSQSModelListQueuesRequest; overload;
    function NextToken       (Value: string): IAWS4DSQSModelListQueuesRequest; overload;
    function QueueNamePrefix (Value: string): IAWS4DSQSModelListQueuesRequest; overload;

    function MaxResults      : Integer; overload;
    function NextToken       : string; overload;
    function QueueNamePrefix : string; overload;
  end;

  IAWS4DSQSModelListQueuesResult = interface(IAWS4DModelResponseMetadata)
    ['{3772C8BA-4901-4018-BAFB-37C2C27CB157}']
    function QueuesUrls: TList<String>;
    function NextToken: string;
  end;


implementation

end.
