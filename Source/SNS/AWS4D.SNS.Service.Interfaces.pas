unit AWS4D.SNS.Service.Interfaces;

interface

uses
  AWS4D.Core.Model.Types,
  AWS4D.SNS.Model.Interfaces;

type
  IAWS4DSNSService<I: IInterface> = interface
    ['{D7028158-A96E-4C0F-8A99-4756BECE476E}']
    function AccessKey(Value: String): IAWS4DSNSService<I>;
    function SecretKey(Value: String): IAWS4DSNSService<I>;
    function Region(Value: String): IAWS4DSNSService<I>; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSNSService<I>; overload;

    function CreateTopic(Request: IAWS4DSNSCreateTopicRequest<I>): IAWS4DSNSCreateTopicResponse<I>;
    procedure DeleteTopic(Request: IAWS4DSNSDeleteTopicRequest<I>);
    function ListSubscriptions(Request: IAWS4DSNSListSubscriptionsRequest<I>): IAWS4DSNSListSubscriptionsResponse<I>;
    function ListTopics(Request: IAWS4DSNSListTopicsRequest<I>): IAWS4DSNSListTopicsResponse<I>;
    procedure SetTopicAttributes(Request: IAWS4DSNSSetTopicAttributesRequest<I>);
    function Subscribe(Request: IAWS4DSNSSubscribeRequest<I>): IAWS4DSNSSubscribeResponse<I>;
    procedure Unsubscribe(Request: IAWS4DSNSUnsubscribeRequest<I>);

    function Parent(Value: I): IAWS4DSNSService<I>;
    function &End: I;
  end;

implementation

end.
