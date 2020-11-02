unit AWS4D.SQS.Model.ReceiveMessageResponse;

interface

uses
  AWS4D.Model.Classes,
  AWS4D.SQS.Model.Interfaces,
  System.JSON,
  System.Generics.Collections;

type TAWS4DSQSModelReceiveMessageResponse = class(TAWS4DModelResponseMetadata, IAWS4DSQSModelReceiveMessageResponse)

  private
    FMessageId: string;
    FReceiptHandle: string;
    FMD5OfBody: string;
    FBody: string;
    FAttributes: TDictionary<String, String>;

  protected
    function MessageId: String;
    function ReceiptHandle: string;
    function MD5OfBody: string;
    function Body: string;
    function Attributes: TDictionary<String, String>;

  public
    constructor create(JSONString: String); override;
    class function New(JSONString: String): IAWS4DSQSModelReceiveMessageResponse;
    destructor Destroy; override;
end;

implementation

{ TAWS4DSQSModelReceiveMessageResponse }

function TAWS4DSQSModelReceiveMessageResponse.Attributes: TDictionary<String, String>;
begin
  result := FAttributes;
end;

function TAWS4DSQSModelReceiveMessageResponse.Body: string;
begin
  result := FBody;
end;

constructor TAWS4DSQSModelReceiveMessageResponse.create(JSONString: String);
begin
  inherited;
  if not Assigned(FJSON) then
    Exit;

end;

destructor TAWS4DSQSModelReceiveMessageResponse.Destroy;
begin
  FAttributes.Free;
  inherited;
end;

function TAWS4DSQSModelReceiveMessageResponse.MD5OfBody: string;
begin
  Result := FMD5OfBody;
end;

function TAWS4DSQSModelReceiveMessageResponse.MessageId: String;
begin
  result := FMessageId;
end;

class function TAWS4DSQSModelReceiveMessageResponse.New(JSONString: String): IAWS4DSQSModelReceiveMessageResponse;
begin
  result := Self.create(JSONString);
end;

function TAWS4DSQSModelReceiveMessageResponse.ReceiptHandle: string;
begin
  result := FReceiptHandle;
end;

end.
