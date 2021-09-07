unit AWS4D.S3.Model.Interfaces;

interface

uses
  AWS4D.Core.Model.Types;

type
  IAWS4DS3ListBucketsResponse<I: IInterface> = interface
    ['{4EE25118-D4CB-419D-A238-E19C9818EF6F}']
    function Buckets: IAWS4DIterator<String>;
  end;

implementation

end.
