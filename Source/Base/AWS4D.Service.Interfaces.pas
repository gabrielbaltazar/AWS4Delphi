unit AWS4D.Service.Interfaces;

interface

type
  IAWS4DService = interface
    ['{D93A37C0-ADA3-44A2-AAD4-EADF1BC984BB}']
    function Region      (Value: String): IAWS4DService; overload;
    function AccessKeyID (Value: String): IAWS4DService; overload;
    function SecretKey   (Value: String): IAWS4DService; overload;

    function Region      : String; overload;
    function AccessKeyID : string; overload;
    function SecretKey   : string; overload;
  end;

implementation

end.
