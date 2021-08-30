unit AWS4D.SQS.Model.SendMessage.Response;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Helper.JSON,
  System.Generics.Collections,
  System.JSON;

type TAWS4SQSSendMessageResponse<I: IInterface> = class(TInterfacedObject, IAWS4DSQSSendMessageResponse<I>)

  private
    [Weak]
    FParent: I;
    FMD5OfMessageAttributes: string;
    FMD5OfMessageBody: string;
    FMD5OfMessageSystemAttributes: string;
    FMessageId: string;
    FSequenceNumber: string;

    procedure FromJSON(Value: TJSONObject);

  protected
    function MD5OfMessageAttributes: string;
    function MD5OfMessageBody: string;
    function MD5OfMessageSystemAttributes: string;
    function MessageId: string;
    function SequenceNumber: string;

    function &End: I;

  public
    constructor create(Parent: I; JSON: TJSONObject);
    class function New(Parent: I; JSON: TJSONObject): IAWS4DSQSSendMessageResponse<I>;
    destructor Destroy; override;

end;

implementation

constructor TAWS4SQSSendMessageResponse<I>.create(Parent: I; JSON: TJSONObject);
begin
  FParent := Parent;
  FromJSON(JSON);
end;

destructor TAWS4SQSSendMessageResponse<I>.Destroy;
begin

  inherited;
end;

function TAWS4SQSSendMessageResponse<I>.&End: I;
begin
  result := FParent;
end;

procedure TAWS4SQSSendMessageResponse<I>.FromJSON(Value: TJSONObject);
var
  json: TJSONObject;
begin
  inherited;
  if not Assigned(Value) then
    Exit;

  json := Value.ValueAsJSONObject('SendMessageResponse')
               .ValueAsJSONObject('SendMessageResult');

  if not Assigned(json) then
    Exit;

  FMD5OfMessageBody := json.ValueAsString('MD5OfMessageBody');
  FMD5OfMessageAttributes := json.ValueAsString('MD5OfMessageAttributes');
  FMD5OfMessageSystemAttributes := json.ValueAsString('MD5OfMessageSystemAttributes');
  FMessageId := json.ValueAsString('MessageId');
  FSequenceNumber := json.ValueAsString('SequenceNumber');
end;

function TAWS4SQSSendMessageResponse<I>.MD5OfMessageAttributes: string;
begin
  result := FMD5OfMessageAttributes;
end;

function TAWS4SQSSendMessageResponse<I>.MD5OfMessageBody: string;
begin
  result := FMD5OfMessageBody;
end;

function TAWS4SQSSendMessageResponse<I>.MD5OfMessageSystemAttributes: string;
begin
  result := FMD5OfMessageSystemAttributes;
end;

function TAWS4SQSSendMessageResponse<I>.MessageId: string;
begin
  Result := FMessageId;
end;

class function TAWS4SQSSendMessageResponse<I>.New(Parent: I; JSON: TJSONObject): IAWS4DSQSSendMessageResponse<I>;
begin
  result := Self.create(Parent, JSON);
end;

function TAWS4SQSSendMessageResponse<I>.SequenceNumber: string;
begin
  result := FSequenceNumber;
end;

end.
