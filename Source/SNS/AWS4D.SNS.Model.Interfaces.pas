unit AWS4D.SNS.Model.Interfaces;

interface

uses
  AWS4D.Core.Model.Types;

type
  IAWS4DSNSListSubscriptionsResponse<I: IInterface> = interface;

  IAWS4DSNSListSubscriptionsRequest<I: IInterface> = interface
    ['{3BCC7E93-2749-4B9B-8147-06EFC5EC5EDB}']
    function NextToken(Value: String): IAWS4DSNSListSubscriptionsRequest<I>; overload;
    function NextToken: String; overload;

    function TopicArn(Value: String): IAWS4DSNSListSubscriptionsRequest<I>; overload;
    function TopicArn: String; overload;

    function &End: I;
  end;

  IAWS4DSNSSubscription = interface
    ['{54A16395-9D34-4B7A-A710-B650BC2446C8}']
    function Endpoint: String;
    function Owner: string;
    function Protocol: String;
    function SubscriptionArn: String;
    function TopicArn: string;
  end;

  IAWS4DSNSListSubscriptionsResponse<I: IInterface> = interface
    ['{C17BDB10-C92B-41FF-BD83-6869669BF4D9}']
    function NextToken: string;
    function Subscriptions: IAWS4DIterator<IAWS4DSNSSubscription>;

    function &End: I;
  end;

  IAWS4DSNSListTopicsRequest<I: IInterface> = interface
    ['{E011D208-1C63-4DC0-96DF-78EE8BA4C92A}']
    function NextToken(Value: String): IAWS4DSNSListTopicsRequest<I>; overload;
    function NextToken: String; overload;

    function &End: I;
  end;

  IAWS4DSNSListTopicsResponse<I> = interface
    ['{A44CCB8A-FBDA-448F-BF34-6F9D7256FCF4}']
    function NextToken: String;
    function Topics: IAWS4DIterator<String>;
  end;

implementation

end.
