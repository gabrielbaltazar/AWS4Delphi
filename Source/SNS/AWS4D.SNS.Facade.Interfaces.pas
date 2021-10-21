unit AWS4D.SNS.Facade.Interfaces;

interface

uses
  AWS4D.Core.Model.Types,
  AWS4D.SNS.Model.Interfaces;

type
  IAWS4DSNSFacadeListTopics = interface;

  IAWS4DSNSFacade = interface
    ['{0D47D22F-3793-498D-AAA2-A40D48B72F12}']
    function AccessKey(Value: String): IAWS4DSNSFacade;
    function SecretKey(Value: String): IAWS4DSNSFacade;
    function Region(Value: String): IAWS4DSNSFacade; overload;
    function Region(Value: TAWS4DRegion): IAWS4DSNSFacade; overload;

    function ListTopics: IAWS4DSNSFacadeListTopics;
  end;

  IAWS4DSNSFacadeListTopics = interface
    ['{6D5472E6-773E-4E99-BBD9-A7AA70D3ED85}']
    function Request: IAWS4DSNSListTopicsRequest<IAWS4DSNSFacadeListTopics>;
    function Send: IAWS4DSNSListTopicsResponse<IAWS4DSNSFacadeListTopics>;
    function Response: IAWS4DSNSListTopicsResponse<IAWS4DSNSFacadeListTopics>;
  end;

function NewSNSFacade: IAWS4DSNSFacade;

implementation

uses
  AWS4D.SNS.Facade;

function NewSNSFacade: IAWS4DSNSFacade;
begin
  result := TAWS4DSNSFacade.New;
end;

end.
