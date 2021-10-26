unit AWS4D.SNS.Model.Publish.Response;

interface

uses
  AWS4D.SNS.Model.Interfaces,
  System.JSON,
  AWS4D.Core.Helper.JSON;

type TAWS4DSNSModelPublishResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSNSPublishResponse<I>)

  private
    [Weak]
    FParent: I;
    FMessageId: string;
    FSequenceNumber: string;

    procedure FromJSON(Value: TJSONObject);

  protected
    function MessageId: String;
    function SequenceNumber: String;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSNSPublishResponse<I>;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSModelPublishResponse<I> }

constructor TAWS4DSNSModelPublishResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FromJSON(JSON);
end;

destructor TAWS4DSNSModelPublishResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4DSNSModelPublishResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4DSNSModelPublishResponse<I>.FromJSON(Value: TJSONObject);
var
  LJSON: TJSONObject;
begin
  if not Assigned(Value) then
    Exit;

  LJSON := Value.ValueAsJSONObject('PublishResponse')
               .ValueAsJSONObject('PublishResult');

  FMessageId := LJSON.ValueAsString('MessageId');
  FSequenceNumber := LJSON.ValueAsString('SequenceNumber');
end;

function TAWS4DSNSModelPublishResponse<I>.MessageId: String;
begin
  result := FMessageId;
end;

class function TAWS4DSNSModelPublishResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSNSPublishResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

function TAWS4DSNSModelPublishResponse<I>.SequenceNumber: String;
begin
  result := FSequenceNumber;
end;

end.
