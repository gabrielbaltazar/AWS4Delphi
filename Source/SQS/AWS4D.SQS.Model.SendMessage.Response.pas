unit AWS4D.SQS.Model.SendMessage.Response;

interface

uses
  AWS4D.SQS.Model.Interfaces,
  AWS4D.Core.Model.Types,
  AWS4D.Core.Model.Iterator,
  AWS4D.Core.Helper.JSON,
  System.Generics.Collections,
  System.JSON;

type
  TAWS4SQSSendMessageResponse<I: IInterface> = class(TInterfacedObject,
    IAWS4DSQSSendMessageResponse<I>)
  private
    [Weak]
    FParent: I;
    FMD5OfMessageAttributes: string;
    FMD5OfMessageBody: string;
    FMessageId: string;

    procedure FromJSON(AValue: TJSONObject);
  protected
    function MD5OfMessageAttributes: string;
    function MD5OfMessageBody: string;
    function MessageId: string;
    function &End: I;
  public
    constructor Create(AParent: I; AJSON: TJSONObject);
    class function New(AParent: I; AJSON: TJSONObject): IAWS4DSQSSendMessageResponse<I>;
  end;

implementation

constructor TAWS4SQSSendMessageResponse<I>.Create(AParent: I; AJSON: TJSONObject);
begin
  FParent := AParent;
  FromJSON(AJSON);
end;

function TAWS4SQSSendMessageResponse<I>.&End: I;
begin
  Result := FParent;
end;

procedure TAWS4SQSSendMessageResponse<I>.FromJSON(AValue: TJSONObject);
begin
  inherited;
  if not Assigned(AValue) then
    Exit;

  FMD5OfMessageBody := AValue.ValueAsString('MD5OfMessageBody');
  FMD5OfMessageAttributes := AValue.ValueAsString('MD5OfMessageAttributes');
  FMessageId := AValue.ValueAsString('MessageId');
end;

function TAWS4SQSSendMessageResponse<I>.MD5OfMessageAttributes: string;
begin
  Result := FMD5OfMessageAttributes;
end;

function TAWS4SQSSendMessageResponse<I>.MD5OfMessageBody: string;
begin
  Result := FMD5OfMessageBody;
end;

function TAWS4SQSSendMessageResponse<I>.MessageId: string;
begin
  Result := FMessageId;
end;

class function TAWS4SQSSendMessageResponse<I>.New(AParent: I; AJSON: TJSONObject): IAWS4DSQSSendMessageResponse<I>;
begin
  Result := Self.Create(AParent, AJSON);
end;

end.
