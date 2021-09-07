unit AWS4D.S3.Service.Interfaces;

interface

uses
  AWS4D.Core.Model.Types,
  AWS4D.S3.Model.Interfaces;

type
  IAWS4DS3Service<I: IInterface> = interface
    ['{9A30B487-7C85-4D4F-A8AE-AFA2EE84DCFB}']
    function AccessKey(Value: String): IAWS4DS3Service<I>;
    function SecretKey(Value: String): IAWS4DS3Service<I>;
    function Region(Value: String): IAWS4DS3Service<I>; overload;
    function Region(Value: TAWS4DRegion): IAWS4DS3Service<I>; overload;

    function ListBuckets: IAWS4DS3ListBucketsResponse<I>;

    function Parent(Value: I): IAWS4DS3Service<I>;
    function &End: I;
  end;

implementation

end.
