unit AWS4D.S3.Model.Exceptions;

interface

uses
  AWS4D.Model.Exceptions,
  System.SysUtils;

type
  EAWS4DS3ModelException = class(EAWS4DException)
  private
    FStatusCode: Integer;
    FStatusMessage: String;

  public
    property StatusCode: Integer read FStatusCode;
    property StatusMessage: String read FStatusMessage;

    constructor create(AStatusCode: Integer; AStatusMessage: String);
  end;

implementation

{ EAWS4DS3ModelException }

constructor EAWS4DS3ModelException.create(AStatusCode: Integer; AStatusMessage: String);
begin
  inherited create(Format('%s: %s', [AStatusCode.ToString, AStatusMessage]));
  Self.FStatusCode    := AStatusCode;
  Self.FStatusMessage := AStatusMessage;
end;

end.
