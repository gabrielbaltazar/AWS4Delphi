unit AWS4D.Authorization.Interfaces;

interface

uses
  AWS4D.Service.Interfaces,
  System.Classes;

type
  IAWS4DAuthorization = interface
    ['{9C4F7EA9-B467-43B7-8921-3F744A788234}']
    function URL    (Value: String): IAWS4DAuthorization;
    function Action (Value: String): IAWS4DAuthorization;

    function AddQuery(Name, Value: String): IAWS4DAuthorization;
    
    function GenerateSignature(HttpVerb: string; Content: TStream = nil): string;
  end;

implementation

end.
