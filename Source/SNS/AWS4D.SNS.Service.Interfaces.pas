unit AWS4D.SNS.Service.Interfaces;

interface

uses
  AWS4D.Core.Model.Types;

type
  IAWS4DServiceSNS = interface
    ['{D7028158-A96E-4C0F-8A99-4756BECE476E}']
    function AccessKey(Value: String): IAWS4DServiceSNS;
    function SecretKey(Value: String): IAWS4DServiceSNS;
    function Region(Value: String): IAWS4DServiceSNS; overload;
    function Region(Value: TAWS4DRegion): IAWS4DServiceSNS; overload;

    function ListSubscriptions: IAWS4DServiceSNS;
  end;

implementation

end.
