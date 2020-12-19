unit AWS4D.SQS.Model.DeleteMessageBatchRequest;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  System.Generics.Collections;

type TAWS4DSQSModelDeleteMessageBatchRequest = class(TInterfacedObject, IAWS4DSQSModelDeleteMessageBatchRequest)

  private
    FQueueUrl: String;
    FReceiptHandle: TDictionary<String, String>;

  protected
    function QueueUrl(Value: String): IAWS4DSQSModelDeleteMessageBatchRequest; overload;
    function AddReceiptHandle(Id, ReceiptHandle: String): IAWS4DSQSModelDeleteMessageBatchRequest;

    function QueueUrl: string; overload;
    function ReceiptHandle: TDictionary<String, String>;

  public
    constructor create;
    destructor  Destroy; override;
    class function New: IAWS4DSQSModelDeleteMessageBatchRequest;
end;

implementation

{ TAWS4DSQSModelDeleteMessageBatchRequest }

function TAWS4DSQSModelDeleteMessageBatchRequest.AddReceiptHandle(Id, ReceiptHandle: String): IAWS4DSQSModelDeleteMessageBatchRequest;
begin
  result := Self;
  FReceiptHandle.AddOrSetValue(Id, ReceiptHandle);
end;

constructor TAWS4DSQSModelDeleteMessageBatchRequest.create;
begin
  FReceiptHandle := TDictionary<String, String>.create;
end;

destructor TAWS4DSQSModelDeleteMessageBatchRequest.Destroy;
begin
  FReceiptHandle.Free;
  inherited;
end;

class function TAWS4DSQSModelDeleteMessageBatchRequest.New: IAWS4DSQSModelDeleteMessageBatchRequest;
begin
  result := Self.create;
end;

function TAWS4DSQSModelDeleteMessageBatchRequest.QueueUrl(Value: String): IAWS4DSQSModelDeleteMessageBatchRequest;
begin
  result := Self;
  FQueueUrl := Value;
end;

function TAWS4DSQSModelDeleteMessageBatchRequest.QueueUrl: string;
begin
  Result := FQueueUrl;
end;

function TAWS4DSQSModelDeleteMessageBatchRequest.ReceiptHandle: TDictionary<String, String>;
begin
  result := FReceiptHandle;
end;

end.
