unit AWS4D.SQS.Model.Factory;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.SQS.Model.Classes,
  System.SysUtils;

type TAWS4DSQSModelFactory = class(TInterfacedObject, IAWS4DSQSModelFactory)

  private
    class var FInstance: IAWS4DSQSModelFactory;

    constructor createPrivate;
  protected
    function ListQueuesRequest: IAWS4DSQSModelListQueuesRequest;
    function ReceiveMessageRequest: IAWS4DSQSModelReceiveMessageRequest;

  public
    constructor create;
    class function GetInstance: IAWS4DSQSModelFactory;
end;

implementation

{ TAWS4DSQSModelFactory }

constructor TAWS4DSQSModelFactory.create;
begin
  raise Exception.CreateFmt('Use the class function GetInstance.', []);
end;

constructor TAWS4DSQSModelFactory.createPrivate;
begin
end;

function TAWS4DSQSModelFactory.ListQueuesRequest: IAWS4DSQSModelListQueuesRequest;
begin
  result := TAWS4DSQSModelListQueuesRequest.New;
end;

function TAWS4DSQSModelFactory.ReceiveMessageRequest: IAWS4DSQSModelReceiveMessageRequest;
begin
  Result := TAWS4DSQSModelReceiveMessageRequest.New;
end;

class function TAWS4DSQSModelFactory.GetInstance: IAWS4DSQSModelFactory;
begin
  if not Assigned(FInstance) then
    FInstance := TAWS4DSQSModelFactory.createPrivate;
  result := FInstance;

end;

end.
