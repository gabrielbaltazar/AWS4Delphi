unit AWS4D.SQS.Model.TagQueueRequest;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces,
  System.Generics.Collections;

type TAWS4DSQSModelTagQueueRequest = class(TInterfacedObject, IAWS4DSQSModelTagQueueRequest)

  private
    FTags: TDictionary<String, String>;
    FQueueUrl: string;

  protected
    function QueueUrl(Value: String): IAWS4DSQSModelTagQueueRequest; overload;
    function AddTag(Key, Value: string): IAWS4DSQSModelTagQueueRequest;

    function QueueUrl: string; overload;
    function Tags: TDictionary<String, String>;

  public
    constructor create;
    destructor Destroy; override;
    class function New: IAWS4DSQSModelTagQueueRequest;
end;

implementation

{ TAWS4DSQSModelTagQueueRequest }

function TAWS4DSQSModelTagQueueRequest.AddTag(Key, Value: string): IAWS4DSQSModelTagQueueRequest;
begin
  result := Self;
  FTags.AddOrSetValue(Key, Value);
end;

constructor TAWS4DSQSModelTagQueueRequest.create;
begin
  FTags := TDictionary<String, String>.create;
end;

destructor TAWS4DSQSModelTagQueueRequest.Destroy;
begin
  FTags.Free;
  inherited;
end;

class function TAWS4DSQSModelTagQueueRequest.New: IAWS4DSQSModelTagQueueRequest;
begin
  result := Self.create;
end;

function TAWS4DSQSModelTagQueueRequest.QueueUrl(Value: String): IAWS4DSQSModelTagQueueRequest;
begin
  result := Self;
  FQueueUrl := Value;
end;

function TAWS4DSQSModelTagQueueRequest.QueueUrl: string;
begin
  result := FQueueUrl;
end;

function TAWS4DSQSModelTagQueueRequest.Tags: TDictionary<String, String>;
begin
  result := FTags;
end;

end.
