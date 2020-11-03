unit AWS4D.SQS.Model.UntagQueueRequest;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  System.Generics.Collections;

type TAWS4DSQSModelUntagQueueRequest = class(TInterfacedObject, IAWS4DSQSModelUntagQueueRequest)

  private
    FQueueUrl: string;
    FTags: TList<String>;

  protected
    function QueueUrl(Value: String): IAWS4DSQSModelUntagQueueRequest; overload;
    function AddTag(Key: string): IAWS4DSQSModelUntagQueueRequest;

    function QueueUrl: string; overload;
    function Tags: TList<String>;

  public
    constructor create;
    destructor  Destroy; override;
    class function New: IAWS4DSQSModelUntagQueueRequest;
end;

implementation

{ TAWS4DSQSModelUntagQueueRequest }

function TAWS4DSQSModelUntagQueueRequest.AddTag(Key: string): IAWS4DSQSModelUntagQueueRequest;
begin
  result := Self;
  FTags.Add(Key);
end;

constructor TAWS4DSQSModelUntagQueueRequest.create;
begin
  FTags := TList<String>.create;
end;

destructor TAWS4DSQSModelUntagQueueRequest.Destroy;
begin
  FTags.Free;
  inherited;
end;

class function TAWS4DSQSModelUntagQueueRequest.New: IAWS4DSQSModelUntagQueueRequest;
begin
  result := Self.create;
end;

function TAWS4DSQSModelUntagQueueRequest.QueueUrl: string;
begin
  result := FQueueUrl;
end;

function TAWS4DSQSModelUntagQueueRequest.QueueUrl(Value: String): IAWS4DSQSModelUntagQueueRequest;
begin
  result := Self;
  FQueueUrl := Value;
end;

function TAWS4DSQSModelUntagQueueRequest.Tags: TList<String>;
begin
  result := FTags;
end;

end.
