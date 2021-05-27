unit AWS4D.SQS.Model.Exceptions;

interface

uses
  AWS4D.Model.Exceptions,
  System.SysUtils;

type
  EAWS4DSQSModelException = class(EAWS4DException)
  private
    FStatusCode: Integer;
    FStatusMessage: String;

  public
    property StatusCode: Integer read FStatusCode;
    property StatusMessage: String read FStatusMessage;

    constructor create(AStatusCode: Integer; AStatusMessage: String);
  end;

implementation

{ EAWS4DSQSModelException }

constructor EAWS4DSQSModelException.create(AStatusCode: Integer; AStatusMessage: String);
begin
  inherited create(Format('%s: %s', [AStatusCode.ToString, AStatusMessage]));
  Self.FStatusCode    := AStatusCode;
  Self.FStatusMessage := AStatusMessage;
end;

end.
