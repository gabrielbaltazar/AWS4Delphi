unit AWS4D.SQS.Model.GetQueueAttributesRequest;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  System.JSON,
  System.Generics.Collections;

type TAWS4DSQSModelGetQueueAttributesRequest = class(TInterfacedObject, IAWS4DSQSModelGetQueueAttributesRequest)

  private
    FQueueUrl: string;
    FAttributes: TList<String>;

  protected
    function QueueUrl(Value: String): IAWS4DSQSModelGetQueueAttributesRequest; overload;

    function AddAttribute(Value: String): IAWS4DSQSModelGetQueueAttributesRequest;

    function Attributes: TList<String>;
    function QueueUrl: string; overload;

  public
    constructor create;
    destructor  Destroy; override;
    class function New: IAWS4DSQSModelGetQueueAttributesRequest;

end;

implementation

{ TAWS4DSQSModelGetQueueAttributesRequest }

function TAWS4DSQSModelGetQueueAttributesRequest.AddAttribute(Value: String): IAWS4DSQSModelGetQueueAttributesRequest;
begin
  Result := Self;
  if not FAttributes.Contains(Value) then
    FAttributes.Add(Value);
end;

function TAWS4DSQSModelGetQueueAttributesRequest.Attributes: TList<String>;
begin
  result := FAttributes;
end;

constructor TAWS4DSQSModelGetQueueAttributesRequest.create;
begin
  FAttributes := TList<String>.Create;
end;

destructor TAWS4DSQSModelGetQueueAttributesRequest.Destroy;
begin
  FAttributes.Free;
  inherited;
end;

class function TAWS4DSQSModelGetQueueAttributesRequest.New: IAWS4DSQSModelGetQueueAttributesRequest;
begin
  result := Self.create;
end;

function TAWS4DSQSModelGetQueueAttributesRequest.QueueUrl(Value: String): IAWS4DSQSModelGetQueueAttributesRequest;
begin
  Result := Self;
  FQueueUrl := Value;
end;

function TAWS4DSQSModelGetQueueAttributesRequest.QueueUrl: string;
begin
  result := FQueueUrl;
end;

end.
