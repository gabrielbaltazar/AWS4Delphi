unit Unit1;

interface

uses
  AWS4D.SQS.Model.Interfaces;

type TAWS4DSQSModelListQueueTagsRequest<I: IInterface> = class(TInterfacedObject, IAWS4DSQSListQueueTagRequest<I>)

  private
    [Weak]
    FParent: I;
    FMaxResults: Integer;
    FNextToken: string;
    FQueueNamePrefix: string;

  protected
    function MaxResults(Value: Integer): IAWS4DSQSListQueuesRequest<I>; overload;
    function NextToken(Value: String): IAWS4DSQSListQueuesRequest<I>; overload;
    function QueueNamePrefix(Value: String): IAWS4DSQSListQueuesRequest<I>; overload;

    function MaxResults: Integer; overload;
    function NextToken: String; overload;
    function QueueNamePrefix: string; overload;

    function &End: I;

  public
    constructor create(Parent: I);
    class function New(Parent: I): IAWS4DSQSListQueuesRequest<I>;
    destructor Destroy; override;

end;

implementation

end.
