unit AWS4D.SNS.Model.Types;

interface

type
  TAWS4DSNSProtocol = (pHttp,
                       pHttps,
                       pEmail,
                       pEmailJson,
                       pSms,
                       pSqs,
                       pApplication,
                       pLambda,
                       pFirehouse);

  TAWS4DSNSProtocolHelper = record helper for TAWS4DSNSProtocol
  public
    function ToString: string;
  end;

implementation

{ TAWS4DSNSProtocolHelper }

function TAWS4DSNSProtocolHelper.ToString: string;
begin
  case Self of
    pHttp: result := 'http';
    pHttps: result := 'https';
    pEmail: result := 'email';
    pEmailJson: result := 'email-json';
    pSms: result := 'sms';
    pSqs: result := 'sqs';
    pApplication: result := 'application';
    pLambda: result := 'lambda';
    pFirehouse: result := 'firehouse';
  end;
end;

end.
