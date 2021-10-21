unit AWS4D.SNS.Facade;

interface

uses
  AWS4D.SNS.Facade.Interfaces,
  AWS4D.SNS.Service.Interfaces,
  AWS4D.SNS.Model.Interfaces,
  AWS4D.SNS.Facade.ListTopics,
  AWS4D.SNS.Service,
  AWS4D.Core.Model.Types;

type TAWS4DSNSFacade = class(TInterfacedObject, IAWS4DSNSFacade)

  private
    FAccessKey: String;
    FSecretKey: String;
    FRegion: TAWS4DRegion;
    FListTopics: IAWS4DSNSFacadeListTopics;

    function SNSService<I: IInterface>: IAWS4DSNSService<I>;

  protected
    function AccessKey(Value: String): IAWS4DSNSFacade;
    function SecretKey(Value: String): IAWS4DSNSFacade;
    function Region(Value: String): IAWS4DSNSFacade; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSNSFacade; overload;

    function ListTopics: IAWS4DSNSFacadeListTopics;
  public
    constructor create;
    class function New: IAWS4DSNSFacade;
    destructor Destroy; override;

end;

implementation

{ TAWS4DSNSFacade }

function TAWS4DSNSFacade.AccessKey(Value: String): IAWS4DSNSFacade;
begin
  result := Self;
  FAccessKey := Value;
end;

constructor TAWS4DSNSFacade.create;
begin
  FRegion := aws4dUSEast1;
end;

destructor TAWS4DSNSFacade.Destroy;
begin

  inherited;
end;

function TAWS4DSNSFacade.ListTopics: IAWS4DSNSFacadeListTopics;
var
  service: IAWS4DSNSService<IAWS4DSNSFacadeListTopics>;
begin
  if not Assigned(FListTopics) then
  begin
    service := Self.SNSService<IAWS4DSNSFacadeListTopics>;
    FListTopics := TAWS4DSNSFacadeListTopics.New(service);
  end;

  result := FListTopics;
end;

class function TAWS4DSNSFacade.New: IAWS4DSNSFacade;
begin
  result := Self.create;
end;

function TAWS4DSNSFacade.Region(Value: String): IAWS4DSNSFacade;
begin
  result := Self;
  FRegion.fromString(Value);
end;

function TAWS4DSNSFacade.Region(Value: TAWS4DRegion): IAWS4DSNSFacade;
begin
  result := Self;
  FRegion := Value;
end;

function TAWS4DSNSFacade.SecretKey(Value: String): IAWS4DSNSFacade;
begin
  result := Self;
  FSecretKey := Value;
end;

function TAWS4DSNSFacade.SNSService<I>: IAWS4DSNSService<I>;
begin
  Result := TAWS4DSNSService<I>.New;
  Result
    .AccessKey(FAccessKey)
    .SecretKey(FSecretKey)
    .Region(FRegion);
end;

end.
