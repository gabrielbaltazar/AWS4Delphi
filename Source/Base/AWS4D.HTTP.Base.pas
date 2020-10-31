unit AWS4D.HTTP.Base;

interface

uses
  AWS4D.Service.Interfaces;

type TAWS4DHTTPBase = class(TInterfacedObject)

  protected
    [Weak]
    FAWSService: IAWS4DService;

  public
    constructor create(AWSService: IAWS4DService); virtual;
end;

implementation

{ TAWS4DHTTPBase }

constructor TAWS4DHTTPBase.create(AWSService: IAWS4DService);
begin
  FAWSService := AWSService;
end;

end.
