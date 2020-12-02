unit AWS4D.S3.Model.Factory;

interface

uses
  AWS4D.S3.Model.Interfaces,
  AWS4D.S3.Model.CreateObject.Request,
  System.SysUtils;

type TAWS4DS3ModelFactory = class(TInterfacedObject, IAWS4DS3ModelFactory)

  private
    class var FInstance: IAWS4DS3ModelFactory;

    constructor createPrivate;

  protected
    function CreateObjectRequest: IAWS4DS3ModelCreateObjectRequest;

  public
    constructor create;
    class function GetInstance: IAWS4DS3ModelFactory;
end;

implementation

{ TAWS4DS3ModelFactory }

constructor TAWS4DS3ModelFactory.create;
begin
  raise Exception.CreateFmt('Use the class function GetInstance.', []);
end;

function TAWS4DS3ModelFactory.CreateObjectRequest: IAWS4DS3ModelCreateObjectRequest;
begin
  result := TAWS4DS3ModelCreateObjectRequest.New;
end;

constructor TAWS4DS3ModelFactory.createPrivate;
begin

end;

class function TAWS4DS3ModelFactory.GetInstance: IAWS4DS3ModelFactory;
begin
  if not Assigned(FInstance) then
    FInstance := TAWS4DS3ModelFactory.createPrivate;
  result := FInstance;
end;

end.
