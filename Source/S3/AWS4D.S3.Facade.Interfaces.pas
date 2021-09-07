unit AWS4D.S3.Facade.Interfaces;

interface

uses
  AWS4D.S3.Service.Interfaces,
  AWS4D.S3.Model.Interfaces,
  AWS4D.Core.Model.Types;

type
  IAWS4DS3FacadeListBuckets = interface;

  IAWS4DS3Facade = interface
    ['{136DB671-C3AC-41B7-8FFE-28EA75A92C2C}']
    function AccessKey(Value: String): IAWS4DS3Facade;
    function SecretKey(Value: String): IAWS4DS3Facade;
    function Region(Value: String): IAWS4DS3Facade; overload;
    function Region(Value: TAWS4DRegion): IAWS4DS3Facade; overload;

    function ListBuckets: IAWS4DS3FacadeListBuckets;
  end;

  IAWS4DS3FacadeListBuckets = interface
    ['{BAA4A272-ABCC-410C-B2E9-BD3B32DBAAF9}']
    function Send: IAWS4DS3ListBucketsResponse<IAWS4DS3FacadeListBuckets>;
    function Response: IAWS4DS3ListBucketsResponse<IAWS4DS3FacadeListBuckets>;
  end;

function NewS3Facade: IAWS4DS3Facade;

implementation

uses
  AWS4D.S3.Facade;

function NewS3Facade: IAWS4DS3Facade;
begin
  result := TAWS4DS3Facade.New;
end;

end.
