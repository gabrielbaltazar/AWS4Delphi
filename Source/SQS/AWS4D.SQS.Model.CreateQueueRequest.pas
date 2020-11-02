unit AWS4D.SQS.Model.CreateQueueRequest;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces,
  System.Generics.Collections;

type TAWS4DSQSModelCreateQueueRequest = class(TInterfacedObject, IAWS4DSQSModelCreateQueueRequest)

  private
    FQueueName: string;
    FTags: TDictionary<String, String>;
    FAttributes: TDictionary<String, String>;

  protected
    function QueueName: string; overload;
    function QueueName(Value: String): IAWS4DSQSModelCreateQueueRequest; overload;

    function AddTag(Key, Value: String): IAWS4DSQSModelCreateQueueRequest;
    function AddAttribute(Key, Value: String): IAWS4DSQSModelCreateQueueRequest;

    function Tags: TDictionary<String, String>;
    function Attributes: TDictionary<String, String>;

  public
    constructor create;
    destructor  Destroy; override;
    class function New: IAWS4DSQSModelCreateQueueRequest;

end;

implementation

{ TAWS4DSQSModelCreateQueueRequest }

function TAWS4DSQSModelCreateQueueRequest.AddAttribute(Key, Value: String): IAWS4DSQSModelCreateQueueRequest;
begin
  result := Self;
  FAttributes.AddOrSetValue(Key, Value);
end;

function TAWS4DSQSModelCreateQueueRequest.AddTag(Key, Value: String): IAWS4DSQSModelCreateQueueRequest;
begin
  result := Self;
  FTags.AddOrSetValue(Key, Value);
end;

function TAWS4DSQSModelCreateQueueRequest.Attributes: TDictionary<String, String>;
begin
  result := FAttributes;
end;

constructor TAWS4DSQSModelCreateQueueRequest.create;
begin
  FAttributes := TDictionary<String, String>.Create;
  FTags := TDictionary<String, String>.Create;
end;

destructor TAWS4DSQSModelCreateQueueRequest.Destroy;
begin
  FAttributes.Free;
  FTags.Free;
  inherited;
end;

class function TAWS4DSQSModelCreateQueueRequest.New: IAWS4DSQSModelCreateQueueRequest;
begin
  result := Self.create;
end;

function TAWS4DSQSModelCreateQueueRequest.QueueName: string;
begin
  result := FQueueName;
end;

function TAWS4DSQSModelCreateQueueRequest.QueueName(Value: String): IAWS4DSQSModelCreateQueueRequest;
begin
  result := Self;
  FQueueName := Value;
end;

function TAWS4DSQSModelCreateQueueRequest.Tags: TDictionary<String, String>;
begin
  result := FTags;
end;

end.
